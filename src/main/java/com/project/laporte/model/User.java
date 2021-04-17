package com.project.laporte.model;

import lombok.Data;

@Data
public class User {
	private int userno;
	private String email;
	private String userpwd;
	private String name;
	private String birthdate;
	private String phoneno;
	private String gender;
	private String addr1;
	private String addr2;
	private String postcode;
	private String userstatus;
	private int point;
	private String regdate;
	private String editdate;
	
}
