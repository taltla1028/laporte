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
    <link rel="stylesheet" type="text/css" href="../assets/css/pwrevise.css">
    
    <!-- javascript  -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="http://code.jquery.com/jquery.min.js"></script>
    
	<!-- ajax-helper -->
    <link rel="stylesheet" href="../assets/plugins/ajax/ajax_helper.css" />
	<script src="../assets/plugins/ajax/ajax_helper.js"></script>
	
	<!-- sweetalert -->
    <link rel="stylesheet" href="../assets/plugins/sweetalert/sweetalert2.min.css">
   

</head>

<body>

<div id= "login_pwrevise">
	<div class="header">
	<h3><b>비밀번호를 재설정해주세요.</b>
	</h3>
	</div>
	
	<div class="section">
	<form id="pwrevise-form" action="${pageContext.request.contextPath}/02_mypage/pwrevise_ok">
	<input type="password" id="pw_insert" name="userpwd" placeholder="새로운 비밀번호"></input>
	<a href="#" class= "showPassword">
		<span class="pw_hide_icon">비밀번호숨기기</span>
		<span class="pw_show_icon">비밀번호보이기</span>
	</a>
	<input type="password" id="pw_insert_chk" placeholder="새로운 비밀번호 확인"></input>
	
	<p>비밀번호는 최소 다음이 포함되어야 합니다.</p>
	<p id="pw_length">✓ 8-20자 이내</p>
	<p id="pw_num">✓ 숫자</p>
	<p id="pw_eng">✓ 영문</p>
	<p id="pw_spe">✓ 특수 문자</p>
	<p id="pw_correct">✓ 비밀번호 일치</p>

	<a id="new_pw_save" href="#" data-userno="${output.userno}">새로운 비밀번호 저장</a>
	</form>
	
	</div>
	
	<div class="footer">
	<h5>laporte.kr-<a href="#">개인정보처리방침</a></h5>
	</div>
</div>

<!-- swweetalert -->
<script src="../assets/plugins/sweetalert/sweetalert2.all.min.js"></script>

<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		  <!--Google CDN 서버로부터 jQuery 참조 -->
    <!-- jQuery Ajax Form plugin CDN -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
    <!-- jQuery Ajax Setup -->
    <script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
    
<script type="text/javascript">
$(function(){
	$(".pw_show_icon").hide()
	

	 $('#pw_insert').keyup(function(e){
		e.preventDefault();

        var pw = $('#pw_insert').val();
        var num = pw.search(/[0-9]/g);
        var eng = pw.search(/[a-z]/ig);
		var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

		
			if(pw.length > 7 && pw.length < 21){
                $('#pw_length').css("color","#437fb3");
			}else{$('pw_length').css("color","rgb(105,105,105)");}
			
            if(eng > -1){
                $('#pw_eng').css("color","#437fb3");
            }else{ $('#pw_eng').css("color","rgb(105,105,105)");}

        
            if(num > -1){
                $('#pw_num').css("color","#437fb3");
            }else{$('#pw_num').css("color","rgb(105,105,105)");}
         

            if(spe > -1){
                $('#pw_spe').css("color","#437fb3");
			}else{$('#pw_spe').css("color","rgb(105,105,105)");}
         
       
    
	});
	

    $('#pw_insert_chk').keyup(function(e){
        e.preventDefault;

        var pwInput = $('#pw_insert').val();
        var pwInputCheck = $('#pw_insert_chk').val();

        if(pwInput == pwInputCheck){
            $('#pw_correct').css("color","#437fb3");
     	   }else{$('#pw_correct').css("color","rgb(105,105,105)");}
	});

		 // showPassword 아이콘 클릭 이벤트 정의
	$('.showPassword').on('click', function(){

		// 패스워드 input에서 값을 가져옴
		var passwordField = $('#pw_insert');

		// 현재 패스워드 타입이 text인지 password인지 가져욤
		var passwordFieldType = passwordField.attr('type');

		// 현재 입력값이 password인 경우
		if(passwordFieldType == 'password'){
			// input type을 text로 바꿈
			passwordField.attr('type', 'text');

			//password 가리기 아이콘 숨기고 password보이기 아이콘 보여주기                
			$(".pw_hide_icon").hide()
			$(".pw_show_icon").show()
		} else {
			// input type이 password가 아닐경우 password로 변경
			passwordField.attr('type', 'password');

			// password보여주기 아이콘 숨기고, password숨기기 아이콘 보여주기
			$(".pw_show_icon").hide()
			$(".pw_hide_icon").show()
		}
	});
		 
	 /** 비밀번호 수정 */
	 $('#new_pw_save').click(function(e){
		e.preventDefault();
		
		let current = $(this);
		let userno = current.data('userno');
		let userpwd = $('#pw_insert').val();
		
		//put 메서드로 ajax 요청
		$.put("${pageContext.request.contextPath}/02_mypage/pwrevise_ok",{
			"userno" : userno,
			"userpwd" : userpwd,
		},function(json){
			if(json.rt == "OK"){
			swal('완료','비밀번호가 재설정되었습니다.','success');
			window.location = "${pageContext.request.contextPath}/02_mypage/login.do";
		}
	 });
});
});
		 //#pwrevise-form에 대한 submit 이벤트를 가로채서 Ajax요청을 전송한다.
	/* $('#pwrevise-form').ajaxForm({
		//전송 메서드 지정
		method : "POST",
		//서버에서 200 응답을 전달한 경우 실행됨
		success: function(json){
			console.log(json);
			
			//json 결과가 OK 일 시 로그인 페이지로 이동한다.
			if(json.rt == "OK"){
			swal('완료','비밀번호가 재설정되었습니다.','success'); */
				
		/* 	}
		}
	}); */
</script>
</body>
</html>