package com.project.laporte.scheduler;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;


import com.project.laporte.helper.WebHelper;
import com.project.laporte.model.Coupon;
import com.project.laporte.service.CouponService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller

public class CouponScheduler {
	/** 쿠폰 서비스 주입 */
	@Autowired CouponService couponService;
	@Autowired WebHelper webHelper;
	
	
	public void couponExpire() {
		
		/** 오늘 날짜 캘린더로 정의하기 */
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DAY_OF_MONTH, -1);
		
		String date = String.format("%04d-%02d-%02d", c.get(Calendar.YEAR), c.get(Calendar.MONTH)+1, c.get(Calendar.DAY_OF_MONTH));
		
		List<Coupon> couponList = null;
		Coupon couponItem = null;
		
		try {
			couponList = couponService.getCouponList(null);
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			
			for(int i = 0; i<couponList.size(); i++) {
				couponItem = couponList.get(i);
				String couponItemDate = couponItem.getEnddate();
				
				Date today = dateFormat.parse(date);
				Date couponDate = dateFormat.parse(couponItemDate);
			
				if(couponDate.before(today)) {
					couponService.expireCoupon(couponItem);
				}
				
			}	
			}catch (Exception e) {
	            System.out.println(e);
	        }
		
		
	}

}
