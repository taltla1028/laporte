package com.project.laporte.model;

import lombok.Data;

@Data
public class Delivery {
	private int deliveryno;					// 배송 번호(PK)
	private String deliverydate;			// 배송 날짜
	private String deliverystatus;			// 배송 상태 ( 결제전 N, 준비중 R, 배송대기 S, 배송중 D, 배송완료 C)
	private int trackingnum;				// 운송장 번호
	private int userno;						// 유저 번호 (FK)
	private int orderno;					// 주문 번호 (FK)
	private String regdate;					// 저장 날짜
	private String editdate;				// 수정 날짜
	
	/** 2) JOIN절에 따른 추가 컬럼 */
	// user table
	private int uname;						// 유저 이름 ( 주문자 )
	
	// orderlist table
	private String addr1;					// 배송지 주소 ( 기본값 유저주소)
	private String addr2;					// 배송지 상세주소 ( 기본값 유저상세주소 )
	private String oname;					// 배송받는 사람 ( 기본값 유저이름 )
	private String email;					// 배송받는 사람 이메일 ( 기본값 유저이메일 )
	private String phoneno;					// 배송받는 사람 연락처 ( 기본값 유저연락처 )
	private String servicetype;				// 배송 서비스 유/무 ( 기본값 N )
	private String request;					// 배송 요청사항 ( 기본값 null )
	private String deldate;					// 배송 희망날짜
	private String paytype;					// 결제 수단 ( 신용카드 C, 무통장입금 D, 휴대폰결제 M, 실시간계좌이체 D2 )
	private int totalprice;					// 총 결제 금액
	private String orderstatus;				// 주문 상태 ( 주문 N, 취소 CC, 교환 CH, 반품 RT, 환불 RF )
	private String paystatus;				// 결제 상태 ( 결제완료 Y, 결제전 N )
	private int point;
	private String ccdate;
	private String ccstatus;

	// product table
	private String prodno;					// 상품 번호
	private String pname;					// 상품 이름
	private int ea;							// 상품 수량
	private int price;						// 상품 수량
	private String size;					// 상품 사이즈
	private String color;					// 상품 색상
	
	// deltype table
	private int deltypeno;					// 배송 유형번호
	private String dname;					// 배송 유형이름 ( 일반배송, 트럭배송 )
	private int dprice;						// 배송비
	
	// coupon table
	private String usrcouponno;				// 쿠폰 번호
	private String couponno;				// 쿠폰 번호
	private String cname;					// 쿠폰 이름
	private int discount;					// 할인율
	private String distype;					// 할인 유형 ( %, - )
	
	// firstimg table
	private String thumbnailUrl;
	
	// 3) 페이지 구현을 위한 static 변수
	/** LIMIT 절에서 사용할 조회 시작 위치 */
	private static int offset;
	
	/** LIMIT 절에서 사용할 조회할 데이터 수 */
	private static int listCount;

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		Delivery.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		Delivery.listCount = listCount;
	}
	
}