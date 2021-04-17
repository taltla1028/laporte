package com.project.laporte.service;

import java.util.List;

import com.project.laporte.model.Coupon;

public interface CouponService {
	
	/** 새로운 쿠폰 저장 */
	public int addCoupon(Coupon input) throws Exception;
	
	/** 쿠폰 조회 */
	public Coupon getCoupon(Coupon input) throws Exception;
	
	/** 만료전 쿠폰 목록 조회 */
	public List<Coupon> getCouponList(Coupon input) throws Exception;
	
	/** 만료된 쿠폰 목록 조회 */
	public List<Coupon> getEndCouponList(Coupon input) throws Exception;
	
	/** 쿠폰 정보 수정 */
	public int reviseCoupon(Coupon input) throws Exception;
	
	/** 쿠폰 정보 삭제 */
	public int deleteCoupon(Coupon input) throws Exception;
	
	/** 쿠폰 만료 업데이트 */
	public int expireCoupon(Coupon input) throws Exception;
	
	
	
}
	

