package com.project.laporte.service;

import java.util.List;

import com.project.laporte.model.Cart;

/** 장바구니 데이터 관리 기능을 제공하기 위한 Service 계층 */
public interface CartService {

	/**
	 * 장바구니 데이터 상세 조회
	 * @param Cart 조회할 장바구니의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public Cart getCartItem(Cart input) throws Exception;
	
	/**
	 * 장바구니 데이터 목록 조회
	 * @param Cart 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Cart> getCartList(Cart input) throws Exception;
	
	/** 
	 * 장바구니 데이터 등록하기
	 * @param Cart 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addCart(Cart input) throws Exception;
	
	/**
	 * 장바구니 데이터 수정하기
	 * @param Cart 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editCart(Cart input) throws Exception;
	
	/**
	 * 장바구니 데이터 삭제하기
	 * @param Cart 삭제할 장바구니의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteCart(Cart input) throws Exception;
	
	/**
	 * 장바구니 데이터 중복검사하기
	 * @param Cart 중복검사할 장바구니의 상품번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int countCart(Cart input) throws Exception;
	
	/**
	 * 장바구니 데이터 수량변경하기
	 * @param Cart 수량변경할 장바구니의 상품번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int updateCart(Cart input) throws Exception;
	
	/**
	 * 장바구니 카트 번호로 카트 목록 조회
	 * @param Cart 조회할 장바구니의 카트번호를 담고 있는 Beans
	 * @return Cart
	 * @throws Exception
	 */
	public Cart getCartByCartno(Cart input) throws Exception;
}
