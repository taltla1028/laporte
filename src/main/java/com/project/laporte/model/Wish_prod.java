package com.project.laporte.model;

import lombok.Data;

@Data
public class Wish_prod {
	
	// 1) 기본 컬럼
	private int wishno;
	private int prodno;
	private int ea;
	
	// 2) JOIN절에 따른 추가 컬럼
	private int userno;
	private String title;
	private String name;
	private String size;
	private String color;
	private int price;
	private int saleprice;
	private String thumbnailurl;
	private String basic;
	private int newwishno;
	
}
