package com.project.laporte.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.laporte.helper.PageData;
import com.project.laporte.helper.RegexHelper;
import com.project.laporte.helper.WebHelper;
import com.project.laporte.model.Delivery;
import com.project.laporte.model.Orderlist;
import com.project.laporte.service.DeliveryService;
import com.project.laporte.service.OrderlistService;

@Controller
public class AdminCommonAjaxController {

	/** WebHelper 주입 */
	@Autowired  WebHelper webHelper;
	
	/** RegexHelper 주입 */
	@Autowired  RegexHelper regexHelper;
	
	@Autowired  OrderlistService OrderlistService;
	
	@Autowired  DeliveryService DeliveryService;
	
	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	@RequestMapping(value="/11_admin/admin_login.do", method=RequestMethod.GET)
    public  ModelAndView home(Model model) {	
		
		
		//model.addAttribute("output", output);
		return new  ModelAndView("/11_admin/admin_login");
    }
	
	@RequestMapping(value="/11_admin/admin_logout.do", method=RequestMethod.GET)
    public  String admin_logout(HttpServletRequest request) {	
		HttpSession session = request.getSession();
    	if(session.getAttribute("my_admin")!=null) {
    		session.removeAttribute("my_admin");
    	}
		return "redirect:/11_admin/admin_login.do";
    }
	
	@RequestMapping(value="/11_admin/admin_home.do", method=RequestMethod.GET)
    public ModelAndView adminHome(Model model, HttpServletRequest request) {
        // "/src/main/webapp/WEB-INF/views/11_admin/admin_home.jsp" 파일을 View로 지정한다.
		/** 로그인 여부 검사 */
		String adminno = "";
		HttpSession session = request.getSession();
    	if(session.getAttribute("my_admin")!=null) {
    		adminno = (String) session.getAttribute("my_admin");
    	}
    	if(adminno == "") {
    		return webHelper.redirect(null, "관리자로 로그인을 해주세요.");
    	}
		
    	Orderlist orderlist = new Orderlist();
    	int CC = 0;
    	int CH = 0;
    	int RT = 0;
    	int RF = 0;
    	int Deli = 0;
    	
    	Delivery delivery = new Delivery();
    	int R = 0;
    	int S = 0;
    	int D = 0;
    	
    	try {
    		orderlist.setOrderstatus("CC");
			CC = OrderlistService.getOrderCount(orderlist);
			orderlist.setOrderstatus("CH");
			CH = OrderlistService.getOrderCount(orderlist);
			orderlist.setOrderstatus("RT");
			RT = OrderlistService.getOrderCount(orderlist);
			orderlist.setOrderstatus("RF");
			RF = OrderlistService.getOrderCount(orderlist);
			
			orderlist.setDelistatus("N");
			Deli = OrderlistService.getOrderCountDeli(orderlist);
			
			delivery.setDeliverystatus("R");
			R = DeliveryService.getCountDelivery(delivery);
			delivery.setDeliverystatus("S");
			S = DeliveryService.getCountDelivery(delivery);
			delivery.setDeliverystatus("D");
			D = DeliveryService.getCountDelivery(delivery);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
    	
    	model.addAttribute("CC", CC);
    	model.addAttribute("CH", CH);
    	model.addAttribute("RT", RT);
    	model.addAttribute("RF", RF);
    	model.addAttribute("Deli", Deli);
    	model.addAttribute("R", R);
    	model.addAttribute("S", S);
    	model.addAttribute("D", D);
    	
        return new  ModelAndView("/11_admin/admin_home");
    }
	
}
