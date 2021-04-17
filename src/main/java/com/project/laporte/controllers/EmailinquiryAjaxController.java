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
import com.project.laporte.model.Email_inquiry;
import com.project.laporte.service.EmailinquiryService;

@Controller
public class EmailinquiryAjaxController {
	
	/** WebHelper 주입 */
	@Autowired  WebHelper webHelper;
	
	/** RegexHelper 주입 */
	@Autowired  RegexHelper regexHelper;
	
	/** Service 패턴 구현체 주입 */
	@Autowired  EmailinquiryService emailinquiryService;
	
	
	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	
	@RequestMapping(value="/11_admin/admin_qanda.do", method=RequestMethod.GET)
    public ModelAndView admin_qanda(Model model,
    		HttpServletRequest request,
    		@RequestParam(value="emailno", defaultValue="0") int emailno) {
		
		 /** 로그인 여부 검사 */
		String adminno = "";
		HttpSession session = request.getSession();
    	if(session.getAttribute("my_admin")!=null) {
    		adminno = (String) session.getAttribute("my_admin");
    	}
    	if(adminno == "") {
    		return webHelper.redirect(null, "관리자로 로그인을 해주세요.");
    	}
    	
		/** 이메일 문의 리스트 불러오기 */
		List<Email_inquiry> output = null;
		
		
		try {
			//데이터 조회하기
			
			output = emailinquiryService.getEmailInquiryList(null);
			
			
			
		}catch(Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/**2) View 처리*/
		model.addAttribute("output", output);
		
        // "/src/main/webapp/WEB-INF/views/07purchase/purchase.jsp" 파일을 View로 지정한다.
        return new ModelAndView("11_admin/admin_qanda");
    }
	

}
