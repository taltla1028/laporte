package com.project.laporte.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.laporte.model.DetailImg;
import com.project.laporte.model.Firstimg;
import com.project.laporte.model.Prod_category1;
import com.project.laporte.model.Prod_category2;
import com.project.laporte.model.Product;
import com.project.laporte.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProductServiceImpl implements ProductService{
	
	/** MyBatis */
	// --> import org.apache.ibatis.session.SqlSession
	@Autowired
	SqlSession sqlSession;

	/**
	 * 상품 카테고리 대분류 데이터 조회
	 * @param Prod_category1 상품 카테고리 대분류 데이터를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public List<Prod_category1> category(Prod_category1 input) throws Exception {
		List<Prod_category1> result = null;

		try {
			result = sqlSession.selectList("CategoryMapper.selectList", input);

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
	 * 상품 카테고리 소분류 데이터 조회
	 * @param Prod_category2 상품 카테고리 대분류 데이터를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public List<Prod_category2> category2(Prod_category2 input) throws Exception {
		List<Prod_category2> result = null;

		try {
			result = sqlSession.selectList("CategoryMapper.selectList2", input);

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
	 * 카테고리 이름 조회
	 * @param Product 카테고리 이름을 조회할 파일의 정보를 담고있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
		@Override
		public Product getCategotyName(Product input) throws Exception { 
			Product result = null;

			try {
				result = sqlSession.selectOne("ProductMapper.selectcategory", input);

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
     * 상품 데이터 목록 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
	@Override
	public List<Product> getProductList(Product input) throws Exception {
		List<Product> result = null;

        try {
            result = sqlSession.selectList("ProductMapper.selectList", input);

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
	 * 상품 데이터 등록하기
	 * @param Product 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int addProduct(Product input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("ProductMapper.insertItem", input);

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
	 * 상품 데이터 수정하기
	 * @param Product 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int editProduct(Product input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("ProductMapper.updateItem", input);

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
	 * 상품 데이터 삭제하기
	 * @param Product 삭제할 상품의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int deleteProduct(Product input) throws Exception {
		int result = 0;
		
		int prodno = input.getProdno();
		
		DetailImg detailimg = new DetailImg();
		detailimg.setProdno(prodno);
		
		Firstimg firstimg = new Firstimg();
		firstimg.setProdno(prodno);

		try {
			
			//상품 삭제 전 자신을 참조하는 테이블 수정
			// --> 리뷰, 위시, 카트, 주문, 상품 상세 이미지
			//sqlSession.update("?Mapper.unsetProduct", input);
			
			//참조하는 테이블 수정 - 상품 상세 이미지
			sqlSession.delete("ProductMapper.deleteProductImg", detailimg);
			
			//참조하는 테이블 수정 - 상품 대표 이미지
			sqlSession.delete("ProductMapper.deleteImgItem", firstimg);
			
			result = sqlSession.delete("ProductMapper.deleteItem", input);

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
	 * 상품 데이터 상세 조회
	 * @param Product 조회할 상품 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public Product getProductItem(Product input) throws Exception {
		Product result = null;

		try {
			result = sqlSession.selectOne("ProductMapper.selectItem", input);

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
	 * 상품 데이터 대표 이미지 저장하기
	 * @param Product 대표 이미지를 저장할 파일의 정보를 담고있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int addProductFirstImg(Firstimg input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("ProductMapper.insertImgItem", input);

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
	 * 상품 데이터 대표 이미지 정보 조회하기
	 * @param Product 대표 이미지를 조회할 파일의 정보를 담고있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public Firstimg getProductFirstImg(Firstimg input) throws Exception {
		Firstimg result = null;

		try {
			result = sqlSession.selectOne("ProductMapper.selectImgItem", input);

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
	 * 상품 데이터 대표 이미지 정보 수정하기
	 * @param Product 대표 이미지를 수정할 파일의 정보를 담고있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int editProductFirstImg(Firstimg input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("ProductMapper.updateImgItem", input);

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
	 * 상품 상세이미지 데이터 목록 조회
	 * @param DetailImg 검색조건을 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<DetailImg> getDeailImgList(DetailImg input) throws Exception {
		List<DetailImg> result = null;

		try {
			result = sqlSession.selectList("ProductMapper.selectDetailImg", input);

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
	 * 상품 상세이미지 데이터 저장하기
	 * @param DetailImg 상세이미지를 저장할 파일의 정보를 담고있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int addDetailImg(DetailImg input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("ProductMapper.insertDetailImg", input);

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
	 * 상품 상세이미지 데이터 삭제하기
	 * @param DetailImg 상세이미지를 삭제할 파일의 정보를 담고있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int deleteDetailImg(DetailImg input) throws Exception {
		int result = 0;

		try {
			
			result = sqlSession.delete("ProductMapper.deleteDetailImg", input);

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
	 * 유사한 상품 데이터 목록 조회
	 * @param Product 검색조건과 페이지 구현 정보(아직 구현전)를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Product> getSimilarList(Product input) throws Exception {
		List<Product> result =null;
		try {
			result = sqlSession.selectList("ProductMapper.selectSimilarList", input);

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
	 * 상품 데이터 목록 조회 - 상품 대표 이미지 포함 결과
	 * @param Product 검색조건과 페이지 구현 정보(아직 구현전)를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Product> getProductListAll(Product input) throws Exception {
		List<Product> result = null;

		try {
            result = sqlSession.selectList("ProductMapper.selectListAllInfo", input);

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

	@Override
	public int getProductCountAdmin(Product input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("ProductMapper.selectCountAllAdmin" , input);
			
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	

}
