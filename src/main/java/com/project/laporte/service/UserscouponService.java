package com.project.laporte.service;

import java.util.List;

import com.project.laporte.model.Userscoupon;

public interface UserscouponService {
	
	/** 회원 쿠폰 추가 */
	public int addUsersCoupon(Userscoupon input) throws Exception;
	
	/** 회원 쿠폰 단일 조회 */
	public Userscoupon getUsersCoupon(Userscoupon input) throws Exception;

	/** 쿠폰 목록 조회 */
	public List<Userscoupon> getUsersCouponList(Userscoupon input) throws Exception;
	
	/** 사용한 쿠폰 업데이트 */
	public int updateUsersCoupon(Userscoupon input) throws Exception;
	
	/** 회원 가입 쿠폰 추가 */
	public int addJoinCoupon(Userscoupon input) throws Exception;
	
	/** 중복 쿠폰 보유 여부 확인 */
	public Userscoupon checkUsersCoupon(Userscoupon input) throws Exception;
}
	

