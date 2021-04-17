package com.project.laporte.controllers;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.project.laporte.helper.MailHelper;
import com.project.laporte.helper.RegexHelper;
import com.project.laporte.helper.UploadItem;
import com.project.laporte.helper.WebHelper;

import com.project.laporte.model.Email_inquiry;
import com.project.laporte.service.EmailinquiryService;

@RestController
public class EmailinquiryRestController {
	
	 /** WebHelper 주입 */
    @Autowired  WebHelper webHelper;

    /** RegexHelper 주입 */
    @Autowired  RegexHelper regexHelper;
    
    /** MailHlper 주입 */
    @Autowired MailHelper mailHelper;
    
    /** Service 패턴 구현체 주입 */
    @Autowired EmailinquiryService emailinquiryService;


    /** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
    @Value("#{servletContext.contextPath}")
    String contextPath;
    
    /** 새로운 이메일 문의 추가*/
    @RequestMapping(value="/09_cs", method=RequestMethod.POST)
    public Map<String, Object>add_email_inquiry(Model model, HttpServletRequest request,
    		@RequestParam(value="name", defaultValue="") String name,
    		@RequestParam(value="email", defaultValue="") String email,
    		@RequestParam(value="category", defaultValue="") String category,
    		@RequestParam(required=false) MultipartFile file,
    		@RequestParam(value="content", defaultValue="") String content
    		){
    	
    	/**1) 사용자가 입력한 파라미터 유효성 검사*/
		//유효성 검사 프론트에서 구현
    	if(!regexHelper.isValue(name)) 				{webHelper.getJsonWarning("이름을 입력해주세요."); }
    	if(!regexHelper.isValue(email)) 			{webHelper.getJsonWarning("이메일을 입력해주세요."); }
    	if(!regexHelper.isValue(category)) 			{webHelper.getJsonWarning("카테고리를 선택해주세요."); }
    	if(!regexHelper.isValue(content)) 			{webHelper.getJsonWarning("문의 내용을 입력해주세요."); }
    	
		/** 2) 데이터 저장하기 */
		//저장할 값들을 Beans에 담는다.
		Email_inquiry input = new Email_inquiry();
		input.setName(name);
		input.setEmail(email);
		input.setCategory(category);
		input.setContent(content);
		
		
		//저장된 결과를 조회하기 위한 객체
		Email_inquiry output = null;
		
		//업로드 된 결과를 저장하기 위한 객체 생성		
		UploadItem uploadFile = new UploadItem();
		
		try {
			if(file != null) {
			//업로드 결과가 저장된 Beans를 리턴받는다.
			uploadFile = webHelper.saveMultipartFile(file);
			
			String fileUrl = uploadFile.getFileUrl();
			input.setFile(fileUrl);
			}
			
			//데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			emailinquiryService.addEmailInquiry(input);
			
			//데이터 조회
			output = emailinquiryService.getEmailInquiry(input);
			

		}catch(Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		/** 결과를 확인하기 위한 페이지 연동 */
		//저장 결과를 확인하기 위해 데이터 저장 시 생성된 PK값을 상세 페이지로 전달해야 한다.
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", output);
	
		
		return webHelper.getJsonData();
    }
    
    /** 새로운 이메일 답변 추가*/
    @RequestMapping(value="/09_cs", method=RequestMethod.PUT)
    public Map<String, Object>answer_email_inquiry(    		
    		@RequestParam(value="emailno", defaultValue="0") int emailno,
    		@RequestParam(value="answer", defaultValue="") String answer
    		){
    	
    	/**1) 사용자가 입력한 파라미터 유효성 검사*/
		//유효성 검사 프론트에서 구현
    	
		/** 2) 데이터 저장하기 */
		//저장할 값들을 Beans에 담는다.
		Email_inquiry input = new Email_inquiry();
		input.setEmailno(emailno);
		input.setAnswer(answer);
		
		Email_inquiry output = null;
		
		try {
			//데이터 수정
			emailinquiryService.answerEmailInquiry(input);
			
			//수정 결과 조회
			output = emailinquiryService.getEmailInquiry(input);
			
			//DB 에 답변 저장 후 이메일 보내기
			
			if(output != null) {
				try {
				String subject = "la porte 고객센터 입니다.";
				String content = "<div style = 'width : 75%; border: 35px solid #cebea7; margin:auto; padding:30px;'> " +
						 "<h2> 안녕하세요. la porte 입니다 </h2>" +
						 "<br />" +
						 "<p> 고객님께서" + output.getRegdate()+ "에 문의 해주신 </p>" +
						 "<h3 stype='font-weight: bold;'>" +output.getContent() + "</h3>"+
						 "<p>에 대한 답변 입니다.</p>"+						 
						 "<br />" + 
						 
						 "<p style ='display:block; width:135px; height: 32px; color:#fff; font-weight:bold; background-color: #172f50; text-align: center; padding-top: 10px;'> laporte 고객센터 답변 </p>" +
						 "<h3 stype='font-weight: bold;'>" + output.getAnswer()+ "</h3>" +
						 "<br />" +
						 "</div>";
				
				mailHelper.sendMail(output.getEmail(), subject, content);
				}catch(Exception e) {
					return webHelper.getJsonError(e.getLocalizedMessage());
				}
			}
		}
		catch(Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		/** 결과를 확인하기 위한 JSON 출력 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", output);
		return webHelper.getJsonData(map);
    }
    
    /** 이메일 문의 아이템 불러오기*/
    @RequestMapping(value="/09_cs", method=RequestMethod.GET)
    public Map<String, Object>item_email_inquiry(   		
    		@RequestParam(value="emailno", defaultValue="0") int emailno,
    		@RequestParam(value="category", defaultValue="") String category,
    		@RequestParam(value="status", defaultValue="") String status
    		){
    	
    	/** 이메일 문의 아이템 불러오기 */
		Email_inquiry input = new Email_inquiry();
		input.setEmailno(emailno);
		input.setCategory(category);
		input.setStatus(status);
		Email_inquiry email_item = null;
		
		/** 이메일 문의 필터 조건에 맞는 리스트 불러오기 */
		
		List <Email_inquiry> list_output = null;
		
		
		/** 결과를 확인하기 위한 페이지 연동 */
		//저장 결과를 확인하기 위해 데이터 저장 시 생성된 PK값을 상세 페이지로 전달해야 한다.
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			
			if(emailno != 0) {
				email_item = emailinquiryService.getEmailInquiry(input);
				map.put("email_item", email_item);
			}
			
			if(category != null || status != null) {
				list_output = emailinquiryService.getEmailInquiryList(input);
				map.put("email_list", list_output);
			}
			}catch(Exception e) {
				return webHelper.getJsonError(e.getLocalizedMessage());
			}
			return webHelper.getJsonData(map);
		
    }
    	
}
