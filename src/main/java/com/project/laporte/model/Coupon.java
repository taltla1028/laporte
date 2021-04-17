package com.project.laporte.model;

import lombok.Data;

@Data
public class Coupon {
	
	/**1) 기본 컬럼 */
	
	private int couponno;			//쿠폰번호(PK)
	private String name;			//쿠폰이름
	private String startdate;		//쿠폰 시작날짜
	private String enddate;			//쿠폰 만료날짜
	private int discount;			//쿠폰할인
	private String distype;			//할인유형(퍼센트)
	private String dupliuse;		//쿠폰 중복 사용여부
	private String link;			//쿠폰링크
	private String expire;			//쿠폰 만료여부
	private String regdate;			//생성날짜
	private String editdate;		//수정날짜
}
