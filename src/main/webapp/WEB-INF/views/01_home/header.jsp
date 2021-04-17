<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<header class="nav-down">
	<div class="hd_container">
		<div class="hd_iconbox">
			<div class="hd_icon">
				<a href="${pageContext.request.contextPath}" id="hd_logo"><span
					id="hd_logo_icon"></span></a>
				<ul class="hd_list">
					<c:choose>
					<c:when test="${my_session == null}">
					<li><a
						href="${pageContext.request.contextPath}/02_mypage/login.do?userno=allproduct.css
edit.css
reserve_list.css
reserve.css"><span
							id="hd_mypage_icon"></span></a></li>
					<li><a
						href="${pageContext.request.contextPath}/05_wishlist/wishlist.do"><span
							id="hd_wishlist_icon"></span></a></li>
					<li><a
						href="${pageContext.request.contextPath}/06_cart/cart.do"><span
							id="hd_cart_icon"></span></a></li>
					<li><a href="#"><span id="hd_menu_icon"></span></a></li>
					</c:when>
					<c:otherwise>
						<li><a
						href="${pageContext.request.contextPath}/02_mypage/mypage.do?userno=<%out.print(session.getAttribute("my_session"));%>"><span
							id="hd_mypage_icon"></span></a></li>
					<li><a
						href="${pageContext.request.contextPath}/05_wishlist/wishlist.do?userno=<%out.print(session.getAttribute("my_session"));%>"><span
							id="hd_wishlist_icon"></span></a></li>
					<li><a
						href="${pageContext.request.contextPath}/06_cart/cart.do?userno=<%out.print(session.getAttribute("my_session"));%>"><span
							id="hd_cart_icon"></span></a></li>
					<li><a href="#"><span id="hd_menu_icon"></span></a></li>
					</c:otherwise>
					</c:choose>
				</ul>

			</div>
		</div>
	</div>

	<!-- 메뉴 모달창 -->
        <!-- 화면에 표시될 원본 보기 영역 - 기본적으로 숨겨진 상태. -->
        <div class="hd_gray_layer" id="hd_menu_background"></div>
        <div class="hd_over_layer" id="hd_menu_front">
            <!-- 메뉴 로고 및 아이콘 -->
            <div id="hd_menu_header">
                <div id="hd_menu_logo">
                    <a href="../home.jsp"><span id="hd_menu_logoicon"></span></a>
                </div>
                <div id="hd_menu_close">
                    <a href="#"><span><b>&times;</b></span></a>
                </div>
            </div>
            <!-- 메뉴목록 -->
            <div>
                <ul id="hd_menu_ul1" class="hd_menu_ul">
                    <li id="hd_menu_product"><a href="${pageContext.request.contextPath}/03_detail/allproduct1.do"><h2>가구</h2></a></li>
                    <li><a href="${pageContext.request.contextPath}/03_detail/allproduct2.do?catno1=101">소파 / 암체어</a></li>
                    <li><a href="${pageContext.request.contextPath}/03_detail/allproduct2.do?catno1=102">침대</a></li>
                    <li><a href="${pageContext.request.contextPath}/03_detail/allproduct2.do?catno1=103">수납 / 정리</a></li>
                    <li><a href="${pageContext.request.contextPath}/03_detail/allproduct2.do?catno1=104">주방가구 / 용품</a></li>
                    <li><a href="${pageContext.request.contextPath}/03_detail/allproduct2.do?catno1=105">조명</a></li>
                </ul>
                <ul id="hd_menu_ul2" class="hd_menu_ul">
                    <li><a href="${pageContext.request.contextPath}/10_event/event.do">이달의 혜택</a></li>
                </ul>
                <ul id="hd_menu_ul3" class="hd_menu_ul">
                    <li><a href="${pageContext.request.contextPath}/08_reserve/showroom_info.do">컨설팅 쇼룸 정보</a></li>
                    <li><a href="${pageContext.request.contextPath}/09_cs/cs.do">고객지원</a></li>
                    <li><a href="${pageContext.request.contextPath}/02_mypage/order.do">배송조회</a></li>
                </ul>
            </div>
        </div>
    </header>