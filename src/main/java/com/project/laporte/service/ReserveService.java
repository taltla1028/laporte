package com.project.laporte.service;

import java.util.List;

import com.project.laporte.model.Reserve;

public interface ReserveService {
	/**
	 * 예약 데이터 저장하기
	 * @param Reserve 저장할 정보를 담고있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addReserve(Reserve input) throws Exception;
	

	/**
	 * 예약 데이터 수정하기
	 * @param Reserve 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editReserve(Reserve input) throws Exception;
	
	/**
	 * 예약 데이터 삭제하기
	 * @param Reserve 삭제할 예약 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteReserve(Reserve input) throws Exception;
	
	public int updateReservey(Reserve input) throws Exception;
	
	/**
	 * 예약 상세 조회하기
	 * @param Reserve 조회할 교수의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public Reserve getReserveItem(Reserve input) throws Exception;
	
	/**
	 * 예약 목록 조회
	 * @param Reserve 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exceptin
	 */
	public List<Reserve> getReservesList(Reserve input) throws Exception ;
	
	
	/**
	 * 관리자 예약 목록 조회
	 * @param Reserve 검색조건 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬랙션
	 * @throws Exception
	 */
	
	public List<Reserve> getReserveList(Reserve input) throws Exception;
	
	
	
	/** 마이페이지에서 회원 예약 건 확인 */
	public int checkReserve(Reserve input) throws Exception;
}