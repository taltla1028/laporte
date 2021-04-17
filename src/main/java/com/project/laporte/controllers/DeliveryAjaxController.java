package com.project.laporte.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.laporte.helper.PageData;
import com.project.laporte.helper.RegexHelper;
import com.project.laporte.helper.WebHelper;
import com.project.laporte.model.Delivery;
import com.project.laporte.model.Orderlist;
import com.project.laporte.service.DeliveryService;
import com.project.laporte.service.OrderlistService;

@Controller
public class DeliveryAjaxController {

	/** Webhelper 주입 */
	// -> import org.springframework.beans.factory.annotation.Autowired;
	// -> import study.spring.springhelper.helper.WebHelper;
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	// -> import study.spring.springhelper.helper.RegexHelper;
	@Autowired
	RegexHelper regexHelper;
	
	/** Service 패턴 구현체 주입 */
	// -> import com.project.laporte.service.OrderlistService;
	@Autowired
	OrderlistService OrderlistService;

	// -> import com.project.laporte.service.DeliveryService;
	@Autowired
	DeliveryService deliveryService;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	// -> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** 사용자 주문관리 목록 페이지 */
	@RequestMapping(value = "/02_mypage/order.do", method = RequestMethod.GET)
	public ModelAndView list(Model model, HttpServletRequest request,
			@RequestParam(value = "userno", defaultValue = "0") int userno) {

		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Orderlist input = new Orderlist();
		Delivery deliveryInput = new Delivery();

		List<Orderlist> output = null; // 조회결과가 저장될 객체
		List<Delivery> deliveryOutput = new ArrayList<Delivery>(); // 조회결과가 저장될 객체

		try {
			if (userno == 0) {
				HttpSession session = request.getSession();
				userno = (int) session.getAttribute("my_session");

				input.setUserno(userno);
				deliveryInput.setUserno(userno);
				output = OrderlistService.getOrderItem(input);

				// 데이터 조회하기
			} else {

				input.setUserno(userno);
				deliveryInput.setUserno(userno);
				output = OrderlistService.getOrderItem(input);
			}
			deliveryOutput = deliveryService.getDeliveryListUser(deliveryInput);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		model.addAttribute("output", output);
		model.addAttribute("deliveryOutput", deliveryOutput);

		return new ModelAndView("/02_mypage/order");
	}

	/** 관리자 - 주문관리 목록 페이지 */
	@RequestMapping(value = "/11_admin/admin_order.do", method = RequestMethod.GET)
	public ModelAndView orderList(Model model,
			HttpServletRequest request,
			// 검색어
			@RequestParam(value = "keyword", defaultValue = "", required = false) String keyword,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {

		/** 로그인 여부 검사 */
		String adminno = "";
		HttpSession session = request.getSession();
    	if(session.getAttribute("my_admin")!=null) {
    		adminno = (String) session.getAttribute("my_admin");
    	}
    	if(adminno == "") {
    		return webHelper.redirect(null, "관리자로 로그인을 해주세요.");
    	}
		
		/** 1) 페이지 구현에 필요한 변수값 생성 */
		int totalCount = 0; 	// 전체 게시글 수
		int listCount = 10; 	// 한 페이지당 표시할 목록 수
		int pageCount = 5; 		// 한 그룹당 표시할 페이지 번호 수

		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Orderlist input = new Orderlist();
		input.setName(keyword);
		Delivery deliveryInput = null;
		PageData pageData = null; 			// 페이지 번호를 계산한 결과가 저장될 객체

		List<Orderlist> output = null; 		// 조회결과가 저장될 객체
		List<Delivery> deliveryOutput = new ArrayList<Delivery>(); // 조회결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = OrderlistService.getOrderlistCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Orderlist.setOffset(pageData.getOffset());
			Orderlist.setListCount(pageData.getListCount());

			output = OrderlistService.getOrderList(input);
			deliveryOutput = deliveryService.getDeliveryList(deliveryInput);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		model.addAttribute("deliveryOutput", deliveryOutput);
		model.addAttribute("keyword", keyword);

		return new ModelAndView("11_admin/admin_order");
	}

	/** 관리자 - 배송관리 목록 페이지 */
	@RequestMapping(value = "/11_admin/admin_delivery.do", method = RequestMethod.GET)
	public ModelAndView deliveryList(Model model,
			HttpServletRequest request,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {

		/** 로그인 여부 검사 */
		String adminno = "";
		HttpSession session = request.getSession();
    	if(session.getAttribute("my_admin")!=null) {
    		adminno = (String) session.getAttribute("my_admin");
    	}
    	if(adminno == "") {
    		return webHelper.redirect(null, "관리자로 로그인을 해주세요.");
    	}
		
		/** 1) 페이지 구현에 필요한 변수값 생성 */
		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Orderlist input = new Orderlist();

		List<Orderlist> output = null; // 조회결과가 저장될 객체
		PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체
		List<Delivery> deliveryOutput = null; // 조회결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = OrderlistService.getOrderlistCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Orderlist.setOffset(pageData.getOffset());
			Orderlist.setListCount(pageData.getListCount());

			output = OrderlistService.getOrderList(input);
			deliveryOutput = deliveryService.getDeliveryList(null);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		model.addAttribute("deliveryOutput", deliveryOutput);

		return new ModelAndView("11_admin/admin_delivery");
	}

	/** 관리자 - 취소관리 목록 페이지 */
	@RequestMapping(value = "/11_admin/admin_cancel.do", method = RequestMethod.GET)
	public ModelAndView cancelList(Model model,
			HttpServletRequest request,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {

		/** 로그인 여부 검사 */
		String adminno = "";
		HttpSession session = request.getSession();
    	if(session.getAttribute("my_admin")!=null) {
    		adminno = (String) session.getAttribute("my_admin");
    	}
    	if(adminno == "") {
    		return webHelper.redirect(null, "관리자로 로그인을 해주세요.");
    	}
		
		/** 1) 페이지 구현에 필요한 변수값 생성 */
		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Orderlist input = new Orderlist();
		Delivery deliveryInput = null;

		List<Orderlist> output = null; // 조회결과가 저장될 객체
		PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체
		List<Delivery> deliveryOutput = new ArrayList<Delivery>(); // 조회결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = OrderlistService.getOrderlistCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Orderlist.setOffset(pageData.getOffset());
			Orderlist.setListCount(pageData.getListCount());

			output = OrderlistService.getOrderList(input);
			deliveryOutput = deliveryService.getDeliveryList(deliveryInput);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		model.addAttribute("deliveryOutput", deliveryOutput);

		return new ModelAndView("11_admin/admin_cancel");
	}
}
