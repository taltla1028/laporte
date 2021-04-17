package com.project.laporte.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.laporte.helper.PageData;
import com.project.laporte.helper.RegexHelper;
import com.project.laporte.helper.WebHelper;
import com.project.laporte.model.Delivery;
import com.project.laporte.model.DetailImg;
import com.project.laporte.model.Firstimg;
import com.project.laporte.model.Order_prod;
import com.project.laporte.model.Orderlist;
import com.project.laporte.model.Prod_category1;
import com.project.laporte.model.Prod_category2;
import com.project.laporte.model.Product;
import com.project.laporte.model.RevComment;
import com.project.laporte.model.Review;
import com.project.laporte.model.Wish_prod;
import com.project.laporte.model.Wishlist;
import com.project.laporte.service.ProductService;
import com.project.laporte.service.ReviewService;
import com.project.laporte.service.WishlistService;

@Controller
public class ProductAjaxController {
	/** WebHelper 주입 */
	// --> import org.springframework.beans.factory.annotation.Autowired;
	// --> import study.spring.springhelper.helper.WebHelper;
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	// --> import study.spring.helper.RegexHelper;
	@Autowired
	RegexHelper regexHelper;

	/** Service 패턴 구현체 주입 */
	@Autowired
	ProductService productService;

	@Autowired
	WishlistService wishlistService;

	@Autowired
	ReviewService reviewService;

