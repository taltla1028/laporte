package com.project.laporte.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.laporte.helper.WebHelper;
import com.project.laporte.model.Userscoupon;
import com.project.laporte.service.UserscouponService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j

public class UserscouponServiceImpl implements UserscouponService {

	/** MyBatis */
	@Autowired
	SqlSession sqlSession;

	@Autowired
	WebHelper webHelper;

	/** 회원 쿠폰 추가 */
	@Override
	public int addUsersCoupon(Userscoupon input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("UserscouponMapper.insertUsersCoupon", input);
			
			if(result == 0) {
				throw new NullPointerException("result==0");
			}
		}catch(NullPointerException e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("저장된 데이터가 없습니다.");
			}catch(Exception e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("데이터 저장에 실패했습니다.");
			}
			return result;
		}

	/** 회원 쿠폰 목록 조회 */
	@Override
	public List<Userscoupon> getUsersCouponList(Userscoupon input) throws Exception {
		List<Userscoupon> result = null;
		
		try {	
			result = sqlSession.selectList("UserscouponMapper.selectUsersCouponList", input);
			
			if(result == null) {
				throw new NullPointerException("result==null");
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

	/** 사용한 쿠폰 업데이트 */
	@Override
	public int updateUsersCoupon(Userscoupon input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("UserscouponMapper.updateUsersCoupon", input);
			
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

	/** 회원 쿠폰 단일 조회 */
	@Override
	public Userscoupon getUsersCoupon(Userscoupon input) throws Exception {
		Userscoupon result = null;
		
		try {
			result = sqlSession.selectOne("UserscouponMapper.selectUsersCoupon", input);
			
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

	/** 회원 가입 쿠폰 추가 */
	@Override
	public int addJoinCoupon(Userscoupon input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("UserscouponMapper.insertUsersCoupon", input);
			
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

	/** 중복 쿠폰 보유 여부 확인 */
	@Override
	public Userscoupon checkUsersCoupon(Userscoupon input) throws Exception {
		Userscoupon result = null;
		
		try {
			result = sqlSession.selectOne("UserscouponMapper.checkUsersCoupon", input);
			
			if(result == null) {
				result = null;
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
