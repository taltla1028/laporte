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
    <link rel="stylesheet" type="text/css" href="../assets/css/join.css">

</head>

<body>

<div id= "Join">
	<div class="header">
		<h3><b>지금 la porte에 가입 하세요!</b></h3>
	</div>
	
	<div class="Join_information_box1">
        <div class="Join_info_line">
            <input type="checkbox" id="Join_info_checkbox">
            <label for="Join_info_checkbox"><span></span></label>
            <div id="Join_info_text">모두 동의</div>
        </div>
    </div>

    <div class="Join_information_box2">

        <div class="Join_info_line2">
            <div id="Join_accessterm_text">
               <input type="checkbox" class='check' id="Join_accessterm_checkbox">
               <span>[필수]이용약관 동의 보기</span>
            <a href="#content1" id="Join_accessterm_dropdown"></a>
            <div id="content1" class="content">
                제6조 (회원가입 신청)<br>
                ① 회원가입의 대상은 만 14세 이상의 개인으로 제한합니다.<br>
                ② 회원가입을 원하는 고객은 la porte에 제공하는 가입신청양식에 따라 성명(성, 이름), 휴대전화번호, 이메일, 비밀번호 등을 기재해야 합니다.<br>
                ③ 회원가입을 원하는 고객은 실명으로 가입 신청을 하여야 하고, 실명이 아니거나 타인의 정보를. 도용하여. 회원으로 가입한 자는 서비스를 이용할 수 없으며, 관련 법령에 의해 처벌 등을 받을 수. 있습니다.<br>
                ④ 회원의 아이디(ID)는 서비스 별로 고객 1인 당 1개만 사용할 수 있습니다.<div>
            </div>
        </div>

            <div class="Join_info_line3">
                <div id="Join_personal_text">
                 <input type="checkbox" class='check' id="Join_personal_checkbox">
                 <span>[필수] 개인정보 처리방침 동의 보기</span>
            <a href="#content2" id="Join_personal_dropdown"></a>
            <div id="content2" class="content">
                라포르테코리아 유한회사(이하 "라포르테"라고 합니다)는 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」제27조의2, 「개인정보 보호법」제30조 등 관련 법령에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보처리방침을 수립ㆍ공개합니다.
            <br>  
            </div>
            
        </div>
       
    </div>
	
		<button id="Join_btn" type="submit">동의하고 가입하기</button>
	
	<div class="footer">
		<h5>laporte.kr-<a href="#">개인정보처리방침</a></h5>
	</div>

</div>
</div>
</div>
</div>

</body>

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
            /* `#all_check`의 선택 상태가 변경되었을 때의 이벤트 */
            $("#Join_info_checkbox").change(function() {
                // 모든 `.hobby`의 선택 상태를 `#all_check`와 동일하게 맞춘다.
                $(".check").prop('checked', $(this).prop('checked'));
            });
            
            /** 게시글의 제목을 클릭한 경우 호출되는 이벤트 정의 */
            $("#Join_accessterm_dropdown, #Join_personal_dropdown").click(function(e) {
                // 링크의 기본 동작(페이지 이동) 방지
                e.preventDefault();
                // 클릭한 요소의 href 속성을 가져온다 --> 내용영역의 id
                var target = $(this).attr('href');
                // 가져온 내용영역의 id를 화면에 표시한다.
                $(target).slideToggle(100);
                // 내용영역(.content)중에서
                // 클릭한 요소가 지정한 항목만 제외(not($(target)))
                // 하고 화면에서 숨긴다.
                $(".content").not($(target)).slideUp(100);
            });
            
            $('#Join_btn').click(function(e){
            	e.preventDefault();
            	var agree = $('.check:checked');
            	if(agree.length < 2){
            		alert("필수항목을 모두 선택하셔야 회원가입이 가능합니다.");
            		return false;
            	}else{
            		location.href='${pageContext.request.contextPath}/02_mypage/join2.do';
            	}
            });
        });

    
     
    
</script>
</body>
</html>