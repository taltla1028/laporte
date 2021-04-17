package com.project.laporte.service;

import java.util.List;

import com.project.laporte.model.DetailImg;
import com.project.laporte.model.Firstimg;
import com.project.laporte.model.Prod_category1;
import com.project.laporte.model.Prod_category2;
import com.project.laporte.model.Product;

public interface ProductService {
	
	//카테고리 드롭다운 - 대분류
	public List<Prod_category1> category(Prod_category1 input) throws Exception;
	
	//카테고리 드롭다운 - 소분류
	public List<Prod_category2> category2(Prod_category2 input) throws Exception;
	
	//카테고리 이름 출력
	public Product getCategotyName(Product input) throws Exception;
	
	/**
	 * 상품 데이터 상세 조회
	 * @param Product 조회할 상품 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public Product getProductItem(Product input) throws Exception;
	
	/**
	 * 상품 데이터 목록 조회
	 * @param Product 검색조건과 페이지 구현 정보(아직 구현전)를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Product> getProductList(Product input) throws Exception;
	/**
	 * 상품 데이터 등록하기
	 * @param Product 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addProduct(Product input) throws Exception;
	
	/**
	 * 상품 데이터 수정하기
	 * @param Product 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editProduct(Product input) throws Exception;
	
	/**
	 * 상품 데이터 삭제하기
	 * @param Product 삭제할 상품의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteProduct(Product input) throws Exception;
	
	/**
	 * 상품 데이터 대표 이미지 저장하기
	 * @param Product 대표 이미지를 저장할 파일의 정보를 담고있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addProductFirstImg(Firstimg input) throws Exception;
	
	/**
	 * 상품 데이터 대표 이미지 조회하기
	 * @param Product 대표 이미지를 조회할 파일의 정보를 담고있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public Firstimg getProductFirstImg(Firstimg input) throws Exception;
	
	/**
	 * 상품 데이터 대표 이미지 정보 수정하기
	 * @param Product 대표 이미지를 수정할 파일의 정보를 담고있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editProductFirstImg(Firstimg input) throws Exception;
	
	/**
	 * 상품 상세이미지 데이터 목록 조회
	 * @param DetailImg 검색조건을 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<DetailImg> getDeailImgList(DetailImg input) throws Exception;
	
	/**
	 * 상품 상세이미지 데이터 저장하기
	 * @param DetailImg 상세이미지를 저장할 파일의 정보를 담고있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addDetailImg(DetailImg input) throws Exception;
	
	/**
	 * 상품 상세이미지 데이터 삭제하기
	 * @param DetailImg 상세이미지를 삭제할 파일의 정보를 담고있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteDetailImg(DetailImg input) throws Exception;
	
	/**
	 * 유사한 상품 데이터 목록 조회
	 * @param Product 검색조건과 페이지 구현 정보(아직 구현전)를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Product> getSimilarList(Product input) throws Exception;
	
	/**
	 * 상품 데이터 목록 조회
	 * @param Product 검색조건과 페이지 구현 정보(아직 구현전)를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Product> getProductListAll(Product input) throws Exception;
	
	public int getProductCountAdmin(Product input) throws Exception;
}
