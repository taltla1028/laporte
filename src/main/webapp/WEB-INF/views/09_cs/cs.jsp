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
        <link rel="stylesheet" type="text/css" href="../assets/css/cs.css">

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
            
            <!-- 여기가 현재 페이지를 의미합니다. - active클래스 적용됨 -->

			<!-- 검색제외 본문영역 -->
            <div class="container">
                <div class="page-header">
                    <ol class="breadcrumb">
                        <li><a href=${pageContext.request.contextPath}>홈</a></li>
                        <!-- 여기가 현재 페이지를 의미합니다. - active클래스 적용됨 -->
                        <li class="active"><a href="#">고객 지원</a></li>
                    </ol>
                </div>
                <!--페이지 경로 끝-->
                <div>
                    <div>
                        <h2 class="cs_title">고객 지원</h2>
                    </div>
                    <div class="cs_explain_box">
                        <p>
                            혹시 도움이 필요하신가요? laporte 에서의 경험이 만족스러운
                            기억으로 남도록 안내 및 지원 서비스가
                            항상 준비되어 있습니다.
                        </p>
                    </div>
                    <div class="cs_content_box">
                        <div class="cs_content">
                            <a href="#" class="cs_content_link">
                                <h4>laporte 온라인 구매방법</h4>
                                <span class="cs_arrow_icon"></span>
                                <div class="cs_img_box">
                                    <span class="cs_icon_img" id="cs_shopping"></span>
                                </div>
                            </a>
                        </div>
                        <div class="cs_content">
                        	<a href="${pageContext.request.contextPath}/09_cs/fa.do">
                                <h4>자주 묻는 질문</h4>
                                <span class="cs_arrow_icon"></span>
                                <div class="cs_img_box">
                                    <span class="cs_icon_img" id="cs_fa"></span>
                                </div>
                            </a>
                        </div>
                        <div class="cs_content">
                            <a href="${pageContext.request.contextPath}/09_cs/csmain.do">
                                <h4>La porte 고객지원센터</h4>
                                <span class="cs_arrow_icon"></span>
                                <div class="cs_img_box">
                                    <span class="cs_icon_img" id="cs_center"></span>
                                </div>
                            </a>
                        </div>
                        <div class="cs_content">
                        	<a href="${pageContext.request.contextPath}/09_cs/delivery.do">
                                <h4>배송조회 및 관리</h4>
                                <span class="cs_arrow_icon"></span>
                                <div class="cs_img_box">
                                    <span class="cs_icon_img" id="cs_delivery"></span>
                                </div>
                            </a>
                        </div>
                        <div class="cs_content">
                            <a href="${pageContext.request.contextPath}/09_cs/exchange.do">
                                <h4>교환환불</h4>
                                <span class="cs_arrow_icon"></span>
                                <div class="cs_img_box">
                                    <span class="cs_icon_img" id="cs_return"></span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>

            </div>
		</section>
		<%@ include file="../01_home/footer.jsp" %>

       <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
       <script src="../assets/js/home.js"></script>

	</body>
</html>