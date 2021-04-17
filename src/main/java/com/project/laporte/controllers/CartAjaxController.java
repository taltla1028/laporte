package com.project.laporte.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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

import com.project.laporte.helper.RegexHelper;
import com.project.laporte.helper.WebHelper;
import com.project.laporte.model.Cart;
import com.project.laporte.model.Product;
import com.project.laporte.model.Wish_prod;
import com.project.laporte.model.Wishlist;
import com.project.laporte.service.CartService;
import com.project.laporte.service.ProductListService;
import com.project.laporte.service.ProductService;
import com.project.laporte.service.UserService;
import com.project.laporte.service.WishlistService;

@Controller
public class CartAjaxController {

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
	
	// -> import com.project.laporte.service.ProductListService;
	@Autowired ProductListService productListService;
	
	@Autowired
	WishlistService wishlistService;
	
	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	// -> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/** 목록 페이지 */
    @RequestMapping(value = "/06_cart/cart.do", method = RequestMethod.GET)
    public ModelAndView list(Model model, HttpServletRequest request,
            @RequestParam(value="userno", defaultValue="0") int userno,
            @RequestParam(value="prodno", defaultValue="0") int prodno,
            @CookieValue(value="my_wish", defaultValue="0", required=false)int my_wish) {

    	/** 1) 데이터 조회하기 */
        // 조회에 필요한 조건값를 Beans에 담는다.
        Cart input = new Cart();
        Product productInput = new Product();
        
        List<Cart> output = null;   // 조회결과가 저장될 객체
        List<Product> productOutput = new ArrayList<Product>();
        
        try {
        	if(userno == 0) {
        		input.setUserno(userno);
        		output = cartService.getCartList(input);
        		productOutput = productListService.getProductlistList(productInput);
        		
        	// 데이터 조회하기
        	} else { 
        		HttpSession session = request.getSession();
        		userno = (int) session.getAttribute("my_session");
        		
        		input.setUserno(userno);
        		output = cartService.getCartList(input);
        		productOutput = productListService.getProductlistList(productInput);
    		}
        	
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
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
		
		
		Wishlist wishlistinputs = new Wishlist();
		wishlistinputs.setWishno(my_wish);
		List<Wish_prod> wishoutput = new ArrayList<Wish_prod>();
		try {
			wishoutput = wishlistService.getWishitemList(wishlistinputs);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
        
        /** 2) View 처리 */
        model.addAttribute("output", output);
        model.addAttribute("my_wish", my_wish);
        model.addAttribute("userno", userno);
        model.addAttribute("wishoutput", wishoutput);
        model.addAttribute("productOutput", productOutput);

        return new ModelAndView("06_cart/cart");
    }
    
}
