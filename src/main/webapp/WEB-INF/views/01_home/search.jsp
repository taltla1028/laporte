<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

		<!-- 검색 -->
		<div class="hd_searchbox">
			<div class="hd_search">
				<input id="search_text" type="text" placeholder="검색어 입력"> <span
					id="hd_search_icon"></span>
			</div>
			<div class="sc_gray_layer" id="hd_search_background"></div>
			<div class="sc_over_layer" id="hd_search_front">
				<div id="modal_search_box_container">
					<form method="get" action="${pageContext.request.contextPath}/03_detail/allproduct2.do">
						<input id="modal_search_text" type="text" placeholder="검색어 입력" name="keyword" value="${keyword }">
						<span id="search_close_icon"></span> <input type="reset"
							id="search_remove_icon" /> <input type="submit"
							id="search_enter_icon">
					</form>
					<div id="search_result">
						<h4>추천 검색어</h4>
						<a href="${pageContext.request.contextPath}/03_detail/allproduct1.do"><span class="rec_reyword"></span>가구</a>
						<a href="${pageContext.request.contextPath}/03_detail/allproduct2.do?catno1=102"><span class="rec_reyword"></span>침대</a> 
						<a href="${pageContext.request.contextPath}/03_detail/allproduct2.do?catno1=104"><span class="rec_reyword"></span>주방</a> 
						<a href="${pageContext.request.contextPath}/03_detail/allproduct2.do?catno1=101"><span class="rec_reyword"></span>소파</a> 
						<a href="${pageContext.request.contextPath}/03_detail/allproduct2.do?catno1=103"><span class="rec_reyword"></span>수납</a> 
						<a href="${pageContext.request.contextPath}/03_detail/allproduct2.do?catno1=105"><span class="rec_reyword"></span>조명</a>
					</div>
				</div>
			</div>
		</div>