package com.project.laporte.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.project.laporte.helper.RegexHelper;
import com.project.laporte.helper.UploadItem;
import com.project.laporte.helper.WebHelper;
import com.project.laporte.model.DetailImg;
import com.project.laporte.model.Firstimg;
import com.project.laporte.model.Prod_category2;
import com.project.laporte.model.Product;
import com.project.laporte.service.ProductService;

@RestController
public class ProductRestController {

	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;

	/** Service 패턴 구현체 주입 */
	@Autowired
	ProductService productService;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** 상품 등록 페이지 - 2차 카테고리(소분류) 데이터 추출하기 */
	@RequestMapping(value = "/11_admin/product_add/category", method = RequestMethod.POST)
	public Map<String, Object> get_item(@RequestParam(value = "catno1", defaultValue = "0") int catno1) {

		/** 1) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Prod_category2 cat2 = new Prod_category2();
		cat2.setCatno1(catno1);

		List<Prod_category2> category2 = null; // 조회결과가 저장될 객체

		try {
			// 데이터 조회 --> 조건값을 담은 beans 넣기 bnfc
			category2 = productService.category2(cat2);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("catno1", catno1);
		data.put("item", category2);

		return webHelper.getJsonData(data);
	}

	/** 상품 등록 작성 폼에 대한 action 페이지 */
	@RequestMapping(value = "/11_admin/product_add", method = RequestMethod.POST)
	public Map<String, Object> post(@RequestParam(value = "name") String name, @RequestParam(value = "price") int price,
			@RequestParam(value = "saleprice", defaultValue = "0", required = false) int saleprice,
			@RequestParam(value = "stock", defaultValue = "0", required = false) int stock,
			@RequestParam(value = "display") String display, @RequestParam(value = "color") String color,
			@RequestParam(value = "size", defaultValue = "", required = false) String size,
			@RequestParam(value = "adminnote", defaultValue = "", required = false) String adminnote,
			@RequestParam(value = "detailnote") String detailnote,
			@RequestParam(value = "detailsize") String detailsize,
			@RequestParam(value = "catno2", defaultValue = "0") int catno2, HttpServletRequest request,
			@RequestParam(required = false) MultipartFile product_thumbnail) {

		// 체크박스의 name 속성이 동일한 요소가 여러개인 경우 파라미터를 배열로 리턴받는다.
		String[] arr = request.getParameterValues("prd_group[]");

		// 체크박스의 선택값이 저장괼 문자열
		// -> arr 배열의 각원소를 첫번째 파라미터로 설정한 구분값을 적용하여 하나의 문자열로 연결
		String group = "";
		if (arr != null) {
			group = String.join(", ", arr);
		}

		System.out.println(group);
		adminnote=adminnote.replace("\r\n","<br>");
		detailnote=detailnote.replace("\r\n","<br>");
		detailsize=detailsize.replace("\r\n","<br>");

		/** 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		Product input = new Product();
		input.setName(name);
		input.setPrice(price);
		input.setSaleprice(saleprice);
		input.setStock(stock);
		input.setDisplay(display);
		input.setColor(color);
		input.setSize(size);
		input.setAdminnote(adminnote);
		input.setDetailnote(detailnote);
		input.setDetailsize(detailsize);
		input.setCatno2(catno2);
		input.setGroup(group);

		// 저장된 결과를 조회하기 위한 객체
		Product output = null;

		try {
			// 데이터 저장
			// -> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			productService.addProduct(input);

			// 데이터 조회
			output = productService.getProductItem(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 대표이미지 업로드 처리 */
		// 업로드 결과가 저장된 Beans를 리턴받는다.
		UploadItem imgItem = new UploadItem();

		try {
			imgItem = webHelper.saveMultipartFile(product_thumbnail);
		} catch (NullPointerException e) {
			e.printStackTrace();
			return webHelper.getJsonError(e.getLocalizedMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** [신규] 파일 형식이 이미지인 경우 썸네일 이미지 생성하기 */
		if (imgItem != null && imgItem.getContentType().indexOf("image") > -1) {
			// 필요한 이미지 사이즈로 썸네일을 생성할 수 있다.
			String thumbnailPath = null;

			try {
				thumbnailPath = webHelper.createTuhmbnail(imgItem.getFilePath(), 240, 240, true);
			} catch (Exception e) {
				e.printStackTrace();
				return webHelper.getJsonError(e.getLocalizedMessage());
			}

			// 썸네일 경로를 URL로 변환
			String thumbnailUrl = webHelper.getUploadUrl(thumbnailPath);
			// 리턴할 객체에 썸네일 정보 추가
			imgItem.setThumbnailPath(thumbnailPath);
			imgItem.setThumbnailUrl(thumbnailUrl);
		}

		String fieldName = imgItem.getFieldName();
		String orginName = imgItem.getOrginName();
		String contentType = imgItem.getContentType();
		long fileSize = imgItem.getFileSize();
		String filePath = imgItem.getFilePath();
		String thumbnailPath = imgItem.getThumbnailPath();
		String fileUrl = imgItem.getFileUrl();
		String thumbnailUrl = imgItem.getThumbnailUrl();
		int prodno = input.getProdno();

		Firstimg firstImg = new Firstimg();
		firstImg.setProdno(prodno);
		firstImg.setFieldName(fieldName);
		firstImg.setOriginName(orginName);
		firstImg.setContentType(contentType);
		firstImg.setFileSize(fileSize);
		firstImg.setFilePath(filePath);
		firstImg.setThumbnailPath(thumbnailPath);
		firstImg.setFileUrl(fileUrl);
		firstImg.setThumbnailUrl(thumbnailUrl);

		// 저장된 결과를 조회하기 위한 객체
		Firstimg Imgoutput = null;

		try {
			// 데이터 저장
			// -> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			productService.addProductFirstImg(firstImg);

			// 데이터 조회
			Imgoutput = productService.getProductFirstImg(firstImg);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 결과를 확인하기 위한 JSON 출력 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", output);
		map.put("imgitem", Imgoutput);
		return webHelper.getJsonData(map);
	}

	/** 상세 페이지 */
	@RequestMapping(value = "/11_admin/product_view/{prodno}", method = RequestMethod.GET)
	public Map<String, Object> get_prod(@PathVariable("prodno") int prodno) {

		/** 1) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Product input = new Product();
		input.setProdno(prodno);

		// 조회결과를 저장할 객체 선언
		Product output = null;

		try {
			// 데이터 조회
			output = productService.getProductItem(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 2) JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("item", output);

		return webHelper.getJsonData(data);
	}

	/** 상품 삭제 페이지 */
	@RequestMapping(value = "/11_admin/product_view", method = RequestMethod.DELETE)
	public Map<String, Object> deleteproduct(@RequestParam(value = "prodno") int prodno) {
		/** 1) 파라미터 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (prodno == 0) {
			return webHelper.getJsonWarning("상품 번호가 없습니다.");
		}

		/** 2) 데이터 삭제하기 */
		// 데이터 삭제에 필요한 조건 값을 Beans에 저장하기
		Product input = new Product();
		input.setProdno(prodno);

		try {
			productService.deleteProduct(input); // 데이터 삭제
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 JSON 출력 */
		// 확인할 대상이 삭제된 결과값만 OK로 전달
		return webHelper.getJsonData();
	}

	/** 수정 폼에 대한 action 페이지 */
	@RequestMapping(value = "/11_admin/product_edit", method = RequestMethod.POST)
	public Map<String, Object> put(
			@RequestParam(value = "prodno", defaultValue="0") int prodno,
			@RequestParam(value = "catno1", defaultValue = "0") int catno1,
			@RequestParam(value = "name", defaultValue="") String name, 
			@RequestParam(value = "price", defaultValue="0") int price,
			@RequestParam(value = "saleprice", defaultValue = "0", required = false) int saleprice,
			@RequestParam(value = "stock", defaultValue = "0", required = false) int stock,
			@RequestParam(value = "display", defaultValue="Y") String display, 
			@RequestParam(value = "color", defaultValue="") String color,
			@RequestParam(value = "size", defaultValue = "", required = false) String size,
			@RequestParam(value = "adminnote", defaultValue = "", required = false) String adminnote,
			@RequestParam(value = "detailnote", defaultValue="") String detailnote,
			@RequestParam(value = "detailsize", defaultValue="") String detailsize,
			@RequestParam(value = "catno2", defaultValue = "0") int catno2, 
			HttpServletRequest request,
			@RequestParam(required = false) MultipartFile product_thumbnail) {

		/** 파라미터 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if(prodno == 0) {
			return webHelper.getJsonWarning("상품 번호가 없습니다.");
		}
		
		// 체크박스의 name 속성이 동일한 요소가 여러개인 경우 파라미터를 배열로 리턴받는다.
		String[] arr = request.getParameterValues("prd_group[]");

		// 체크박스의 선택값이 저장될 문자열
		// -> arr 배열의 각원소를 첫번째 파라미터로 설정한 구분값을 적용하여 하나의 문자열로 연결
		String group = "";
		
		if (arr != null) {
			group = String.join(", ", arr);
		}
		//System.out.println(arr);
		System.out.println("그룹 내용 :"+ group);
		
		adminnote=adminnote.replace("\r\n","<br>");
		detailnote=detailnote.replace("\r\n","<br>");
		detailsize=detailsize.replace("\r\n","<br>");

		/** 데이터 수정하기 */
		// 수정할 값들을 Beans에 담는다.
		Product input = new Product();
		input.setProdno(prodno);
		input.setName(name);
		input.setPrice(price);
		input.setSaleprice(saleprice);
		input.setStock(stock);
		input.setDisplay(display);
		input.setColor(color);
		input.setSize(size);
		input.setAdminnote(adminnote);
		input.setDetailnote(detailnote);
		input.setDetailsize(detailsize);
		input.setCatno2(catno2);
		input.setGroup(group);

		// 수정된 결과를 조회하기 위한 객체
		Product output = null;

		try {
			// 데이터 수정
			productService.editProduct(input);

			// 수정 결과 조회
			output = productService.getProductItem(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		if (product_thumbnail != null) {
			/** 대표이미지 업로드 처리 */
			// 업로드 결과가 저장된 Beans를 리턴받는다.
			UploadItem imgItem = new UploadItem();

			try {
				imgItem = webHelper.saveMultipartFile(product_thumbnail);
			} catch (NullPointerException e) {
				e.printStackTrace();
				return webHelper.getJsonError(e.getLocalizedMessage());
			} catch (Exception e) {
				e.printStackTrace();
				return webHelper.getJsonError(e.getLocalizedMessage());
			}

			/** [신규] 파일 형식이 이미지인 경우 썸네일 이미지 생성하기 */
			if (imgItem != null && imgItem.getContentType().indexOf("image") > -1) {
				// 필요한 이미지 사이즈로 썸네일을 생성할 수 있다.
				String thumbnailPath = null;

				try {
					thumbnailPath = webHelper.createTuhmbnail(imgItem.getFilePath(), 240, 240, true);
				} catch (Exception e) {
					e.printStackTrace();
					return webHelper.getJsonError(e.getLocalizedMessage());
				}

				// 썸네일 경로를 URL로 변환
				String thumbnailUrl = webHelper.getUploadUrl(thumbnailPath);
				// 리턴할 객체에 썸네일 정보 수정
				imgItem.setThumbnailPath(thumbnailPath);
				imgItem.setThumbnailUrl(thumbnailUrl);
			}
			
			String fieldName = imgItem.getFieldName();
			String orginName = imgItem.getOrginName();
			String contentType = imgItem.getContentType();
			long fileSize = imgItem.getFileSize();
			String filePath = imgItem.getFilePath();
			String thumbnailPath = imgItem.getThumbnailPath();
			String fileUrl = imgItem.getFileUrl();
			String thumbnailUrl = imgItem.getThumbnailUrl();

			Firstimg firstImg = new Firstimg();
			firstImg.setProdno(prodno);
			firstImg.setFieldName(fieldName);
			firstImg.setOriginName(orginName);
			firstImg.setContentType(contentType);
			firstImg.setFileSize(fileSize);
			firstImg.setFilePath(filePath);
			firstImg.setThumbnailPath(thumbnailPath);
			firstImg.setFileUrl(fileUrl);
			firstImg.setThumbnailUrl(thumbnailUrl);

			// 수정된 결과를 조회하기 위한 객체
			Firstimg Imgoutput = null;

			try {
				// 데이터 수정
				productService.editProductFirstImg(firstImg);

				// 데이터 조회
				Imgoutput = productService.getProductFirstImg(firstImg);
			} catch (Exception e) {
				return webHelper.getJsonError(e.getLocalizedMessage());
			}
			
			/** 결과를 확인하기 위한 JSON 출력 */
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("item", output);
			map.put("imgitem", Imgoutput);
			return webHelper.getJsonData(map);
			
		}//대표 이미지 새로 수정 했는지 확인하는 if문 끝
		else {
			Firstimg firstImg = new Firstimg();
			firstImg.setProdno(prodno);
			
			Firstimg Imgoutput = null;
			try {
				// 데이터 조회
				Imgoutput = productService.getProductFirstImg(firstImg);
			} catch (Exception e) {
				return webHelper.getJsonError(e.getLocalizedMessage());
			}
			
			/** 결과를 확인하기 위한 JSON 출력 */
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("item", output);
			map.put("imgitem", Imgoutput);
			return webHelper.getJsonData(map);
		}
		
		
	}

	/** 상세 이미지 추가 페이지 */
	@RequestMapping(value = "/11_admin/product_img", method = { RequestMethod.GET, RequestMethod.POST })
	public Map<String, Object> detailImg(Model model, @RequestParam(value = "prodno") int prodno,
			@RequestParam(required = false) MultipartFile product_detail_img) {

		/** 대표이미지 업로드 처리 */
		// 업로드 결과가 저장된 Beans를 리턴받는다.
		UploadItem imgItem = new UploadItem();

		try {
			imgItem = webHelper.saveMultipartFile(product_detail_img);
		} catch (NullPointerException e) {
			e.printStackTrace();
			return webHelper.getJsonError(e.getLocalizedMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		String fieldName = imgItem.getFieldName();
		String orginName = imgItem.getOrginName();
		String contentType = imgItem.getContentType();
		long fileSize = imgItem.getFileSize();
		String filePath = imgItem.getFilePath();
		String fileUrl = imgItem.getFileUrl();

		DetailImg detailimg = new DetailImg();

		detailimg.setProdno(prodno);
		detailimg.setFieldName(fieldName);
		detailimg.setOrginName(orginName);
		detailimg.setContentType(contentType);
		detailimg.setFileSize(fileSize);
		detailimg.setFilePath(filePath);
		detailimg.setFileUrl(fileUrl);

		// 저장된 결과를 조회하기 위한 객체
		List<DetailImg> Imgoutput = null;

		try {
			// 데이터 저장
			// -> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			productService.addDetailImg(detailimg);

			// 데이터 조회
			Imgoutput = productService.getDeailImgList(detailimg);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 결과를 확인하기 위한 JSON 출력 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("imgitem", Imgoutput);
		return webHelper.getJsonData(map);
	}

	/** 상세이미지 삭제 페이지 */
	@RequestMapping(value = "/11_admin/product_img", method = RequestMethod.DELETE)
	public Map<String, Object> deletedetailImg(@RequestParam(value = "detailimgno") int detailimgno) {
		/** 1) 파라미터 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (detailimgno == 0) {
			return webHelper.getJsonWarning("상품 번호가 없습니다.");
		}

		/** 2) 데이터 삭제하기 */
		// 데이터 삭제에 필요한 조건 값을 Beans에 저장하기
		DetailImg input = new DetailImg();
		input.setDetailimgno(detailimgno);

		try {
			productService.deleteDetailImg(input); // 데이터 삭제
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 JSON 출력 */
		// 확인할 대상이 삭제된 결과값만 OK로 전달
		return webHelper.getJsonData();
	}
	
	/** 상품 상세 페이지 - 사용자 */
	@RequestMapping(value = "/03_detail/detail/{prodno}", method = RequestMethod.GET)
	public Map<String, Object> get_detail(@PathVariable("prodno") int prodno) {

		/** 1) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Product input = new Product();
		input.setProdno(prodno);

		// 조회결과를 저장할 객체 선언
		Product output = null;

		try {
			// 데이터 조회
			output = productService.getProductItem(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 2) JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("item", output);

		return webHelper.getJsonData(data);
	}

}
