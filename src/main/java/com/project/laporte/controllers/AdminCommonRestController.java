package com.project.laporte.controllers;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.laporte.helper.RegexHelper;
import com.project.laporte.helper.WebHelper;
import com.project.laporte.model.Admin;

@RestController
public class AdminCommonRestController {

	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	@RequestMapping(value = "/11_admin/admin", method = RequestMethod.POST)
	public Map<String, Object> admin_login(HttpServletRequest request,
			@RequestParam(value = "aid", defaultValue = "") String aid,
			@RequestParam(value = "apw", defaultValue = "") String apw) {

		/** 유효성 검사 */
		if (!regexHelper.isValue(aid)) {
			return webHelper.getJsonWarning("아이디를 입력해주세요.");
		}
		if (!regexHelper.isValue(apw)) {
			return webHelper.getJsonWarning("비밀번호를 입력해주세요.");
		}

		String id = "admin";
		String pw1 = "laporte123";
		String pw2 = "ㅣㅁㅔㅐㄱㅅㄷ123";
		if (aid.equals(id) && (apw.equals(pw1) || apw.equals(pw2))) {

			Admin admin = new Admin();
			admin.setAid(aid);

			/** request 객체를 사용해서 세션 객체 만들기 */
			HttpSession session = request.getSession();
			session.setAttribute("my_admin", admin.getAid());

			/** 결과를 확인하기 위한 JSON 출력 */
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("admin", admin);

			return webHelper.getJsonData(data);

		} else {
			return webHelper.getJsonWarning("아이디와 비밀번호가 일치하지 않습니다.");
		}

	}

}
