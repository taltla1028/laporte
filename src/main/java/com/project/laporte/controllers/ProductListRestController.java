package com.project.laporte.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.laporte.helper.PageData;
import com.project.laporte.helper.RegexHelper;
import com.project.laporte.helper.WebHelper;
import com.project.laporte.model.Firstimg;
import com.project.laporte.model.Prod_category1;
import com.project.laporte.model.Prod_category2;
import com.project.laporte.model.Product;
import com.project.laporte.service.ProductListService;
import com.project.laporte.service.ProductService;

@RestController
public class ProductListRestController {
	/** WebHelper 주입 */
	@Autowired  WebHelper webHelper;
	
	/** RegexHelper 주입 */
	@Autowired  RegexHelper regexHelper;
	
	/** Service 패턴 구현체 주입 */
	@Autowired ProductListService productListService;
	@Autowired ProductService productService;
	
	/** 목록 페이지 */
	@RequestMapping(value ="/03_detail", method = RequestMethod.GET)
	public Map<String, Object>get_list(
			// 검색어
			@RequestParam(value="catno1",defaultValue ="0")int catno1,
			@RequestParam(value="catno2",defaultValue ="0")int catno2,
			@RequestParam(value="page", defaultValue="1")int nowPage){
		
		/** 1) 페이지 구현에 필요한 변수값 생성 */
		int totalCount = 0;		// 전체 게시글 수 
		int listCount = 5;		// 한 페이지당 표시할 목록 수
		int pageCount = 5;		// 한 그룹당 표시할 페이지 번호 수 
		
		Product input = new Product();
		
		input.setCatno1(catno1);
		if(catno2 != 0) {
		input.setCatno2(catno2);
		}
		Prod_category2 cat2 = new Prod_category2();
		cat2.setCatno1(catno1);
		List<Prod_category2> category2 = null;
		/** 조회결과를 저장할 객체 선언 */
		List<Prod_category1> category1 = null;
		List<Product> output = null;
		List<Firstimg> fimg = null;
		PageData pageData = null;
		
		try {
			// 데이터 조회
			// 전체 게시글 수 조회
			totalCount = productListService.getProductCount(input);
			
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			output = productListService.getProductlistList(input);
			category1 = productService.category(null);
			category2 = productService.category2(cat2);
			fimg = productListService.getFirstimgList(null);
			
			Product.setOffset(pageData.getOffset());
			Product.setListCount(pageData.getListCount());
		}catch(Exception e) { 
			
			return webHelper.getJsonError(e.getLocalizedMessage());
			
		}
		/** 3) JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("category1", category1);
		data.put("category2", category2);
		data.put("fimg", fimg);
		data.put("item", output);
		data.put("meta", pageData);
		
		return webHelper.getJsonData(data);
	}
			
	
}
