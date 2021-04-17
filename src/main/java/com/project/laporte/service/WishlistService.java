package com.project.laporte.service;

import java.util.List;

import com.project.laporte.model.Wish_prod;
import com.project.laporte.model.Wishlist;

public interface WishlistService {
	/**
	 * 기본 위시리스트 번호 조회 기능
	 * @param Wishlist 조회할 장바구니의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public Wishlist selectBasicWish(Wishlist input) throws Exception;
	
	/**
	 * 위시리스트 선택시 모든 상품 목록 (상품 목록 조회)
	 * @param Wishlist 조회할 장바구니의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public List<Wish_prod> getWishitemList(Wishlist input) throws Exception;
	
	/**
	 * 위시리스트 선택시 조회된 상품 삭제
	 * @param Wishlist 조회할 장바구니의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public int deleteWishlistItem(Wish_prod input) throws Exception;
	
	/**
	 * 위시리스트 선택시 조회된 상품 하나의 정보
	 * @param Wishlist 조회할 장바구니의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public Wish_prod getWishitem(Wish_prod input) throws Exception;
	
	/**
	 * 위시리스트 선택시 조회된 상품 수정
	 * @param Wishlist 조회할 장바구니의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public int editWishlistItem(Wish_prod input) throws Exception;
	
	/**
	 * 위시리스트에 있는 상품 다른 리스트로 이동
	 * @param Wishlist 조회할 장바구니의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public int editWishlistItemMove(Wish_prod input) throws Exception;
	
	/**
	 * 위시리스트에 상품 추가
	 * @param Wishlist 조회할 장바구니의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public int addWishlistItem(Wish_prod input) throws Exception;
	
	/**
	 * 위시리스트 목록 조회
	 * @param Wishlist 조회할 장바구니의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public List<Wishlist> getWishList(Wishlist input) throws Exception;
	
	/**
	 * 위시리스트 목록 추가
	 * @param Wishlist 조회할 장바구니의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public int addWishlist(Wishlist input) throws Exception;
	
	/**
	 * 위시리스트 목록 삭제
	 * @param Wishlist 조회할 장바구니의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public int deleteWishlist(Wishlist input1, Wish_prod input2) throws Exception;
	
	/**
	 * 위시리스트 목록 수정
	 * @param Wishlist 조회할 장바구니의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public int editWishlist(Wishlist input) throws Exception;
	
	/**
	 * 위시리스트 목록 단일행 조회
	 * @param Wishlist 조회할 위시리스트
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public Wishlist getWishListOne(Wishlist input) throws Exception;

	/**
	 * 위시리스트 목록에 있는 상품 모두 삭제
	 * @param Wish_prod 조회할 장바구니의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public int deleteWishItems(Wish_prod input) throws Exception;
	
	/**
	 * 기본 위시리스트 목록 추가
	 * 
	 * @param Wishlist 조회할 장바구니의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public int addbasicWishlist(Wishlist input) throws Exception;
	
	/**
	 * 위시리스트 상품 추가 (원래 있던 상품)
	 * 
	 * @param Wish_prod 조회할 위시리스트 상품의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public int editWishItemOne(Wish_prod input) throws Exception;
	
	/** 회원별 위시리스트 갯수 조회 */
	//0308추가 -조진경
	public int getWishlistQTY(Wishlist input) throws Exception;
}
