package com.project.laporte.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.laporte.helper.RegexHelper;
import com.project.laporte.helper.WebHelper;
import com.project.laporte.model.Cart;
import com.project.laporte.model.Wish_prod;
import com.project.laporte.service.CartService;
import com.project.laporte.service.ProductService;
import com.project.laporte.service.UserService;
import com.project.laporte.service.WishlistService;

@RestController
public class CartRestController {
	
	/** Webhelper 주입 */
	// -> import org.springframework.beans.factory.annotation.Autowired;
	// -> import study.spring.springhelper.helper.WebHelper;
	@Autowired WebHelper webHelper;
	
	/** RegexHelper 주입 */
	// -> import study.spring.springhelper.helper.RegexHelper;
	@Autowired RegexHelper regexHelper;
	
	/** Service 패턴 구현체 주입 */
	// -> import study.spring.springhelper.service.CartService;
	@Autowired CartService cartService;
	
	// -> import study.spring.springhelper.service.UserService;
	@Autowired UserService userService;
	
	// -> import study.spring.springhelper.service.ProductService;
	@Autowired ProductService productService;
	
	// -> import study.spring.springhelper.service.WishlistService;
	@Autowired WishlistService wishlistService;
	
	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	// -> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;
    
    /** 저장 */
    @RequestMapping(value = "/06_cart/cart", method = RequestMethod.POST)
    public Map<String, Object> post(HttpServletRequest request,
    		@RequestParam(value="userno", defaultValue="0") int userno,
    		@RequestParam(value="prodno", defaultValue="0") int prodno,
    		@RequestParam(value="ea", defaultValue="1") int ea,
    		@RequestParam(value="wishno", defaultValue="0") int wishno) {
    	
    	if (prodno == 0)                       	{ return webHelper.getJsonWarning("제품번호를 입력하세요."); }
    	if (prodno <= 20001 && prodno >= 29999)	{ return webHelper.getJsonWarning("제품번호는 20001번부터 29999까지 입니다."); }
    	
    	if (userno == 0) {
    		return webHelper.getJsonWarning("로그인을 먼저 해주세요.");
    	} else {
    		HttpSession session = request.getSession();
    		userno = (int) session.getAttribute("my_session");
    	}
    	
    	/** 1) 데이터 저장하기 */
    	// 저장할 값들을 Beans에 담는다.
    	Cart input = new Cart();
    	input.setProdno(prodno);
    	input.setEa(ea);
    	input.setUserno(userno);
    	
    	// 저장된 결과를 조회하기 위한 객체
		List<Cart> output = null;
		int count = 0;
    	
		// 중복검사
		try {
			count = cartService.countCart(input);
		} catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }
		
		// 갯수 추가 수정
		if (count != 0) {
			try {
				ea = cartService.updateCart(input);
				
				// 데이터 조회
				output = cartService.getCartList(input);
				
			} catch (Exception e) {
	            return webHelper.getJsonError(e.getLocalizedMessage());
	        }
		} else {
		
	    	try {
				// 데이터 저장
				// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
	    		input.setUserno(userno);
				cartService.addCart(input);
				
				// 데이터 조회
				output = cartService.getCartList(input);
				
			} catch(Exception e) {
				return webHelper.getJsonError(e.getLocalizedMessage());
			}
		}
		
		if(wishno != 0) {
			Wish_prod wishprod = new Wish_prod();
			wishprod.setWishno(wishno);
			wishprod.setProdno(prodno);
			
			try {
				wishlistService.deleteWishlistItem(wishprod); // 위시리스트 안에있는 상품을 삭제
			} catch (Exception e) {
				return webHelper.getJsonError(e.getLocalizedMessage());
			}
		}
    	
    	/** 2) 결과를 확인하기 위한 페이지 연동*/
		// 저장 결과를 확인하기 위해 데이터 저장 시 생성된 PK값을 상세 페이지로 전달해야 한다.
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", output);
		return webHelper.getJsonData(map);
    }
    
    /** 수정 */
    @RequestMapping(value="/06_cart/cart", method = RequestMethod.PUT)
    public Map<String, Object> put(HttpServletRequest request,
    		@RequestParam(value="cartno", defaultValue="0") int cartno,
    		@RequestParam(value="ea", defaultValue="0") int ea) {
    	
    	/** 1) 데이터 수정하기 */
    	// 수정할 값들을 Beans에 담는다.
    	HttpSession session = request.getSession();
    	int userno = (int) session.getAttribute("my_session");
    	
    	Cart input = new Cart();
    	input.setEa(ea);
    	input.setCartno(cartno);
    	
    	// 수정된 결과를 조회하기 위한 객체
    	List<Cart> output = null;
    	
    	try {
    		// 데이터 수정
    		cartService.editCart(input);
    		// 수정 결과 조회
    		input.setUserno(userno);
    		output = cartService.getCartList(input);
    	} catch (Exception e) {
    		return webHelper.getJsonError(e.getLocalizedMessage());
    	}
    	
    	/** 3) 결과를 확인하기 위한 JSON 출력 */
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("item", output);    	
    	return webHelper.getJsonData(map);
    }
    
    /** 삭제 */
    @RequestMapping(value = "/06_cart/cart", method = RequestMethod.DELETE)
	public Map<String, Object> delete(
			@RequestParam(value = "cartno", defaultValue = "0") int cartno) {
    	
		/** 1) 파라미터 유효성 검사 */
    	// 이 값이 존재하지 않는다면 데이터가 삭제가 불가능하므로 반드시 필수값으로 처리해야 한다.
    	if (cartno == 0) {
    		return webHelper.getJsonWarning("장바구니정보가 없습니다.");
    	}
    	
    	/** 2) 데이터 삭제하기 */
    	// 데이터 삭제에 필요한 조건값을 Beans에 저장하기
    	Cart input = new Cart();
    	input.setCartno(cartno);
    	
    	try {
    		cartService.deleteCart(input);	// 데이터 삭제
    	} catch (Exception e) {
    		return webHelper.getJsonError(e.getLocalizedMessage());
    	}
    	
    	/** 3) 결과를 확인하기 위한 JSON 출력 */
    	// 확인할 대상이 삭제된 결과값만 OK로 전달
    	return webHelper.getJsonData();
    }
}