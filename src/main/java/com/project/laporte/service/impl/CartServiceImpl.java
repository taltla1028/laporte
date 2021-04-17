package com.project.laporte.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.laporte.helper.WebHelper;
import com.project.laporte.model.Cart;
import com.project.laporte.service.CartService;

import lombok.extern.slf4j.Slf4j;

/** 장바구니 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */
// -> import org.springframework.stereotype.Service;
@Service
@Slf4j
public class CartServiceImpl implements CartService {
	
	/** MyBatis 세션 객체 주입 설정 */
	// -> import org.apache.ibatis.session.Sqlsession
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	WebHelper webHelper;
	
	/**
	 * 장바구니 데이터 상세 조회
	 * @param Cart 조회할 장바구니의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public Cart getCartItem(Cart input) throws Exception {
		Cart result = null;
		
		try {
			result = sqlSession.selectOne("CartMapper.selectCartItem", input);
			
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
	
	/**
     * 장바구니 데이터 목록 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
	@Override
	public List<Cart> getCartList(Cart input) throws Exception {
		List<Cart> result = null;

        try {
            result = sqlSession.selectList("CartMapper.selectCartList", input);

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

	/**
	 * 장바구니 데이터 등록하기
	 * @param Cart 저장할 정보를 담고 있는 beans
	 * @throws Exception
	 */
	@Override
	public int addCart(Cart input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("CartMapper.insertCartItem", input);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error((e.getLocalizedMessage()));
			throw new Exception("데이터 저장에 실패했습니다.");
		}
		return result;	
	}

	/**
	 * 장바구니 데이터 수정하기
	 * @param Cart 수정할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int editCart(Cart input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("CartMapper.updateCartItem", input);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error((e.getLocalizedMessage()));
			throw new Exception("데이터 저장에 실패했습니다.");
		}
		return result;
	}

	/**
	 * 장바구니 데이터 삭제하기
	 * @param Cart 삭제할 장바구니의 일련번호를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int deleteCart(Cart input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.delete("CartMapper.deleteCartItem", input);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 삭제에 실패했습니다.");
		}
		return result;
	}
	
	/**
	 * 장바구니 데이터 중복검사하기
	 * @param Cart 중복검사할 장바구니의 상품번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int countCart(Cart input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("CartMapper.countCart", input);
			
			if (result > 0) {
				result = 1;
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}

	/**
	 * 장바구니 데이터 수량변경하기
	 * @param Cart 수량변경할 장바구니의 상품번호를 담고 있는 Beans
	 * @return 
	 * @throws Exception
	 */
	@Override
	public int updateCart(Cart input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("CartMapper.updateCartList", input);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error((e.getLocalizedMessage()));
			throw new Exception("데이터 저장에 실패했습니다.");
		}
		return result;
	}
	
	/**
	 * 장바구니 카트 번호로 카트 목록 조회
	 * @param Cart 조회할 장바구니의 카트번호를 담고 있는 Beans
	 * @return Cart
	 * @throws Exception
	 */
	@Override
	public Cart getCartByCartno(Cart input) throws Exception {
		Cart result = null;

        try {
        	result = sqlSession.selectOne("CartMapper.selectCartByCartno", input);

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
	
}

