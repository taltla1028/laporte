package com.project.laporte.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.laporte.helper.RegexHelper;
import com.project.laporte.helper.WebHelper;
import com.project.laporte.model.Cart;
import com.project.laporte.model.User;
import com.project.laporte.model.Userscoupon;
import com.project.laporte.service.CartService;
import com.project.laporte.service.CouponService;
import com.project.laporte.service.ProductService;
import com.project.laporte.service.UserService;
import com.project.laporte.service.UserscouponService;

@Controller
public class OrderlistAjaxController {
	
	/** WebHelper 주입 */
	@Autowired  WebHelper webHelper;
	
	/** RegexHelper 주입 */
	@Autowired  RegexHelper regexHelper;
	
	/** Service 패턴 구현체 주입 */
	@Autowired  UserService userService;
	@Autowired 	CouponService couponService;
	@Autowired 	CartService cartService;
	@Autowired 	UserscouponService userscouponService;
	@Autowired 	ProductService productService;
	
	
	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value="/07_purchase/purchase/{userno}", method=RequestMethod.POST)
    public ModelAndView purchase(Model model,HttpServletRequest request,
    		@PathVariable(value = "userno") int userno) {
		
		/** 1) 카트 리스트 조회하기*/
				
		//체크된 카트 배열을 불러온다.
		String[] selectedCart = request.getParameterValues("chk[]");
		// 체크된 카트 번호 변수 선언 및 초기화
		int selectedCartno = 0;
		
		// 카트 정보를 불러올 객체 생성
		Cart input = new Cart();
		// 조회한 카트 정보를 담을 객체 초기화
		Cart output = null;
		
		// 여러 개의 카트 정보를 담을 List 객체 생성
		List<Cart> result = new ArrayList<Cart>();
		
		
		/** 3) 회원 정보 불러오기 */
		// 회원 정보를 불러올 객체 생성
		User u_input = new User();
		u_input.setUserno(userno);
		
		// 조회한 회원 정보를 담을 객체 초기화
		User u_output = null;
		
		/** 4) 회원 쿠폰 정보 불러오기 */
		// 조회할 회원 쿠폰 정보를 불러올 객체 생성
		Userscoupon uc_input = new Userscoupon();
		uc_input.setUserno(userno);
		
		// 조회한 회원 쿠폰 정보를 담을 객체 초기화
		List<Userscoupon> uc_output = null;
		
		try {
			for(int i= 0; i < selectedCart.length; i++) {
				// 체크된 카트 번호 int로 parse
				selectedCartno = Integer.parseInt(selectedCart[i]);
				
				input.setCartno(selectedCartno);
				output = cartService.getCartByCartno(input);
			
				// 조회된 카트 정보 담기
				result.add(output);
				
			}		
			
			u_output = userService.getUserItem(u_input);
			uc_output = userscouponService.getUsersCouponList(uc_input);
			
		}catch(Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/**2) View 처리*/
		model.addAttribute("output", result);
		model.addAttribute("u_output", u_output);
		model.addAttribute("uc_output", uc_output);
		
        // "/src/main/webapp/WEB-INF/views/07purchase/purchase.jsp" 파일을 View로 지정한다.
        return new ModelAndView("07_purchase/purchase");
    }
	
	@RequestMapping(value="/07_purchase/daum_pc_find", method=RequestMethod.POST)
    public String daum_pc_find() {
        // "/src/main/webapp/WEB-INF/views/07purchase/daum_pc_find.jsp" 파일을 View로 지정한다.
        return "/07_purchase/daum_pc_find";
    }

	
}
