package com.project.laporte.model;

import lombok.Data;

@Data
public class Cart {
	/** 1) 기본 컬럼 */
	private int cartno;			// 장바구니 번호(PK)
	private int userno;			// 유저 번호 (FK)
	private int prodno;			// 상품 번호 (FK)
	private int ea;				// 상품 수량
	private String regdate;		// 저장 날짜
	private String editdate;	// 수정 날짜
	
	/** 2) JOIN절에 따른 추가 컬럼 */
	// user table 
	private String uname;		// 유저 이름
	
	// product table 
	private String pname;		// 제품 이름
	private int price;			// 제품 가격
	private int saleprice;		// 제품 세일 가격
	private int stock;			// 제품 재고
	private String color;		// 제품 색상
	private String size;		// 제품 사이즈
	
	// firstimg table
	private String thumbnailUrl; // 제품 이미지
	
}