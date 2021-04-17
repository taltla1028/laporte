package com.project.laporte.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.laporte.helper.WebHelper;
import com.project.laporte.model.Orderlist;
import com.project.laporte.service.OrderlistService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j

public class OrderlistServiceImpl implements OrderlistService {

	/** MyBatis */
	@Autowired
	SqlSession sqlSession;

	@Autowired
	WebHelper webHelper;

	/** 새로운 구매 저장 */
	@Override
	public int addPurchase(Orderlist input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("OrderlistMapper.insertPurchase", input);

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

	/** 구매 정보 조회 */
	@Override
	public Orderlist getPurchase(Orderlist input) throws Exception {
		Orderlist result = null;

		try {
			result = sqlSession.selectOne("OrderlistMapper.selectPurchase", input);

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
	
	/** 사용자 - 주문 상세 조회 */
	@Override
	public List<Orderlist> getOrderItem(Orderlist input) throws Exception {
		List<Orderlist> result = null;
		
		try {
			result = sqlSession.selectList("OrderlistMapper.selectOrderItem", input);
			
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

	/** 관리자 - 주문관리 조회 */
	@Override
	public List<Orderlist> getOrderList(Orderlist input) throws Exception {
		List<Orderlist> result = null;

        try {
            result = sqlSession.selectList("OrderlistMapper.selectOrderList", input);

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
	
	/** 회원별 주문 목록 정보 조회*/
	//0228추가-조진경
	@Override
	public List<Orderlist> getOrderListbyUserno(Orderlist input) throws Exception {
		
		List<Orderlist> result = null;
		
		try {
			result = sqlSession.selectList("OrderlistMapper.selectOrderlistbyUserno", input);
			
			if(result == null) {
				 throw new NullPointerException("result == null");
			}
			}catch (NullPointerException e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("조회된 데이터가 없습니다.");
	        } catch (Exception e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("데이터 조회에 실패했습니다.");
	        }
	        return result;
	}
	
	/** 회원별 주문 건 수 조회를 위한 기능 정의 */
	//0308추가-조진경
	@Override
	public int getOrderQty(Orderlist input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("OrderlistMapper.selectCountByUserno", input);
		}catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }

        return result;
	}
	
	/** 주문 갯수 */
	@Override
    public int getOrderlistCount(Orderlist input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.selectOne("OrderlistMapper.selectCountAll", input);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }

        return result;
    }

	/** 주문정보 수정 */
	@Override
	public int updateOrderlist(Orderlist input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("OrderlistMapper.updateOrderItem", input);

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
	
	/** 배송정보 저장을 위한 기능 정의 */
	@Override
	public int updateOrderStatus(Orderlist input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("OrderlistMapper.updateOrderStatus", input);

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

	/** 취소정보 수정 */
	@Override
	public int updateOrderCClist(Orderlist input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("OrderlistMapper.updateOrderCCItem", input);

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

	/** 단일행 조회 */
	@Override
	public Orderlist getOrderDeliveryItem(Orderlist input) throws Exception {
		Orderlist result = null;

		try {
			result = sqlSession.selectOne("OrderlistMapper.getOrderDeliveryItem", input);
			
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	/** 주문별 취소 수량 조회 */
	@Override
	public int getOrderCount(Orderlist input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.selectOne("OrderlistMapper.selectCount", input);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }

        return result;
    }

	/** 주문별 수량 */
	@Override
	public int getOrderCountDeli(Orderlist input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.selectOne("OrderlistMapper.selectCountDeli", input);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }

        return result;
    }
}