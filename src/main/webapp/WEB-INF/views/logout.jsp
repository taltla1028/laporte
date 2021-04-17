<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	//모든 세션값을 삭제하고 돌아가기
	session.invalidate();

%>
<!doctype html>
<html lang ="ko">
<head>
	<meta charset = "UTF-8" />
	    <script src="http://code.jquery.com/jquery.min.js"></script>
	<!-- sweetalert -->
	
	 <link rel="stylesheet" href="assets/plugins/sweetalert/sweetalert2.min.css">
	 <script src="assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
	<script>
	alert("로그아웃 되셨습니다.");
	</script>
	<!--홈으로 강제 이동 -->
	<meta http-equiv='refresh' content='0; url=home.out' />
</head>
<body></body>
</html>