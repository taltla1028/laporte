<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>

<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Hello Laporte admin</title>
 <link rel="shortcut icon" href="../assets/img/laporte_favi.png" />
<!-- stylesheet -->
<link
	href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<link rel="stylesheet" href="../assets/css/admin_common.css">
<link rel="stylesheet" href="../assets/css/admin_login.css">

<!-- javascript -->
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<!-- ajax-helper -->
<link rel="stylesheet" href="../assets/plugins/ajax/ajax_helper.css" />
<script src="../assets/plugins/ajax/ajax_helper.js"></script>
</head>

<body>
	<div class="login_box">
		<div class="logo_box">
			<span class="logo">로고</span>
		</div>
		<div class="login">
			<form id="login-form" action="${pageContext.request.contextPath}/11_admin/admin">
				<input type="text" placeholder="아이디" id="aid" class="admin_input" name="aid"/> 
				<input type="password" placeholder="비밀번호" id="apw" class="admin_input" name="apw"/>
				<button type="submit" id="admin_login_btn">로그인</button>
			</form>
		</div>
	</div>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- jQuery Ajax Form plugin CDN -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
	<!-- jQuery Ajax Setup -->
    <script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
	<script type="text/javascript">
		$(function() {
				//.add_wishlist_form에 대한 submit이벤트를 가로채서 Ajax 요청을 전송한다.
		    	$("#login-form").ajaxForm({
		    		//전송 메서드 지정
		    		method: "POST",
		    		//서버에서 200 응답을 전달한 경우 실행됨
		    		success: function(json){
		    			//json에 포함된 데이터를 활용하여 상세페이지로 이동한다.
		    			if(json.rt == "OK"){
		    				window.location.href = "${pageContext.request.contextPath}/11_admin/admin_home.do";
		                    
		    			}else {
							$("#admin_id").val("");
							$("#admin_pw").val("");
							$("#admin_id").focus();
							return false;
						}
		    		}
		    	});
		});
	</script>
</body>

</html>