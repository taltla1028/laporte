package com.project.laporte.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.laporte.helper.WebHelper;
import com.project.laporte.model.Coupon;
import com.project.laporte.service.CouponService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j

public class CouponServiceImpl implements CouponService {

	/** MyBatis */
	@Autowired
	SqlSession sqlSession;

	@Autowired
	WebHelper webHelper;
	
	/** 새로운 쿠폰 저장 */
	@Override
	public int addCoupon(Coupon input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("CouponMapper.insertCoupon", input);
			
			if(result == 0) {
				throw new NullPointerException("result==0");
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

	/** 쿠폰 조회 */
	@Override
	public Coupon getCoupon(Coupon input) throws Exception {
		Coupon result = null;
		
		try {
			result = sqlSession.selectOne("CouponMapper.selectCoupon", input);
			
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

	/** 만료전 쿠폰 목록 조회 */
	@Override
	public List<Coupon> getCouponList(Coupon input) throws Exception {
		List<Coupon> result = null;
		
		try {
			result = sqlSession.selectList("CouponMapper.selectCouponList", input);
			
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
	
	/**만료된 쿠폰 목록 조회*/

	@Override
	public List<Coupon> getEndCouponList(Coupon input) throws Exception {
		List<Coupon> result = null;
		
		try {
			result = sqlSession.selectList("CouponMapper.selectEndCouponList", input);
			
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
	public int reviseCoupon(Coupon input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("CouponMapper.updateCoupon", input);
			
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

	/** 쿠폰 정보 삭제 */
	@Override
	public int deleteCoupon(Coupon input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.delete("CouponMapper.deleteCoupon", input);
			
			if(result == 0) {
				throw new NullPointerException("result == 0");
			}
		}catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("이미 고객에게 발급된 쿠폰은 삭제할 수 없습니다.");
		}
		return result;
	}

	/** 쿠폰 만료 업데이트 */
	@Override
	public int expireCoupon(Coupon input) throws Exception {
		int result =0;
		
		try {
			result = sqlSession.update("CouponMapper.expireCoupon", input);
			
			if(result == 0) {
				throw new NullPointerException("result == 0");
			}
		}catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("이미 고객에게 발급된 쿠폰은 삭제할 수 없습니다.");
		}
		return result;
	}


	
}
