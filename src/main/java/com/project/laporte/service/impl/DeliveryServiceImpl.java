package com.project.laporte.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.laporte.helper.WebHelper;
import com.project.laporte.model.Delivery;
import com.project.laporte.service.DeliveryService;

import lombok.extern.slf4j.Slf4j;

/** 배송 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */
// -> import org.springframework.stereotype.Service;
@Service
@Slf4j
public class DeliveryServiceImpl implements DeliveryService {
	
	/** MyBatis 세션 객체 주입 설정 */
	// -> import org.apache.ibatis.session.Sqlsession
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	WebHelper webHelper;
	
	/**
	 * 배송 데이터 상세 조회
	 * @param Delivery 조회할 배송의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public Delivery getDeliveryItem(Delivery input) throws Exception {
		Delivery result = null;
		
		try {
			result = sqlSession.selectOne("DeliveryMapper.selectDeliveryItem", input);
			
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
	 * 배송 데이터 유무 조회
	 * @param Delivery 조회할 배송의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public int getDeliveryItemCount(Delivery input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("DeliveryMapper.selectDeliveryItemCount", input);
			
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	/**
     * 배송 데이터 목록 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
	@Override
	public List<Delivery> getDeliveryList(Delivery input) throws Exception {
		List<Delivery> result = null;

        try {
            result = sqlSession.selectList("DeliveryMapper.selectDeliveryList", input);

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
     * 배송 데이터 유저목록 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
	@Override
	public List<Delivery> getDeliveryListUser(Delivery input) throws Exception {
		List<Delivery> result = null;

        try {
            result = sqlSession.selectList("DeliveryMapper.selectDeliveryListUser", input);

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
	 * 배송 데이터 등록하기
	 * @param Delivery 저장할 정보를 담고 있는 beans
	 * @throws Exception
	 */
	@Override
	public int addDelivery(Delivery input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("DeliveryMapper.insertDeliveryItem", input);
			
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
	 * 배송 데이터 수정하기
	 * @param Delivery 수정할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int editDelivery(Delivery input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("DeliveryMapper.updateDeliveryItem", input);
			
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
	 * 배송 데이터 삭제하기
	 * @param Delivery 삭제할 배송의 일련번호를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int deleteDelivery(Delivery input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.delete("DeliveryMapper.deleteDeliveryItem", input);
			
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
     * 배송 데이터가 저장되어 있는 갯수 조회
     * @return int
     * @throws Exception
     */
    @Override
    public int getDeliveryCount(Delivery input) throws Exception {
        int result = 0;
        
        try {
            result = sqlSession.selectOne("DeliveryMapper.selectCountAll", input);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }
        
        return result;
    }

    /**
	 * 배송 데이터 수량 조회
	 * @param Delivery 조회할 배송의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public int getCountDelivery(Delivery input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("DeliveryMapper.selectCountDelivery", input);
			
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

}

