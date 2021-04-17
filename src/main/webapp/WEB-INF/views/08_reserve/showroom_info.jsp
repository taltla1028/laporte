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
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
	    <link rel="stylesheet" type="text/css" href="../assets/css/common.css">
	     <link rel="stylesheet" type="text/css" href="../assets/css/showroom_info.css">
		
		<!-- javascript -->
	     <script src="http://code.jquery.com/jquery.min.js"></script>
	     <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	     <script src="../plugins/ajax/ajax_helper.js"></script>
		
		<!-- ajax-helper -->
	     <link rel="stylesheet" href="../plugins/ajax/ajax_helper.css" />
	      
	</head>

	<body>
	<%@ include file="../01_home/header.jsp" %>
	<%@ include file="../01_home/search.jsp"%>
		<section>
			

 <!-- 여기가 현재 페이지를 의미합니다. - active클래스 적용됨 -->

			<!-- 검색제외 본문영역 -->
            <div class="container">
                <!-- 페이지 경로-->
                <li class="showroom_li active">
                    <a href="../01_home/home.html">홈</a></li>
        
                <!--페이지 경로 끝-->
                    <div class="showroom_header_box">
                        <div>
                            <h2 class="showroom_title">쇼룸 안내</h2>
                        </div>
                        <br />
                        <div class="show_explain_box">
                            <h4>플래닝 스튜디오</h4>
                            <br />
                            <p>
                                플래닝 스튜디오에서는 1:1 무료상담을 통해 편리하게 가구 플래닝 상담을 받고 원하는 날짜에 배송과 조립서비스까지 한번에 신청할 수 있습니다.
							</p>
							<p>
								플래닝 스튜디오는 강남점, 광명점, 대구점이 있습니다.
							</p>
                        </div>
                    </div>
                    
                    <div class="showroom_content_box">
                        <!-- 강남점 쇼룸 안내 -->
                        <div class="showroom_info_box">
                            <img src="https://image.guud.com/mall/DP/display/detail/065F8077242F47508881C9F0FD78B516.jpg">
                            
                            <h4>강남점</h4>
								<p>
                                    라포르테 강남 본점
                                </p>
                                <p>
                                    강남구 청담동 라포르테로 123
                                </p>
                                <br />
                                <h4>운영 시간</h4>
                            
                                    <li>월~토 09:00 ~ 18:00</li>
                                    <li>일요일에는 서비스가 제공되지 않습니다.</li>
                                    <br />
									 <c:choose>
                                    <c:when test="${my_session == null}">
                                    <a href="${pageContext.request.contextPath}/02_mypage/login.do" class="service_res login">la porte 플래닝 서비스 예약하기</a>
                                    </c:when>
                                    <c:otherwise>
                                    <a href="${pageContext.request.contextPath}/08_reserve/reserve.do?userno=<%out.print(session.getAttribute("my_session"));%>" class="service_res">la porte 플래닝 서비스 예약하기</a>
                                    </c:otherwise>
                                    </c:choose>
									<a href="https://map.kakao.com/link/search/이젠아카데미컴퓨터학원 강남" class="showroom_loc">강남점 위치 확인하기</a>
                            </div>
                            <!-- 강남점 쇼룸 안내 -->
                        <div class="showroom_info_box">
                            <img src="https://image.guud.com/mall/DP/display/detail/39526A091AC7493BA411F65807E9EC6B.jpg">
                                                    <h4>광명점</h4>
								<p>
                                    라포르테 광명점
                                </p>
                                <p>
                                    경기도 광명시 라포르테로 456
                                </p>
                                <br />
                                <h4>운영 시간</h4>
                            
                                    <li>월~토 09:00 ~ 18:00</li>
                                    <li>일요일에는 서비스가 제공되지 않습니다.</li>
                                    <br />
									 <c:choose>
                                    <c:when test="${my_session == null}">
                                    <a href="${pageContext.request.contextPath}/02_mypage/login.do" class="service_res login" >la porte 플래닝 서비스 예약하기</a>
                                    </c:when>
                                    <c:otherwise>
                                    <a href="${pageContext.request.contextPath}/08_reserve/reserve.do?userno=<%out.print(session.getAttribute("my_session"));%>" class="service_res">la porte 플래닝 서비스 예약하기</a>
                                    </c:otherwise>
                                    </c:choose>
									<a href="https://map.kakao.com/link/search/이젠아카데미컴퓨터학원 강남" class="showroom_loc">광명점 위치 확인하기</a>
                            </div>
                            <!-- 강남점 쇼룸 안내 -->
                        <div class="showroom_info_box">
                            <img src="https://image.guud.com/mall/DP/display/detail/9EAB51195621406C8803E750320C2AA3.jpg">
                            <h4>대구점</h4>
								<p>
                                    라포르테 대구점
                                </p>
                                <p>
                                     대구광역시 수성구 라포르테로 789
                                </p>
                                <br />
                                <h4>운영 시간</h4>
                            
                                    <li>월~토 09:00 ~ 18:00</li>
                                    <li>일요일에는 서비스가 제공되지 않습니다.</li>
                                    <br />
                                    <c:choose>
                                    <c:when test="${my_session == null}">
                                    <a href="${pageContext.request.contextPath}/02_mypage/login.do" class="service_res login" >la porte 플래닝 서비스 예약하기</a>
                                    </c:when>
                                    <c:otherwise>
                                    <a href="${pageContext.request.contextPath}/08_reserve/reserve.do?userno=<%out.print(session.getAttribute("my_session"));%>" class="service_res">la porte 플래닝 서비스 예약하기</a>
                                    </c:otherwise>
                                    </c:choose>
									<a href="https://map.kakao.com/link/search/이젠아카데미컴퓨터학원 강남" class="showroom_loc">대구점 위치 확인하기</a>
							</div>
						</div>
					
                        
                    </div>
                </div>

            </div>
		</section>
		<%@ include file="../01_home/footer.jsp" %>
		
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="../assets/js/home.js"></script>
        <script type="text/javascript">
        $(".login").click(function(){
         	alert("로그인을 해주세요.");
     	});
        
        </script>
      
     	
	</body>
</html>