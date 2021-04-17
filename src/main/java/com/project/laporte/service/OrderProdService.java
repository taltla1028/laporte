package com.project.laporte.service;

import com.project.laporte.model.Order_prod;


public interface OrderProdService {
	
	/** 새로운 구매 내역 추가 */
	public int addOrderProd(Order_prod input) throws Exception;
	
	/** 단일 구매 내역 조회 */
	public Order_prod getOrderProd(Order_prod input) throws Exception;
	
}
	

