package com.project.laporte.model;

import lombok.Data;

@Data
public class Review {
	// 1) 기본 컬럼
	private int reviewno;
	private int prodno;
	private int userno;
	private int orderno;
	private String title;
	private String content;
	private int easyscore;
	private int benefitscore;
	private int qualityscore;
	private int funcscore;
	private int appearscore;
	private int avgscore;
	private String recommend;
	private String regdate;
	private String editdate;

	// 2) Use테이블과 Join
	private String name;

	// 3) Fristimg 테이블과 Join
	private String thumbnailUrl;
	
	// 4) Product 테이블과 Join
	private int catno2;
	
	

	// 5) 페이지 구현을 위한 static 변수
	/** LIMIT 절에서 사용할 조회 시작 위치 */
	private static int offset;

	/** LIMIT 절에서 사용할 조회할 데이터 수 */
	private static int listCount;

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		Review.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		Review.listCount = listCount;
	}
}
