package com.project.laporte.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.laporte.helper.RegexHelper;
import com.project.laporte.helper.WebHelper;
import com.project.laporte.model.Coupon;
import com.project.laporte.model.Userscoupon;
import com.project.laporte.service.CouponService;
import com.project.laporte.service.UserscouponService;

@Controller
public class CouponAjaxController {

	/** WebHelper 주입 */
	@Autowired  WebHelper webHelper;
	
	/** RegexHelper 주입 */
	@Autowired  RegexHelper regexHelper;
	
	/** Service 패턴 구현체 주입 */
	@Autowired  CouponService couponService;
    @Autowired	UserscouponService userscouponService;
	
	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/** 쿠폰 목록(관리자) */
	 @RequestMapping(value="/11_admin/admin_coupon.do", method=RequestMethod.GET)
	    public ModelAndView adminCoupon(Model model, HttpServletResponse response,
	    		HttpServletRequest request,
	    		@RequestParam(value="couponno", defaultValue="0") int couponno ) {
		 
		 /** 로그인 여부 검사 */
			String adminno = "";
			HttpSession session = request.getSession();
	    	if(session.getAttribute("my_admin")!=null) {
	    		adminno = (String) session.getAttribute("my_admin");
	    	}
	    	if(adminno == "") {
	    		return webHelper.redirect(null, "관리자로 로그인을 해주세요.");
	    	}
	    	
		 List<Coupon> coupon = null;
		 List<Coupon> end_coupon = null;
		 
		//데이터 조회에 필요한 조건값을 Beans에 저장하기
		 Coupon input = new Coupon();
		 input.setCouponno(couponno);
		 
		 //수정할 데이터의 원본 조회하기
		 Coupon edit_coupon = null;
		 
		 try {
			 //만료전 쿠폰 조회하기
			 coupon = couponService.getCouponList(null);
			 
			 //만료된 쿠폰 조회하기
			 end_coupon = couponService.getEndCouponList(null);
			 
			 if(couponno != 0) {
				 
				//데이터 조회하기
				 edit_coupon = couponService.getCoupon(input);
				 //만료전 쿠폰 조회하기
				 coupon = couponService.getCouponList(null);
				 
				 //만료된 쿠폰 조회하기
				 end_coupon = couponService.getEndCouponList(null);			 
				 model.addAttribute("edit_coupon", edit_coupon);
				 
			 }
			 
		 }catch(Exception e) {e.printStackTrace();}
		 
		 //View 처리
		 model.addAttribute("output", coupon);
		 model.addAttribute("end_coupon", end_coupon);
	     return new ModelAndView("11_admin/admin_coupon");
	    }
	 
	 /** 쿠폰 수정 폼 */
	 @RequestMapping(value="/11_admin/admin_coupon_rev.do", method=RequestMethod.GET)
	    public ModelAndView revise_coupon(Model model, HttpServletResponse response,
	    		@RequestParam(value="couponno") int couponno) {
		 
		 //데이터 조회에 필요한 조건값을 Beans에 저장하기
		 Coupon input = new Coupon();
		 input.setCouponno(couponno);
		 
		 //수정할 데이터의 원본 조회하기
		 Coupon output = null;
		 
		 try {
			 //데이터 조회하기
			 output = couponService.getCoupon(input);
		 }catch(Exception e) {e.printStackTrace();}
		 
		 //View 처리
		 model.addAttribute("output", output);
	     return new ModelAndView("11_admin/admin_coupon_rev");
	    }
	 
	   /** 사용자-쿠폰추가*/
	    @RequestMapping(value="/10_event/coupon", method = RequestMethod.GET)
	    public ModelAndView add_usrcoupon(
	    		Model model, HttpServletRequest request,
	    		@RequestParam(value= "couponno", defaultValue="0") int couponno,
	    		@RequestParam(value= "userno", defaultValue="0") int userno){
	    	if(userno==0) {
	    		HttpSession session = request.getSession();
	        	if(session.getAttribute("my_session")!=null) {
	        		userno = (int) session.getAttribute("my_session");
	        	}else {
	        		return webHelper.redirect(null, "로그인을 해주세요.");
	        	}
	    	}
	    	System.out.println("======================"+userno);
	    	/** 1) 쿠폰 저장하기 */
	    	//userno 과 couponno 파라미터를 Userscoupon 객체에 넣어 저장하기
	    	Userscoupon input = new Userscoupon();
	    	input.setUserno(userno);
	    	input.setCouponno(couponno);
	    	
	    	
	    	Userscoupon output = null;
	    	
	    	try {
	    		output = userscouponService.checkUsersCoupon(input);
	    		
	    		if(output == null) {
	    		userscouponService.addUsersCoupon(input);
	    		output = userscouponService.getUsersCoupon(input);
	    		}else {
	    			return webHelper.redirect(null, "이미 보유한 쿠폰입니다." );
	    		}
	    		
	    	}catch(Exception e) {e.printStackTrace();}
			 
			//페이지 이동
	    	//쿠폰 추가 후 메시지와 함께 이벤트 페이지로 이동
		     return webHelper.redirect(contextPath + "/10_event/event.do", "쿠폰이 추가되었습니다.");
	  
	    	
	    }
}
