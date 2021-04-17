package com.project.laporte.controllers;

import java.util.HashMap;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.laporte.helper.RegexHelper;
import com.project.laporte.helper.WebHelper;
import com.project.laporte.model.Coupon;
import com.project.laporte.service.CouponService;

@RestController
public class CouponRestController {
	
	 /** WebHelper 주입 */
    @Autowired  WebHelper webHelper;

    /** RegexHelper 주입 */
    @Autowired  RegexHelper regexHelper;
    
    /** Service 패턴 구현체 주입 */
    @Autowired  CouponService couponService;

    /** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
    @Value("#{servletContext.contextPath}")
    String contextPath;
    
    /** 새로운 쿠폰 생성 */
    @RequestMapping(value="/11_admin/admin_coupon", method=RequestMethod.POST)
    public Map<String, Object>add_coupon(Model model,
    		@RequestParam(value="name", defaultValue="") String name,
    		@RequestParam(value="startdate", defaultValue="") String startdate,
    		@RequestParam(value="enddate", defaultValue="") String enddate,
    		@RequestParam(value="discount", defaultValue="0") int discount,
    		@RequestParam(value="distype", defaultValue="") String distype,
    		@RequestParam(value="dupliuse", defaultValue="") String dupliuse,
    		@RequestParam(value="link", defaultValue="") String link
    		){
    	
    	/**1) 사용자가 입력한 파라미터 유효성 검사*/
		if(!regexHelper.isValue(name))				{return webHelper.getJsonWarning("쿠폰이름을 입력하세요.");}
		//if(!regexHelper.isValue(startdate))			{return webHelper.getJsonWarning("쿠폰 시작일을 입력하세요.");}
		//if(!regexHelper.isValue(enddate))			{return webHelper.getJsonWarning("쿠폰 만료일을 입력하세요.");}
		if(!regexHelper.isValue(distype))			{return webHelper.getJsonWarning("쿠폰 할인 타입을 선택하세요.");}
		if(!regexHelper.isValue(dupliuse))			{return webHelper.getJsonWarning("중복 사용 여부를 선택하세요.");}
		if(!regexHelper.isValue(link))				{return webHelper.getJsonWarning("쿠폰링크를 입력하세요.");}
        
		/** 2) 데이터 저장하기 */
		//저장할 값들을 Beans에 담는다.
		Coupon input = new Coupon();
		input.setName(name);
		input.setStartdate(startdate);
		input.setEnddate(enddate);
		input.setDiscount(discount);
		input.setDistype(distype);
		input.setDupliuse(dupliuse);
		input.setLink(link);
		
		//저장된 결과를 조회하기 위한 객체
		Coupon output = null;
		
		try {
			//데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			couponService.addCoupon(input);
			
			//데이터 조회
			output = couponService.getCoupon(input);
		}catch(Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		/** 결과를 확인하기 위한 페이지 연동 */
		//저장 결과를 확인하기 위해 데이터 저장 시 생성된 PK값을 상세 페이지로 전달해야 한다.
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", output);
		return webHelper.getJsonData();
    }
    
    /** 쿠폰 수정 */
    @RequestMapping(value="/11_admin/admin_coupon", method=RequestMethod.PUT)
    public Map<String, Object>revise_coupon_ok(Model model,
    		@RequestParam(value="couponno", defaultValue="0") int couponno,
    		@RequestParam(value="name", defaultValue="") String name,
    		@RequestParam(value="startdate", defaultValue="") String startdate,
    		@RequestParam(value="enddate", defaultValue="") String enddate,
    		@RequestParam(value="discount", defaultValue="0") int discount,
    		@RequestParam(value="distype", defaultValue="") String distype,
    		@RequestParam(value="dupliuse", defaultValue="") String dupliuse,
    		@RequestParam(value="link", defaultValue="") String link
    		){
    	
    	/**1) 사용자가 입력한 파라미터 유효성 검사*/
		if(!regexHelper.isValue(name))				{return webHelper.getJsonWarning("쿠폰이름을 입력하세요.");}
		if(!regexHelper.isValue(startdate))			{return webHelper.getJsonWarning("쿠폰 시작일을 입력하세요.");}
		if(!regexHelper.isValue(enddate))			{return webHelper.getJsonWarning("쿠폰 만료일을 입력하세요.");}
		if(!regexHelper.isValue(distype))			{return webHelper.getJsonWarning("쿠폰 할인 타입을 선택하세요.");}
		if(!regexHelper.isValue(dupliuse))			{return webHelper.getJsonWarning("중복 사용 여부를 선택하세요.");}
		if(!regexHelper.isValue(link))				{return webHelper.getJsonWarning("쿠폰링크를 입력하세요.");}
        
		/** 2) 데이터 저장하기 */
		//저장할 값들을 Beans에 담는다.
		Coupon input = new Coupon();
		input.setCouponno(couponno);
		input.setName(name);
		input.setStartdate(startdate);
		input.setEnddate(enddate);
		input.setDiscount(discount);
		input.setDistype(distype);
		input.setDupliuse(dupliuse);
		input.setLink(link);
		
		Coupon output = null;
		
		try {
			//데이터 수정
			couponService.reviseCoupon(input);
			
			//수정 결과 조회
			output = couponService.getCoupon(input);
		}catch(Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		/** 결과를 확인하기 위한 JSON 출력 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", output);
		return webHelper.getJsonData(map);
    }
    
    /** 쿠폰 삭제 */
    @RequestMapping(value="/11_admin/admin_coupon", method=RequestMethod.DELETE)
    public Map<String, Object>delete_coupon_ok(Model model,
    		@RequestParam(value="couponno", defaultValue="0") int couponno){
    	
    	/** 1) 파라미터 유효성 검사 */
    	if(couponno == 0) {
    		return webHelper.getJsonWarning("쿠폰 번호가 없습니다.");
    	}
    	
    	/** 2)데이터 삭제하기 */
    	Coupon input = new Coupon();
    	input.setCouponno(couponno);
    	
    	try {
    		couponService.deleteCoupon(input);
    	}catch(Exception e) {
    		return webHelper.getJsonError(e.getLocalizedMessage());
    	}
    	
    	/** 3) 결과 확인 JSON 출력 */
    	return webHelper.getJsonData();
    }
    
    /** 관리자-쿠폰 상세 조회 */
    @RequestMapping(value = "/11_admin/admin_coupon_detail", method = RequestMethod.GET)
    public Map<String, Object> get_coupon_detail(@RequestParam("couponno") int couponno) {

        /** 1) 데이터 조회하기 */
        // 데이터 조회에 필요한 조건값을 Beans에 저장하기
    	Coupon input = new Coupon();
        input.setCouponno(couponno);

        // 조회결과를 저장할 객체 선언
        //주문정보 조회
		 Coupon output = null;

        try {
            // 데이터 조회
        	 output = couponService.getCoupon(input);
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }

        /** 2) JSON 출력하기 */
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("item", output);

        return webHelper.getJsonData(data);
    }
    
}