	/** "/프로젝트이름"에 해당하는 ContextPath 변수 주입 */
	// --> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** 상품 등록 페이지 */
	@RequestMapping(value = "/11_admin/product_add.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView productAdd(Model model, @RequestParam(value = "catno1", defaultValue = "0") int catno1,
			HttpServletRequest request) {
		String adminno = "";
		HttpSession session = request.getSession();
		if (session.getAttribute("my_admin") != null) {
			adminno = (String) session.getAttribute("my_admin");
		}
		if (adminno == "") {
			return webHelper.redirect(null, "관리자로 로그인을 해주세요.");
		}

		/** 데이터 조회하기 **/
		// 카테고리 대분류 목록 조회 결과를 저장할 객체 선언
		List<Prod_category1> category1 = null;

		// 카테고리 소분류 목록 조회 결과를 저장할 객체 선언
		// catno1을 Prod_category2 Beans에 넣어서 2차 카테고리 추출
		Prod_category2 cat2 = new Prod_category2();
		cat2.setCatno1(catno1);
		List<Prod_category2> category2 = null;

		// 상품 목록 조회 결과를 저장할 객체 선언
		// List<Product> output = null;

		try {
			// 데이터 조회 --> 검색조건 없이 모든 카테고리 조회
			category1 = productService.category(null);
			// 2차 카테고리 -> catno1을 넣은 Beans를 파라미터로 넣고 카테고리 데이터 조회
			category2 = productService.category2(cat2);
			// 데이터 조회 -> 검색조건 없이 모든 상품 조회
			// output = productService.getProductList(null);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** View 처리 **/
		model.addAttribute("category1", category1);
		model.addAttribute("category2", category2);
		model.addAttribute("catno1", catno1);
		// model.addAttribute("output", output);

		return new ModelAndView("11_admin/product_add");
	}

	/** 수정 폼 페이지 */
	@RequestMapping(value = "/11_admin/product_edit.do", method = RequestMethod.GET)
	public ModelAndView edit(Model model, @RequestParam(value = "prodno", defaultValue = "0") int prodno,
			HttpServletRequest request) {
		String adminno = "";
		HttpSession session = request.getSession();
		if (session.getAttribute("my_admin") != null) {
			adminno = (String) session.getAttribute("my_admin");
		}
		if (adminno == "") {
			return webHelper.redirect(null, "관리자로 로그인을 해주세요.");
		}

		/** 1) 파라미터 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (prodno == 0) {
			return webHelper.redirect(null, "상품 번호가 없습니다");
		}

		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Product input = new Product();
		Firstimg img = new Firstimg();
		input.setProdno(prodno);
		img.setProdno(prodno);

		// 조회결과를 저장할 객체 선언
		Product output = null;
		Firstimg imgoutput = null;

		try {
			output = productService.getProductItem(input);
			imgoutput = productService.getProductFirstImg(img);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		int catno1 = output.getCatno1();
		System.out.println(catno1);

		// 카테고리 대분류 목록 조회 결과를 저장할 객체 선언
		List<Prod_category1> category1 = null;

		// 카테고리 소분류 목록 조회 결과를 저장할 객체 선언
		// catno1을 Prod_category2 Beans에 넣어서 2차 카테고리 추출
		Prod_category2 cat2 = new Prod_category2();
		cat2.setCatno1(catno1);
		List<Prod_category2> category2 = null;

		try {
			// 데이터 조회 --> 검색조건 없이 모든 카테고리 조회
			category1 = productService.category(null);
			// 2차 카테고리 -> catno1을 넣은 Beans를 파라미터로 넣고 카테고리 데이터 조회
			category2 = productService.category2(cat2);
			// 데이터 조회
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리하기 */
		model.addAttribute("output", output);
		model.addAttribute("imgoutput", imgoutput);
		model.addAttribute("category1", category1);
		model.addAttribute("category2", category2);
		model.addAttribute("catno1", catno1);
		return new ModelAndView("11_admin/product_edit");
	}

	/** 상품 정보 페이지 (관리자) */
	@RequestMapping(value = "/11_admin/product_view.do", method = RequestMethod.GET)
	public ModelAndView view(Model model, @RequestParam(value = "prodno", defaultValue = "0") int prodno,
			HttpServletRequest request) {

		/** 로그인 여부 검사 */
		String adminno = "";
		HttpSession session = request.getSession();
		if (session.getAttribute("my_admin") != null) {
			adminno = (String) session.getAttribute("my_admin");
		}
		if (adminno == "") {
			return webHelper.redirect(null, "관리자로 로그인을 해주세요.");
		}

		/** 1) 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (prodno == 0) {
			return webHelper.redirect(null, "상품 번호가 없습니다");
		}

		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Product input = new Product();
		Firstimg img = new Firstimg();
		input.setProdno(prodno);
		img.setProdno(prodno);

		// 조회결과를 저장할 객체 선언
		Product output = null;
		Firstimg imgoutput = null;

		try {
			// 데이터 조회
			output = productService.getProductItem(input);
			imgoutput = productService.getProductFirstImg(img);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리하기 */
		model.addAttribute("output", output);
		model.addAttribute("imgoutput", imgoutput);
		return new ModelAndView("11_admin/product_view");
	}

	/** 상품 상세 이미지 추가 */
	@RequestMapping(value = "/11_admin/product_img.do", method = RequestMethod.GET)
	public ModelAndView imageadd(Model model, @RequestParam(value = "prodno", defaultValue = "0") int prodno,
			HttpServletRequest request) {
		/** 로그인 여부 검사 */
		String adminno = "";
		HttpSession session = request.getSession();
		if (session.getAttribute("my_admin") != null) {
			adminno = (String) session.getAttribute("my_admin");
		}
		if (adminno == "") {
			return webHelper.redirect(null, "관리자로 로그인을 해주세요.");
		}

		/** 1) 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (prodno == 0) {
			return webHelper.redirect(null, "상품 번호가 없습니다");
		}

		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		DetailImg img = new DetailImg();
		img.setProdno(prodno);

		// 조회결과를 저장할 객체 선언
		List<DetailImg> imgList = null;

		try {
			// 데이터 조회
			imgList = productService.getDeailImgList(img);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리하기 */
		model.addAttribute("img", img);
		model.addAttribute("imgList", imgList);
		return new ModelAndView("11_admin/product_img");
	}

	/** 상품 상세 페이지 - 사용자 */
	@RequestMapping(value = "/03_detail/detail.do", method = RequestMethod.GET)
	public ModelAndView detail(Model model, @RequestParam(value = "prodno", defaultValue = "0") int prodno,
			HttpServletResponse response, HttpServletRequest request,
			@CookieValue(value = "my_cookie", defaultValue = "") String myCookie,
			@CookieValue(value = "my_wish", defaultValue = "0", required = false) int my_wish) {

		/** 1) 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (prodno == 0) {
			return webHelper.redirect(null, "상품 번호가 없습니다");
		}

		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		DetailImg dimg = new DetailImg();
		dimg.setProdno(prodno);
		Product input = new Product();
		input.setProdno(prodno);
		List<Product> similar = new ArrayList<Product>();
		Firstimg fimg = new Firstimg();
		fimg.setProdno(prodno);

		// 조회결과를 저장할 객체 선언
		Product output = null;
		Product category = null;
		Firstimg imgoutput = null;
		List<DetailImg> imgList = null;

		try {
			// 데이터 조회
			output = productService.getProductItem(input);
			imgoutput = productService.getProductFirstImg(fimg);
			imgList = productService.getDeailImgList(dimg);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		try {
			// 데이터 조회
			category = productService.getCategotyName(output);
			similar = productService.getSimilarList(output);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 쿠키 저장 **/
		Cookie cookie = new Cookie("prodno" + prodno, String.valueOf(prodno)); // 저장할 쿠키 객체 생성.
		cookie.setPath("/"); // 쿠키의 유효 경로 --> 사이트 전역에 대한 설정.
		cookie.setDomain("itproject.ezenac.co.kr"); // 쿠키의 유효 도메인

		if (String.valueOf(prodno).equals("")) { // 쿠키 시간을 설정하지 않으면 브라우저가 동작하는 동안 유효
			cookie.setMaxAge(0); // 쿠키 설정시간이 0이면 즉시 삭제된다.
		} else {
			cookie.setMaxAge(60 * 60); // 값이 있다면 60초 동안 쿠키 저장
		}

		response.addCookie(cookie); // 쿠키 저장

		/** 쿠키 꺼내기 **/
		Cookie[] cookies = request.getCookies();

		List<Firstimg> cookie_img = new ArrayList<Firstimg>();

		Firstimg cookie_img_output = new Firstimg();

		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie cookie2 = cookies[i];
				if (cookie2.getName().contains("prodno")) {
					myCookie = cookie2.getValue();
					int cookie_prodno = Integer.parseInt(myCookie);
					Firstimg cookie_output = new Firstimg();
					cookie_output.setProdno(cookie_prodno);
					try {
						cookie_img_output = productService.getProductFirstImg(cookie_output);
					} catch (Exception e) {
						return webHelper.redirect(null, e.getLocalizedMessage());
					}
					cookie_img.add(cookie_img_output);
					// System.out.println("Hello " + cookie_img);
				}
			}
			// 추출한 값을 View에게 전달
			model.addAttribute("my_cookie", cookie_img);
		} else {
			try {
				Firstimg cookie_output = new Firstimg();
				cookie_output.setProdno(Integer.parseInt(myCookie));
				cookie_img_output = productService.getProductFirstImg(cookie_output);
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			model.addAttribute("my_cookie", cookie_img_output);
		}
		// 현재 상품이 위시리스트에 담겨있는지 확인
		Wish_prod wishValue = new Wish_prod();

		// 로그인 여부 확인 -> 로그인 중 일때 - userno!=0 / 로그인 하지 않았을때 - userno ==0
		int userno = 0;
		HttpSession session = request.getSession();
		if (session.getAttribute("my_session") != null) {
			userno = (int) session.getAttribute("my_session");
		}
		// 쿠키에 저장되어있는 위시리스트가 내 계정의 위시리스트가 맞는지 확인 -> 아니라면 my_wish 지우기
		if (my_wish != 0) {
			Wishlist oldwish = new Wishlist();
			oldwish.setWishno(my_wish);
			Wishlist newwish = new Wishlist();
			try {
				// 데이터 조회
				newwish = wishlistService.getWishListOne(oldwish);
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			if (newwish.getUserno() != userno) {
				Cookie cookiewish = new Cookie("my_wish", "0");
				cookiewish.setPath("/");
				cookiewish.setDomain("itproject.ezenac.co.kr");
				cookiewish.setMaxAge(0);
				response.addCookie(cookiewish);
				my_wish = 0;
			}
		}

		Wishlist basicoutput = new Wishlist();
		if (my_wish == 0 && userno != 0) { // 로그인은 했으나 쿠키에 위시리스트가 저장되어있지 않을때 기본 위시리스트에 저장
			// 사용자의 기본위시리스트번호 조회
			Wishlist basicinput = new Wishlist();
			basicinput.setUserno(userno);

			try {
				// 데이터 조회
				basicoutput = wishlistService.selectBasicWish(basicinput);
				my_wish = basicoutput.getWishno();
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
		}
		
		
		wishValue.setWishno(my_wish);
		wishValue.setProdno(prodno);
		Wish_prod wishoutput = new Wish_prod();
		try {
			wishoutput = wishlistService.getWishitem(wishValue);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		Wishlist wishlistinputs = new Wishlist();
		wishlistinputs.setWishno(my_wish);
		List<Wish_prod> wishoutputs = new ArrayList<Wish_prod>();
		try {
			wishoutputs = wishlistService.getWishitemList(wishlistinputs);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** ---------------------리뷰 관련----------------------- */
		/** ---------로그인을 했을 경우---------- !! */
		List<Orderlist> orderoutput = null;
		Order_prod orderprod = new Order_prod();
		Delivery delivery = new Delivery();
		Review review = new Review();
		Review result = new Review();
		int orderno = 0;

		if (userno != 0) {
			/** ----리뷰를 작성할 자격이 있는지 검사---- */
			/** 1) 주문 내역이 있는지 확인 */
			Orderlist orderinput = new Orderlist();
			orderinput.setUserno(userno);
			try {
				// 데이터 조회
				orderoutput = reviewService.getOrderList(orderinput);
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			/** 2) 조회한 주문 내역 중에서 현재 페이지의 상품을 구매했는지 확인 */
			if (orderoutput.size() != 0) {
				for (int i = 0; i < orderoutput.size(); i++) {
					Orderlist item = orderoutput.get(i);

					Order_prod orderprodinput = new Order_prod();

					orderprodinput.setOrderno(item.getOrderno());
					orderprodinput.setProdno(prodno);

					try {
						// 데이터 조회
						orderprod = reviewService.getOrderProd(orderprodinput);
					} catch (Exception e) {
						return webHelper.redirect(null, e.getLocalizedMessage());
					}

					/** 3) 그 주문한 내역이 배송상태가 배송완료인 상태인지 확인 */
					if (orderprod != null) {
						Delivery deliveryinput = new Delivery();
						deliveryinput.setOrderno(orderprod.getOrderno());

						try {
							// 데이터 조회
							delivery = reviewService.getDelivery(deliveryinput);
						} catch (Exception e) {
							return webHelper.redirect(null, e.getLocalizedMessage());
						}

						/** 4) 그 주문번호로 이 상품에 대해 리뷰를 작성한적이 있는지 확인 */
						if (delivery != null) {
							review.setOrderno(delivery.getOrderno());
							review.setProdno(prodno);

							try {
								// 데이터 조회
								result = reviewService.getReviewCount(review);
							} catch (Exception e) {
								return webHelper.redirect(null, e.getLocalizedMessage());
							}
							System.out.println("result=============" + result);
							if (result == null) {
								orderno = review.getOrderno();
							}
						}
					}
				}
			}
		}

		/** ----------리뷰 목록------------ */
		Review reviewinput = new Review();
		List<Review> reviewList = null;
		reviewinput.setProdno(prodno);

		/** ---------리뷰 답변 목록---------- */
		RevComment revcomoutput = new RevComment();
		List<RevComment> reviewadminList = null;

		try {
			// 데이터 조회
			reviewList = reviewService.getReviewList(reviewinput);
			reviewadminList = reviewService.admintReviewAllList(revcomoutput);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		// System.out.println("result============="+result);
		// System.out.println("result============="+orderno);

		/** 3) View 처리하기 */
		model.addAttribute("wishoutput", wishoutput);
		model.addAttribute("wishoutputs", wishoutputs);
		model.addAttribute("imgoutput", imgoutput);
		model.addAttribute("similar", similar);
		model.addAttribute("imgList", imgList);
		model.addAttribute("category", category);
		model.addAttribute("output", output);
		model.addAttribute("my_wish", my_wish);
		model.addAttribute("userno", userno);
		model.addAttribute("basicoutput", basicoutput);
		model.addAttribute("result", result);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("orderno", orderno);
		model.addAttribute("revcom", reviewadminList);
		return new ModelAndView("03_detail/detail");

	}

	/** 상품 관리 목록 관리자 페이지 */
	@RequestMapping(value = "/11_admin/stock_management.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView stockproduct(Model model, HttpServletRequest request,
			@RequestParam(value = "page", defaultValue = "1") int nowPage,
			@RequestParam(value = "catno1", defaultValue = "0") int catno1,
			@RequestParam(value = "search_catno2", required = false, defaultValue = "0") int search_catno2,
			@RequestParam(value = "search_condition", required = false) String search_condition,
			@RequestParam(value = "search_name_number", required = false) String search_name_number,
			@RequestParam(value = "search_count", required = false) String search_count,
			@RequestParam(value = "search_stock", required = false, defaultValue = "0") int search_stock,
			@RequestParam(value = "search_group", required = false) String search_group,
			@RequestParam(value = "search_display", required = false) String search_display) {
		/** 1) 유효성 검사 */
		String adminno = "";
		HttpSession session = request.getSession();
		if (session.getAttribute("my_admin") != null) {
			adminno = (String) session.getAttribute("my_admin");
		}
		if (adminno == "") {
			return webHelper.redirect(null, "관리자로 로그인을 해주세요.");
		}
		// 검색 기능 구현

		/** 페이지 구현에 필요한 변수값 생성 */
		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Product input = new Product();

		// 검색 버튼 클릭시 - > 파라미터가 있는 경우
		// 카테고리 선택시
		if (search_catno2 != 0) {
			input.setCatno2(search_catno2);
		}
		// 제품번호 or 제품명으로 검색시
		if (search_name_number != "") {
			if (search_condition != null) {
				if (search_condition.equals("product_name")) {
					input.setName(search_name_number);
				} else if (search_condition.equals("product_num")) {
					int prodno = Integer.parseInt(search_name_number);
					input.setProdno(prodno);
				}
			}
		}
		// 재고여부로 검색시
		if(search_count != null) {
			if(search_count.equals("Y")) {
				if(search_stock != 0) {
					input.setStock(search_stock);
				}
			}else if(search_count.equals("N")) {
				input.setStock(0);
			}
		}
		
		// 그룹으로 검색시
		if(search_group!=null) {
			input.setGroup(search_group);
		}
		
		// 진열 여부로 검색시
		if(search_display != null) {
			input.setDisplay(search_display);
		}

		PageData pageData = null;

		// 조회결과를 저장할 객체 선언
		List<Product> output = null;
		
		//총 상품 개수
		int allcount = 0;
	    Product allinput = new Product();

		try {
			// 데이터 조회
			allcount = productService.getProductCountAdmin(allinput);
			totalCount = productService.getProductCountAdmin(input);

			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			Product.setOffset(pageData.getOffset());
			Product.setListCount(pageData.getListCount());
			output = productService.getProductListAll(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 데이터 조회하기 **/
		// 카테고리 대분류 목록 조회 결과를 저장할 객체 선언
		List<Prod_category1> category1 = null;

		// 카테고리 소분류 목록 조회 결과를 저장할 객체 선언
		// catno1을 Prod_category2 Beans에 넣어서 2차 카테고리 추출
		Prod_category2 cat2 = new Prod_category2();
		cat2.setCatno1(catno1);
		List<Prod_category2> category2 = null;

		try {
			// 데이터 조회 --> 검색조건 없이 모든 카테고리 조회
			category1 = productService.category(null);
			// 2차 카테고리 -> catno1을 넣은 Beans를 파라미터로 넣고 카테고리 데이터 조회
			category2 = productService.category2(cat2);
			// 데이터 조회 -> 검색조건 없이 모든 상품 조회
			// output = productService.getProductList(null);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** View 처리 **/
		model.addAttribute("category1", category1);
		model.addAttribute("category2", category2);
		
		/** 3) View 처리하기 */
		model.addAttribute("search_display", search_display);
		model.addAttribute("catno1", catno1);
		model.addAttribute("search_catno2", search_catno2);
		model.addAttribute("search_condition", search_condition);
		model.addAttribute("search_count", search_count);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		model.addAttribute("allcount", allcount);
		model.addAttribute("search_name_number", search_name_number);
		model.addAttribute("search_stock", search_stock);
		model.addAttribute("search_group", search_group);
		return new ModelAndView("11_admin/stock_management");
	}
}
