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
	
		<link rel="preconnect" href="https://fonts.gstatic.com">
		
	<!-- stylesheet -->
		<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/css/common.css">
        <link rel="stylesheet" type="text/css" href="../assets/css/delivery.css">
	
	<!-- javascript -->
        <script src="http://code.jquery.com/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	
	<!-- ajax-helper -->
        <link rel="stylesheet" href="../plugins/ajax/ajax_helper.css" />
        <script src="../plugins/ajax/ajax_helper.js"></script>
	</head>

	<body>
		<%@ include file="../01_home/header.jsp" %>
		<section>
		<%@ include file="../01_home/search.jsp"%>

			<!-- 검색제외 본문영역 -->
            <div class="container">
                <!-- 페이지 경로-->
                <div class="page-header">
                    <ol class="breadcrumb">
                        <li><a href=${pageContext.request.contextPath}>홈</a></li>
                        <li><a href="${pageContext.request.contextPath}/09_cs/cs.do">고객 지원</a></li>
                        <!-- 여기가 현재 페이지를 의미합니다. - active클래스 적용됨 -->
                        <li class="active"><a href="#">배송조회 및 관리</a></li>
                    </ol>
                </div>
                <!--페이지 경로 끝-->
                    <div class="delivery_header_box">
                        <div>
                            <h2 class="delivery_title">배송조회 및 관리</h2>
                        </div>
                        <div class="delivery_explain_box">
                            <p>
                                주문한 제품이 지금 어디에 있는지 알고 싶으신가요? 
                                아니면 주문 내용에 변경하고 싶은 부분이 있나요? 
                                걱정하지 마세요. La porte의 추적 및 관리 서비스가 도와드릴 수 있어요.
                            </p>
                        </div>
                    </div>
                    
                    
                    <div class="delivery_content_box">
                        <!--배송조회 박스 -->
                        <div class="delivery_check_box">
                            <div>
                                <h3>배송조회</h3>
                                <p>구입한 제품이 지금 어디에 있는지 정확히 알고 싶으신가요? 
                                    주문을 추적하면 걱정을 덜 수 있을 거예요.</p>
                            </div>
                            <a href="#" class="delivery_btn">배송조회</a>
                        </div>
                        <!--배송조회 박스 끝-->
                        <!--주문 관리 박스 -->
                        <div class="delivery_check_box">
                            <div>
                                <h3>주문 관리</h3>
                                <p>트럭 배송 시간을 변경해야 하거나, 
                                    주문 취소 또는 조립 서비스가 필요하다면 여기에서 도와드릴게요.</p>
                            </div>
                            <a href="#" class="delivery_btn">주문관리</a>
                        </div>
                        <!--주문 관리 박스 끝-->
                    </div>
                </div>
		</section>
		<%@ include file="../01_home/footer.jsp" %>
		
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="../assets/js/home.js"></script>
        
	</body>
</html>