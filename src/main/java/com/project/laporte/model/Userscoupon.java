package com.project.laporte.model;

import lombok.Data;

@Data
public class Userscoupon {
	
	//1) 기본컬럼
	private int usrcouponno;
	private int userno;
	private int couponno;
	private String usestatus;
	private String regdate;
	private String editdate;
	
	
	//2) user 테이블과 조인
	private int u_userno;
	
	//3) coupon 테이블과 조인
	private String name;			//쿠폰이름
	private String startdate;		//쿠폰 시작날짜
	private String enddate;			//쿠폰 만료날짜
	private int discount;			//쿠폰할인
	private String distype;			//할인유형(퍼센트)
	private String dupliuse;		//쿠폰 중복 사용여부
	private String link;			//쿠폰링크
	private String expire;			//쿠폰 만료여부
}
