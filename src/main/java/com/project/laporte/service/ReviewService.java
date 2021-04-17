package com.project.laporte.service;

import java.util.List;

import com.project.laporte.model.Delivery;
import com.project.laporte.model.Order_prod;
import com.project.laporte.model.Orderlist;
import com.project.laporte.model.RevComment;
import com.project.laporte.model.Review;


public interface ReviewService {
	/**
	 * 리뷰 데이터 상세 조회
	 * @param Review 조회할 상품 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public Review getReviewItem(Review input) throws Exception;
	
	/**
	 * 리뷰 데이터 목록 조회
	 * @param Review 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Review> getReviewList(Review input) throws Exception;
	/**
	 * 리뷰 데이터 등록하기
	 * @param Review 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addReview(Review input) throws Exception;
	
	/**
	 * 리뷰 데이터 수정하기
	 * @param Review 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editReview(Review input) throws Exception;
	
	/**
	 * 리뷰 데이터 삭제하기
	 * @param Review 삭제할 정보를 담고있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteReview(Review input) throws Exception;
	
	/**
	 * 주문 데이터 목록 조회
	 * @param Orderlist 사용자 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Orderlist> getOrderList(Orderlist input) throws Exception;
	
	/**
	 * 특정한 상품을 주문한 주문내역의 배송상태가 배송완료인 데이터만 조회
	 * @param Delivery 주문 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 빈즈
	 * @throws Exception
	 */
	public Delivery getDelivery(Delivery input) throws Exception;
	
	/**
	 * 특정한 상품을 주문 했는지 조회
	 * @param Order_prod 주문 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public Order_prod getOrderProd(Order_prod input) throws Exception;
	
	/**
	 * 주문한 한 내역의 상품에 대해 리뷰를 남긴적이 있는지 조회
	 * @param int 리뷰를 남겼는지에 대한 개수
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public Review getReviewCount(Review input) throws Exception;
	
	/**
	 * 리뷰 데이터 목록 조회
	 * @param Review 리뷰 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Review> admintReviewList(Review input) throws Exception;
	
	/**
	 * 리뷰에 대한 관리자답변 데이터 목록 조회
	 * @param RevComment 리뷰답변 정보를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public RevComment admintRevcommentList(RevComment input) throws Exception;
	
	/**
	 * 관리자 리뷰 답변 데이터 등록하기
	 * @param RevComment 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addRevComment(RevComment input) throws Exception;
	
	/**
	 * 관리자 리뷰 답변 데이터 수정하기
	 * @param RevComment 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editRevComment(RevComment input) throws Exception;
	
	/**
	 * 관리자 리뷰 답변 데이터 삭제하기
	 * @param Review 삭제할 정보를 담고있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteRevComment(RevComment input) throws Exception;
	
	/**
	 * 관리자 페이지에서 리뷰 상세 조회
	 * @param Review 조회할 정보를 담고있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public Review selectReview(Review input) throws Exception;

	/**
	 * 리뷰에 대한 관리자답변이 있는지 조회
	 * @param RevComment 리뷰답변 정보를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public RevComment adminRevcomment(RevComment input) throws Exception;
	
	/**
	 * 답변리뷰 데이터 목록 조회
	 * @param RevComment 리뷰 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<RevComment> admintReviewAllList(RevComment input) throws Exception;
	
	public int getProductCountAdmin(Review input) throws Exception;
}
