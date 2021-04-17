package com.project.laporte.controllers;

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

import com.project.laporte.helper.RegexHelper;
import com.project.laporte.helper.WebHelper;
import com.project.laporte.model.Reserve;
import com.project.laporte.service.ReserveService;



@Controller
public class ReserveAjaxController {
	/** WebHelper 주입 */
	// --> import org.springframework.beans.factory.annotation.Autowired;
	// --> import com.project.laporte.helper.WebHelper;
	@Autowired WebHelper webHelper;
	
	/** RegexHelper 주입 */
	// --> import com.project.laporte.helper.RegexHelper;
	@Autowired RegexHelper regexHelper;
	
	/** Service 패턴 구현체 주입 */
	// --> import com.project.laporte.service.ReserveService;
	@Autowired ReserveService reserveService;
	
	/** "/프로젝트 이름" 에 해당하는 ContextPath 변수 주입  */
	// --> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;
	/** 작성 폼 페이지 */
	@RequestMapping(value ="/08_reserve/reserve.do", method = RequestMethod.GET)
	public ModelAndView add(Model model) {return new ModelAndView("/08_reserve/reserve");}
	
	
	/** 목록 페이지 */
	@RequestMapping(value="/08_reserve/reserve_list.do",method = RequestMethod.GET)
	public ModelAndView list(Model model,
	
			@RequestParam(value="userno",defaultValue="0")int userno) {
//		/** 1) 유효성 검사 */
//		// 이 값이 존재하지 않는다면 데이터 조회가 불가능 하므로 필수값으로 처리해야한다.
//		if(userno == 0) {
//			return webHelper.redirect(null, "회원 정보가 없습니다.");
//		}
		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Reserve input = new Reserve();
		input.setUserno(userno);
		
		List<Reserve> output = null;
		
		try {
			output = reserveService.getReservesList(input);
		}catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("input",input);
		model.addAttribute("output",output);
		return new ModelAndView("/08_reserve/reserve_list");
		
	}
	
	/** 상세 페이지 */
	@RequestMapping(value="/08_reserve/reserve_cfm.do", method = RequestMethod.GET)
	public ModelAndView view(Model model,
			@RequestParam(value="reserveno",defaultValue="0")int reserveno) {
		
		/** 1) 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
//		if (reserveno == 0) {
//			return webHelper.redirect(null, "예약번호가 없습니다.");
//		}
//		
		/** 2)데이터 조회하기*/
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Reserve input = new Reserve();
		input.setReserveno(reserveno);
		
		// 조회결과를 저장할 객체 선언
		Reserve output = null;
		
		try {
			//데이터 조회
			output = reserveService.getReserveItem(input);
		}catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3)View 처리 */
		model.addAttribute("input",input);
		model.addAttribute("output",output);
		return new ModelAndView("/08_reserve/reserve_cfm");
		
	}
	
	/** 수정 폼 페이지 */
	@RequestMapping(value="/08_reserve/reserve_edit.do", method = RequestMethod.GET)
	public ModelAndView edit(Model model,
			@RequestParam(value="reserveno", defaultValue="0")int reserveno) {
		
		/** 1) 파라미터 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if(reserveno == 0) {
			return webHelper.redirect(null, "예약번호가 없습니다.");
			
		}
		
		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Reserve input = new Reserve();
		input.setReserveno(reserveno);
		
		Reserve output = null;
		
		try {
			output = reserveService.getReserveItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output",output);
		return new ModelAndView("/08_reserve/reserve_edit");
	}
	
	
	
	/** 예약 취소 처리 */
	@RequestMapping(value ="08_reserve/reserve_delete_ok.do",method =RequestMethod.GET)
	public ModelAndView delete_ok(Model model,
			@RequestParam(value="reserveno", defaultValue="0")int reserveno) {
		
		/** 1) 파라미터 유효성 검사 */
		// 이값이 존재하지않는다면 예약취소가 불가능하므로 필수값으로 처리해야 한다.
//		if(reserveno == 0) {
//			return webHelper.redirect(null, "예약 번호가 없습니다.");
//		}
		
		/** 2) 데이터 삭제하기 */
		Reserve input = new Reserve();
		input.setReserveno(reserveno);
		
		try {
			reserveService.deleteReserve(input);
		}catch(Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		/** 3) 페이지 이동 */
		return webHelper.redirect(contextPath + "/08_reserve/reserve_cfm.do", "예약취소되었습니다.");
	}
	
	/** 예약 확인 처리 */
	@RequestMapping(value ="08_reserve/reserve_update_ok.do",method =RequestMethod.GET)
	public ModelAndView reserve_ok(Model model,
			@RequestParam(value="reserveno", defaultValue="0")int reserveno) {
		
		/** 1) 파라미터 유효성 검사 */
		// 이값이 존재하지않는다면 예약취소가 불가능하므로 필수값으로 처리해야 한다.
//		if(reserveno == 0) {
//			return webHelper.redirect(null, "예약 번호가 없습니다.");
//		}
		
		/** 2) 데이터 수정하기 */
		Reserve input = new Reserve();
		input.setReserveno(reserveno);
		
		try {
			reserveService.updateReservey(input);
		}catch(Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		/** 3) 페이지 이동 */
		return webHelper.redirect(contextPath + "/08_reserve/reserve_cfm.do", "예약확인되었습니다.");
	}
	
	@RequestMapping(value ="/11_admin/admin_resvappv.do", method = RequestMethod.GET)
	public ModelAndView adlist (Model model,HttpServletRequest request) {
		/** 로그인 여부 검사 */
		String adminno = "";
		HttpSession session = request.getSession();
    	if(session.getAttribute("my_admin")!=null) {
    		adminno = (String) session.getAttribute("my_admin");
    	}
    	if(adminno == "") {
    		return webHelper.redirect(null, "관리자로 로그인을 해주세요.");
    	}
		List<Reserve> output = null;
		
		try {
			// 데이터 조회하기
			output = reserveService.getReserveList(null);
		}catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output",output);
		
		return new ModelAndView("11_admin/admin_resvappv");
	}
	
}