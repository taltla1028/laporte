<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>la porte</title>
 <link rel="shortcut icon" href="../assets/img/laporte_favi.png" />

<!-- font stylesheet -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
	rel="stylesheet">

<!-- stylesheet -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<link rel="stylesheet" href="../assets/css/admin_common.css">
<link rel="stylesheet" href="../assets/css/admin_coupon.css">


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
								??? ???????????? ???????????? <b class="caret"></b></a></li>
						<ul class="dropdown-menu">
							<li><a
								href="${pageContext.request.contextPath}/11_admin/admin_resvappv.do"><i
									class="glyphicon glyphicon-ok"></i> ?????? ??????</a></li>
						</ul>
						</li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><i class="glyphicon glyphicon-tags"></i>
								?????? ?????? <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath}/11_admin/stock_management.do"><i
										class="glyphicon glyphicon-briefcase"></i> ?????? ??????</a></li>
								<li><a href="product_add.html"><i
										class="glyphicon glyphicon-plus"></i> ?????? ??????</a></li>
								<li><a href="${pageContext.request.contextPath}/11_admin/review_management.do"><i
										class="glyphicon glyphicon-star-empty"></i> ?????? ??????</a></li>
								
							</ul></li>
						<li class="dropdown open"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="glyphicon glyphicon-user"></i>
								?????? ?????? <b class="caret"></b>
						</a>
							<ul class="dropdown-menu">
								<li><a
									href="${pageContext.request.contextPath}/11_admin/admin_userlist.do">
										<i class="glyphicon glyphicon-user"></i> ???????????? ??????
								</a></li>
								<li><a href="${pageContext.request.contextPath}/11_admin/admin_order.do"> <i
										class="glyphicon glyphicon-shopping-cart"></i> ???????????? ??????
								</a></li>
								<li><a href="${pageContext.request.contextPath}/11_admin/admin_delivery.do"> <i
										class="glyphicon glyphicon-transfer"></i> ???????????? ??????
								</a></li>
								<li><a href="${pageContext.request.contextPath}/11_admin/admin_cancel.do"> <i
										class="glyphicon glyphicon-retweet"></i> ??????/??????/??????/??????
								</a></li>
								<li class="active"><a
									href="${pageContext.request.contextPath}/11_admin/admin_coupon.do">
										<i class="glyphicon glyphicon-credit-card"></i> ??????
								</a></li>
								
						
							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="glyphicon glyphicon-pencil"></i>
								?????? ?????? <b class="caret"></b>
						</a>
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath}/11_admin/admin_qanda.do"> <i
										class="glyphicon glyphicon-envelope"></i> ????????? ?????? ??????
								</a></li>
								
							</ul></li>
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
								<h3 class="m-0">????????????</h3>
							</div>
							<!-- /.col -->

							<div class="col-sm-6 clearfix">
								<ol class="breadcrumb pull-right">
									<li class="breadcrumb-item"><a href="#">????????????</a></li>
									<li class="breadcrumb-item active">????????????</li>
								</ol>
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->
					</div>
					<!-- /.container-fluid -->
				</div>
				<!-- /.content-header -->
				<div class="content_wrapper">
					<!-- Main content -->
					<div class="content">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-12">
									<div class="card">
										<div class="card-header border-0">
											<h4 class="card-title">????????????</h4>
											<br>

											<table class="coupon_list">
												<thead class="coupon_li_head">
													<tr>
														<th>?????????</th>
														<th>??????</th>
														<th>??????</th>
														<th>??????????????????</th>
														<th>????????????</th>
														<th>??????</th>
													</tr>
												</thead>
												<tbody>

													<c:if test="${output == null || fn:length(output) == 0 }">
														<tr class="coupon_li">
															<td>????????? ????????????. ????????? ????????? ???????????????.</td>
														</tr>
													</c:if>

													<c:forEach var="item" items="${output}" varStatus="stauts">
												

															<tr>
																<td>${item.name}</td>
																<td>${item.startdate}~${item.enddate}</td>
																<td>${item.discount}
																<c:choose>
																		<c:when test="${item.distype == 'P'}">
																			<span>%</span>
																		</c:when>
																		<c:otherwise>
																			<span>???</span>
																		</c:otherwise>
																	</c:choose>
																</td>
																<td>${item.dupliuse}</td>
																<td>${item.link}</td>
																<td class="coupon_li_btns">
																	<a href="#" data-couponno = "${item.couponno}" class="revise">??????</a>
																	<a href="#" id="deleteCoupon" data-couponno= "${item.couponno}" data-name= "${item.name}" class="delete btn-danger">??????</a></td>
															</tr>
													
													</c:forEach>
							
												</tbody>
											</table>
										</div>

										<div class="coupon_li_revise">
		<div class="coupon_rev_border">

			<form id='revcoupon-form'
				action='${pageContext.request.contextPath}/11_admin/admin_coupon'>
				<table class="coupon_reg_card">
				<tr class="coupon_reg_li">
						<td class="coupon_reg">????????????</td>
						<td class="coupon_reg_input">
							<div class="form-inline">
								<div class="form-group">
									<input id="couponno" type="text" name="couponno" value="${edit_coupon.couponno}" class="form-control" readonly />
								</div>
							</div>
						</td>
					</tr>
					
					<tr class="coupon_reg_li">
						<td class="coupon_reg">?????????</td>
						<td class="coupon_reg_input">
							<div class="form-inline">
								<div class="form-group">
									<input id="coupon_name" type="text" name="name" value= "${edit_coupon.name}"
										class="form-control" />
								</div>
							</div>
						</td>
					</tr>

					<tr class="coupon_reg_li">
						<td class="coupon_reg">??????</td>
						<td class="coupon_reg_input">

							<div class="form-inline">
								<div class="form-group">
									<input type="date" class="coupon_date form-control"
										id="coupon_date1" name="startdate" value= "${edit_coupon.startdate}" /> ~ <input type="date"
										class="coupon_date form-control" id="coupon_date2"
										name="enddate" value= "${edit_coupon.enddate}" />
								</div>
							</div>
						</td>
					</tr>

					<tr class="coupon_reg_li">
						<td class="coupon_reg">????????????/?????????</td>
						<td class="coupon_reg_input">
							<div class="form-inline">
								<div class="form-group">
									<input type="text" id="coupon_discount" class="form-control"
										name="discount" value="${edit_coupon.discount}"/> 
										<input type="radio"
										class="discount_type" name="distype" value="P" <c:if test= "${edit_coupon.distype == 'P'}">checked</c:if>/><span>%?????????</span>
									<input type="radio" class="discount_type" name="distype" value="W"
										<c:if test= "${edit_coupon.distype == 'W'}">checked</c:if>/><span>???</span>
								</div>
							</div>
						</td>
					</tr>

					<tr class="coupon_reg_li">
						<td class="coupon_reg">??????????????????</td>
						<td class="coupon_reg_input">
						<input type="radio"
							name="dupliuse" class="dupli_use" value="Y" <c:if test= "${edit_coupon.dupliuse == 'Y'}">checked</c:if>/><span>??????????????????</span>
						<input type="radio" name="dupliuse" class="dupli_use" value="N" <c:if test= "${edit_coupon.dupliuse}">checked</c:if>/><span>??????????????????</span></td>
					</tr>


					<tr class="coupon_reg_li">
						<div class="form-group">
							<td class="coupon_reg">????????????</td>
							<td class="coupon_reg_input">
								<div class="form-inline">
									<div class="form-group">
										<input type="text" id="coupon_link" name="link"
											class="form-control" value= "${edit_coupon.link}">
									</div>
								</div>
							</td>
						</div>
					</tr>
				</table>
				
				<div class= "button-block">
				<button type="reset" id="coupon_rev_cancel">????????????</button>
				<button type="submit" id="coupon_revise">????????????</button>
				</div>
			</form>
		</div>
	</div>
									</div>
							</div>


							<div class="col-md-12">
									<div class="card">
										<div class="card-header border-0">
											<h4 class="card-title">????????? ????????????</h4>
											<br>

											<table class="coupon_list">
												<thead class="coupon_li_head">
													<tr>
														<th>?????????</th>
														<th>??????</th>
														<th>??????</th>
														<th>??????????????????</th>
														<th>????????????</th>
													</tr>
												<tbody>


													
													<c:choose>
														<c:when test="${end_coupon == null || fn:length(end_coupon) == 0}">
														<tr class="coupon_li">
															<td colspan="5">????????? ????????????. ????????? ????????? ???????????????.</td>
														</tr>
															</c:when>
													
													
													
														<c:otherwise>
													<c:forEach var="end_coupon" items="${end_coupon}" varStatus="stauts">
															<tr>
																<td>${end_coupon.name}</td>
																<td>${end_coupon.startdate}~${end_coupon.enddate}</td>
																<td>${end_coupon.discount}<c:choose>
																		<c:when test="${end_coupon.distype == 'P'}">
																			<span>%</span>
																		</c:when>
																		<c:otherwise>
																			<span>???</span>
																		</c:otherwise>
																	</c:choose>
																</td>
																<td>${end_coupon.dupliuse}</td>
																<td>${end_coupon.link}</td>
															</tr>
													</c:forEach>
														</c:otherwise>
														</c:choose>


												</tbody>
											</table>
											
											
											
										</div>
										</div>
										</div>
							<!-- /.card -->

							<div class="col-md-12">
								<div class="card">
									<div class="card-header border-0">
										<h3 class="card-title">????????????</h3>
										<br>
										<form id='newcoupon-form'
											action='${pageContext.request.contextPath}/11_admin/admin_coupon'>
											<table class="coupon_reg_card">

												<tr class="coupon_reg_li">
													<td class="coupon_reg">?????????</td>
													<td class="coupon_reg_input">
														<div class="form-inline">
															<div class="form-group">
																<input id="coupon_name" type="text" name="name"
																	class="form-control" />
															</div>
														</div>
													</td>
												</tr>

											<tr class="coupon_reg_li">
													<td class="coupon_reg">??????</td>
													<td class="coupon_reg_input">

														<div class="form-inline">
															<div class="form-group">
																<input type="date" class="coupon_date form-control"
																	id="coupon_date1" name="startdate" /> ~ <input
																	type="date" class="coupon_date form-control"
																	id="coupon_date2" name="enddate" />
															</div>
														</div>
													</td>
												</tr>

												<tr class="coupon_reg_li">
													<td class="coupon_reg">????????????/?????????</td>
													<td class="coupon_reg_input">
														<div class="form-inline">
															<div class="form-group">
																<input type="text" id="coupon_discount"
																	class="form-control" name="discount"> 
																	<input
																	type="radio" class="discount_type" name="distype"
																	value="P" /><span>%?????????</span> 
																	<input type="radio"
																	class="discount_type" name="distype" value="W" /><span>???</span>
															</div>
														</div>
													</td>
												</tr>

												<tr class="coupon_reg_li">
													<td class="coupon_reg">??????????????????</td>
													<td class="coupon_reg_input"><input type="radio"
														name="dupliuse" class="dupli_use" value="Y"><span>??????????????????</span>
														<input type="radio" name="dupliuse" class="dupli_use"
														value="N"><span>??????????????????</span></td>
												</tr>


												<tr class="coupon_reg_li">
													<div class="form-group">
														<td class="coupon_reg">????????????</td>
														<td class="coupon_reg_input">
															<div class="form-inline">
																<div class="form-group">
																	<input type="text" id="coupon_link" name="link"
																		class="form-control">
																</div>
															</div>
														</td>
													</div>
												</tr>
											</table>
											<div class="button-block">
											<button type="submit" id="coupon_submit"
												class="btn-success btn-lg">????????????</button>
											</div>

										</form>
									</div>
								</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /.col-md-6 -->
				</div>
				<!-- /.row -->
			</div>
			</div>
	</section>
	<!-- /wrapper  ???-->
	<!-- Content Wrapper. Contains page content -->

	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!--Google CDN ??????????????? jQuery ?????? -->
	<!-- jQuery Ajax Form plugin CDN -->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
	<!-- jQuery Ajax Setup -->
	<script
		src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>

	<!-- REQUIRED SCRIPTS -->
	<script type="text/javascript">

		$(function() {
			
			$(document).ready(function(e){
				e.preventDefault;
	    	  	var couponno_check = $('#couponno').val();
	    	  	
	    	   if(couponno_check == ""){
	        	$('.coupon_li_revise').hide();
	    	   }else{
	        	$('.coupon_li_revise').show();}
				
			});
			
			$('#newcoupon-form').ajaxForm({
				//?????? ????????? ??????
				method : "POST",
				//???????????? 200 ????????? ????????? ?????? ?????????
				success : function(json) {
					console.log(json);

					//json ????????? OK??? ??? ?????? ???????????? ??????????????????.
					if (json.rt == "OK") {
						alert("????????? ?????????????????????.");
						location.reload();
					}
				}
			});
			
			$(document).on("click",".revise", function(e){
	        	e.preventDefault;
	        	
	        	
	        	let revise = $(this);
	        	let couponno = revise.data('couponno');
	        	let couponno_input = $('#couponno').val(couponno);
	        	
	        	$.get("${pageContext.request.contextPath}/11_admin/admin_coupon_detail",{
	        		"couponno" : couponno
	        	},function(json){
	        		if(json.rt == "OK"){
	        			window.location = "${pageContext.request.contextPath}/11_admin/admin_coupon.do?couponno=" + couponno;
	        		}
	        	});
	        	
	        });
			
			$('#revcoupon-form').ajaxForm({
				//?????? ????????? ??????
				method : "PUT",
				//???????????? 200 ????????? ????????? ?????? ?????????
				success : function(json) {
					console.log(json);

					//json ????????? OK??? ??? ?????? ???????????? ??????????????????.
					if (json.rt == "OK") {
						alert("????????? ?????????????????????.");
						window.location = "${pageContext.request.contextPath}/11_admin/admin_coupon.do";
					}
				}
			});
			
			$('#coupon_rev_cancel').click(function(e){
				e.preventDefault();
				$('.coupon_li_revise').hide();
				
			});
			
			$(document).on('click', '#deleteCoupon', function(e){
				e.preventDefault();
				
				var current = $(this);
				var couponno = current.data('couponno');
				var name = current.data('name');
				
				//????????????
				if(!confirm("?????? " + name + "??? ????????????????????????? ????????? ????????? ????????? ????????? ?????????.")){
					return false;
				}
			$.delete("${pageContext.request.contextPath}/11_admin/admin_coupon", {
				"couponno" : couponno
			}, function(json){
				if(json.rt == "OK"){
					alert("?????????????????????.");
					//?????? ?????? ??? ?????? ???????????? ??????
					location.reload();
				}
			});
			});
			
		
		});
	</script>
</body>
</html>
