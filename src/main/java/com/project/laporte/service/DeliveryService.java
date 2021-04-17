package com.project.laporte.service;

import java.util.List;

import com.project.laporte.model.Delivery;

/** 배송 데이터 관리 기능을 제공하기 위한 Service 계층 */
public interface DeliveryService {

	/**
	 * 배송 데이터 상세 조회
	 * @param Delivery 조회할 배송의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public Delivery getDeliveryItem(Delivery input) throws Exception;
	
	/**
	 * 배송 데이터 유무 조회
	 * @param Delivery 조회할 배송의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public int getDeliveryItemCount(Delivery input) throws Exception;
	
	/**
	 * 배송 데이터 목록 조회
	 * @param Delivery 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Delivery> getDeliveryList(Delivery input) throws Exception;
	
	/**
	 * 배송 데이터 유저 목록 조회
	 * @param Delivery 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Delivery> getDeliveryListUser(Delivery input) throws Exception;
	
	/**
	 * 배송 데이터가 저장되어 있는 갯수 조회
	 * @param Delivery 검색조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int getDeliveryCount(Delivery input) throws Exception;
	
	/** 
	 * 배송 데이터 등록하기
	 * @param Delivery 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addDelivery(Delivery input) throws Exception;
	
	/**
	 * 배송 데이터 수정하기
	 * @param Delivery 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editDelivery(Delivery input) throws Exception;
	
	/**
	 * 배송 데이터 삭제하기
	 * @param Delivery 삭제할 배송의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteDelivery(Delivery input) throws Exception;
	
	/**
	 * 배송 수량 조회
	 * @param Delivery 조회할 배송의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public int getCountDelivery(Delivery input) throws Exception;
}
