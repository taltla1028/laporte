package com.project.laporte.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.laporte.helper.WebHelper;
import com.project.laporte.model.Order_prod;
import com.project.laporte.service.OrderProdService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j

public class OrderProdServiceImpl implements OrderProdService {

	/** MyBatis */
	@Autowired
	SqlSession sqlSession;

	@Autowired
	WebHelper webHelper;

	@Override
	public int addOrderProd(Order_prod input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("OrderProdMapper.insertOrderProd", input);

			if (result == 0) {
				throw new NullPointerException("result==0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}
		return result;
	}

	@Override
	public Order_prod getOrderProd(Order_prod input) throws Exception {
		Order_prod result =null;
		
		try {
			result = sqlSession.selectOne("OrderProdMapper.selectOrderProd", input);
			
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
	}
