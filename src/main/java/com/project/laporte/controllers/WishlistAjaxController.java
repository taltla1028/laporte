package com.project.laporte.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.laporte.helper.RegexHelper;
import com.project.laporte.helper.WebHelper;
import com.project.laporte.model.Wish_prod;
import com.project.laporte.model.Wishlist;
import com.project.laporte.service.WishlistService;

@Controller
public class WishlistAjaxController {
	/** WebHelper 주입 */
	// --> import org.springframework.beans.factory.annotation.Autowired;
	// --> import study.spring.springhelper.helper.WebHelper;
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	// --> import study.spring.helper.RegexHelper;
	@Autowired
	RegexHelper regexHelper;

	/** Service 패턴 구현체 주입 */
	@Autowired
	WishlistService wishlistService;

	/** "/프로젝트이름"에 해당하는 ContextPath 변수 주입 */
	// --> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** 위시리스트 페이지  */
	@RequestMapping(value = "/05_wishlist/wishlist.do", method = RequestMethod.GET)
	public ModelAndView view(Model model, 
							HttpServletRequest request,
							HttpServletResponse response,
							@RequestParam(value = "userno", defaultValue = "0", required=false) int userno,
							@RequestParam(value = "wishno", defaultValue = "0", required=false) int wishno,
							@CookieValue(value="my_wish", defaultValue="0", required=false)int my_wish) {
		
		
		/** 1) 유효성 검사 */
		// 세션값 확인해서 세션값이 있으면 userno에 넣기
		if (userno == 0) {
			HttpSession session = request.getSession();
        	if(session.getAttribute("my_session")!=null) {
        		userno = (int) session.getAttribute("my_session");
        	}
		}
		
		//쿠키에 저장되어있는 위시리스트가 내 계정의 위시리스트가 맞는지 확인 -> 아니라면 my_wish 지우기
			if(my_wish!=0) {
				Wishlist oldwish = new Wishlist();
				oldwish.setWishno(my_wish);
				Wishlist newwish = new Wishlist();
				try {
					// 데이터 조회
					newwish = wishlistService.getWishListOne(oldwish);
				} catch (Exception e) {
					return webHelper.redirect(null, e.getLocalizedMessage());
				}
				if(newwish.getUserno() != userno) {
					Cookie cookiewish = new Cookie("my_wish", "0");
					cookiewish.setPath("/");
					cookiewish.setDomain("itproject.ezenac.co.kr");
					cookiewish.setMaxAge(0);
					response.addCookie(cookiewish);
					my_wish=0;
				}
			}

		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		//위시리스트를 선택하지 않은경우
		Wishlist basicwish = new Wishlist();
		List<Wish_prod> basicwishprod = new ArrayList<Wish_prod>(); //기본위시리스트에 담긴 상품조회 리스트
		
		if(wishno==0 && userno!=0 && my_wish==0) { //로그인은 했지만 아무 위시리스트도 선택하지 않았을 때 (기본 위시리스트)
			Wishlist input = new Wishlist();
			input.setUserno(userno);

			// 조회결과를 저장할 객체 선언
			Wishlist basicoutput = null;
			List<Wishlist> wishlist = new ArrayList<Wishlist>();

			try {
				// 데이터 조회
				basicoutput = wishlistService.selectBasicWish(input);
				wishlist = wishlistService.getWishList(input);
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			
			int basicno = basicoutput.getWishno();
			
			basicwish.setWishno(basicno);
			
			//현재 선택한 위시리스트 번호를 쿠키에 저장
			Cookie cookie = new Cookie("my_wish", String.valueOf(basicno));
			cookie.setPath("/");
			cookie.setDomain("itproject.ezenac.co.kr");
			if(String.valueOf(basicno).equals("")) {
				cookie.setMaxAge(0);
			}else {
				cookie.setMaxAge(60*60*24);
			}
			response.addCookie(cookie);
			
			try {
				// 데이터 조회
				basicwishprod = wishlistService.getWishitemList(basicwish);
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			System.out.println("중간확인================"+basicwishprod);
			model.addAttribute("basicwishprod", basicwishprod);
			model.addAttribute("nowwilist", basicoutput);
			model.addAttribute("basicoutput", basicoutput);
			model.addAttribute("wishlist", wishlist);
		}else if((wishno!=0 && userno!=0) || (userno!=0 && my_wish!=0)) { //로그인도 했고, 다른 위시리스트를 선택했을 경우
			if(wishno==0) {
				wishno = my_wish;
			}
			
			// 현재 로그인한 사용자의 위시리스트 조회
			Wishlist input = new Wishlist();
			input.setUserno(userno);
			List<Wishlist> wishlist = new ArrayList<Wishlist>();
			
			basicwish.setWishno(wishno);
			
			//파라미터로 받은 wishno을 쿠키에 저장
			Cookie cookie = new Cookie("my_wish", String.valueOf(wishno));
			cookie.setPath("/");
			cookie.setDomain("itproject.ezenac.co.kr");
			if(String.valueOf(wishno).equals("")) {
				cookie.setMaxAge(0);
			}else {
				cookie.setMaxAge(60*60*24);
			}
			response.addCookie(cookie);
			
			//현재 선택한 위시리스트 조회
			Wishlist nowoutput = new Wishlist();
			nowoutput.setWishno(wishno);
			
			//사용자의 기본위시리스트 조회
			Wishlist basicinput = new Wishlist();
			basicinput.setUserno(userno);
			Wishlist basicoutput = new Wishlist();
			
			//현재 선택한 위시리스트의 상품 조회	
			List<Wish_prod> nowwishprod = new ArrayList<Wish_prod>();
			
			try {
				// 데이터 조회
				nowwishprod = wishlistService.getWishitemList(nowoutput);
				wishlist = wishlistService.getWishList(input);
				nowoutput = wishlistService.getWishListOne(nowoutput);
				basicoutput = wishlistService.selectBasicWish(basicinput);
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			
			
			model.addAttribute("basicwishprod", nowwishprod);	// 현재 위시리스트의 상품 정보들 
			model.addAttribute("wishlist", wishlist); //	사용자가 가지고 있는 위시리스트 목록 리스트 
			model.addAttribute("nowwilist", nowoutput);	// 현재 위시리스트 
			model.addAttribute("basicoutput", basicoutput);	// 기본 위시리스트 조회할 빈즈 
			
		}else { //로그인을 안한 경우
			basicwishprod = null;
			model.addAttribute("basicwishprod", basicwishprod);
		}
		
		
		
		//위시리스트에 담겨있는 상품 데이터 조회
		

		/** 3) View 처리하기 */
		model.addAttribute("userno", userno);
		return new ModelAndView("05_wishlist/wishlist");
	}
}
