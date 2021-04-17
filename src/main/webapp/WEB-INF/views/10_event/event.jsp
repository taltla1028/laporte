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
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>la porte</title>
 <link rel="shortcut icon" href="../assets/img/laporte_favi.png" />

<link rel="preconnect" href="https://fonts.gstatic.com">

<!-- stylesheet -->
<link
	href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="../assets/css/common.css">
<link rel="stylesheet" type="text/css" href="../assets/css/event.css">

<!-- javascript -->
<script src="http://code.jquery.com/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<!-- ajax-helper -->
<link rel="stylesheet" href="../assets/plugins/ajax/ajax_helper.css" />
<script src="../assets/plugins/ajax/ajax_helper.js"></script>
</head>

<body>
	<%@ include file="../01_home/header.jsp"%>
	<section>
	<%@ include file="../01_home/search.jsp"%>

		<!-- 검색제외 본문영역 -->
		<div class="container">
			<div class="page-header">
				<ol class="breadcrumb">
					<li><a href="${pageContext.request.contextPath}">홈</a></li>
					<!-- 여기가 현재 페이지를 의미합니다. - active클래스 적용됨 -->
					<li class="active">이달의 혜택</li>
				</ol>
			</div>
			<!-------배너 영역------>
			<!-- Swiper -->
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<img src="../assets/img/banner1.png" class="banner_img">
					</div>
					<div class="swiper-slide">
						<img src="../assets/img/banner2.png" class="banner_img">
					</div>
					<div class="swiper-slide">
						<img src="../assets/img/banner3.png" class="banner_img">
					</div>
				</div>
				<!-- Add Pagination -->
				<div class="slider__controller">
					<div class="slider__controller__dot">
						<div
							class="fb__progressBar swiper-pagination swiper-pagination-progressbar">
							<span class="swiper-pagination-progressbar-fill"> </span>
						</div>
					</div>
				</div>
				<!--pagenation 끝-->
			</div>
			<!-- swiper 배너 영역 끝-->

			<div class="event_lists">
				<div class="event_board_box">
					<ul class="event_board">
						<!--이벤트 목록 1-->
						<li class="event_board_list"><a href="${pageContext.request.contextPath}/10_event/coupon?couponno=40004" class="event_box">
								<div class="event_wrapper clearfix">
									<div class="event_text_box pull-left">
										<strong class="eveny_title block">코로나 저리가 쿠폰</strong> <span
											class="event_content block">5% 추가할인</span> <span
											class="event_date block">2021.03.01 - 2021.03.31</span>
									</div>
									<div class="event_img_box pull-right">
										<img
											src="https://image.guud.com/mall/DP/display/detail/13C2B351750543F8A7E7F65ED321D12D.jpg"
											class="event_img">
									</div>
								</div>
						</a></li>
						<!-- 이벤트 목록 1 끝-->
						<!--이벤트 목록 2-->
						<li class="event_board_list"><a href="${pageContext.request.contextPath}/10_event/coupon?couponno=40005" class="event_box">
								<div class="event_wrapper clearfix">
									<div class="event_text_box pull-left">
										<strong class="eveny_title block">지구 살리기 프로젝트 쿠폰</strong> <span
											class="event_content block">친환경 제품 구매시, 5000원 추가 할인 쿠폰</span> <span
											class="event_date block">2021.03.01 - 2021.03.31</span>
									</div>
									<div class="event_img_box pull-right">
										<img
											src="https://image.guud.com/mall/DP/display/detail/856FBCB56F534C349E76D16EB0AF945D.jpg"
											class="event_img">
									</div>
								</div>
						</a></li>
						<!-- 이벤트 목록 2 끝-->
						<!--이벤트 목록 3-->
						<li class="event_board_list"><a href="${pageContext.request.contextPath}/10_event/coupon?couponno=40006" class="event_box">
								<div class="event_wrapper clearfix">
									<div class="event_text_box pull-left">
										<strong class="eveny_title block">새학기 맞이 쿠폰</strong> <span
											class="event_content block">3% 할인 쿠폰</span> <span
											class="event_date block">2021.03.01 - 2021.03.31</span>
									</div>
									<div class="event_img_box pull-right">
										<img
											src="https://image.guud.com/mall/DP/display/detail/B6B6F53B6E2F4C3F9AFA0BCCD35BB64E.jpg"
											class="event_img">
									</div>
								</div>
						</a></li>
						<!-- 이벤트 목록 3 끝-->
						<!--이벤트 목록 4-->
						<li class="event_board_list"><a href="#" class="event_box">
								<div class="event_wrapper clearfix">
									<div class="event_text_box pull-left">
										<strong class="eveny_title block">라포르테 2021 첫 정기세일 </strong> <span
											class="event_content block">특별 상품 SALE , 함께사면 반값 특가</span> <span
											class="event_date block">2021.03.15 - 2021.04.14</span>
									</div>
									<div class="event_img_box pull-right">
										<img src="../assets/img/sale.png" class="event_img">
									</div>
								</div>
						</a></li>
						<!-- 이벤트 목록 4 끝-->
						<!--이벤트 목록 5-->
						<li class="event_board_list"><a href="#" class="event_box">
								<div class="event_wrapper clearfix">
									<div class="event_text_box pull-left">
										<strong class="eveny_title block">3월 구매후기 이벤트</strong> <span
											class="event_content block">구매후기 남기고 이벤트 신청하세요!</span> <span
											class="event_date block">2021.03.01 - 2021.03.31</span>
									</div>
									<div class="event_img_box pull-right">
										<img
											src="https://image.guud.com/mall/DP/display/detail/6CE1A44CB2BF47D3A014749BBC95A858.jpg"
											class="event_img">
									</div>
								</div>
						</a></li>
						<!-- 이벤트 목록 5 끝-->
						<!--이벤트 목록 6-->
						<li class="event_board_list"><a href="#" class="event_box">
								<div class="event_wrapper clearfix">
									<div class="event_text_box pull-left">
										<strong class="eveny_title block">3월 카드사 무이자 할부 혜택</strong> <span
											class="event_content block">무이자 할부 혜택으로 부담없는 쇼핑!</span> <span
											class="event_date block">2021.03.01 - 2021.03.31</span>
									</div>
									<div class="event_img_box pull-right">
										<img
											src="https://image.guud.com/mall/DP/display/detail/B9D9C701E9E1476FA8B0640352D023E2.jpg"
											class="event_img">
									</div>
								</div>
						</a></li>
						<!-- 이벤트 목록 6-->
					
					</ul>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="../01_home/footer.jsp"%>

	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="../assets/js/home.js"></script>
	<script type="text/javascript">
		/*-------배너 플러그인-------*/
		var swiper = new Swiper('.swiper-container', {
			spaceBetween : 30,
			centeredSlides : true,
			autoplay : {
				delay : 2500,
				disableOnInteraction : false,
			},
			pagination : {
				el : '.swiper-pagination',
				type : 'progressbar',
			},
		});
		/*-------배너 플러그인 끝-------*/
	</script>
</body>
</html>