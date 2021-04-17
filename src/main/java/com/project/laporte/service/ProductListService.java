package com.project.laporte.service;

import java.util.List;

import com.project.laporte.model.Firstimg;
import com.project.laporte.model.Product;

public interface ProductListService {


	/**
	 * 상품 데이터 목록 조회
	 * @param Product 검색조건과 페이지 구현 정보(아직 구현전)를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Product> getProductlistList(Product input) throws Exception;



	public List<Firstimg> getFirstimgList(Firstimg input) throws Exception;
	
	public int getProductCount(Product input) throws Exception;
	
}