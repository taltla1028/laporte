package com.project.laporte.controllers;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.project.laporte.model.Firstimg;
import com.project.laporte.model.Prod_category1;
import com.project.laporte.model.Prod_category2;
import com.project.laporte.model.Product;
import com.project.laporte.model.Wish_prod;
import com.project.laporte.model.Wishlist;
import com.project.laporte.service.ProductListService;
import com.project.laporte.service.ProductService;
import com.project.laporte.service.WishlistService;

@Controller
public class ProductListAjaxController {
	
	/** WebHelper 주입 */
	@Autowired  WebHelper webHelper;
	
	/** RegexHelper 주입 */
	@Autowired  RegexHelper regexHelper;
	
	/** Service 패턴 구현체 주입 */
	@Autowired ProductListService productListService;
	@Autowired ProductService productService;
	@Autowired WishlistService wishlistService;
	
	
	@RequestMapping(value="03_detail/allproduct2.do",method = RequestMethod.GET)
	public ModelAndView prdocutlist(Model model,
			@RequestParam(value="catno1",defaultValue ="0")int catno1,
			@RequestParam(value="prodno",defaultValue ="0", required=false)int prodno,
			// 검색어
            @RequestParam(value="keyword", required=false) String keyword,
            HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="catno2",defaultValue ="0")int catno2,
			@RequestParam(value="page", defaultValue="1")int nowPage,
			@CookieValue(value = "my_wish", defaultValue = "0", required = false) int my_wish){ 
		/** 1) 유효성 검사 */
		System.out.println("=================================nowpage"+nowPage );
		
		/** 페이지 구현에 필요한 변수값 생성 */
		int totalCount = 0;		// 전체 게시글 수 
		int listCount = 6;		// 한 페이지당 표시할 목록 수
		int pageCount = 5;		// 한 그룹당 표시할 페이지 번호 수
		// 현재 상품이 위시리스트에 담겨있는지 확인
				Wish_prod wishValue = new Wish_prod();
		
		// 로그인 여부 확인 -> 로그인 중 일때 - userno!=0 / 로그인 하지 않았을때 - userno ==0
			int userno = 0;
			HttpSession session = request.getSession();
			if (session.getAttribute("my_session") != null) {
				userno = (int) session.getAttribute("my_session");
			}
			
		//쿠키에 저장되어있는 위시리스트가 내 계정의 위시리스트가 맞는지 확인 -> 아니라면 my_wish 지우기
		if(my_wish!=0) {
			Wishlist oldwish = new Wishlist();
			oldwish.setWishno(my_wish);
			Wishlist newwish = new Wishlist();
			try {
				// 데이터 조회
				newwish = wishlistService.getWishListOne(oldwish);
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			if(newwish.getUserno() != userno) {
				Cookie cookiewish = new Cookie("my_wish", "0");
				cookiewish.setPath("/");
				cookiewish.setDomain("itproject.ezenac.co.kr");
				cookiewish.setMaxAge(0);
				response.addCookie(cookiewish);
				my_wish=0;
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
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
		}

		
		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Product input = new Product();
		input.setCatno1(catno1);
		if(catno2 != 0) {
		input.setCatno2(catno2);
		}
		input.setName(keyword);
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
			totalCount = productListService.getProductCount(input);
			
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			Product.setOffset(pageData.getOffset());
			Product.setListCount(pageData.getListCount());
			output = productListService.getProductlistList(input);
			category1 = productService.category(null);
			category2 = productService.category2(cat2);
			fimg = productListService.getFirstimgList(null);
			
		}catch(Exception e) { 
			
			return webHelper.redirect(null, e.getLocalizedMessage());
			
		}
		
		wishValue.setWishno(my_wish);
		wishValue.setProdno(prodno);
		Wish_prod wishoutput = new Wish_prod();
		try {
			wishoutput = wishlistService.getWishitem(wishValue);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		// View 처리
		model.addAttribute("userno",userno);
		model.addAttribute("input",input);
		model.addAttribute("output",output);
		model.addAttribute("category1", category1);
		model.addAttribute("category2", category2);
		model.addAttribute("fimg",fimg);
		model.addAttribute("keyword", keyword);
		model.addAttribute("wishoutput", wishoutput);
		model.addAttribute("my_wish", my_wish);
		model.addAttribute("basicoutput", basicoutput);
		model.addAttribute("pageData", pageData);
		
		return new ModelAndView ("03_detail/allproduct2");
	}
	
}
