package com.project.laporte.model;

import lombok.Data;

@Data
public class Product {

	// 1) 기본 컬럼
	private int prodno;
	private String name;
	private int price;
	private int saleprice;
	private int stock;
	private String display;
	private String color;
	private String size;
	private String adminnote;
	private String detailnote;
	private String detailsize;
	private int catno2;
	private String group;
	private String regdate;
	private String editdate;

	// 2) JOIN절에 따른 추가 컬럼
	private String catname1;
	private String catname2;
	private int catno1;
	private String FileUrl;
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
		Product.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		Product.listCount = listCount;
	}
}
