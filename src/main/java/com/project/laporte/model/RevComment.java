package com.project.laporte.model;

import lombok.Data;

@Data
public class RevComment {
	private int revcomno;
	private int reviewno;
	private String content;
	private String regdate;
	private String editdate;
}
