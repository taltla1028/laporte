package com.project.laporte.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.laporte.helper.RegexHelper;
import com.project.laporte.helper.WebHelper;
import com.project.laporte.model.Cart;
import com.project.laporte.model.Wish_prod;
import com.project.laporte.model.Wishlist;
import com.project.laporte.service.CartService;
import com.project.laporte.service.WishlistService;

@RestController
public class WishlistRestController {

	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;

	/** Service 패턴 구현체 주입 */
	@Autowired
	WishlistService wishlistService;

	@Autowired
	CartService cartservice;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** 위시리스트 페이지 상품 개수 수정 */
	@RequestMapping(value = "/05_wishlist/wishlist", method = RequestMethod.PUT)
	public Map<String, Object> edit_item(@RequestParam(value = "prodno", defaultValue = "0") int prodno,
			@RequestParam(value = "wishno", defaultValue = "0") int wishno,
			@RequestParam(value = "ea", defaultValue = "0") int ea) {

		if (prodno == 0) {
			return webHelper.getJsonWarning("상품 번호가 없습니다.");
		}

		if (wishno == 0) {
			return webHelper.getJsonWarning("위시리스트 번호가 없습니다.");
		}

		if (ea == 0) {
			return webHelper.getJsonWarning("상품 수량이 없습니다.");
		}

		// 수정할 값들을 Beans에 담는다.
		Wish_prod input = new Wish_prod();
		input.setProdno(prodno);
		input.setWishno(wishno);
		input.setEa(ea);

		// 수정된 결과를 조회하기 위한 객체
		Wish_prod output = null;

		try {
			// 데이터 수정
			wishlistService.editWishlistItem(input);
			// 수정 결과 조회
			output = wishlistService.getWishitem(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 JSON 출력 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", output);
		return webHelper.getJsonData(map);
	}

	/** 위시리스트 추가하는 action 페이지 */
	@RequestMapping(value = "/05_wishlist/wishlist", method = RequestMethod.POST)
	public Map<String, Object> add_wishlist(@RequestParam(value = "title") String title,
			@RequestParam(value = "userno", defaultValue = "0") int userno) {
		/** 1) 사용자가 입력한 파라미터에 대한 유효성 검사 */
		// 일반 문자열 입력 컬럼 -> String으로 파라미터가 선언되어 있는 경우는 값이 입력되지 않으면 빈 문자열로 처리된다.
		if (!regexHelper.isValue(title)) {
			return webHelper.getJsonWarning("위시리스트 이름을 입력하세요.");
		}
		if (userno == 0) {
			return webHelper.getJsonWarning("사용자 번호가 없습니다.");
		}

		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		Wishlist input = new Wishlist();
		input.setUserno(userno);
		input.setTitle(title);

		// 저장된 결과를 조회하기 위한 객체
		Wishlist output = null;

		try {
			// 데이터 저장
			// -> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			wishlistService.addWishlist(input);

			// 데이터 조회
			output = wishlistService.getWishListOne(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 JSON 출력 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", output);
		return webHelper.getJsonData(map);
	}

	/** 위시리스트 삭제하는 페이지 */
	@RequestMapping(value = "/05_wishlist/wishlist", method = RequestMethod.DELETE)
	public Map<String, Object> delete_wishlist(@RequestParam(value = "wishno") int wishno) {
		/** 1) 파라미터 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (wishno == 0) {
			return webHelper.getJsonWarning("위시리스트 번호가 없습니다.");
		}

		/** 2) 데이터 삭제하기 */
		// 데이터 삭제에 필요한 조건 값을 Beans에 저장하기
		Wishlist wishinput = new Wishlist();
		Wish_prod wishprodinput = new Wish_prod();
		wishinput.setWishno(wishno);
		wishprodinput.setWishno(wishno);

		try {
			wishlistService.deleteWishlist(wishinput, wishprodinput); // 위시리스트 삭제
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 JSON 출력 */
		// 확인할 대상이 삭제된 결과값만 OK로 전달
		return webHelper.getJsonData();
	}

	/** 위시리스트 이름 수정 */
	@RequestMapping(value = "/05_wishlist/wishlist/rename", method = RequestMethod.PUT)
	public Map<String, Object> edit_listname(@RequestParam(value = "wishno", defaultValue = "0") int wishno,
			@RequestParam(value = "title", defaultValue = "") String title) {

		if (wishno == 0) {
			return webHelper.getJsonWarning("위시리스트 번호가 없습니다.");
		}

		if (title == "") {
			return webHelper.getJsonWarning("위시리스트 이름이 없습니다.");
		}

		// 수정할 값들을 Beans에 담는다.
		Wishlist input = new Wishlist();
		input.setTitle(title);
		input.setWishno(wishno);

		// 수정된 결과를 조회하기 위한 객체
		Wishlist output = null;

		try {
			// 데이터 수정
			wishlistService.editWishlist(input);
			// 수정 결과 조회
			output = wishlistService.getWishListOne(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 JSON 출력 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", output);
		return webHelper.getJsonData(map);
	}

	/** 위시리스트 아이템 삭제하는 페이지 */
	@RequestMapping(value = "/05_wishlist/wishlist/item", method = RequestMethod.DELETE)
	public Map<String, Object> delete_wishitem(@RequestParam(value = "wishno") int wishno,
			@RequestParam(value = "prodno") int prodno) {
		/** 1) 파라미터 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (wishno == 0) {
			return webHelper.getJsonWarning("위시리스트 번호가 없습니다.");
		}
		if (prodno == 0) {
			return webHelper.getJsonWarning("상품 번호가 없습니다.");
		}

		/** 2) 데이터 삭제하기 */
		// 데이터 삭제에 필요한 조건 값을 Beans에 저장하기
		Wish_prod wishprodinput = new Wish_prod();
		wishprodinput.setWishno(wishno);
		wishprodinput.setProdno(prodno);

		try {
			wishlistService.deleteWishlistItem(wishprodinput); // 위시리스트 삭제
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 JSON 출력 */
		// 확인할 대상이 삭제된 결과값만 OK로 전달
		return webHelper.getJsonData();
	}

	/** 위시리스트 상품 다른 위시리스트로 이동 */
	@RequestMapping(value = "/05_wishlist/wishlist/moveitem", method = RequestMethod.PUT)
	public Map<String, Object> edit_wishitem(@RequestParam(value = "newwishno", defaultValue = "0") int newwishno,
			@RequestParam(value = "prodno", defaultValue = "0") int prodno,
			@RequestParam(value = "wishno", defaultValue = "0") int wishno) {

		if (newwishno == 0) {
			return webHelper.getJsonWarning("이동할 위시리스트 번호가 없습니다.");
		}

		if (prodno == 0) {
			return webHelper.getJsonWarning("이동시킬 상품 번호가 없습니다.");
		}
		if (wishno == 0) {
			return webHelper.getJsonWarning("이동시킬 상품 번호을 담은 위시리스트번호가 없습니다.");
		}

		// 수정할 값들을 Beans에 담는다.
		Wish_prod input = new Wish_prod();
		input.setNewwishno(newwishno);
		input.setProdno(prodno);
		input.setWishno(wishno);

		// 수정된 결과를 조회하기 위한 객체
		Wish_prod output = null;
		Wish_prod newwish = new Wish_prod();

		try {
			// 데이터 수정
			wishlistService.editWishlistItemMove(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		try {
			newwish.setWishno(newwishno);
			newwish.setProdno(prodno);
			// 수정 결과 조회
			output = wishlistService.getWishitem(newwish);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 JSON 출력 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", output);
		return webHelper.getJsonData(map);
	}

	/** 위시리스트에 상품을 추가하는 action 페이지 */
	@RequestMapping(value = "/05_wishlist/wishlist/item", method = RequestMethod.POST)
	public Map<String, Object> add_wishitem(@RequestParam(value = "wishno") int wishno,
			@RequestParam(value = "prodno", defaultValue = "0") int prodno,
			@RequestParam(value = "userno", defaultValue = "0") int userno) {

		if (userno == 0) {
			return webHelper.getJsonWarning("로그인 후 이용해주세요.");
		}

		if (wishno == 0) {
			// 조회결과를 저장할 객체 선언
			Wishlist input = new Wishlist();
			input.setUserno(userno);
			Wishlist basicoutput = null;

			try {
				// 데이터 조회
				basicoutput = wishlistService.selectBasicWish(input);
			} catch (Exception e) {
				return webHelper.getJsonError(e.getLocalizedMessage());
			}

			wishno = basicoutput.getWishno();
		}

		// 저장할 값들을 Beans에 담는다.
		Wish_prod input = new Wish_prod();
		input.setWishno(wishno);
		input.setProdno(prodno);
		Wishlist wish = new Wishlist();
		wish.setWishno(wishno);

		// 저장된 결과를 조회하기 위한 객체
		List<Wish_prod> output = null;
		Wish_prod itemresult = null;

		try {
			
			itemresult=wishlistService.getWishitem(input);
			
			if(itemresult!=null) {
				wishlistService.editWishItemOne(input);
			}else {
				// 데이터 저장
				// -> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
				wishlistService.addWishlistItem(input);
			}
			
			// 데이터 조회
			output = wishlistService.getWishitemList(wish);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 JSON 출력 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", output);
		return webHelper.getJsonData(map);
	}

	/** 위시리스트에 있는 모든 상품을 장바구니에 추가 */
	@RequestMapping(value = "/05_wishlist/wishlist/moveitem", method = RequestMethod.DELETE)
	public Map<String, Object> add_allcart(@RequestParam(value = "wishno", defaultValue = "0") int wishno,
			@RequestParam(value = "userno", defaultValue = "0") int userno) {

		if (wishno == 0) {
			return webHelper.getJsonWarning("장바구니에 추가할 상품 번호을 담은 위시리스트번호가 없습니다.");
		}

		// 수정할 값들을 Beans에 담는다.
		Wishlist input = new Wishlist();
		input.setWishno(wishno);

		// 수정된 결과를 조회하기 위한 객체
		List<Wish_prod> wishitems = new ArrayList<Wish_prod>();

		try {
			// 데이터 수정
			wishitems = wishlistService.getWishitemList(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		// 저장된 결과를 조회하기 위한 객체
		List<Cart> output = null;
		int count = 0;

		for (int i = 0; i < wishitems.size(); i++) {
			Wish_prod item = wishitems.get(i);
			Cart cart = new Cart();
			cart.setProdno(item.getProdno());
			cart.setUserno(userno);
			cart.setEa(item.getEa());

			// 중복검사
			try {
				count = cartservice.countCart(cart);
			} catch (Exception e) {
				return webHelper.getJsonError(e.getLocalizedMessage());
			}

			// 갯수 추가 수정
			if (count != 0) {
				try {
					cartservice.updateCart(cart);

					// 데이터 조회
					output = cartservice.getCartList(cart);

				} catch (Exception e) {
					return webHelper.getJsonError(e.getLocalizedMessage());
				}
			} else {

				try {
					// 데이터 저장
					// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
					cart.setUserno(userno);
					cartservice.addCart(cart);

					// 데이터 조회
					output = cartservice.getCartList(cart);

				} catch (Exception e) {
					return webHelper.getJsonError(e.getLocalizedMessage());
				}
			}
		}

		Wishlist wishinput = new Wishlist();
		Wish_prod wishprodinput = new Wish_prod();
		wishinput.setWishno(wishno);
		wishprodinput.setWishno(wishno);

		try {
			wishlistService.deleteWishItems(wishprodinput); // 위시리스트 안에있는 상품을 삭제
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", output);

		return webHelper.getJsonData();
	}

}
