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
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<title>la porte</title>
		 <link rel="shortcut icon" href="../assets/img/laporte_favi.png" />

		<link rel="preconnect" href="https://fonts.gstatic.com">

	<!-- stylesheet -->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" />
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
		<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
		<link rel="stylesheet" type="text/css" href="../assets/css/common.css">
	    <link rel="stylesheet" type="text/css" href="../assets/css/order.css">

	<!-- javascript -->
		<script src="http://code.jquery.com/jquery.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

	<!-- ajax-helper -->
		<link rel="stylesheet" href="../assets/plugins/ajax/ajax_helper.css" />
		<script src="../assets/plugins/ajax/ajax_helper.js"></script>
	</head>

	<body>
		<%@ include file="../01_home/header.jsp"%>
		<section>
			<!-- 검색 -->
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
			<!-- 검색 끝 -->
			
			<!-- 검색제외 본문영역 -->
		    <div class="order_list01">
			    <div>
			        <a class="order_back" href="#">< 뒤로</a>
			        <div class="order_info01">
			            <h3>주문 내역</h3>
			            <p>주문 번호(iSell 번호) : <span class="order_iSellno">1718571319</span></p>
			        </div>
			    </div>
			    <hr/>
			    <div class="order_info02">
			        <p>
			            <b>주문 날짜</b><br/>
			            <span class="order_date">2020-10-31 16:25</span><br/>
			            <b>주문 번호(iSell 번호)</b><br/>
			            <span class="order_iSellno">171857319</span><br/>
			            <b>최종 결제 금액</b><br/>
			            &#8361; <span class="order_totalprice">74,000</span>
			        </p>
			        <div>
			            <span id="order_icon"></span><a class="order_return" href="../02_mypage/order_return.html">주문취소</a>
			        </div>
			    </div>
			    <hr/>
			    <div class="order_info03">
			        <div class="order_line">
			            <p><b>택배 배송 내역</b></p>
			            <a href="#"><b><span class="order_delivery_info">+</span></b></a>
			        </div>
			        <div class="order_line">
			            <p><b>택배 배송 제품</b></p>
			            <a href="#"><b><span class="order_delivery_product">+</span></b></a>
			        </div>
			        <div class="order_hidden">
			            <form class="order_itemlist">
			                <img class="order_item_img">
			                <div class="order_item">
			                    <span class="order_item_title"></span><br/>
			                    <span class="order_item_info"></span><br/>
			                    <span class="order_item_productno"></span><br/>
			                    <span class="order_item_price"></span>
			                </div>
			            </form>
			        </div>
			        <div class="order_userinfo">
			            <p>
			                <b>주소</b><br/>
			                <span class="order_name">홍 길동</span><br/>
			                <span class="order_address">서울 서초구 서초동 1303-37 13층</span><br/>
			                <span class="order_email">ezen@ezen.com</span><br/>
			            </p>
			        </div>
			    </div>
			    <hr/>
			    <div>
			        <p><b>결제 방법</b><br/>
			        <span class="order_payment">신용카드</span>
			    </div>
			    <hr/>
			    <div>
			        <div>
			            <span>
			                <b>총 주문금액</b>
			            </span>
			            <span class="pull_right">
			                <b>&#8361; <span class="order_price"></span></b>
			            </span>
			        </div>
			        <br/>
			        <div>
			            <span>
			                배송비
			            </span>
			            <span class="pull_right">
			                &#8361; <span class="order_deliveryprice"></span>
			            </span>
			        </div>
			        <hr/>
			        <div>
			            <p>
			                <span>
			                    <b>최종 결제금액</b>
			                </span>
			                <span class="pull_right">
			                    <b>&#8361; <span class="order_totalprice"></span></b>
			                </span>
			            </p>
			        </div>							
			    </div>
			</div>
			<div class="hd_gray_layer" id="hd_menu_background"></div>
			<div class="order_over_layer" id="hd_menu_front">
			    <!-- 메뉴 로고 및 아이콘 -->
			    <div>
			        <table id="order_table01"></table>
			    </div>
			    <br/>
			    <div>
			        <table id="order_table02"></table>
			    </div>
			</div>
		</section>
		<%@ include file="../01_home/footer.jsp"%>
		
		<!-- Handlebar CDN 참조 -->
    	<script src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.4.2/handlebars.min.js"></script>
    	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
   		<!-- jQuery Ajax Form plugin CDN -->
   		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
    	<script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
		<script src="../assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
	    <script src="../assets/js/home.js"></script>
	    
	    
	</body>
	
</html>