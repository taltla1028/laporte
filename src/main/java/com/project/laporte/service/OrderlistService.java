package com.project.laporte.service;

import java.util.List;

import com.project.laporte.model.Orderlist;

public interface OrderlistService {

	/** 새로운 구매 저장 */
	public int addPurchase(Orderlist input) throws Exception;

	/** 구매 정보 조회 */
	public Orderlist getPurchase(Orderlist input) throws Exception;

	/** 사용자 - 주문 상세 조회 */
	public List<Orderlist> getOrderItem(Orderlist input) throws Exception;
	
	/** 단일 정보 조회 */
	public Orderlist getOrderDeliveryItem(Orderlist input) throws Exception;
	
	/** 관리자 - 주문 목록 조회 */
	public List<Orderlist> getOrderList(Orderlist input) throws Exception;
	
	/** 회원별 주문 목록 정보 조회*/
	//0228추가-조진경
	public List<Orderlist> getOrderListbyUserno(Orderlist input) throws Exception;
	
	/** 회원별 주문 건 수 조회를 위한 기능 정의 */
	//0308추가-조진경
	public int getOrderQty(Orderlist input) throws Exception;
	 
	/** 주문 데이터가 저장되어 있는 갯수 조회 */
	public int getOrderlistCount(Orderlist input) throws Exception;
	
	/** 주문정보 수정 */
	public int updateOrderlist(Orderlist input) throws Exception;
	
	/** 배송정보 저장을 위한 기능 정의 */
	public int updateOrderStatus(Orderlist input) throws Exception;
	
	/** 취소정보 수정 */
	public int updateOrderCClist(Orderlist input) throws Exception;
	
	/** 주문별 취소 목록 수량 조회*/
	public int getOrderCount(Orderlist input) throws Exception;
	
	/** 주문별 주문 목록 수량 조회*/
	public int getOrderCountDeli(Orderlist input) throws Exception;

}
