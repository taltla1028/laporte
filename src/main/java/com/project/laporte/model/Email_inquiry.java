package com.project.laporte.model;

import lombok.Data;

@Data
public class Email_inquiry {
	
	private int emailno;
	private String name;
	private String email;
	private String category;
	private String file;
	private String content;
	private String status;
	private String answer;
	private String regdate;
	private String editdate;

}
