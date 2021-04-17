package com.project.laporte.controllers;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.laporte.helper.RegexHelper;
import com.project.laporte.helper.WebHelper;
import com.project.laporte.model.Product;
import com.project.laporte.model.Wish_prod;
import com.project.laporte.model.Wishlist;
import com.project.laporte.service.ProductListService;
import com.project.laporte.service.WishlistService;

import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
@Slf4j
@Controller
public class HomeController {

	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	@Autowired
	RegexHelper regexHelper;
	@Autowired
	SqlSession sqlSession;
	@Autowired
	ProductListService productlistService;
	@Autowired
	WishlistService wishlistService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response,
			@CookieValue(value = "my_wish", defaultValue = "0", required = false) int my_wish) {

		log.debug("HomeController 실행됨");

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		/** 추천제품 */
		Product input = new Product();
		List<Product> output = new ArrayList<Product>();

		// 현재 상품이 위시리스트에 담겨있는지 확인
		Wishlist wishValue = new Wishlist();

// 로그인 여부 확인 -> 로그인 중 일때 - userno!=0 / 로그인 하지 않았을때 - userno ==0
		int userno = 0;
		HttpSession session = request.getSession();
		if (session.getAttribute("my_session") != null) {
			userno = (int) session.getAttribute("my_session");
		}

//쿠키에 저장되어있는 위시리스트가 내 계정의 위시리스트가 맞는지 확인 -> 아니라면 my_wish 지우기
		if (my_wish != 0) {
			Wishlist oldwish = new Wishlist();
			oldwish.setWishno(my_wish);
			Wishlist newwish = new Wishlist();
			try {
				// 데이터 조회
				newwish = wishlistService.getWishListOne(oldwish);
			} catch (Exception e) {
				e.printStackTrace();
			}
			if (newwish.getUserno() != userno) {
				Cookie cookiewish = new Cookie("my_wish", "0");
				cookiewish.setPath("/");
				cookiewish.setDomain("itproject.ezenac.co.kr");
				cookiewish.setMaxAge(0);
				response.addCookie(cookiewish);
				my_wish = 0;
			}
		}

		Wishlist basicoutput = new Wishlist();
		if (my_wish == 0 && userno != 0) { // 로그인은 했으나 쿠키에 위시리스트가 저장되어있지 않을때 기본 위시리스트에 저장
			// 사용자의 기본위시리스트번호 조회
			Wishlist basicinput = new Wishlist();
			basicinput.setUserno(userno);

			try {
				// 데이터 조회
				basicoutput = wishlistService.selectBasicWish(basicinput);
				my_wish = basicoutput.getWishno();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		try {
			// 데이터 조회
			output = productlistService.getProductlistList(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

		wishValue.setWishno(my_wish);
		List<Wish_prod> wishoutput = new ArrayList<Wish_prod>();
		try {
			wishoutput = wishlistService.getWishitemList(wishValue);
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("userno", userno);
		model.addAttribute("output", output);
		model.addAttribute("serverTime", formattedDate);
		model.addAttribute("basicoutput", basicoutput);
		model.addAttribute("my_wish", my_wish);
		model.addAttribute("wishoutput", wishoutput);

		return "home";
	}

}
