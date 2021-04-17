package com.project.laporte.model;

import lombok.Data;

@Data
public class Orderlist {
	
	//1) 기본 컬럼
	private int orderno;
	private String addr1;
	private String addr2;
	private String postcode;
	private String name;
	private String email;
	private String phoneno;
	private String loctype;
	private String servicetype;
	private String request;
	private String sizelimit;
	private String deldate;
	private String paytype;
	private int totalprice;
	private int usrcouponno;
	private int userno;
	private int point;
	private int deltypeno;
	private String orderstatus;
	private String paystatus;
	private String regdate;
	private String editdate;
	private String ccdate;
	private String ccstatus;
	private String delistatus;
	
	//2) deltype(배송 유형) 테이블과 조인
	private String d_name;
	private int d_price;
	
	
	//3) coupon(쿠폰) 테이블과 조인
	private String couponno;
	private String c_name;
	private int discount;
	private String distype;
	
	//4) product(제품) 테이블과 조인
	private int prodno;
	private String pname;
	private int ea;
	private int price;
	private String size;
	private String color;
	
	//5) firstimg 테이블과 조인
	private String thumbnailUrl;
	
	//6) delivery 테이블과 조인
	private int deliveryno;					// 배송 번호(PK)
	private String deliverydate;			// 배송 날짜
	private String deliverystatus;			// 배송 상태 ( 결제전 N, 준비중 R, 배송대기 S, 배송중 D, 배송완료 C)
	private int trackingnum;				// 운송장 번호
	
	// 5) 페이지 구현을 위한 static 변수
	/** LIMIT 절에서 사용할 조회 시작 위치 */
	private static int offset;
	
	/** LIMIT 절에서 사용할 조회할 데이터 수 */
	private static int listCount;

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		Orderlist.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		Orderlist.listCount = listCount;
	}
}
