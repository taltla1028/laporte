package com.project.laporte.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.laporte.model.Wish_prod;
import com.project.laporte.model.Wishlist;
import com.project.laporte.service.WishlistService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class WishlistServiceImpl implements WishlistService {

	/** MyBatis */
	// --> import org.apache.ibatis.session.SqlSession
	@Autowired
	SqlSession sqlSession;

	/**
	 * 위시리스트 선택시 데이터 상세 조회 (상품 목록 조회)
	 * 
	 * @param Wishlist 조회할 장바구니의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public List<Wish_prod> getWishitemList(Wishlist input) throws Exception {
		List<Wish_prod> result = null;

		try {
			result = sqlSession.selectList("WishlistMapper.selectWishList", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * 위시리스트 선택시 조회된 상품 삭제
	 * 
	 * @param Wishlist 조회할 장바구니의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public int deleteWishlistItem(Wish_prod input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete("WishlistMapper.deleteWishItem", input);

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
	 * 위시리스트 선택시 조회된 상품 수정
	 * 
	 * @param Wishlist 조회할 장바구니의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public int editWishlistItem(Wish_prod input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("WishlistMapper.updateWishItem", input);

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
	 * 위시리스트에 상품 추가
	 * 
	 * @param Wishlist 조회할 장바구니의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public int addWishlistItem(Wish_prod input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("WishlistMapper.inserWishItem", input);

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
	 * 위시리스트 목록 조회 - (기본 위시리스트 외)
	 * 
	 * @param Wishlist 조회할 위시리스트 목록을 담고있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public List<Wishlist> getWishList(Wishlist input) throws Exception {
		List<Wishlist> result = null;

		try {
			result = sqlSession.selectList("WishlistMapper.selectallwishlist", input);

			} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * 위시리스트 목록 추가
	 * 
	 * @param Wishlist 조회할 장바구니의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public int addWishlist(Wishlist input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("WishlistMapper.insertwish", input);

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
	 * 위시리스트 목록 삭제
	 * 
	 * @param Wishlist 조회할 장바구니의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public int deleteWishlist(Wishlist input1, Wish_prod input2) throws Exception {
		int result = 0;

		try {
			
			if(input2!=null) {
				// 위시리스트 삭제 전 담고있는 위시리스트 상품 데이터를 삭제
				sqlSession.delete("WishlistMapper.deleteWishAllItem", input2);
			}
			result = sqlSession.delete("WishlistMapper.deletewish", input1);

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
	 * 위시리스트 목록 수정
	 * 
	 * @param Wishlist 조회할 장바구니의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public int editWishlist(Wishlist input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("WishlistMapper.updatewish", input);

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
	 * 기본 위시리스트 번호 조회 기능
	 * 
	 * @param Wishlist 조회할 장바구니의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public Wishlist selectBasicWish(Wishlist input) throws Exception {
		Wishlist result = null;

		try {
			result = sqlSession.selectOne("WishlistMapper.selectbasicwish", input);

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
	 * 위시리스트 선택시 조회된 상품 하나의 정보
	 * 
	 * @param Wishlist 조회할 장바구니의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public Wish_prod getWishitem(Wish_prod input) throws Exception {
		Wish_prod result = null;

		try {
			result = sqlSession.selectOne("WishlistMapper.selectWishItem", input);

		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * 위시리스트 목록 단일행 조회
	 * 
	 * @param Wishlist 조회할 위시리스트
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public Wishlist getWishListOne(Wishlist input) throws Exception {
		Wishlist result = null;

		try {
			result = sqlSession.selectOne("WishlistMapper.selectonewishlist", input);

			} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * 위시리스트 목록에 있는 상품 모두 삭제
	 * 
	 * @param Wish_prod 조회할 장바구니의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public int deleteWishItems(Wish_prod input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete("WishlistMapper.deleteWishAllItem", input);

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
	 * 위시리스트에 있는 상품 다른 리스트로 이동
	 * @param Wishlist 조회할 장바구니의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public int editWishlistItemMove(Wish_prod input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("WishlistMapper.updateWishItemMove", input);

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
	 * 기본 위시리스트 목록 추가
	 * 
	 * @param Wishlist 조회할 장바구니의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public int addbasicWishlist(Wishlist input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("WishlistMapper.inserbasicwish", input);

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
	 * 위시리스트 상품 추가 (원래 있던 상품)
	 * 
	 * @param Wish_prod 조회할 위시리스트 상품의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public int editWishItemOne(Wish_prod input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("WishlistMapper.updateWishItemOne", input);

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 수정에 실패했습니다.");
		}

		return result;
	}

	/** 회원별 위시리스트 갯수 조회 */
	//0308추가 -조진경
	
	@Override
	public int getWishlistQTY(Wishlist input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("WishlistMapper.selectCountByUserno", input);
		}catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

}
