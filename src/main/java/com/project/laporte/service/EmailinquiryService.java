package com.project.laporte.service;

import java.util.List;

import com.project.laporte.model.Email_inquiry;

public interface EmailinquiryService {

	/** 새로운 이메일 문의 저장 */
	public int addEmailInquiry(Email_inquiry input) throws Exception;
	
	/** 이메일 문의 조회 */
	public Email_inquiry getEmailInquiry(Email_inquiry input) throws Exception;
	
	/**이메일 문의 리스트 조회 */
	public List<Email_inquiry> getEmailInquiryList(Email_inquiry input) throws Exception;
	
	/** 이메일 문의 답변 저장 */
	public int answerEmailInquiry(Email_inquiry input) throws Exception;
}
