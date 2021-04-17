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
        <link rel="stylesheet" type="text/css" href="../assets/css/exchange.css">
	
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
                        <li class="active"><a href="#">교환환불</a></li>
                    </ol>
                </div>
                <!--페이지 경로 끝-->
                    <div class="exchange_header_box">
                        <div>
                            <h2 class="exchange_title">교환환불</h2>
                        </div>
                        <div class="exchange_explain_box">
                            <p>
								La porte에서 구매한 제품이 마음에 들지 않으면 365일 이내에 가져오세요.
								<br/>
								구매 영수증과 사용하지 않은 제품을 가져오면 환불해 드립니다. 
							</p>
							<p>
								다만, 조건에 맞지 않으면, La porte는 교환 및 환불 요청을 거절할 수 있습니다.
							</p>
                        </div>
                    </div>
                    
                    <div class="exchange_content_box">
                        <!--교환 환불 절차 박스 -->
                        <div class="exchange_check_box">
                            <h3>교환환불 절차</h3>
							<span class="exchange_icon"></span>
							<div>
								<h4>픽업</h4>
								<p>
									도심 지역의 제품 수거 비용은 택배 배송 5,000원 부터, 트럭 배송 49,000원 부터 시작합니다.
									<br />
									서비스가 제공되지 않는 지역도 있으니, 가격과 일정에 관한 자세한 정보는 
									<a href="${pageContext.request.contextPath}/09_cs/csmain.do" class="csmain_link">고객센터</a>로 문의하세요.
								</p>
							</div>
						</div>
						<!--교환 환불 절차 박스  끝-->
						<!--문의 박스 -->
                        <div class="exchange_check_box">
                            <h3>제품 누락 / 파손 제품 문의 / 주문 오류</h3>
							<span class="exchange_icon2"></span>
							<div>
								<h4>전화 및 이메일 문의</h4>
								<p>
									주문하신 제품에 문제가 있을 경우 
									<a href="${pageContext.request.contextPath}/09_cs/csmain.do">고객지원센터</a>로 문의해주세요.
								</p>
							</div>
						</div>
						<!--문의 박스  끝-->
						<div class="exchange_check_box">
                            <a href="#" class="exchange_link_box">
                                <h3>반품 정책</h3>
                                <span class="ex_arrow_icon"></span>
                                <span class="ex_img_box">
                                    <span class="exchange_icon3"></span>
                                </span>
                            </a>
                        </div>
                        
                    </div>
                </div>
		</section>
		<%@ include file="../01_home/footer.jsp" %>
		
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="../assets/js/home.js"></script>
	</body>
</html>