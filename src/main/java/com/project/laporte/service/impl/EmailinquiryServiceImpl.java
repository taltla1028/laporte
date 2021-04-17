package com.project.laporte.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.laporte.helper.WebHelper;
import com.project.laporte.model.Email_inquiry;
import com.project.laporte.service.EmailinquiryService;


import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j

public class EmailinquiryServiceImpl implements EmailinquiryService {

	/** MyBatis */
	@Autowired
	SqlSession sqlSession;

	@Autowired
	WebHelper webHelper;

	/** 새로운 이메일 문의 저장 */
	@Override
	public int addEmailInquiry(Email_inquiry input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("EmailinquiryMapper.insertEmailInquiry", input);
			
			if(result == 0) {
				throw new NullPointerException("result == 0");
			}
			
		}catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		}catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}
		return result;
	}

	/** 이메일 문의 조회 */
	@Override
	public Email_inquiry getEmailInquiry(Email_inquiry input) throws Exception {
		Email_inquiry result = null;
		
		try {
			result = sqlSession.selectOne("EmailinquiryMapper.selectEmailInquiry", input);
			
			if(result == null) {
				throw new NullPointerException("result == null");
			}
				}catch (NullPointerException e) {
					log.error(e.getLocalizedMessage());
					throw new Exception("조회된 데이터가 없습니다.");
				}catch(Exception e) {
					log.error(e.getLocalizedMessage());
					throw new Exception("데이터 조회에 실패했습니다.");
				}
				return result;
	}

	/**이메일 문의 목록 조회 */
	@Override
	public List<Email_inquiry> getEmailInquiryList(Email_inquiry input) throws Exception {
		
		List<Email_inquiry> result = null;
		
		try {
			result = sqlSession.selectList("EmailinquiryMapper.selectEmailInquiryList", input);
			
			if(result == null) {
				throw new NullPointerException("result == null");
			}
		}catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int answerEmailInquiry(Email_inquiry input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("EmailinquiryMapper.answerEmailInquiry", input);
			
			if(result == 0) {
				throw new NullPointerException("result == 0");
			}
		}catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
}