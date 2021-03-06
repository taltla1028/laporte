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
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin_common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin_userlist.css">
    <!-- javascript -->
    <script src="http://code.jquery.com/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <!-- jQuery Ajax Form plugin CDN -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
    <!-- ajax-helper -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.css" />
    <script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
</head>

<body>
    <section>
        <nav id="navbar-white" class="navbar navbar-default navbar-fixed-top clearfix" role="navigation">
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
						<li class="brand_logo_box">
                            <a href="#" class="brand_logo">
								<span id="logo_img">la porte</span>
                            </a>
                        </li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><i class="glyphicon glyphicon-edit"></i>
								??? ???????????? ???????????? <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li>
									<a href="${pageContext.request.contextPath}/11_admin/admin_resvappv.do">
										<i class="glyphicon glyphicon-ok"></i>
										?????? ??????
									</a>
								</li>
							</ul>
						</li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><i class="glyphicon glyphicon-tags"></i>
								?????? ?????? <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath}/11_admin/stock_management.do">
										<i class="glyphicon glyphicon-briefcase"></i> ?????? ??????</a></li>
               					<li><a href="${pageContext.request.contextPath}/11_admin/product_add.do">
               					 		<i class="glyphicon glyphicon-plus"></i> ?????? ??????</a></li>
								<li><a href="${pageContext.request.contextPath}/11_admin/admin_review.do">
										<i class="glyphicon glyphicon-star-empty"></i> ?????? ??????</a></li>
							
							</ul>
						</li>
                        <li class="dropdown open">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="glyphicon glyphicon-user"></i>
                                ?????? ?????? <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li  class="active"><a href="${pageContext.request.contextPath}/11_admin/admin_userlist.do">
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
                                <li><a href="${pageContext.request.contextPath}/11_admin/admin_qanda.do">
                                    <i class="glyphicon glyphicon-envelope"></i> ????????? ?????? ??????</a></li>
                                
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
                                <h3 class="m-0">????????????</h3>
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-6 clearfix">
                                <ol class="breadcrumb pull-right">
                                    <li class="breadcrumb-item"><a href="#">????????????</a></li>
                                    <li class="breadcrumb-item active">???????????? ??????</li>
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
											<!-- ?????? ?????? -->
											<table class="user_list">
												<thead class="join_users_head">
													<tr>
														<th class="select-user"><input type="checkbox" /></th>
														<th>????????????</th>
														<th>??????</th>
														<th>?????????</th>
														<th>????????????</th>
														<th>?????????</th>
														<th>?????????</th>
														<th>??????</th>
													</tr>
												</thead>
												<tbody class="join_user_li">
													<c:forEach var="item" items="${output}" varStatus="stauts">
														<tr>
															<td class="select-user"><input type="checkbox" /></td>
															<td>${item.userno}</td>
															<td>${item.name}</td>
															<td>${item.email}</td>
															<td>${item.birthdate}</td>
															<td>${item.phoneno}</td>
															<td>${item.regdate}</td>
															<td><a href="#" id="order-button"
																data-userno="${item.userno}" class=" btn-success btn-xs">???????????????</a>
																<a href="#" data-userno="${item.userno}" id="delete_user" class="user-delete btn-danger btn-xs"> X
																	????????????</a></td>
														</tr>
													</c:forEach>
												</tbody>




											</table>

											<br />
											
						
											<div id="userdetail-list">
											
											<table class="table table-bordered">
											<thead>
													<tr class="table_color">
														<th>????????????</th>
														<th>?????? ?????????</th>
													</tr>
											</thead>
											<tbody>
											<tr>
											<td>
											<input id="userno-input" value="${u_output.userno}" readonly>
											</td>
											<td><fmt:formatNumber pattern="###,###,###"
																value="${u_output.point}" /></td>
																
											</tr>
											
										
													
											</table>
											<table id="order-form" class="table table-bordered">
											</tbody>
												<thead>
													<tr class="table_color">
														<th>????????????</th>
														<th>?????????</th>
														<th>?????????</th>
														<th>????????????</th>
														<th>??? ??????</th>
														<th>????????????</th>
														<th>????????????</th>
														<th>???????????????</th>
														<th>????????????</th>
														<th>????????????</th>
													</tr>
												</thead>

												<tbody id="order_list">
													<c:choose>
														<c:when
															test="${o_output == null || fn:length(o_output) == 0}">
															<tr>
																<td colspan="11" align="center">??????????????? ????????????.</td>
															</tr>
														</c:when>
														<c:otherwise>
															<c:forEach var="order" items="${o_output}"
																varStatus="status">
																<tr>
																	<td>${order.orderno}</td>
																	<td>${order.regdate}</td>

																	<td><fmt:formatNumber var="phoneno"
																			value="${order.phoneno}" pattern="###,####,####" />
																		<c:out value="${fn:replace(phoneno, ',', '-') }" /></td>
																	<td>?????? ?????? ??????------------------</td>
																	<td>&#8361; <fmt:formatNumber
																			pattern="###,###,###" value='${order.totalprice }' />
																	</td>
																	<td><c:if test="${order.paytype=='C'}">
                                                                                            ????????????
                                                                                        </c:if>
																		<c:if test="${order.paytype=='D'}">
                                                                                            ???????????????
                                                                                        </c:if>
																		<c:if test="${order.paytype=='M'}">
                                                                                            ???????????????
                                                                                        </c:if>
																		<c:if test="${order.paytype=='D2'}">
                                                                                            ?????????????????????
                                                                                        </c:if>
																	</td>
																	<td><c:if test="${order.paystatus=='N' }">
                                                                                            ?????????
                                                                                        </c:if>
																		<c:if test="${order.paystatus=='Y' }">
                                                                                            ????????????
                                                                                        </c:if>
																	</td>
																	<td>${order.deldate}</td>
																	<td><c:if test="${order.deliverystatus=='N' }">
                                                                                            ?????????
                                                                                        </c:if>
																		<c:if test="${order.deliverystatus=='R' }">
                                                                                            ?????????
                                                                                        </c:if>
																		<c:if test="${order.deliverystatus=='S' }">
                                                                                            ????????????
                                                                                        </c:if>
																		<c:if test="${order.deliverystatus=='D' }">
                                                                                            ?????????
                                                                                        </c:if>
																		<c:if test="${order.deliverystatus=='C' }">
                                                                                            ????????????
                                                                                        </c:if>
																	</td>
																	<td><c:if test="${order.orderstatus=='N' }">
                                                                                            ??????
                                                                                        </c:if>
																		<c:if test="${order.orderstatus=='CC' }">
                                                                                            ??????
                                                                                        </c:if>
																		<c:if test="${order.orderstatus=='CH' }">
                                                                                            ??????
                                                                                        </c:if>
																		<c:if test="${order.orderstatus=='RT' }">
                                                                                            ??????
                                                                                        </c:if>
																		<c:if test="${order.orderstatus=='RF' }">
                                                                                            ??????
                                                                                        </c:if>
																	</td>
																</tr>
															</c:forEach>
														</c:otherwise>
													</c:choose>
												</tbody>
											</table>

											<table id="point-form" class="table table-bordered">
												<thead>
													<tr class="table_color">
													
													</tr>
												</thead>
											</table>

											<table id="coupon-form" class="table table-bordered">
												<thead>
													<tr class="table_color">
														<th>?????????</th>
														<th>??????</th>
														<th>??????</th>
														<th>??????????????????</th>
														<th>????????????</th>
														<th>??????</th>
													</tr>
												</thead>

												<tbody id="coupon_list">
													<c:choose>
													<c:when test="${uc_output == null || fn:length(uc_output) == 0 }">
														<tr class="coupon_li">
															<td colspan="7">????????? ????????? ????????????.</td>
														</tr>
													</c:when>
													<c:otherwise>
													<c:forEach var="coupon" items="${uc_output}" varStatus="stauts">
														<c:if test="${coupon.expire == 'N'}">

															<tr>
																<td>${coupon.name}</td>
																<td>${coupon.startdate}~${coupon.enddate}</td>
																<td>${coupon.discount}<c:choose>
																		<c:when test="${coupon.distype == 'P'}">
																			<span>%</span>
																		</c:when>
																		<c:otherwise>
																			<span>???</span>
																		</c:otherwise>
																	</c:choose>
																</td>
																<td>${coupon.dupliuse}</td>
																<td>${coupon.link}</td>
																<td class="coupon_li_btns">
																 <a href="#" id="deleteCoupon"
																	data-couponno="${item.couponno}"
																	data-name="${item.name}" class="delete btn-danger btn-xs">??????</a></td>
															</tr>
														</c:if>
														</c:forEach>
														</c:otherwise>
														</c:choose>
												</tbody>
											</table>
											</div>
										</div>
									</div>
								</div>
								<!-- ?????? ?????? -->
                                <!--?????? ?????? ??????  -->
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="card-header border-0">
                                            <h3 class="card-title">??????????????????</h3>
                                            <br>
                                            <table class="user_list">
                                                <thead class="out_users_head">
                                                    <tr>
                                                        <th class="select-user"><input type="checkbox" class="select-user" /></th>
                                                        <th>????????????</th>
                                                        <th>??????</th>
                                                        <th>?????????</th>
                                                        <th>?????????</th>
                                                        <th>?????????</th>
                                                        <th>????????????</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="out_user_li">
                                                    <c:forEach var="outuser" items="${ou_output}" varStatus="stauts">
                                                        <tr>
                                                            <td class="select-user"><input type="checkbox" /></td>
                                                            <td>${outuser.outuserno}</td>
                                                            <td>${outuser.name}</td>
                                                            <td>${outuser.email}</td>
                                                            <td>${outuser.regdate}</td>
                                                            <td>${outuser.outdate}</td>
                                                            <td>
                                                            	<c:choose>
                                                            		<c:when test="${outuser.outreason == NULL}" >
                                                            		??????????????????
                                                            		</c:when>
                                                            		<c:otherwise>
                                                            		${outuser.outreason}
                                                            		</c:otherwise>
                                                            	</c:choose>
                                                            
                                                            </td>
                                                    
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <!-- ???????????? ?????? -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- REQUIRED SCRIPTS -->
    <script type="text/javascript">
    $(function() {
	     $(document).ready(function(e){
    	   e.preventDefault;
    	  	var userno_check = $('#userno-input').val();
    	  	
    	   if(userno_check == ""){
        	$('#userdetail-list').hide();
    	   }else{
        	$('#userdetail-list').show();}
       });
        
        $(document).on("click","#order-button", function(e){
        	e.preventDefault;
        	
        	let order_btn = $(this);
        	let userno = order_btn.data('userno');
        	let userno_input = $('#userno').val(userno);
        	
        	$.get("${pageContext.request.contextPath}/11_admin/admin_userlist_order",{
        		"userno" : userno
        	},function(json){
        		if(json.rt == "OK"){
        			window.location = "${pageContext.request.contextPath}/11_admin/admin_userlist.do?userno=" + userno;
        		}
        	});
        	
        });
        
      //?????? ????????????
       $(document).on("click","#delete_user", function(e){
        	e.preventDefault();
        	
        	let current = $(this);
        	let outuserno = current.data('userno');
        	let outreason = "";
        	
        	if(!confirm('?????? ????????????????????????? ????????? ????????? ?????? ????????? ????????? ?????????.')){
        		return false;
        	}else{
        	outreason = prompt("?????? ?????? ????????? ??????????????????.");
        	}
        	//put ???????????? ajax ??????
        	$.delete("${pageContext.request.contextPath}/02_mypage",{
        		"userno" : outuserno,
        		"outreason" : outreason
        	},function(json){
        		if(json.rt == "OK"){
        		alert("?????? ????????? ??????????????? ???????????????.");
        		location.reload();
        	}
         });
        });
        
      

    });
    </script>
</body>

</html>