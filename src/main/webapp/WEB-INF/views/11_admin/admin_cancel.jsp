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
<link rel="stylesheet" href="../assets/css/admin_cancel.css">

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
						<li class="brand_logo_box">
                            <a href="#" class="brand_logo">
								<span id="logo_img">la porte</span>
                            </a>
                        </li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><i class="glyphicon glyphicon-edit"></i>
								홈 퍼블리싱 예약관리 <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li>
									<a href="${pageContext.request.contextPath}/11_admin/admin_resvappv.do">
										<i class="glyphicon glyphicon-ok"></i>
										예약 승인
									</a>
								</li>
							</ul>
						</li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><i class="glyphicon glyphicon-tags"></i>
								제품 관리 <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath}/11_admin/stock_management.do">
										<i class="glyphicon glyphicon-briefcase"></i> 상품 관리</a></li>
               					<li><a href="${pageContext.request.contextPath}/11_admin/product_add.do">
               					 		<i class="glyphicon glyphicon-plus"></i> 상품 등록</a></li>
								<li><a href="${pageContext.request.contextPath}/11_admin/admin_review.do">
										<i class="glyphicon glyphicon-star-empty"></i> 리뷰 관리</a></li>
								
							</ul>
						</li>
                        <li class="dropdown open">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="glyphicon glyphicon-user"></i>
                                고객 관리 <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="${pageContext.request.contextPath}/11_admin/admin_userlist.do">
                                    <i class="glyphicon glyphicon-user"></i> 회원정보 관리</a></li>
                                <li><a href="${pageContext.request.contextPath}/11_admin/admin_order.do">
                                    <i class="glyphicon glyphicon-shopping-cart"></i> 주문내역 관리</a></li>
                                <li><a href="${pageContext.request.contextPath}/11_admin/admin_delivery.do">
                                    <i class="glyphicon glyphicon-transfer"></i> 배송정보 관리</a></li>
                                <li class="active"><a href="${pageContext.request.contextPath}/11_admin/admin_cancel.do">
                                    <i class="glyphicon glyphicon-retweet"></i> 취소/교환/반품/환불</a></li>
                                <li><a href="${pageContext.request.contextPath}/11_admin/admin_coupon.do">
                                    <i class="glyphicon glyphicon-credit-card"></i> 쿠폰 </a></li>
                               
                               
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="glyphicon glyphicon-pencil"></i>
                                문의 관리 <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="${pageContext.request.contextPath}/11_admin/admin_qanda.do">
                                    <i class="glyphicon glyphicon-envelope"></i> 이메일 문의 관리</a></li>
                                
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
								<h2 class="m-0">취소/교환/반품/환불</h2>
							</div>
							<!-- /.col -->
							<div class="col-sm-6 clearfix">
								<ol class="breadcrumb pull-right">
									<li class="breadcrumb-item"><a href="#">주문 관리</a></li>
									<li class="breadcrumb-item active">취소/교환/반품/환불</li>
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
                            <!-- 탭 -->
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="cart-header border-0" id="tab_container">
                                        <ol class="tab_box">
                                            <li id="tab_cancel" class="tab selected">
                                                <a href="#" class="tab_button">
                                                    <span class="tab_thum thum_cancel"></span>
                                                    <strong class="tab_title">취소</strong>
                                                    <span class="count" id="CC"></span>
                                                </a>
                                            </li>
                                            <li id="tab_change" class="tab">
                                                <a href="#" class="tab_button">
                                                    <span class="tab_thum thum_change"></span>
                                                    <strong class="tab_title">교환</strong>
                                                    <span class="count" id="CH"></span>
                                                </a>
                                            </li>
                                            <li id="tab_return" class="tab">
                                                <a href="#" class="tab_button">
                                                    <span class="tab_thum thum_return"></span>
                                                    <strong class="tab_title">반품</strong>
                                                    <span class="count" id="RT"></span>
                                                </a>
                                            </li>
                                            <li id="tab_refund" class="tab">
                                                <a href="#" class="tab_button">
                                                    <span class="tab_thum thum_refund"></span>
                                                    <strong class="tab_title">환불</strong>
                                                    <span class="count" id="RF"></span>
                                                </a>
                                            </li>
                                        </ol>
                                    </div>
                                </div>
                            </div>

                            <!-- 취소 -->
                            <div class="col-md-12 content_cancel">
                                <div class="card">
                                    <div class="card-header border-0">
                                        <h3 class="card-title">취소</h3><br/>
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr class="table_color">
                                                	<th style="width: 30px"></th>
                                                    <th>주문번호</th>
                                                    <th>취소신청일</th>
                                                    <th>주문일자</th>
                                                    <th>주문자</th>
                                                    <th>연락처</th>
                                                    <th>상품정보</th>
                                                    <th>취소 금액</th>
                                                    <th>결제수단</th>
                                                    <th>결제상태</th>
                                                    <th>취소처리</th>
                                                    <th width='54px'>메모</th>
                                                </tr>
                                            </thead>
                                            <tbody id="cancel_list">
                                            	<c:choose>
                                            		<c:when test="${output == null || fn:length(output) == 0}">
									                    <tr>
									                        <td colspan="12" align="center">조회결과가 없습니다.</td>
									                    </tr>
								                    </c:when>
								                    <c:otherwise>
								                    	<c:forEach var="item" items="${output }" varStatus="status">
								                    		<c:if test="${item.orderstatus=='CC'}">
				                                                <tr>
				                                                	<td>
				                                                		<input type='checkbox' class="check" name='chkcc[]' value="${item.orderno }">
				                                                		<input type='hidden' value="${item.orderstatus }" >
				                                                	</td>
				                                                    <td>${item.orderno }</td>
				                                                    <td>
				                                                    	<fmt:parseDate value="${item.ccdate}" var="ccdate" pattern="yyyy-MM-dd" />
				                                                    	<fmt:formatDate value="${ccdate }" pattern="yyyy-MM-dd" />
			                                                    	</td>
			                                                    	<td>
				                                                    	<fmt:parseDate value="${item.regdate}" var="regdate" pattern="yyyy-MM-dd" />
				                                                    	<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" />
			                                                    	</td>
				                                                    <td>${item.name }</td>
				                                                    <td>
				                                                    	0<fmt:formatNumber var="phoneno" value="${item.phoneno }" pattern="###,####,####" />
				                                                    	<c:out value="${fn:replace(phoneno, ',', '-') }" />
			                                                    	</td>
				                                                    <td>${item.pname }</td>
				                                                    <td>
				                                                    	&#8361; <fmt:formatNumber pattern="###,###,###" value='${item.totalprice }'/>
				                                                    </td>
				                                                    <td>
				                                                    	<c:if test="${item.paytype=='C' }">
				                                                    		신용카드
				                                                    	</c:if>
				                                                    	<c:if test="${item.paytype=='D' }">
				                                                    		무통장입금
				                                                    	</c:if>
				                                                    	<c:if test="${item.paytype=='M' }">
				                                                    		휴대폰결제
				                                                    	</c:if>
				                                                    	<c:if test="${item.paytype=='D2' }">
				                                                    		실시간계좌이체
				                                                    	</c:if>
				                                                    </td>
				                                                    <td>
				                                                    	<c:if test="${item.paystatus=='N' }">
				                                                    		결제전
				                                                    	</c:if>
				                                                    	<c:if test="${item.paystatus=='Y' }">
				                                                    		결제완료
				                                                    	</c:if>
				                                                    </td>
				                                                    <td>
				                                                    	<c:if test="${item.ccstatus=='I' }">
				                                                    		처리중
				                                                    	</c:if>
				                                                    	<c:if test="${item.ccstatus=='C' }">
				                                                    		처리완료
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
                                        <button type="button" class="btn btn-block btn-danger btn-sm select_complete" id="cc_complete">처리완료</button>
                                    </div>
                                    <!--페이지 네이션-->
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
                                    <!--페이지네이션 끝-->
                                </div>
                            </div>
                            
                            <!-- 교환 -->
                            <div class="col-md-12 content_change">
                                <div class="card">
                                    <div class="card-header border-0">
                                        <h3 class="card-title">교환</h3><br/>
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr class="table_color">
                                                	<th style="width: 10px"></th>
                                                    <th>주문번호</th>
                                                    <th>교환신청일</th>
                                                    <th>주문일자</th>
                                                    <th>주문자</th>
                                                    <th>상품정보</th>
                                                    <th>수량</th>
                                                    <th>결제상태</th>
                                                    <th>교환처리</th>
                                                    <th width='54px'>메모</th>
                                                </tr>
                                            </thead>
                                            <tbody id="cancel_list">
                                            	<c:choose>
                                            		<c:when test="${output == null || fn:length(output) == 0}">
									                    <tr>
									                        <td colspan="10" align="center">조회결과가 없습니다.</td>
									                    </tr>
								                    </c:when>
								                    <c:otherwise>
								                    	<c:forEach var="item" items="${output }" varStatus="status">
								                    		<c:if test="${item.orderstatus=='CH' && item.paystatus=='Y'}">
				                                                <tr>
				                                                	<td>
				                                                		<input type='checkbox' class="check" name='chkch[]' value="${item.orderno }">
				                                                		<input type='hidden' value="${item.orderstatus }" >
				                                                	</td>
				                                                    <td>${item.orderno }</td>
				                                                    <td>
				                                                    	<fmt:parseDate value="${item.ccdate}" var="ccdate" pattern="yyyy-MM-dd" />
				                                                    	<fmt:formatDate value="${ccdate }" pattern="yyyy-MM-dd" />
			                                                    	</td>
			                                                    	<td>
				                                                    	<fmt:parseDate value="${item.regdate}" var="regdate" pattern="yyyy-MM-dd" />
				                                                    	<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" />
			                                                    	</td>
				                                                    <td>${item.name }</td>
				                                                    <td>${item.pname }</td>
				                                                    <td>${item.ea }</td>
				                                                    <td>
				                                                    	<c:if test="${item.paystatus=='N' }">
				                                                    		결제전
				                                                    	</c:if>
				                                                    	<c:if test="${item.paystatus=='Y' }">
				                                                    		결제완료
				                                                    	</c:if>
				                                                    </td>
				                                                    <td>
				                                                    	<c:if test="${item.ccstatus=='I' }">
				                                                    		처리중
				                                                    	</c:if>
				                                                    	<c:if test="${item.ccstatus=='C' }">
				                                                    		처리완료
				                                                    	</c:if>
				                                                    </td>
				                                                    <td class="clear">
				                                                    	<c:choose>
					                                                    	<c:when test="${orderitem.request != null }">
						                                                        <button type="button" class="btn btn-secondary btn-xs memo user_selected">user</button>
						                                                        <p class="user_memo">
						                                                        	${orderitem.request }
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
                                        <button type="button" class="btn btn-block btn-danger btn-sm select_complete" id="ch_complete">처리완료</button>
                                    </div>
                                    <!--페이지 네이션-->
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
                                    <!--페이지네이션 끝-->
                                </div>
                            </div>

                            <!-- 반품 -->
                            <div class="col-md-12 content_return">
                                <div class="card">
                                    <div class="card-header border-0">
                                        <h3 class="card-title">반품</h3><br/>
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr class="table_color">
                                                	<th style="width: 10px"></th>
                                                    <th>주문번호</th>
                                                    <th>반품신청일</th>
                                                    <th>주문일자</th>
                                                    <th>주문자</th>
                                                    <th>상품정보</th>
                                                    <th>수량</th>
                                                    <th>결제상태</th>
                                                    <th>반품처리</th>
                                                    <th width='54px'>메모</th>
                                                </tr>
                                            </thead>
                                            <tbody id="cancel_list">
                                            	<c:choose>
                                            		<c:when test="${output == null || fn:length(output) == 0}">
									                    <tr>
									                        <td colspan="10" align="center">조회결과가 없습니다.</td>
									                    </tr>
								                    </c:when>
								                    <c:otherwise>
								                    	<c:forEach var="item" items="${output }" varStatus="status">
								                    		<c:if test="${item.orderstatus=='RT' && item.paystatus=='Y'}">
				                                                <tr>
				                                                	<td>
				                                                		<input type='checkbox' class="check" name='chkrt[]' value="${item.orderno }">
				                                                		<input type='hidden' value="${item.orderstatus }" >
		                                                			</td>
				                                                    <td>${item.orderno }</td>
				                                                    <td>
				                                                    	<fmt:parseDate value="${item.ccdate}" var="ccdate" pattern="yyyy-MM-dd" />
				                                                    	<fmt:formatDate value="${ccdate }" pattern="yyyy-MM-dd" />
			                                                    	</td>
			                                                    	<td>
				                                                    	<fmt:parseDate value="${item.regdate}" var="regdate" pattern="yyyy-MM-dd" />
				                                                    	<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" />
			                                                    	</td>
				                                                    <td>${item.name }</td>
				                                                    <td>${item.pname }</td>
				                                                    <td>${item.ea }</td>
				                                                    <td>
				                                                    	<c:if test="${item.paystatus=='N' }">
				                                                    		결제전
				                                                    	</c:if>
				                                                    	<c:if test="${item.paystatus=='Y' }">
				                                                    		결제완료
				                                                    	</c:if>
				                                                    </td>
				                                                    <td>
				                                                    	<c:if test="${item.ccstatus=='I' }">
				                                                    		처리중
				                                                    	</c:if>
				                                                    	<c:if test="${item.ccstatus=='C' }">
				                                                    		처리완료
				                                                    	</c:if>
				                                                    </td>
				                                                    <td class="clear">
				                                                    	<c:choose>
					                                                    	<c:when test="${orderitem.request != null }">
						                                                        <button type="button" class="btn btn-secondary btn-xs memo user_selected">user</button>
						                                                        <p class="user_memo">
						                                                        	${orderitem.request }
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
                                        <button type="button" class="btn btn-block btn-danger btn-sm select_complete" id="rt_complete">처리완료</button>
                                    </div>
                                    <!--페이지 네이션-->
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
                                    <!--페이지네이션 끝-->
                                </div>
                            </div>

                            <!-- 환불 -->
                            <div class="col-md-12 content_refund">
                                <div class="card">
                                    <div class="card-header border-0">
                                        <h3 class="card-title">환불</h3><br/>
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr class="table_color">
                                                	<th style="width: 10px"></th>
                                                    <th>주문번호</th>
                                                    <th>환불신청일</th>
                                                    <th>주문일자</th>
                                                    <th>주문자</th>
                                                    <th>총 수량</th>
                                                    <th>총 환불액</th>
                                                    <th>쿠폰</th>
                                                    <th>적립금</th>
                                                    <th>환불수단</th>
                                                    <th>처리상태</th>
                                                    <th width='54px'>메모</th>
                                                </tr>
                                            </thead>
                                            <tbody id="cancel_list">
                                            	<c:choose>
                                            		<c:when test="${output == null || fn:length(output) == 0}">
									                    <tr>
									                        <td colspan="12" align="center">조회결과가 없습니다.</td>
									                    </tr>
								                    </c:when>
								                    <c:otherwise>
								                    	<c:forEach var="item" items="${output }" varStatus="status">
								                    		<c:if test="${item.orderstatus=='RF' && item.paystatus=='Y'}">
				                                                <tr>
				                                                	<td>
				                                                		<input type='checkbox' class="check" name='chkrf[]' value="${item.orderno }">
				                                                		<input type='hidden' value="${item.orderstatus }" >
				                                                	</td>
				                                                    <td>${item.orderno }</td>
				                                                    <td>
				                                                    	<fmt:parseDate value="${item.ccdate}" var="ccdate" pattern="yyyy-MM-dd" />
				                                                    	<fmt:formatDate value="${ccdate }" pattern="yyyy-MM-dd" />
			                                                    	</td>
				                                                	<td>
				                                                    	<fmt:parseDate value="${item.regdate}" var="regdate" pattern="yyyy-MM-dd" />
				                                                    	<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" />
			                                                    	</td>
				                                                    <td>${item.name }</td>
				                                                    <td>${item.ea }</td>
				                                                    <td>
				                                                    	&#8361; <fmt:formatNumber pattern="###,###,###" value='${item.totalprice }'/>
				                                                    </td>
				                                                    <td>
				                                                    	<c:choose>
				                                                    		<c:when test="${item.distype=='W' }">
				                                                    			${item.c_name }, &#8361; <fmt:formatNumber pattern="###,###,###" value='${item.discount }'/>
				                                                    		</c:when>
				                                                    		<c:when test="${item.distype=='P' }">
				                                                    			${item.c_name }, &#8361; <fmt:formatNumber pattern="###,###,###" value='${(item.price * item.ea) * (item.discount * 1/100) }'/> %
				                                                    		</c:when>
				                                                    		<c:otherwise>
				                                                    			사용안함
				                                                    		</c:otherwise>
				                                                    	</c:choose>
				                                                    </td>
				                                                    <td>
				                                                    	&#8361; <fmt:formatNumber pattern="###,###,###" value='${item.point }'/>
				                                                    </td>
				                                                    <td>
				                                                    	<c:if test="${item.paytype=='C' }">
				                                                    		신용카드
				                                                    	</c:if>
				                                                    	<c:if test="${item.paytype=='D' }">
				                                                    		무통장입금
				                                                    	</c:if>
				                                                    	<c:if test="${item.paytype=='M' }">
				                                                    		휴대폰결제
				                                                    	</c:if>
				                                                    	<c:if test="${item.paytype=='D2' }">
				                                                    		실시간계좌이체
				                                                    	</c:if>
				                                                    </td>
				                                                    <td>
				                                                    	<c:if test="${item.ccstatus=='I' }">
				                                                    		처리중
				                                                    	</c:if>
				                                                    	<c:if test="${item.ccstatus=='C' }">
				                                                    		처리완료
				                                                    	</c:if>
				                                                    </td>
				                                                    <td width='54' align='center' class="clear">
				                                                    	<c:choose>
					                                                    	<c:when test="${orderitem.request != null }">
						                                                        <button type="button" class="btn btn-secondary btn-xs memo user_selected">user</button>
						                                                        <p class="user_memo">
						                                                        	${orderitem.request }
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
                                        <button type="button" class="btn btn-block btn-danger btn-sm select_complete" id="rf_complete">처리완료</button>
                                    </div>
                                    <!--페이지 네이션-->
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
                                    <!--페이지네이션 끝-->
                                </div>
                            </div>
                        </div>
					</div>
				</div>
			</div>
		</div>
		<!-- /wrapper  끝-->
	</section>
	<footer></footer>

	<script type="text/javascript">
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
        });
        
		/* 상단 메뉴 탭 관리 */
        $(function() {
            $(document).ready(function() {
	            $(".content_change").hide();
	            $(".content_return").hide();
	            $(".content_refund").hide();
	            
	            // 상단 탭 수량표시
	            var countcc = $("input:checkbox[name='chkcc[]']").length;
	            $("#CC").html(countcc);
	            
	            var countch = $("input:checkbox[name='chkch[]']").length;
	            $("#CH").html(countch);
	            
	            var countrt = $("input:checkbox[name='chkrt[]']").length;
	            $("#RT").html(countrt);
	            
	            var countrf = $("input:checkbox[name='chkrf[]']").length;
	            $("#RF").html(countrf);
            });

            /** 탭 아이콘 클릭제어 */
            $(document).on("click", ".tab", function(e) {
            	e.preventDefault();

            	// 탭 아이콘 클릭시 색 변화
            	$(this).addClass("selected");
            	$(".tab").not(this).removeClass("selected");
            	
            	// 탭 아이콘 클릭시 전체 체크박스 해제
            	if ($(".check").is(":checked")) {
	            	$(".check").prop("checked", false);
	            }
            });

            /** 탭 아이콘 클릭시 내용 전환 */
            $(document).on("click", "#tab_cancel", function(e) {
            	e.preventDefault();

            	$(".content_cancel").show();
            	$(".content_change").hide();
            	$(".content_return").hide();
	            $(".content_refund").hide();
            });

            $(document).on("click", "#tab_change", function(e) {
    	        e.preventDefault();
	
    	        $(".content_cancel").hide();
        	    $(".content_change").show();
            	$(".content_return").hide();
            	$(".content_refund").hide();
            });

            $(document).on("click", "#tab_return", function(e) {
            	e.preventDefault();

	            $(".content_cancel").hide();
    	        $(".content_change").hide();
        	    $(".content_return").show();
            	$(".content_refund").hide();
            });

            $(document).on("click", "#tab_refund", function(e) {
	            e.preventDefault();
	
    	        $(".content_cancel").hide();
        	    $(".content_change").hide();
            	$(".content_return").hide();
            	$(".content_refund").show();
            });
        });

        /* 취소 처리완료 버튼 */
		$(document).on("click","#cc_complete", function() {
			
			var current = null;													// 체크된 요소 담을 객체
			var count = $("input:checkbox[name='chkcc[]']").length;				// 총 갯수
			var ckcount = $("input:checkbox[name='chkcc[]']:checked").length;	// 체크된 요소 갯수

			for (var i=0; i<count; i++) {
				if(ckcount != 1) {
					alert("주문정보 한개씩 선택해 주세요.");
					break;
				} else {
					current = $("input:checkbox[name='chkcc[]']:checked");		// 체크된 주문정보
				}
			}
			
			var orderno = $(current).val();
			var orderstatus = $(current).next().val();
			var ccstatus = "C";
			if (!confirm("해당 주문은 처리완료 상태가 됩니다.")) {
				return false;
			}
			
			// put 메서드로 ajax 요청
			$.put("${pageContext.request.contextPath}/11_admin/admin_cancel", {
				"orderno":orderno,
				"orderstatus":orderstatus,
				"ccstatus":ccstatus
			}, function(json) {
				if(json.rt == "OK") {
					alert("변경되었습니다");
					// 변경 완료 후 목록 페이지 이동
					window.location = "${pageContext.request.contextPath}/11_admin/admin_cancel.do";
				}
			});
		});
        
		/* 교환 처리완료 버튼 */
		$(document).on("click","#ch_complete", function() {
			
			var current = null;														// 체크된 요소 담을 객체
			var count = $("input:checkbox[name='chkch[]']").length;					// 총 갯수
			var ckcount = $("input:checkbox[name='chkch[]']:checked").length;		// 체크된 요소 갯수

			for (var i=0; i<count; i++) {
				if(ckcount != 1) {
					alert("주문정보 한개씩 선택해 주세요.");
					break;
				} else {
					current = $("input:checkbox[name='chkch[]']:checked");	// 체크된 주문정보
				}
			}
			
			var orderno = $(current).val();
			var orderstatus = $(current).next().val();
			var ccstatus = "C";
			if (!confirm("해당 주문은 처리완료 상태가 됩니다.")) {
				return false;
			}
			
			// put 메서드로 ajax 요청
			$.put("${pageContext.request.contextPath}/11_admin/admin_cancel", {
				"orderno":orderno,
				"orderstatus":orderstatus,
				"ccstatus":ccstatus
			}, function(json) {
				if(json.rt == "OK") {
					alert("변경되었습니다");
					// 변경 완료 후 목록 페이지 이동
					window.location = "${pageContext.request.contextPath}/11_admin/admin_cancel.do";
				}
			});
		});
		
		/* 반품 처리완료 버튼 */
		$(document).on("click","#rt_complete", function() {
			
			var current = null;														// 체크된 요소 담을 객체
			var count = $("input:checkbox[name='chkrt[]']").length;					// 총 갯수
			var ckcount = $("input:checkbox[name='chkrt[]']:checked").length;		// 체크된 요소 갯수

			for (var i=0; i<count; i++) {
				if(ckcount != 1) {
					alert("주문정보 한개씩 선택해 주세요.");
					break;
				} else {
					current = $("input:checkbox[name='chkrt[]']:checked");	// 체크된 주문정보
				}
			}
			
			var orderno = $(current).val();
			var orderstatus = $(current).next().val();
			var ccstatus = "C";
			if (!confirm("해당 주문은 처리완료 상태가 됩니다.")) {
				return false;
			}
			
			// put 메서드로 ajax 요청
			$.put("${pageContext.request.contextPath}/11_admin/admin_cancel", {
				"orderno":orderno,
				"orderstatus":orderstatus,
				"ccstatus":ccstatus
			}, function(json) {
				if(json.rt == "OK") {
					alert("변경되었습니다");
					// 변경 완료 후 목록 페이지 이동
					window.location = "${pageContext.request.contextPath}/11_admin/admin_cancel.do";
				}
			});
		});
		
		/* 환불 처리완료 버튼 */
		$(document).on("click","#rf_complete", function() {
			
			var current = null;														// 체크된 요소 담을 객체
			var count = $("input:checkbox[name='chkrf[]']").length;					// 총 갯수
			var ckcount = $("input:checkbox[name='chkrf[]']:checked").length;		// 체크된 요소 갯수

			for (var i=0; i<count; i++) {
				if(ckcount != 1) {
					alert("주문정보 한개씩 선택해 주세요.");
					break;
				} else {
					current = $("input:checkbox[name='chkrf[]']:checked");	// 체크된 주문정보
				}
			}
			
			var orderno = $(current).val();
			var orderstatus = $(current).next().val();
			var ccstatus = "C";
			if (!confirm("해당 주문은 처리완료 상태가 됩니다.")) {
				return false;
			}
			
			// put 메서드로 ajax 요청
			$.put("${pageContext.request.contextPath}/11_admin/admin_cancel", {
				"orderno":orderno,
				"orderstatus":orderstatus,
				"ccstatus":ccstatus
			}, function(json) {
				if(json.rt == "OK") {
					alert("변경되었습니다");
					// 변경 완료 후 목록 페이지 이동
					window.location = "${pageContext.request.contextPath}/11_admin/admin_cancel.do";
				}
			});
		});
        
	</script>
</body>
</html>