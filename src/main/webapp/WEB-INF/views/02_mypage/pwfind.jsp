<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>la porte</title>
	 <link rel="shortcut icon" href="../assets/img/laporte_favi.png" />

	<!-- font stylesheet -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
	
	 <!-- stylesheet -->
	<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../assets/css/pwfind.css">
    
    <!-- javascript  -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="http://code.jquery.com/jquery.min.js"></script>
    
	<!-- ajax-helper -->
    <link rel="stylesheet" href="../assets/plugins/ajax/ajax_helper.css" />
   
</head>

<body>

<div id= "login_pwfind">
	<div class="header">
	<a href="${pageContext.request.contextPath}/02_mypage/login.do">
		<span id="d_icon_l">이전으로 가기</span>
	</a>
	<h3><b>비밀번호 찾기</b></h3>
	<h5>이메일을 통해 비밀번호를 재설정 해주세요.</h5>
	</div>
	
	<div class="section">
	<form id="pwfind-form" action="${pageContext.request.contextPath}/02_mypage/pwfind_ok.do" >
	<input id="email_insert" name="email" placeholder="이메일" />
	<span id="email_e_msg">올바른 주소 형식을 입력해주세요.</span>
	<button id="login_pwfind_btn" type="submit">비밀번호 찾기</button>
	</form>
	
	</div>
	
	<div class="footer">
	<h5>laporte.kr-<a href="#">개인정보처리방침</a></h5>
	</div>
</div>

<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		  <!--Google CDN 서버로부터 jQuery 참조 -->
    <!-- jQuery Ajax Form plugin CDN -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
    <!-- jQuery Ajax Setup -->
    <script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
    
<script type="text/javascript">
	$(document).ready(function(){
		$('#email_e_msg').hide();
	});
	
	$(function(){
		$('#email_insert').keyup(function(e){
			e.preventDefault;
			
		var emailValue = $('#email_insert').val();
		var emailPattern = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
		
		if(!emailPattern.test(emailValue)){
				$('#email_insert').css("border-bottom","2px solid #f64b4b");
				$('#email_e_msg').css("color", "#f64b4b").show();
				return false;
		}else{
			$('#email_insert').css("border-bottom","2px solid rgb(165, 165, 165)");
			$('#email_e_msg').hide();
		}
		});
		
		//#pwfind-formd에 대한 submit이벤트를 가로채서 Ajax요청을 전송한다.
		$("#pwfind-form").ajaxForm({
			//전송 메서드 지정
			method: "POST",
			//서버에서 200 응답을 전달한 경우 실행됨
			success: function(json){
				console.log(json);
				
				//json 결과가 OK 일 시 로그인 페이지로 이동한다.
				if(json.rt == "OK"){
					alert("입력하신 이메일로 비밀번호 재설정을 위한 메일이 발송되었습니다.");
					window.location = "${pageContext.request.contextPath}/02_mypage/login.do";
				}
			}
		});
	});
</script>
</body>
</html>