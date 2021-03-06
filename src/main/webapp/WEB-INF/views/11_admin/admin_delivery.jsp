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
<link rel="stylesheet" href="../assets/css/admin_delivery.css">

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
					<span class="icon-bar"></span><span class="icon-bar"></span>
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
                                <li><a href="${pageContext.request.contextPath}/11_admin/admin_userlist.do">
                                    <i class="glyphicon glyphicon-user"></i> ???????????? ??????</a></li>
                                <li><a href="${pageContext.request.contextPath}/11_admin/admin_order.do">
                                    <i class="glyphicon glyphicon-shopping-cart"></i> ???????????? ??????</a></li>
                                <li class="active"><a href="${pageContext.request.contextPath}/11_admin/admin_delivery.do">
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
								<h2 class="m-0">?????? ??????</h2>
							</div>
							<!-- /.col -->
							<div class="col-sm-6 clearfix">
								<ol class="breadcrumb pull-right">
									<li class="breadcrumb-item"><a href="#">?????? ??????</a></li>
									<li class="breadcrumb-item active">?????? ??????</li>
								</ol>
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->
					</div>
					<!-- /.container-fluid -->
				</div>
				<!-- Page Content -->
				<div class="content_wrapper">
					<div class="container-fluid">
                        <div class="row">
                            <!-- tab -->
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="cart-header border-0" id="tab_container">
                                        <ol class="tab_box">
                                            <li id="tab_nopay" class="tab selected">
                                                <a href="#" class="tab_button">
                                                    <span class="tab_thum thum_deposit"></span>
                                                    <strong class="tab_title">????????????</strong><br/>
                                                    <span class="count" id="N"></span>
                                                </a>
                                            </li>
                                            <li id="tab_ready" class="tab">
                                                <a href="#" class="tab_button">
                                                    <span class="tab_thum thum_ready"></span>
                                                    <strong class="tab_title">?????? ?????? ???</strong><br/>
                                                    <span class="count" id="R"></span>
                                                </a>
                                            </li>
                                            <li id="tab_stanby" class="tab">
                                                <a href="#" class="tab_button">
                                                    <span class="tab_thum thum_stanby"></span>
                                                    <strong class="tab_title">?????? ??????</strong><br/>
                                                    <span class="count" id="S"></span>
                                                </a>
                                            </li>
                                            <li id="tab_delivery" class="tab">
                                                <a href="#" class="tab_button">
                                                    <span class="tab_thum thum_delivery"></span>
                                                    <strong class="tab_title">?????? ???</strong><br/>
                                                    <span class="count" id="D"></span>
                                                </a>
                                            </li>
                                            <li id="tab_complete" class="tab">
                                                <a href="#" class="tab_button">
                                                    <span class="tab_thum thum_complete"></span>
                                                    <strong class="tab_title">?????? ??????</strong><br/>
                                                    <span class="count" id="C"></span>
                                                </a>
                                            </li>
                                        </ol>
                                    </div>
                                </div>
                            </div>

							<!-- ???????????? ?????? -->
							<div class="col-md-12" id="form_hidden">
                            	<div class="card">
                                    <div class="card-header border-0">
                                        <h3 class="card-title">?????? ?????? ??????</h3>
                            				<form id="delivery_form" action="${pageContext.request.contextPath}/11_admin/admin_delivery">
                            					<div>
										    		<label for="orderno">???????????? &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: </label>
										    		<input type="number" name="orderno" id="orderno" class="cfm_input" maxlength='5' oninput="maxLengthCheck(this)" placeholder="50,000 ????????? ??????????????????." value=""/>
										    	</div>
                            					<div>
										    		<label for="userno">???????????? &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: </label>
										    		<input type="number" name="userno" id="userno" class="cfm_input" maxlength='5' oninput="maxLengthCheck(this)" placeholder="10,000 ????????? ??????????????????." value=""/>
										    	</div>
										    	<div>
										    		<label for="trackingnum">????????? ?????? &nbsp;: </label>
										    		<input type="number" name="trackingnum" id="trackingnum" class="cfm_input" maxlength='6' oninput="maxLengthCheck(this)" placeholder="6????????? ????????? ??????????????????"/>
										    	</div>
										    	<div>
										    		<label for="deliverystatus1">?????? ?????? &nbsp;&nbsp;&nbsp;&nbsp;: </label>
										    		<input type="radio" name="deliverystatus" id="deliverystatus" value="R" checked/> ?????? ?????????
										    	</div>
										    	<button type="submit" class="btn btn-primary btn-sm" id="delivery_cfm">????????????</button>
                            				</form>
                       				</div>
                   				</div>
               				</div>
							
                            <!-- ???????????? -->
                            <div class="col-md-12 content_nopay">
                                <div class="card">
                                    <div class="card-header border-0">
                                        <h3 class="card-title">????????????</h3>
                                        <button type="button" class="btn btn-block btn-danger btn-sm pull-right" id="select_delete">????????????</button><br>
                                        <table class="table table-bordered delivery_table">
                                            <thead>
                                                <tr class="table_color">
                                                    <th style="width: 30px"></th>
                                                    <th>????????????</th>
                                                    <th>?????????</th>
                                                    <th>?????????</th>
                                                    <th>?????????</th>
                                                    <th>??????</th>
                                                    <th>????????????</th>
                                                    <th>??? ??????</th>
                                                    <th>??????????????????</th>
                                                    <th>????????????</th>
                                                    <th>????????????</th>
                                                    <th style="width: 54px">??????</th>
                                                </tr>
                                            </thead>
                                            <tbody id="delivery_list">
                                            	<c:choose>
                                            		<c:when test="${output == null || fn:length(output) == 0}">
									                    <tr>
									                        <td colspan="12" align="center">??????????????? ????????????.</td>
									                    </tr>
								                    </c:when>
								                    <c:otherwise>
							                    		<c:forEach var="item" items="${output }" varStatus="status">
							                    			<c:if test="${item.orderstatus=='N' && item.delistatus =='N'}">
								                    			<tr>
								                    				<td>
				                                                    	<input type='checkbox' class="check" name='chkn[]' value="${item.orderno }">
				                                                    	<input type='hidden' value="${item.userno }">
				                                                    	<input type='hidden' class="paystatus" value="${item.paystatus }">
			                                                    	</td>
				                                                    <td>${item.orderno }</td>
				                                                    <td>
				                                                    	<fmt:parseDate value="${item.regdate}" var="regdate" pattern="yyyy-MM-dd" />
				                                                    	<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" />
			                                                    	</td>
				                                                    <td>${item.name }</td>
				                                                    <td>
				                                                    	0<fmt:formatNumber var="phoneno" value="${item.phoneno }" pattern="###,####,####" />
				                                                    	<c:out value="${fn:replace(phoneno, ',', '-') }" />
			                                                    	</td>
				                                                    <td>${item.addr1 }, ${item.addr2 }</td>
				                                                    <td>${item.pname }</td>
				                                                    <td>
				                                                    	&#8361; <fmt:formatNumber pattern="###,###,###" value='${item.totalprice }'/>
				                                                    </td>
				                                                    <td>
				                                                    	<fmt:parseDate value="${item.deldate}" var="deldate" pattern="yyyy-MM-dd" />
				                                                    	<fmt:formatDate value="${deldate }" pattern="yyyy-MM-dd" />
				                                                    </td>
				                                                    <td>
				                                                    	<c:if test="${item.paytype=='C' }">
				                                                    		????????????
				                                                    	</c:if>
				                                                    	<c:if test="${item.paytype=='D' }">
				                                                    		???????????????
				                                                    	</c:if>
				                                                    	<c:if test="${item.paytype=='M' }">
				                                                    		???????????????
				                                                    	</c:if>
				                                                    	<c:if test="${item.paytype=='D2' }">
				                                                    		?????????????????????
				                                                    	</c:if>
				                                                    </td>
				                                                    <td>
				                                                    	<c:if test="${item.paystatus=='N' }">
				                                                    		?????????
				                                                    	</c:if>
				                                                    	<c:if test="${item.paystatus=='Y' }">
				                                                    		????????????
				                                                    	</c:if>
				                                                    </td>
				                                                    <td class="clear">
				                                                    	<c:choose>
				                                                    	<c:when test="${item.request != null }">
					                                                        <button type="button" class="btn btn-secondary btn-xs memo user_selected">user</button>
					                                                        <p class="user_memo">
					                                                        	${item.request }
				                                                        	</p>
			                                                        	</c:when>
			                                                        	<c:otherwise>
					                                                        <button type="button" class="btn btn-secondary btn-xs memo">user</button>
			                                                        	</c:otherwise>
			                                                        	</c:choose>
				                                                    </td>
			                                                	</tr>
		                                                	</c:if>
		                                                </c:forEach>
	                                                </c:otherwise>
                                                </c:choose>
                                            </tbody>
                                        </table>
                                        <button type="button" class="btn btn-block btn-primary btn-sm select_complete" id="paytypechange">????????????</button>
                                        <button type="button" class="btn btn-block btn-primary btn-sm select_complete" id="delivery_ready">????????????</button>
                                    </div>
                                    <!--????????? ?????????-->
                                    <div class="content_footer">
                                        <div class="pagination_box">
                                            <ul class="pagination pagination-sm m-0">
                                                <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                                                <li class="page-item"><a class="page-link seleted" href="#">1</a></li>
                                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!--?????????????????? ???-->
                                </div>
                            </div>
        
                            <!-- ?????? ?????? ??? -->
                            <div class="col-md-12 content_ready">
                                <div class="card">
                                    <div class="card-header border-0">
                                        <h3 class="card-title">?????? ?????? ???</h3>
                                        <table class="table table-bordered delivery_table">
                                            <thead>
                                                <tr class="table_color">
                                                    <th style="width: 30px"></th>
                                                    <th>????????????</th>
                                                    <th>?????????</th>
                                                    <th>?????????</th>
                                                    <th>?????????</th>
                                                    <th>???????????????</th>
                                                    <th>?????????</th>
                                                    <th>???????????????</th>
                                                    <th>????????????</th>
                                                    <th>??? ??????</th>
                                                    <th style="width: 54px">??????</th>
                                                </tr>
                                            </thead>
                                            <tbody id="delivery_list">
	                                            <c:choose>
                                            		<c:when test="${output == null || fn:length(output) == 0}">
									                    <tr>
									                        <td colspan="10" align="center">??????????????? ????????????.</td>
									                    </tr>
								                    </c:when>
								                    <c:otherwise>
								                    	<c:forEach var="item" items="${deliveryOutput }" varStatus="status">
								                    		<c:if test="${item.deliverystatus=='R' && item.paystatus=='Y' && item.orderstatus=='N'}">
				                                                <tr>
				                                                    <td><input type='checkbox' class="check" name='chkr[]' value="${item.deliveryno }"></td>
				                                                    <td>${item.orderno }</td>
				                                                    <td>
				                                                    	<fmt:parseDate value="${item.regdate}" var="regdate" pattern="yyyy-MM-dd" />
				                                                    	<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" />
			                                                    	</td>
				                                                    <td>${item.oname }</td>
				                                                    <td>
				                                                    	0<fmt:formatNumber var="phoneno" value="${item.phoneno }" pattern="###,####,####" />
				                                                    	<c:out value="${fn:replace(phoneno, ',', '-') }" />
			                                                    	</td>
				                                                    <td>${item.addr1 }, ${item.addr2 }</td>
				                                                    <td>
				                                                    	<fmt:parseDate value="${item.deldate}" var="deldate" pattern="yyyy-MM-dd" />
				                                                    	<fmt:formatDate value="${deldate }" pattern="yyyy-MM-dd" />
			                                                    	</td>
				                                                    <td>${item.trackingnum }</td>
				                                                    <td>${item.pname }</td>
				                                                    <td>
				                                                    	&#8361; <fmt:formatNumber pattern="###,###,###" value='${item.totalprice }'/>
				                                                    </td>
				                                                    <td width='54' align='center' class="clear">
				                                                    	<c:choose>
				                                                    	<c:when test="${item.request != null }">
					                                                        <button type="button" class="btn btn-secondary btn-xs memo user_selected">user</button>
					                                                        <p class="user_memo">
					                                                        	${item.request }
				                                                        	</p>
			                                                        	</c:when>
			                                                        	<c:otherwise>
					                                                        <button type="button" class="btn btn-secondary btn-xs memo">user</button>
			                                                        	</c:otherwise>
			                                                        	</c:choose>
				                                                    </td>
				                                                </tr>
                                                			</c:if>
                                                		</c:forEach>
                                                	</c:otherwise>
                                                </c:choose>
                                            </tbody>
                                        </table>
                                        <button type="button" class="btn btn-block btn-primary btn-sm select_complete" id="delivery_stay">????????????</button>
                                    </div>
                                    <!--????????? ?????????-->
                                    <div class="content_footer">
                                        <div class="pagination_box">
                                            <ul class="pagination pagination-sm m-0">
                                                <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                                                <li class="page-item"><a class="page-link seleted" href="#">1</a></li>
                                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!--?????????????????? ???-->
                                </div>
                            </div>
                            
                            <!-- ?????? ?????? -->
                            <div class="col-md-12 content_stanby">
                                <div class="card">
                                    <div class="card-header border-0">
                                        <h3 class="card-title">?????? ??????</h3>
                                        <table class="table table-bordered delivery_table">
                                            <thead>
                                                <tr class="table_color">
                                                    <th style="width: 30px"></th>
                                                    <th>????????????</th>
                                                    <th>?????????</th>
                                                    <th>?????????</th>
                                                    <th>?????????</th>
                                                    <th>???????????????</th>
                                                    <th>?????????</th>
                                                    <th>???????????????</th>
                                                    <th>????????????</th>
                                                    <th>??? ??????</th>
                                                    <th style="width: 54px">??????</th>
                                                </tr>
                                            </thead>
                                            <tbody id="delivery_list">
                                            	<c:choose>
                                            		<c:when test="${output == null || fn:length(output) == 0}">
									                    <tr>
									                        <td colspan="10" align="center">??????????????? ????????????.</td>
									                    </tr>
								                    </c:when>
								                    <c:otherwise>
								                    	<c:forEach var="item" items="${deliveryOutput }" varStatus="status">
								                    		<c:if test="${item.deliverystatus=='S' && item.paystatus=='Y' && item.orderstatus=='N'}">
				                                                <tr>
				                                                    <td><input type='checkbox' class="check" name='chks[]' value="${item.deliveryno }"></td>
				                                                    <td>${item.orderno }</td>
				                                                    <td>
				                                                    	<fmt:parseDate value="${item.regdate}" var="regdate" pattern="yyyy-MM-dd" />
				                                                    	<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" />
			                                                    	</td>
				                                                    <td>${item.oname }</td>
				                                                    <td>
				                                                    	0<fmt:formatNumber var="phoneno" value="${item.phoneno }" pattern="###,####,####" />
				                                                    	<c:out value="${fn:replace(phoneno, ',', '-') }" />
			                                                    	</td>
				                                                    <td>${item.addr1 }, ${item.addr2 }</td>
				                                                    <td>
				                                                    	<fmt:parseDate value="${item.deldate}" var="deldate" pattern="yyyy-MM-dd" />
				                                                    	<fmt:formatDate value="${deldate }" pattern="yyyy-MM-dd" />
			                                                    	</td>
				                                                    <td>${item.trackingnum }</td>
				                                                    <td>${item.pname }</td>
				                                                    <td>
				                                                    	&#8361; <fmt:formatNumber pattern="###,###,###" value='${item.totalprice }'/>
				                                                    </td>
				                                                    <td width='54' align='center' class="clear">
				                                                    	<c:choose>
				                                                    	<c:when test="${item.request != null }">
					                                                        <button type="button" class="btn btn-secondary btn-xs memo user_selected">user</button>
					                                                        <p class="user_memo">
					                                                        	${item.request }
				                                                        	</p>
			                                                        	</c:when>
			                                                        	<c:otherwise>
					                                                        <button type="button" class="btn btn-secondary btn-xs memo">user</button>
			                                                        	</c:otherwise>
			                                                        	</c:choose>
				                                                    </td>
				                                                </tr>
                                                			</c:if>
                                                		</c:forEach>
                                                	</c:otherwise>
                                                </c:choose>
                                            </tbody>
                                        </table>
                                        <button type="button" class="btn btn-block btn-primary btn-sm select_complete" id="delivery_delivery">??????</button>
                                    </div>
                                    <!--????????? ?????????-->
                                    <div class="content_footer">
                                        <div class="pagination_box">
                                            <ul class="pagination pagination-sm m-0">
                                                <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                                                <li class="page-item"><a class="page-link seleted" href="#">1</a></li>
                                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!--?????????????????? ???-->
                                </div>
                            </div>

                            <!-- ?????? ??? -->
                            <div class="col-md-12 content_delivery">
                                <div class="card">
                                    <div class="card-header border-0">
                                        <h3 class="card-title">?????? ???</h3>
                                        <table class="table table-bordered delivery_table">
                                            <thead>
                                                <tr class="table_color">
                                                    <th style="width: 30px"></th>
                                                    <th>????????????</th>
                                                    <th>?????????</th>
                                                    <th>?????????</th>
                                                    <th>?????????</th>
                                                    <th>???????????????</th>
                                                    <th>?????????</th>
                                                    <th>???????????????</th>
                                                    <th>????????????</th>
                                                    <th>??? ??????</th>
                                                    <th style="width: 54px">??????</th>
                                                </tr>
                                            </thead>
                                            <tbody id="delivery_list">
                                                <c:choose>
                                            		<c:when test="${output == null || fn:length(output) == 0}">
									                    <tr>
									                        <td colspan="10" align="center">??????????????? ????????????.</td>
									                    </tr>
								                    </c:when>
								                    <c:otherwise>
								                    	<c:forEach var="item" items="${deliveryOutput }" varStatus="status">
								                    		<c:if test="${item.deliverystatus=='D' && item.paystatus=='Y' && item.orderstatus=='N'}">
				                                                <tr>
				                                                    <td>
				                                                    	<input type='checkbox' class="check" name='chkd[]' value="${item.deliveryno }">
				                                                    	<input type="hidden" data-userno="${item.userno }" data-point="${item.totalprice * 0.05}" />
				                                                    	</td>
				                                                    <td>${item.orderno }</td>
				                                                    <td>
				                                                    	<fmt:parseDate value="${item.regdate}" var="regdate" pattern="yyyy-MM-dd" />
				                                                    	<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" />
			                                                    	</td>
				                                                    <td>${item.oname }</td>
				                                                    <td>
				                                                    	0<fmt:formatNumber var="phoneno" value="${item.phoneno }" pattern="###,####,####" />
				                                                    	<c:out value="${fn:replace(phoneno, ',', '-') }" />
			                                                    	</td>
				                                                    <td>${item.addr1 }, ${item.addr2 }</td>
				                                                    <td>
				                                                    	<fmt:parseDate value="${item.deldate}" var="deldate" pattern="yyyy-MM-dd" />
				                                                    	<fmt:formatDate value="${deldate }" pattern="yyyy-MM-dd" />
			                                                    	</td>
				                                                    <td>${item.trackingnum }</td>
				                                                    <td>${item.pname }</td>
				                                                    <td>
				                                                    	&#8361; <fmt:formatNumber pattern="###,###,###" value='${item.totalprice }'/>
				                                                    </td>
				                                                    <td width='54' align='center' class="clear">
				                                                    	<c:choose>
				                                                    	<c:when test="${item.request != null }">
					                                                        <button type="button" class="btn btn-secondary btn-xs memo user_selected">user</button>
					                                                        <p class="user_memo">
					                                                        	${item.request }
				                                                        	</p>
			                                                        	</c:when>
			                                                        	<c:otherwise>
					                                                        <button type="button" class="btn btn-secondary btn-xs memo">user</button>
			                                                        	</c:otherwise>
			                                                        	</c:choose>
				                                                    </td>
				                                                </tr>
                                                			</c:if>
                                                		</c:forEach>
                                                	</c:otherwise>
                                                </c:choose>
                                            </tbody>
                                        </table>
                                        <button type="button" class="btn btn-block btn-primary btn-sm select_complete" id="delivery_complete">????????????</button>
                                    </div>
                                    <!--????????? ?????????-->
                                    <div class="content_footer">
                                        <div class="pagination_box">
                                            <ul class="pagination pagination-sm m-0">
                                                <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                                                <li class="page-item"><a class="page-link seleted" href="#">1</a></li>
                                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!--?????????????????? ???-->
                                </div>
                            </div>

                            <!-- ?????? ?????? -->
                            <div class="col-md-12 content_complete">
                                <div class="card">
                                    <div class="card-header border-0">
                                        <h3 class="card-title">?????? ??????</h3>
                                        <button type="button" class="btn btn-block btn-danger btn-sm pull-right" id="delivery_delete">????????????</button><br>
                                        <table class="table table-bordered delivery_table">
                                            <thead>
                                                <tr class="table_color">
                                                    <th style="width: 30px"></th>
                                                    <th>????????????</th>
                                                    <th>?????????</th>
                                                    <th>?????????</th>
                                                    <th>?????????</th>
                                                    <th>???????????????</th>
                                                    <th>?????????</th>
                                                    <th>???????????????</th>
                                                    <th>????????????</th>
                                                    <th>??? ??????</th>
                                                    <th style="width: 54px">??????</th>
                                                </tr>
                                            </thead>
                                            <tbody id="delivery_list">
                                                <c:choose>
                                            		<c:when test="${output == null || fn:length(output) == 0}">
									                    <tr>
									                        <td colspan="10" align="center">??????????????? ????????????.</td>
									                    </tr>
								                    </c:when>
								                    <c:otherwise>
								                    	<c:forEach var="item" items="${deliveryOutput }" varStatus="status">
								                    		<c:if test="${item.deliverystatus=='C' && item.paystatus=='Y' && item.orderstatus=='N'}">
				                                                <tr>
				                                                    <td><input type='checkbox' class="check" name='chkc[]' value="${item.deliveryno }"></td>
				                                                    <td>${item.orderno }</td>
				                                                    <td>
				                                                    	<fmt:parseDate value="${item.regdate}" var="regdate" pattern="yyyy-MM-dd" />
				                                                    	<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" />
			                                                    	</td>
				                                                    <td>${item.oname }</td>
				                                                    <td>
				                                                    	0<fmt:formatNumber var="phoneno" value="${item.phoneno }" pattern="###,####,####" />
				                                                    	<c:out value="${fn:replace(phoneno, ',', '-') }" />
			                                                    	</td>
				                                                    <td>${item.addr1 }, ${item.addr2 }</td>
				                                                    <td>
				                                                    	<fmt:parseDate value="${item.deldate}" var="deldate" pattern="yyyy-MM-dd" />
				                                                    	<fmt:formatDate value="${deldate }" pattern="yyyy-MM-dd" />
			                                                    	</td>
				                                                    <td>${item.trackingnum }</td>
				                                                    <td>${item.pname }
				                                                    </td>
				                                                    <td>
				                                                    	&#8361; <fmt:formatNumber pattern="###,###,###" value='${item.totalprice }'/>
				                                                    </td>
				                                                    <td width='54' align='center' class="clear">
				                                                    	<c:choose>
				                                                    	<c:when test="${item.request != null }">
					                                                        <button type="button" class="btn btn-secondary btn-xs memo user_selected">user</button>
					                                                        <p class="user_memo">
					                                                        	${item.request }
				                                                        	</p>
			                                                        	</c:when>
			                                                        	<c:otherwise>
					                                                        <button type="button" class="btn btn-secondary btn-xs memo">user</button>
			                                                        	</c:otherwise>
			                                                        	</c:choose>
				                                                    </td>
				                                                </tr>
                                                			</c:if>
                                                		</c:forEach>
                                                	</c:otherwise>
                                                </c:choose>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!--????????? ?????????-->
                                    <div class="content_footer">
                                        <div class="pagination_box">
                                            <ul class="pagination pagination-sm m-0">
                                                <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                                                <li class="page-item"><a class="page-link seleted" href="#">1</a></li>
                                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!--?????????????????? ???-->
                                </div>
                            </div>
                        </div>
                    </div>
				</div>
			</div>
		</div>
		<!-- /wrapper  ???-->
	</section>
	<footer></footer>

    <!-- Handlebar CDN ?????? -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.4.2/handlebars.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <!-- jQuery Ajax Form plugin CDN -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
    <!-- jQuery Ajax Setup -->
    <script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
	<script type="text/javascript">
        $("#menu-toggle").click(function(e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
        });
        
        /* input ???????????? ?????? ????????? */
        function maxLengthCheck(object){
            if (object.value.length > object.maxLength){
              object.value = object.value.slice(0, object.maxLength);
            }    
          }
        
        /* ?????? ?????? ??? ?????? */
        $(function() {
            $(document).ready(function() {
	            $(".content_ready").hide();
	            $(".content_stanby").hide();
	            $(".content_delivery").hide();
	            $(".content_complete").hide();
	            $("#form_hidden").hide();
	            
	            // ?????? ??? ????????????
	            var countn = $("input:checkbox[name='chkn[]']").length;
	            $("#N").html(countn);
	            
	            var countr = $("input:checkbox[name='chkr[]']").length;
	            $("#R").html(countr);
	            
	            var counts = $("input:checkbox[name='chks[]']").length;
	            $("#S").html(counts);
	            
	            var countd = $("input:checkbox[name='chkd[]']").length;
	            $("#D").html(countd);
	            
	            var countc = $("input:checkbox[name='chkc[]']").length;
	            $("#C").html(countc);
	            
            });

            /** ??? ????????? ???????????? */
            $(document).on("click", ".tab", function(e) {
            	e.preventDefault();

            	// ??? ????????? ????????? ??? ??????
            	$(this).addClass("selected");
            	$(".tab").not(this).removeClass("selected");
            	
            	// ??? ????????? ????????? ?????? ???????????? ??????
            	if ($(".check").is(":checked")) {
	            	$(".check").prop("checked", false);
	            }
           	});

            /** ??? ????????? ????????? ?????? ?????? */
            $(document).on("click", "#tab_nopay", function(e) {
            	e.preventDefault();

	            $(".content_nopay").show();
	            $(".content_ready").hide();
	            $(".content_stanby").hide();
	            $(".content_delivery").hide();
	            $(".content_complete").hide();
	            
            });

            $(document).on("click", "#tab_ready", function(e) {
            e.preventDefault();

	            $(".content_nopay").hide();
	            $(".content_ready").show();
	            $(".content_stanby").hide();
	            $(".content_delivery").hide();
	            $(".content_complete").hide();
	            $("#form_hidden").hide();
            });

            $(document).on("click", "#tab_stanby", function(e) {
            e.preventDefault();

	            $(".content_nopay").hide();
	            $(".content_ready").hide();
	            $(".content_stanby").show();
	            $(".content_delivery").hide();
	            $(".content_complete").hide();
	            $("#form_hidden").hide();
            });

            $(document).on("click", "#tab_delivery", function(e) {
            e.preventDefault();

	            $(".content_nopay").hide();
	            $(".content_ready").hide();
	            $(".content_stanby").hide();
	            $(".content_delivery").show();
	            $(".content_complete").hide();
	            $("#form_hidden").hide();
            });

            $(document).on("click", "#tab_complete", function(e) {
            e.preventDefault();

	            $(".content_nopay").hide();
	            $(".content_ready").hide();
	            $(".content_stanby").hide();
	            $(".content_delivery").hide();
	            $(".content_complete").show();
	            $("#form_hidden").hide();
            });
        });

        /* ???????????? ?????? toggle */
        $("#delivery_ready").click(function() {
        	$("#form_hidden").slideToggle(200);
        });
		
        /* ????????? ?????? */
        $(document).on("click",".check", function() {
        	var current = $("input:checkbox[name='chkn[]']:checked");														// ????????? ?????? ?????? ??????
			var orderno = $(current).parent().next().html();
			var userno = $(current).next().val();
			$("#orderno").val(orderno);
			$("#userno").val(userno);
        });
        
        /* ???????????? ?????? */
        $(function() {
    		$("#delivery_form").ajaxForm({
    			method:"POST",
    			success: function(json) {
    				console.log(json);
    				
    				if (json.rt == "OK") {
    					alert("?????? ????????? ???????????? ????????? ?????????.")
    					window.location = "${pageContext.request.contextPath}/11_admin/admin_delivery.do?";
    				}
    			}
    		});
    	});
        
        /* ???????????? ?????? */
		$(document).on("click","#select_delete", function() {
			
			var current = null;														// ????????? ?????? ?????? ??????
			var count = $("input:checkbox[name='chkn[]']").length;					// ??? ??????
			var ckcount = $("input:checkbox[name='chkn[]']:checked").length;		// ????????? ?????? ??????
				
			for (var i=0; i<count; i++) {
				if(ckcount != 1) {
					alert("???????????? ????????? ????????? ?????????.");
					break;
				} else {
					current = $("input:checkbox[name='chkn[]']:checked").val();		// ????????? ????????????
				}
			}
			
			var orderno = current;
			var paystatus = $(this).parent().find(".paystatus").val();
			var orderstatus = "CC";
			var ccstatus = "I";
			if (!confirm("?????? ???????????? ???????????? ?????? ?????? ?????????.")) {
				return false;
			}
			
			// put ???????????? ajax ??????
			$.put("${pageContext.request.contextPath}/11_admin/admin_delivery", {
				"orderno":orderno,
				"paystatus":paystatus,
				"orderstatus":orderstatus,
				"ccstatus":ccstatus
			}, function(json) {
				if(json.rt == "OK") {
					alert("?????????????????? ???????????????");
					// ?????? ?????? ??? ?????? ????????? ??????
					window.location = "${pageContext.request.contextPath}/11_admin/admin_cancel.do";
				}
			});
		});
        
        /* ???????????? ?????? */
		$(document).on("click","#paytypechange", function() {
			
			var current = null;														// ????????? ?????? ?????? ??????
			var count = $("input:checkbox[name='chkn[]']").length;					// ??? ??????
			var ckcount = $("input:checkbox[name='chkn[]']:checked").length;		// ????????? ?????? ??????
				
			for (var i=0; i<count; i++) {
				if(ckcount != 1) {
					alert("???????????? ????????? ????????? ?????????.");
					break;
				} else {
					current = $("input:checkbox[name='chkn[]']:checked").val();		// ????????? ????????????
				}
			}
			
			var orderno = current;
			var paystatus = "Y";
			if (!confirm("???????????? " + orderno + "??? ?????????????????? ???????????????????")) {
				return false;
			}
			// put ???????????? ajax ??????
			$.put("${pageContext.request.contextPath}/11_admin/admin_delivery", {
				"orderno":orderno,
				"paystatus":paystatus
			}, function(json) {
				if(json.rt == "OK") {
					alert("?????????????????????");
					// ?????? ?????? ??? ?????? ????????? ??????
					window.location = "${pageContext.request.contextPath}/11_admin/admin_delivery.do";
				}
			});
		});
        
		/* ???????????? ?????? */
		$(document).on("click","#delivery_stay", function() {
			
			var current = null;														// ????????? ?????? ?????? ??????
			var count = $("input:checkbox[name='chkr[]']").length;					// ??? ??????
			var ckcount = $("input:checkbox[name='chkr[]']:checked").length;		// ????????? ?????? ??????
				
			for (var i=0; i<count; i++) {
				if(ckcount != 1) {
					alert("???????????? ????????? ????????? ?????????.");
					break;
				} else {
					current = $("input:checkbox[name='chkr[]']:checked").val();		// ????????? ????????????
				}
			}
			
			var deliveryno = current;
			var deliverystatus = "S";
			if (!confirm("?????? ????????? ???????????? ????????? ?????????.")) {
				return false;
			}
			
			// put ???????????? ajax ??????
			$.put("${pageContext.request.contextPath}/11_admin/admin_delivery", {
				"deliveryno":deliveryno,
				"deliverystatus":deliverystatus
			}, function(json) {
				if(json.rt == "OK") {
					alert("?????????????????????");
					// ?????? ?????? ??? ?????? ????????? ??????
					window.location = "${pageContext.request.contextPath}/11_admin/admin_delivery.do";
				}
			});
		});
		
		/* ????????? ?????? */
		$(document).on("click","#delivery_delivery", function() {
			
			var current = null;														// ????????? ?????? ?????? ??????
			var count = $("input:checkbox[name='chks[]']").length;					// ??? ??????
			var ckcount = $("input:checkbox[name='chks[]']:checked").length;		// ????????? ?????? ??????

			for (var i=0; i<count; i++) {
				if(ckcount != 1) {
					alert("???????????? ????????? ????????? ?????????.");
					break;
				} else {
					current = $("input:checkbox[name='chks[]']:checked").val();		// ????????? ????????????
				}
			}
			
			var deliveryno = current;
			var deliverystatus = "D";
			if (!confirm("?????? ????????? ????????? ????????? ?????????.")) {
				return false;
			}
			
			// put ???????????? ajax ??????
			$.put("${pageContext.request.contextPath}/11_admin/admin_delivery", {
				"deliveryno":deliveryno,
				"deliverystatus":deliverystatus
			}, function(json) {
				if(json.rt == "OK") {
					alert("?????????????????????");
					// ?????? ?????? ??? ?????? ????????? ??????
					window.location = "${pageContext.request.contextPath}/11_admin/admin_delivery.do";
				}
			});
		});
		
		/* ???????????? ?????? */
		$(document).on("click","#delivery_complete", function() {
			
			var current = null;														// ????????? ?????? ?????? ??????
			var count = $("input:checkbox[name='chkd[]']").length;					// ??? ??????
			var ckcount = $("input:checkbox[name='chkd[]']:checked").length;		// ????????? ?????? ??????
				
			for (var i=0; i<count; i++) {
				if(ckcount != 1) {
					alert("???????????? ????????? ????????? ?????????.");
					break;
				} else {
					current = $("input:checkbox[name='chkd[]']:checked");		// ????????? ????????????
				}
			}
			
			var deliveryno = current.val();
			//var userno = current.next().data('userno');					// ?????? ????????????
			//var point = Math.round(current.next().data('point'));		// ????????? ?????????
			//console.log(userno);
			//console.log(point);
			var deliverystatus = "C";
			if (!confirm("?????? ????????? ???????????? ????????? ?????????.")) {
				return false;
			}
			
			// put ???????????? ajax ??????
			$.put("${pageContext.request.contextPath}/11_admin/admin_delivery", {
				"deliveryno":deliveryno,
				//"userno":userno,
				//"point":point,
				"deliverystatus":deliverystatus
			}, function(json) {
				if(json.rt == "OK") {
					alert("?????????????????????");
					// ?????? ?????? ??? ?????? ????????? ??????
					window.location = "${pageContext.request.contextPath}/11_admin/admin_delivery.do";
				}
			});
		});
		
		/* ???????????? ?????? */
		$(document).on("click","#delivery_delete", function() {
			
			var current = null;														// ????????? ?????? ?????? ??????
			var count = $("input:checkbox[name='chkc[]']").length;					// ??? ??????
			var ckcount = $("input:checkbox[name='chkc[]']:checked").length;		// ????????? ?????? ??????
				
			for (var i=0; i<count; i++) {
				if(ckcount != 1) {
					alert("???????????? ????????? ????????? ?????????.");
					break;
				} else {
					current = $("input:checkbox[name='chkc[]']:checked").val();		// ????????? ????????????
				}
			}
			
			var deliveryno = current;
			if (!confirm("?????? ???????????? ???????????? ?????? ?????? ?????????.")) {
				return false;
			}
			
			// delete ???????????? ajax ??????
			$.delete("${pageContext.request.contextPath}/11_admin/admin_delivery", {
				"deliveryno":deliveryno
			}, function(json) {
				if(json.rt == "OK") {
					alert("?????????????????? ???????????????");
					// ?????? ?????? ??? ?????? ????????? ??????
					window.location = "${pageContext.request.contextPath}/11_admin/admin_cancel.do";
				}
			});
		});
        
    </script>
</body>
</html>