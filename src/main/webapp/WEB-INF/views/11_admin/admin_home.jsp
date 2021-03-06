<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<link rel="stylesheet" href="../assets/css/admin_common.css">
<link rel="stylesheet" href="../assets/css/admin_home.css">

<!-- javascript -->
<script src="http://code.jquery.com/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<!-- ajax-helper -->
<link rel="stylesheet" href="../assets/plugins/ajax/ajax_helper.css" />
<script src="../assets/plugins/ajax/ajax_helper.js"></script>
</head>

<body>
	<section>
		<nav id="navbar-white"
			class="navbar navbar-default navbar-fixed-top clearfix"
			role="navigation">
			<div class="navbar-header pull-left">
				<button class="slidebar-toggle" id="menu-toggle">
					<span class="sr-only">Toggle sidebar</span> <span class="icon-bar"></span>
					<span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<span><a class="navbar-brand" href="${pageContext.request.contextPath}/11_admin/admin_home.do">HOME</a></span>
			</div>
			<div class="navbar-button pull-right">
				<a href="${pageContext.request.contextPath}/11_admin/admin_logout.do" class="nav_logout_btn">LOGOUT</a>
			</div>
		</nav>



		<div id="wrapper">
			<!-- Sidebar -->
			<div id="slidebar-white" class="slidebar-nav">
				<nav id="navbar-white" class="navbar navbar-default"
					role="navigation">
					<ul class="nav navbar-nav">
						<li class="brand_logo_box"><a href="#" class="brand_logo">
								<span></span> <span id="logo_img">la porte</span>
						</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><i class="glyphicon glyphicon-edit"></i>
								??? ???????????? ???????????? <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath}/11_admin/admin_resvappv.do"><i
										class="glyphicon glyphicon-ok"></i> ?????? ??????</a></li>
							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><i class="glyphicon glyphicon-tags"></i>
								?????? ?????? <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath}/11_admin/stock_management.do"><i
										class="glyphicon glyphicon-briefcase"></i> ?????? ??????</a></li>
								<li><a href="${pageContext.request.contextPath}/11_admin/product_add.do"><i
										class="glyphicon glyphicon-plus"></i> ?????? ??????</a></li>
								<li><a href="${pageContext.request.contextPath}/11_admin/admin_review.do"><i
										class="glyphicon glyphicon-star-empty"></i> ?????? ??????</a></li>
								<li><a href="#"><i class="glyphicon glyphicon-usd"></i>
										?????? ??????</a></li>
							</ul></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<i class="glyphicon glyphicon-user"></i>
								?????? ?????? <b class="caret"></b>
							</a>
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath}/11_admin/admin_userlist.do">
									<i class="glyphicon glyphicon-user"></i> ???????????? ??????</a></li>
								<li><a href="${pageContext.request.contextPath}/11_admin/admin_order.do">
									<i class="glyphicon glyphicon-shopping-cart"></i> ???????????? ??????</a></li>
								<li><a href="${pageContext.request.contextPath}/11_admin/admin_delivery.do">
									<i class="glyphicon glyphicon-transfer"></i> ???????????? ??????</a></li>
								<li><a href="${pageContext.request.contextPath}/11_admin/admin_cancel.do">
									<i class="glyphicon glyphicon-retweet"></i> ??????/??????/??????/??????</a></li>
								<li><a href="${pageContext.request.contextPath}/11_admin/admin_coupon.do">
									<i class="glyphicon glyphicon-credit-card"></i> ?????? </a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<i class="glyphicon glyphicon-pencil"></i>
									?????? ?????? <b class="caret"></b>
							</a>
							<ul class="dropdown-menu">
								<li>
									<a href="${pageContext.request.contextPath}/11_admin/admin_qanda.do"><i class="glyphicon glyphicon-envelope"></i> ????????? ?????? ??????</a>
								</li>
							</ul>
						</li>
					</ul>
				</nav>
				<!--/.navbar -->
			</div>
			<!--/.sidebar-nav -->

			<div id="page-wrapper6">
				<!-- Content Header (Page header) -->
				<div class="content-header">
					<div class="container-fluid">
						<div class="row mb-2">
							<div class="col-sm-6">
								<h2 class="m-0">????????? ?????? ??????</h2>
							</div>
						</div>
						<!-- /.row -->
					</div>
					<!-- /.container-fluid -->
				</div>
				<!-- Page Content -->
				<div class="content_wrapper">
					<div class="container-fluid">
						<!--?????? ?????? ??????-->
						<div class="row">
							<!-- ?????? ???????????? -->
							<div class="col-md-6">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">
											<a href="${pageContext.request.contextPath}/11_admin/admin_visitors.do">?????? ??????</a>
										</h4>
									</div>
									<!-- /.card-header ??? -->
									<!-- card-body  -->
									<div class="card-body">
										<canvas id="myChart2"></canvas>
									</div>
									<!-- /.card-body ??? -->
								</div>
								<!-- /.card ??? -->
							</div>
							<!-- ?????? ???????????? ???-->
							<!-- ?????? ?????? -->
							<div class="col-md-6">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title"><a href="${pageContext.request.contextPath}/11_admin/admin_order.do">?????? ??????</a></h4>
									</div>
									<!-- /.card-header ??? -->
									<!-- card-body  -->
									<div class="card-body">
										<canvas id="sales-chart"></canvas>
									</div>
									<!-- /.card-body ??? -->
								</div>
								<!-- /.card ??? -->
							</div>
							<!-- ?????? ?????? ???-->
							<!-- ????????? ?????? ??????  -->
							<div class="col-md-12">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">
											<a href="${pageContext.request.contextPath}/11_admin/admin_order.do">????????? ?????? ??????</a>
										</h4>
									</div>
									<!-- /.card-header ??? -->
									<!-- card-body  -->
									<div class="card-body">
										<div class="homeDashBoxList">
											<div class="homeDashBox">
												<div class="row">
													<div class="col-lg-4 col-md-6">
														<a id="today_order" href="${pageContext.request.contextPath}/11_admin/admin_order.do" class="dashbox"> <b
															class="dash_title">??????<span class="dash_num">(1???)</span></b>
															<b class="order_total_amount">249,000<span class="unit">???</span></b>
														</a>
													</div>
													<div class="col-lg-4 col-md-6">
														<a id="today_payment" href="#" class="dashbox"> <span
															id="payment_img"></span> <b class="dash_title">??????<span
																class="dash_num">(1???)</span></b>
																<b class="pay_total_amount">129,800<span class="unit">???</span></b>
														</a>
													</div>
													<div class="col-lg-4 col-md-6"  >
														<a id="today_refund" href="#" class="dashbox"> <span
															id="refund_img"></span> <b class="dash_title">??????<span
																class="dash_num">(1???)</span></b> <span
															class="refund_total_amount">0<span class="unit">???</span></span>
														</a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- /.card-body ??? -->
								</div>
								<!-- /.card ??? -->
							</div>
							<!-- ????????? ?????? ?????? ???-->
							<!-- ?????? ??????  -->
							<div class="col-md-12">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">
											<a href="${pageContext.request.contextPath}/11_admin/admin_order.do">?????? ?????? <span class="card_subtitle">(?????? ??????)</span></a>
										</h4>
									</div>
									<!-- /.card-header ??? -->
									<!-- card-body  -->
									<div class="card-body">
										<div class="homeDashBoxList">
											<div class="homeDashBox">
												<div class="row">
													<div class="col-md-3 col-sm-6 blue">
														<a id="no_pay_cnt" href="#" class="order_dashbox"> 
															<b class="order_count">${Deli }</b>
															<span class="order_title">?????????</span>
														</a>
													</div>
													<div class="col-md-3 col-sm-6">
														<a id="is_shipped_f" href="#" class="order_dashbox"> 
															<b class="order_count">${R }</b>
															<span class="order_title">???????????????</span>
														</a>
													</div><div class="col-md-3 col-sm-6">
														<a id="is_shipped_w" href="#" class="order_dashbox"> 
															<b class="order_count">${S }</b>
															<span class="order_title">????????????</span>
														</a>
													</div><div class="col-md-3 col-sm-6">
														<a id="is_shipped_m" href="#" class="order_dashbox"> 
															<b class="order_count">${D }</b>
															<span class="order_title">?????????</span>
														</a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- /.card-body ??? -->
								</div>
								<!-- /.card ??? -->
							</div>
							<!-- ?????? ?????? ???-->
							<!-- ?????? / ?????? / ?????? / ????????????  -->
							<div class="col-md-12">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">
											<a href="${pageContext.request.contextPath}/11_admin/admin_cancel.do">?????? / ?????? / ?????? / ???????????? <span class="card_subtitle">(?????? ??????)</span></a>
										</h4>
									</div>
									<!-- /.card-header ??? -->
									<!-- card-body  -->
									<div class="card-body">
										<div class="homeDashBoxList">
											<div class="homeDashBox">
												<div class="row">
													<div class="col-md-3 col-sm-6">
														<a id="cancel_count" href="#" class="cancel_dashbox"> 
															<b class="order_count">${CC }</b>
															<span class="cancel_title">??????</span>
														</a>
													</div>
													<div class="col-md-3 col-sm-6">
														<a id="change_count" href="#" class="cancel_dashbox"> 
															<b class="order_count">${CH }</b>
															<span class="cancel_title">??????</span>
														</a>
													</div><div class="col-md-3 col-sm-6">
														<a id="return_count" href="#" class="cancel_dashbox"> 
															<b class="order_count">${RT }</b>
															<span class="cancel_title">??????</span>
														</a>
													</div><div class="col-md-3 col-sm-6">
														<a id="before_refund" href="#" class="cancel_dashbox"> 
															<b class="order_count">${RF }</b>
															<span class="cancel_title">??????</span>
														</a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- /.card-body ??? -->
								</div>
								<!-- /.card ??? -->
							</div>
							<!-- ?????? / ?????? / ?????? / ???????????? ???-->
							
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /wrapper  ???-->
	</section>
	<footer></footer>

	<!-- jQuery -->
	<script src="../assets/plugins/jquery/jquery.min.js"></script>

	<!-- OPTIONAL SCRIPTS -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

	<script type="text/javascript">
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
		});
		var ctx = document.getElementById('myChart2').getContext('2d');
		var chart = new Chart(ctx, {
			// The type of chart we want to create
			type : 'bar',

			// The data for our dataset
			data : {
				
				labels : [ '???', '???', '???', '???', '???', '???', '???', '???' ],
				datasets : [ {
					label : 'By day of the week',
					backgroundColor : 'rgb(49, 142, 224,0.2)',
					borderColor : 'rgb(49, 142, 224)',
					data : [ 80, 300, 250, 100, 450, 100, 270, 350 ]
				} ]
			},

			// Configuration options go here
			options : {}
		});
		var ctx = document.getElementById('sales-chart').getContext('2d');
		var chart = new Chart(ctx, {
			// The type of chart we want to create
			type : 'bar',

			// The data for our dataset
			data : {
				labels : ['1???', '2???', '3???', '4???', '5???', '6???'],
				datasets : [ {
					label : 'This year',
					backgroundColor : 'rgb(0, 128, 0,0.2)',
					borderColor : 'rgb(0, 128, 0)',
					data : [500, 1000, 1500, 2000, 2500, 3000]
				}, {
					label : 'Last year',
					data : [1500, 2500, 3000, 1900, 2950, 2800]
				}]
			},

			// Configuration options go here
			options : {
				scales: { yAxes: [{ ticks: { beginAtZero: true } }] }
			}
		});
	</script>
</body>
</html>