package com.project.laporte.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.laporte.model.Delivery;
import com.project.laporte.model.Order_prod;
import com.project.laporte.model.Orderlist;
import com.project.laporte.model.RevComment;
import com.project.laporte.model.Review;
import com.project.laporte.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ReviewServiceImpl implements ReviewService {
	
	/** MyBatis */
	// --> import org.apache.ibatis.session.SqlSession
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * 리뷰 데이터 상세 조회
	 * @param Review 조회할 상품 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public Review getReviewItem(Review input) throws Exception{
		Review result = null;
		
		try {
			result = sqlSession.selectOne("ReviewMapper.selectItem", input);

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
	 * 리뷰 데이터 목록 조회
	 * @param Review 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Review> getReviewList(Review input) throws Exception{
		List<Review> result = null;

		try {
			result = sqlSession.selectList("ReviewMapper.selectList", input);

		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}
	/**
	 * 리뷰 데이터 등록하기
	 * @param Review 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int addReview(Review input) throws Exception{
		int result = 0;

		try {
			result = sqlSession.insert("ReviewMapper.insertItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
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
	
	/**
	 * 리뷰 데이터 수정하기
	 * @param Review 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int editReview(Review input) throws Exception{
		int result = 0;

		try {
			result = sqlSession.update("ReviewMapper.updateItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 수정에 실패했습니다.");
		}

		return result;
	}
	
	/**
	 * 리뷰 데이터 삭제하기
	 * @param Review 삭제할 정보를 담고있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int deleteReview(Review input) throws Exception {
		int result = 0;

		try {
			sqlSession.delete("ReviewMapper.deleteComItem", input);
			
			result = sqlSession.delete("ReviewMapper.deleteItem", input);

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
	 * 주문 데이터 목록 조회
	 * @param Orderlist 사용자 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Orderlist> getOrderList(Orderlist input) throws Exception{
		List<Orderlist> result = null;

		try {
			result = sqlSession.selectList("ReviewMapper.selectPurchase", input);

		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}

	/**
	 * 특정한 상품을 주문한 주문내역의 배송상태가 배송완료인 데이터만 조회
	 * @param Delivery 주문 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 빈즈
	 * @throws Exception
	 */
	@Override
	public Delivery getDelivery(Delivery input) throws Exception {
		Delivery result = null;

		try {
			result = sqlSession.selectOne("ReviewMapper.selectDelivery", input);

			} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * 특정한 상품을 주문 했는지 조회
	 * @param Order_prod 주문 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public Order_prod getOrderProd(Order_prod input) throws Exception {
		Order_prod result = null;

		try {
			result = sqlSession.selectOne("ReviewMapper.selectOrder", input);

			} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * 주문한 한 내역의 상품에 대해 리뷰를 남긴적이 있는지 조회
	 * @param int 리뷰를 남겼는지에 대한 개수
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public Review getReviewCount(Review input) throws Exception {
		Review result = null;

		try {
			result = sqlSession.selectOne("ReviewMapper.selectReview", input);

		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	

	/**
	 * 리뷰 데이터 목록 조회
	 * @param Review 리뷰 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Review> admintReviewList(Review input) throws Exception{
		List<Review> result = null;

		try {
			result = sqlSession.selectList("ReviewMapper.selectAllList", input);

		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}

	/**
	 * 리뷰에 대한 관리자답변 데이터 목록 조회
	 * @param RevComment 리뷰답변 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public RevComment admintRevcommentList(RevComment input) throws Exception {
		RevComment result = null;

		try {
			result = sqlSession.selectOne("ReviewMapper.selectrevcomment", input);

		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}

	/**
	 * 관리자 리뷰 답변 데이터 등록하기
	 * @param RevComment 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int addRevComment(RevComment input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("ReviewMapper.insertComItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
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

	/**
	 * 관리자 리뷰 답변 데이터 수정하기
	 * @param RevComment 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int editRevComment(RevComment input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("ReviewMapper.updateComItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 수정에 실패했습니다.");
		}

		return result;
	}

	/**
	 * 관리자 리뷰 답변 데이터 삭제하기
	 * @param Review 삭제할 정보를 담고있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int deleteRevComment(RevComment input) throws Exception {
		int result = 0;

		try {
			
			result = sqlSession.delete("ReviewMapper.deleteComItem", input);

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
	 * 관리자 페이지에서 리뷰 상세 조회
	 * @param Review 조회할 정보를 담고있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public Review selectReview(Review input) throws Exception {
		Review result = null;

		try {
			result = sqlSession.selectOne("ReviewMapper.selectItemAdmin", input);

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
	 * 리뷰에 대한 관리자답변이 있는지 조회
	 * @param RevComment 리뷰답변 정보를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public RevComment adminRevcomment(RevComment input) throws Exception {
		RevComment result = null;

		try {
			result = sqlSession.selectOne("ReviewMapper.selectrevcomment", input);

		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}

	/**
	 * 답변리뷰 데이터 목록 조회
	 * @param RevComment 리뷰 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<RevComment> admintReviewAllList(RevComment input) throws Exception {
		List<RevComment> result = null;

		try {
			result = sqlSession.selectList("ReviewMapper.selectAllAnswer", input);

		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}
	
	@Override
	public int getProductCountAdmin(Review input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("ReviewMapper.selectCountAllAdmin" , input);
			
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

}
