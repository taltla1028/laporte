package com.project.laporte.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.laporte.model.Firstimg;
import com.project.laporte.model.Product;
import com.project.laporte.service.ProductListService;

import lombok.extern.slf4j.Slf4j;
@Slf4j

@Service
public class ProductListServiceImpl implements ProductListService{
	/** MyBatis */
	// --> import org.apache.ibatis.session.SqlSession
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<Product> getProductlistList(Product input) throws Exception {
		List<Product> result = null;

        try {
            result = sqlSession.selectList("ProductListMapper.selectallproductList", input);

            if (result == null) {
                throw new NullPointerException("result=null");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("조회된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }

        return result;
	}

	@Override
	public List<Firstimg> getFirstimgList(Firstimg input) throws Exception {
		List<Firstimg> result = null;
		
		try{
			result = sqlSession.selectList("ProductListMapper.selectallfirstList", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			 throw new Exception("조회된 데이터가 없습니다.");
		}catch (Exception e) {
			log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
		}
		return null;
	}

	@Override
	public int getProductCount(Product input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("ProductListMapper.selectCountAll" , input);
			
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
}
