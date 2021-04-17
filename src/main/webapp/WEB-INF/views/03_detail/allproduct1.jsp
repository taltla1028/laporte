<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
  
  	<link rel="stylesheet" type="text/css" href="../assets/css/common.css">
  	<link rel="stylesheet" type="text/css" href="../assets/css/home.css">
  	<link rel="stylesheet" type="text/css" href="../assets/css/product2.css">

<!-- javascript -->
    <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	

<!-- ajax-helper -->
    <link rel="stylesheet" href="../plugins/ajax/ajax_helper.css" />
    <script src="../assets/plugins/ajax/ajax_helper.js"></script>

</head>
<body>
<%@ include file="../01_home/header.jsp" %>
	<div class="hd_searchbox">
			<div class="hd_search">
				<input id="search_text" type="text" placeholder="검색어 입력"> <span
					id="hd_search_icon"></span>
			</div>
			<div class="sc_gray_layer" id="hd_search_background"></div>
			<div class="sc_over_layer" id="hd_search_front">
				<div id="modal_search_box_container">
					<form>
						<input id="modal_search_text" type="text" placeholder="검색어 입력">
						<span id="search_close_icon"></span> <input type="reset"
							id="search_remove_icon"> <input type="submit"
							id="search_enter_icon">
					</form>
					<div id="search_result">
						<h4>추천 검색어</h4>
						<a href="#"><span class="rec_reyword"></span>가구</a> <a href="#"><span
							class="rec_reyword"></span>침대</a> <a href="#"><span
							class="rec_reyword"></span>주방</a> <a href="#"><span
							class="rec_reyword"></span>소파</a> <a href="#"><span
							class="rec_reyword"></span>수납</a> <a href="#"><span
							class="rec_reyword"></span>조명</a>
					</div>
				</div>
			</div>
		</div>
	 <!-- 검색어 끝  -->
	  	<div class="furcontent">
	  	<div class="allproduct_top">
	  		<h3>가구</h3>
		<div class="allproduct_slide">
			<ul class="allproduct_slide_ul">
				<li class="allproduct_slide_ul_li"><a href="${pageContext.request.contextPath}/03_detail/allproduct2.do?catno1=101"><img src="https://shop.static.ingka.ikea.com/category-images/Category_sofas-and-armchairs.jpg?imwidth=300"/></a>소파/암체어</li>
				<li class="allproduct_slide_ul_li"><a href="${pageContext.request.contextPath}/03_detail/allproduct2.do?catno1=102"><img src="https://shop.static.ingka.ikea.com/revamp/beds_bm003.jpg?imwidth=300"/></a>침대</li>
				<li class="allproduct_slide_ul_li"><a href="${pageContext.request.contextPath}/03_detail/allproduct2.do?catno1=103"><img src="https://shop.static.ingka.ikea.com/category-images/Category_cabinets-and-cupboards.jpg?imwidth=300"/></a>수납/정리</li>
				<li class="allproduct_slide_ul_li"><a href="${pageContext.request.contextPath}/03_detail/allproduct2.do?catno1=104"><img src="https://shop.static.ingka.ikea.com/revamp/metod-kitchen_ka005.jpg?imwidth=400"/></a>주방가구/용품</li>
				<li class="allproduct_slide_ul_li"><a href="${pageContext.request.contextPath}/03_detail/allproduct2.do?catno1=105"><img src="https://shop.static.ingka.ikea.com/category-images/Category_childrens-lighting.jpg?imwidth=300"/></a>조명</li>
			</ul>
		</div>
		</div>
			<div class="furcontent_allfur">
				<div class="furcontent_product">
					<h3>어느 거실에나 어울리는 소파</h3>
					<div class="product_box1">
					<a href="#"><img class="product_box1_img" src="../assets/img/sofa1.png" width="377px" height="377px"/></a>
						<div class="furlinkbox">
							<h4>모든소파</h4>
							<a href="${pageContext.request.contextPath}/03_detail/allproduct2.do" class="move_link">이동</a>
						</div>
					</div>
					
				</div>
			<!-- //sofa -->
				<div class="furcontent_product">
					<h3>무엇이든 수납할 수 있어요</h3>
					<p class="furcontent_product_p">침실용 서랍장부터 거실용 책장과 벽에 거는 후크까지 모든 종류의 수납 제품을 만나보세요.</p>
					<div class="product_box2">
						<a href="#"><img class="product_box2_img"src="../assets/img/Storage.png" width="377px"/></a>	
						<span class="seeMore1"></span>
						<span class="seeMore2"></span>
						<span class="seeMore3"></span>
						<div class="moreTxt1">
							<a class="txtTitle">KNIXHULT크닉스홀트</a>
							<p class="txtTitle_p">펜던트등</p>
							<a class="txtTitle"><span class="won">₩</span>59,000</a>
						</div>
						<div class="moreTxt2">
							<a class="txtTitle">HEMNES 헴네스</a>
							<p class="txtTitle_p">유리장식장+서랍3</p>
							<a class="txtTitle"><span class="won">₩</span>599,000</a>
						</div>
						<div class="moreTxt3">
							<a class="txtTitle">BEGARLIG베옐리그</a>
							<p class="txtTitle_p">꽃병</p>
							<a class="txtTitle"><span class="won">₩</span>19,000</a>
						</div>						
					</div>
				</div>
				<!-- //수납공간 -->
				<div class="furcontent_product">
					<h3>숙면할 수 있는 침대</h3>
					<div class="product_box1">
					<a href="#"><img class="product_box1_img" src="../assets/img/bed01.png" width="377px"/></a>
						<div class="furlinkbox">
							<h4>모든침대</h4>
							<a href="${pageContext.request.contextPath}/03_detail/allproduct3.do" class="move_link">이동</a>
						</div>
					</div>
					
				</div>
			</div> <!-- //furcontent_allfur -->
		
			</div><!-- //furcontent -->
		<a href="#"class="moveup">맨 위로 이동</a>
	
	<%@ include file="../01_home/footer.jsp" %>
	<script src="../assets/js/home.js"></script>
	<script src="../assets/plugins/toTop/totop.min.js"></script>
	 <script type="text/javascript">
			
			$(function(){
				$(".seeMore1").click(function(){
					$(".moreTxt1").toggle();
				});
			});
			
			$(function(){
				$(".seeMore2").click(function(){
					$(".moreTxt2").toggle();
				});
			});
			$(function(){
				$(".seeMore3").click(function(){
					$(".moreTxt3").toggle();
				});
			});
	    		
			$('.moveup').tottTop({
				scrollTop:0
			});
	
	</script>
</body>
</html>