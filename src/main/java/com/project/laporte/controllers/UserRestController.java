package com.project.laporte.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.laporte.helper.MailHelper;
import com.project.laporte.helper.RegexHelper;
import com.project.laporte.helper.WebHelper;
import com.project.laporte.model.Orderlist;
import com.project.laporte.model.Outuser;
import com.project.laporte.model.User;
import com.project.laporte.model.Userscoupon;
import com.project.laporte.model.Wishlist;
import com.project.laporte.service.OrderlistService;
import com.project.laporte.service.UserService;
import com.project.laporte.service.UserscouponService;
import com.project.laporte.service.WishlistService;

@RestController
public class UserRestController {

    /** WebHelper 주입 */
    @Autowired  WebHelper webHelper;

    /** RegexHelper 주입 */
    @Autowired  RegexHelper regexHelper;

    /** MailHlper 주입 */
    @Autowired MailHelper mailHelper;

    /** Service 패턴 구현체 주입 */
    @Autowired  UserService userService;
    @Autowired 	OrderlistService orderlistService;
    @Autowired 	UserscouponService userscouponService;
    @Autowired	WishlistService wishService;

    /** Spring Security 주입 */
    @Autowired BCryptPasswordEncoder pwdEncoder;

    /** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
    @Value("#{servletContext.contextPath}")
    String contextPath;



	/**아이디 중복 검사*/
	@RequestMapping(value="/02_mypage/id_check.do", method=RequestMethod.POST)
	public Map<String, Object>id_check(Model model,
			@RequestParam(value = "email", defaultValue="") String email){

		/**1) 아이디 조회를 위해 Bean에 담는다*/
			User input = new User();
			input.setEmail(email);

		//조회된 결과를 확인하기 위한 객체
			int output = 0;

			try {
				output = userService.getIdItem(input);
			}catch (Exception e) {
	            return webHelper.getJsonError(e.getLocalizedMessage());
	        }

	        /** 2) JSON 출력하기 */
	        Map<String, Object> data = new HashMap<String, Object>();
	        data.put("item", output);

	        return webHelper.getJsonData(data);


	}
	/** 회원가입 작성 폼에 대한 action 페이지*/
	@RequestMapping(value="/02_mypage", method=RequestMethod.POST)
	public Map<String, Object> add_user(Model model,
			@RequestParam(value="email", defaultValue="") String email,
			@RequestParam(value="userpwd", defaultValue="") String userpwd,
			@RequestParam(value="name", defaultValue="") String name,
			@RequestParam(value="birthdate", defaultValue="") String birthdate,
			@RequestParam(value="phoneno", defaultValue="") String phoneno,
			@RequestParam(value="gender", defaultValue="") String gender,
			@RequestParam(value="addr1", defaultValue="") String addr1,
			@RequestParam(value="addr2", defaultValue="") String addr2,
			@RequestParam(value="postcode", defaultValue="") String postcode,
			@RequestParam(value="userstatus", defaultValue="") String userstatus,
			@RequestParam(value="point", defaultValue="0") int point,
			@RequestParam(value="regdate", defaultValue="") String regdate,
			@RequestParam(value="editdate", defaultValue="") String editdate
			) {
		//POST 방식으로 Join_ok에서 Join cfm

		/**1) 사용자가 입력한 파라미터 유효성 검사*/
		if(!regexHelper.isValue(email))				{return webHelper.getJsonWarning("이메일을 입력하세요.");}
		if(!regexHelper.isValue(name))				{return webHelper.getJsonWarning("이름을 입력하세요.");}
		if(!regexHelper.isValue(birthdate))			{return webHelper.getJsonWarning("생년월일을 입력하세요.");}
		if(!regexHelper.isValue(phoneno))			{return webHelper.getJsonWarning("연락처를 입력하세요.");}
		if(!regexHelper.isValue(gender))			{return webHelper.getJsonWarning("성별을 입력하세요.");}
		if(!regexHelper.isValue(email))				{return webHelper.getJsonWarning("이메일을 입력하세요.");}
		if(!regexHelper.isValue(addr1))				{return webHelper.getJsonWarning("주소를 입력하세요.");}
		if(!regexHelper.isValue(addr2))				{return webHelper.getJsonWarning("주소를 입력하세요.");}
		if(!regexHelper.isValue(postcode))			{return webHelper.getJsonWarning("우편번호를 입력하세요.");}
		if(!regexHelper.isValue(userpwd))			{return webHelper.getJsonWarning("비밀번호를 입력하세요.");}

		/**2) 데이터 저장하기*/
		//저장할 값들을 Beans에 담는다.
		User input = new User();
		input.setEmail(email);
		input.setUserpwd(userpwd);
		input.setName(name);
		input.setBirthdate(birthdate);
		input.setPhoneno(phoneno);
		input.setGender(gender);
		input.setAddr1(addr1);
		input.setAddr2(addr2);
		input.setPostcode(postcode);
		input.setUserstatus(userstatus);
		input.setRegdate(regdate);
		input.setEditdate(editdate);

		// 저장된 결과를 조회하기 위한 객체
		User output = null;


		// 회원가입 쿠폰 저장하기
		Userscoupon uc_input = new Userscoupon();
		Userscoupon uc_output = null;


		try {
			//데이터 저장
			//비밀번호 암호화
			String inputPwd = input.getUserpwd();
			String pwdEnc = pwdEncoder.encode(inputPwd);
			input.setUserpwd(pwdEnc);

			//--> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			userService.addUser(input);

			//데이터 조회
			output = userService.getUserItem(input);

			//회원가입을 위한 데이터 넣기
			uc_input.setUserno(output.getUserno());
			uc_input.setCouponno(40001);

			//회원가입 쿠폰 조회
			userscouponService.addJoinCoupon(uc_input);
			uc_output = userscouponService.getUsersCoupon(uc_input);

		}catch(Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		//기본 위시리스트 생성하기
		Wishlist wishinput = new Wishlist(); //userno을 담을 빈즈 생성
		wishinput.setUserno(output.getUserno());

		try {
			wishService.addbasicWishlist(wishinput);
			//--> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.

		}catch(Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/**3) 결과를 확인하기 위한 페이지 연동*/
		//저장 결과를 확인하기 위해 데이터 저장 시 생성된 PK값을 상세 페이지로 전달해야 한다.
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", output);
		map.put("uc_output", uc_output);
		return webHelper.getJsonData(map);
	}

	 //로그인 아이디, 패스워드 확인
	@RequestMapping(value="/02_mypage/login_ok.do", method=RequestMethod.POST)
	public Map<String, Object> login_post(Model model, HttpServletRequest request,
			@RequestParam(value="email", defaultValue="") String email,
			@RequestParam(value="userpwd", defaultValue="") String userpwd) {

		/** 사용자가 입력한 파라미터 유효성 검사*/
		if(!regexHelper.isValue(email))					{return webHelper.getJsonWarning("아이디를 입력하세요.");}
		if(!regexHelper.isValue(userpwd))				{return webHelper.getJsonWarning("비밀번호를 입력하세요.");}

		/** 입력값 일치 확인하기*/
		//저장할 값들을 Beans에 담는다.
		User input = new User();
		input.setEmail(email);
		input.setUserpwd(userpwd);

		//사용자가 입력한 암호
		String inputPwd = input.getUserpwd();

		// 저장된 결과를 조회하기 위한 객체
		User idCheck = null;
		User output = null;

		/** request 객체를 사용해서 세션 객체 만들기 */
		HttpSession session = request.getSession();

		try {
			// 아이디 존재여부 확인 및 존재할 경우 id&pw DB에서 가져온다.
			idCheck = userService.checkPw(input);

			//입력한 비밀번호와 DB에서 가져온 비밀번호가 일치할 경우 데이터를 조회한다.
			if(idCheck != null && pwdEncoder.matches(inputPwd, idCheck.getUserpwd())) {
			//데이터 조회
			output = userService.checkIdPw(idCheck);
			// 세션 저장 처리
			session.setAttribute("my_session", output.getUserno());
			}else {
				/**조회에 실패한 경우(DB에 데이터가 존재하지 않는 경우) */
				//세션 삭제
				session.removeAttribute("my_session");
				return webHelper.getJsonError("비밀번호가 잘못되었습니다.");
			}

		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());

		}

		/** 3)JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("item", output);
		return webHelper.getJsonData(data);
	}

	//비밀번호 찾기
	@RequestMapping(value="/02_mypage/pwfind_ok.do", method=RequestMethod.POST)
	public Map<String, Object> pw_find(Model model,
			@RequestParam(value="email", defaultValue="") String email){

		if(!regexHelper.isValue(email)) 	{return webHelper.getJsonWarning("이메일을 입력하세요.");}

		/** 1) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건을 Beans에 저장하기
		User input = new User();
		input.setEmail(email);

		// 조회결과를 저장할 객체 선언
		User output =null;

		try {
			//데이터 조회
			output = userService.checkEmail(input);

			//이메일 존재 하면 메일 발송 처리
			if(output != null) {
				try {
					//이메일 제목
					String subject = "la porte 비밀번호 재설정을 위한 메세지 입니다.";
					//비밀번호 수정 페이지 URL
					String url = "http://itproject.ezenac.co.kr/laporte/02_mypage/pwrevise.do";
					//사용자 번호
					int param_userno = output.getUserno();

					String pwrevise_url = url + "?" + "userno=" + param_userno;

					//전송할 이메일 내용
					String content = "<div style = 'width : 75%; border: 35px solid #cebea7; margin:auto; padding:30px;'>" +
									 "<h2> 안녕하세요. la porte 입니다 </h2>" +
									 "<br />" +
									 "<p> 해당 메일은 비밀번호 재설정 요청에 의해 전송된 이메일 입니다. <p>" +
									 "<br />" +
									 "<p> 고객님께서 요청하지 않으신 내용이라면 la porte 에 접속하여 비밀번호를 변경해주시고, 고객센터에 문의 해주시기 바랍니다.</p>" +
									 "<br />" +
									 "<p> 비밀번호 변경을 요청하셨다면 아래 버튼을 클릭하시면 비밀번호 변경이 가능한 페이지로 이동합니다.</p>" +
									 "<br />" +
									 "<a type= 'button' style ='display:block; width:140px; height: 32px; color:#fff; "
									 + "font-size: 12px; font-weight:bold; background-color: #172f50; margin:auto; "
									 + "margin-top: 20px; border-radius:25px; text-align: center; padding-top: 15px; text-decoration: none;' href='" + pwrevise_url + "'>비밀번호 변경하기</a>" +
									 "</div>";
					//sendMail() 메서드 선언시 throws 를 정의했기 때문에 예외처리가 요구된다.
					mailHelper.sendMail(output.getEmail(), subject, content);
				}catch(Exception e) {
					return webHelper.getJsonError(e.getLocalizedMessage());
				}
			}
		}catch(Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		/** 3)JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("item", output);
		return webHelper.getJsonData(data);
	}

	/** 비밀번호 수정 */
	@RequestMapping(value="/02_mypage/pwrevise_ok", method = RequestMethod.PUT)
	public Map<String, Object> pw_revie(Model model,
			@RequestParam(value = "userno", defaultValue="0") int userno,
			@RequestParam(value="userpwd", defaultValue="") String userpwd){


		/** 데이터 조회하기 */
		User input = new User();
		input.setUserno(userno);

		/** 사용자가 입력한 파라미터 유효성 검사 */
		 if(!regexHelper.isValue(userpwd))				{return webHelper.getJsonWarning("비밀번호를 입력해주세요.");
		 }

		 /** 데이터 수정하기 */

		 input.setUserpwd(userpwd);

		 //비밀번호 암호화
		 String inputPwd = input.getUserpwd();
		 String pwdEnc = pwdEncoder.encode(inputPwd);
		 input.setUserpwd(pwdEnc);
		// 조회결과를 저장할 객체 선언
		User output = null;

		try {
			//데이터 수정
			userService.pwRevise(input);

			//수정 결과 조회
			output = userService.getUserItem(input);

		}catch(Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 결과를 확인하기 위한 JSON 출력 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", output);
		return webHelper.getJsonData(map);
	}

	/** 개인 정보 수정 */
	@RequestMapping(value="/02_mypage/userInfoRevise_ok", method = RequestMethod.PUT)
	public Map<String, Object> userInfo_revise(Model model,
			@RequestParam(value = "userno", defaultValue="0") int userno,
			@RequestParam(value="name", defaultValue="") String name,
			@RequestParam(value="birthdate", defaultValue="") String birthdate,
			@RequestParam(value="gender", defaultValue="") String gender
			){


		/** 데이터 조회하기 */
		User input = new User();

		input.setUserno(userno);
		input.setName(name);
		input.setBirthdate(birthdate);
		input.setGender(gender);


		/** 사용자가 입력한 파라미터 유효성 검사 */
		 if(!regexHelper.isValue(name))						{return webHelper.getJsonWarning("이름을 입력해주세요.");}
		 if(!regexHelper.isValue(birthdate))				{return webHelper.getJsonWarning("생년월일을 입력해주세요.");}
		 if(!regexHelper.isValue(gender))					{return webHelper.getJsonWarning("성별을 입력해주세요.");}


		User output = null;

		try {
			//데이터 수정
			userService.userInfoRevise(input);

			//수정 결과 조회
			output = userService.getUserItem(input);

		}catch(Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 결과를 확인하기 위한 JSON 출력 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", output);
		return webHelper.getJsonData(map);

	}

	/** 연락처 수정  */
	@RequestMapping(value="/02_mypage/userConRevise_ok", method = RequestMethod.PUT)
	public Map<String, Object> userCon_revise(Model model,
			@RequestParam(value = "userno", defaultValue="0") int userno,
			@RequestParam(value="phoneno", defaultValue="") String phoneno
			){


		/** 데이터 조회하기 */
		User input = new User();

		input.setUserno(userno);
		input.setPhoneno(phoneno);


		/** 사용자가 입력한 파라미터 유효성 검사 */
		 if(!regexHelper.isValue(phoneno))				{return webHelper.getJsonWarning("휴대폰번호를 입력해주세요.");}


		User output = null;

		try {
			//데이터 수정
			userService.userConRevise(input);

			//수정 결과 조회
			output = userService.getUserItem(input);

		}catch(Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 결과를 확인하기 위한 JSON 출력 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", output);
		return webHelper.getJsonData(map);

	}

	/** 주소 수정  */
	@RequestMapping(value="/02_mypage/userAddrRevise_ok", method = RequestMethod.PUT)
	public Map<String, Object> userAddr_revise(Model model,
			@RequestParam(value = "userno", defaultValue="0") int userno,
			@RequestParam(value="addr1", defaultValue="") String addr1,
			@RequestParam(value="addr2", defaultValue="") String addr2,
			@RequestParam(value="postcode", defaultValue="") String postcode

			){


		/** 데이터 조회하기 */
		User input = new User();

		input.setUserno(userno);
		input.setAddr1(addr1);
		input.setAddr2(addr2);
		input.setPostcode(postcode);

		/** 사용자가 입력한 파라미터 유효성 검사 */
		 if(!regexHelper.isValue(addr1))				{return webHelper.getJsonWarning("도로명주소를 입력해주세요.");}
		 if(!regexHelper.isValue(addr2))				{return webHelper.getJsonWarning("상세주소를 입력해주세요.");}
		 if(!regexHelper.isValue(postcode))				{return webHelper.getJsonWarning("우편번호를 입력해주세요.");}


		User output = null;

		try {
			//데이터 수정
			userService.userAddrRevise(input);

			//수정 결과 조회
			output = userService.getUserItem(input);

		}catch(Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 결과를 확인하기 위한 JSON 출력 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", output);
		return webHelper.getJsonData(map);

	}

	 /** 회원정보 상세 조회 */
    @RequestMapping(value = "/02_mypage/{userno}", method = RequestMethod.GET)
    public Map<String, Object> get_item(@PathVariable("userno") int userno) {

        /** 1) 데이터 조회하기 */
        // 데이터 조회에 필요한 조건값을 Beans에 저장하기
        User input = new User();
        input.setUserno(userno);

        // 조회결과를 저장할 객체 선언
        User output = null;

        try {
            // 데이터 조회
            output = userService.getUserItem(input);
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }

        /** 2) JSON 출력하기 */
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("item", output);

        return webHelper.getJsonData(data);
    }


	 /** 회원탈퇴 조회 */
   @RequestMapping(value = "/02_mypage", method = RequestMethod.DELETE)
   public Map<String, Object> delete_user(
		   @RequestParam(value="userno", defaultValue="0") int userno,
		   @RequestParam(value="outreason", defaultValue="NULL") String outreason) {

	   /** 1) 파라미터 유효성 검사 */
   		if(userno == 0) {
   		return webHelper.getJsonWarning("잘못된 접근입니다. 삭제할 회원이 없습니다.");
   		}

       /** 2) 데이터 삭제하기 */
       // 데이터 조회에 필요한 조건값을 Beans에 저장하기
       User input = new User();
       input.setUserno(userno);

       Outuser ou_input = new Outuser();
       ou_input.setOutreason(outreason);

       User output = null;

       try {
    	   //데이터 조회
    	   output = userService.getUserItem(input);

    	   //outuser 테이블로 회원 정보 옮겨서 저장하기
        	ou_input.setUserno(output.getUserno());
        	ou_input.setEmail(output.getEmail());
        	ou_input.setName(output.getName());
        	ou_input.setBirthdate(output.getBirthdate());
        	ou_input.setPhoneno(output.getPhoneno());
        	ou_input.setGender(output.getGender());
        	ou_input.setAddr1(output.getAddr1());
        	ou_input.setAddr2(output.getAddr2());
        	ou_input.setPostcode(output.getPostcode());
        	ou_input.setRegdate(output.getRegdate());

    		userService.addOutUser(ou_input);
           // 데이터 삭제
    	   userService.deleteUser(input);


       } catch (Exception e) {
           return webHelper.getJsonError(e.getLocalizedMessage());
       }


   		/** 3) 결과 확인 JSON 출력 */
   		return webHelper.getJsonData();
   }

	 /** 관리자-고객관리 주문 상세 조회 */
    @RequestMapping(value = "/11_admin/admin_userlist_order", method = RequestMethod.GET)
    public Map<String, Object> get_user_order(@RequestParam("userno") int userno) {

        /** 1) 데이터 조회하기 */
        // 데이터 조회에 필요한 조건값을 Beans에 저장하기
        Orderlist input = new Orderlist();
        input.setUserno(userno);

        // 조회결과를 저장할 객체 선언
        //주문정보 조회
		 List<Orderlist> o_output = null;

        try {
            // 데이터 조회
        	 o_output = orderlistService.getOrderListbyUserno(input);
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }

        /** 2) JSON 출력하기 */
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("o_output", o_output);

        return webHelper.getJsonData(data);
    }
}
