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
                                <li class="active"><a href="${pageContext.request.contextPath}/11_admin/admin_delivery.do">
                                    <i class="glyphicon glyphicon-transfer"></i> 배송정보 관리</a></li>
                                <li><a href="${pageContext.request.contextPath}/11_admin/admin_cancel.do">
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
								<h2 class="m-0">배송 관리</h2>
							</div>
							<!-- /.col -->
							<div class="col-sm-6 clearfix">
								<ol class="breadcrumb pull-right">
									<li class="breadcrumb-item"><a href="#">주문 관리</a></li>
									<li class="breadcrumb-item active">배송 관리</li>
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
                                                    <strong class="tab_title">결제확인</strong><br/>
                                                    <span class="count" id="N"></span>
                                                </a>
                                            </li>
                                            <li id="tab_ready" class="tab">
                                                <a href="#" class="tab_button">
                                                    <span class="tab_thum thum_ready"></span>
                                                    <strong class="tab_title">배송 준비 중</strong><br/>
                                                    <span class="count" id="R"></span>
                                                </a>
                                            </li>
                                            <li id="tab_stanby" class="tab">
                                                <a href="#" class="tab_button">
                                                    <span class="tab_thum thum_stanby"></span>
                                                    <strong class="tab_title">배송 대기</strong><br/>
                                                    <span class="count" id="S"></span>
                                                </a>
                                            </li>
                                            <li id="tab_delivery" class="tab">
                                                <a href="#" class="tab_button">
                                                    <span class="tab_thum thum_delivery"></span>
                                                    <strong class="tab_title">배송 중</strong><br/>
                                                    <span class="count" id="D"></span>
                                                </a>
                                            </li>
                                            <li id="tab_complete" class="tab">
                                                <a href="#" class="tab_button">
                                                    <span class="tab_thum thum_complete"></span>
                                                    <strong class="tab_title">배송 완료</strong><br/>
                                                    <span class="count" id="C"></span>
                                                </a>
                                            </li>
                                        </ol>
                                    </div>
                                </div>
                            </div>

							<!-- 배송정보 입력 -->
							<div class="col-md-12" id="form_hidden">
                            	<div class="card">
                                    <div class="card-header border-0">
                                        <h3 class="card-title">배송 정보 입력</h3>
                            				<form id="delivery_form" action="${pageContext.request.contextPath}/11_admin/admin_delivery">
                            					<div>
										    		<label for="orderno">주문번호 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: </label>
										    		<input type="number" name="orderno" id="orderno" class="cfm_input" maxlength='5' oninput="maxLengthCheck(this)" placeholder="50,000 번대를 입력해주세요." value=""/>
										    	</div>
                            					<div>
										    		<label for="userno">회원번호 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: </label>
										    		<input type="number" name="userno" id="userno" class="cfm_input" maxlength='5' oninput="maxLengthCheck(this)" placeholder="10,000 번대를 입력해주세요." value=""/>
										    	</div>
										    	<div>
										    		<label for="trackingnum">운송장 번호 &nbsp;: </label>
										    		<input type="number" name="trackingnum" id="trackingnum" class="cfm_input" maxlength='6' oninput="maxLengthCheck(this)" placeholder="6자리의 숫자를 입력해주세요"/>
										    	</div>
										    	<div>
										    		<label for="deliverystatus1">배송 상태 &nbsp;&nbsp;&nbsp;&nbsp;: </label>
										    		<input type="radio" name="deliverystatus" id="deliverystatus" value="R" checked/> 배송 준비중
										    	</div>
										    	<button type="submit" class="btn btn-primary btn-sm" id="delivery_cfm">작성완료</button>
                            				</form>
                       				</div>
                   				</div>
               				</div>
							
                            <!-- 결제확인 -->
                            <div class="col-md-12 content_nopay">
                                <div class="card">
                                    <div class="card-header border-0">
                                        <h3 class="card-title">결제확인</h3>
                                        <button type="button" class="btn btn-block btn-danger btn-sm pull-right" id="select_delete">주문취소</button><br>
                                        <table class="table table-bordered delivery_table">
                                            <thead>
                                                <tr class="table_color">
                                                    <th style="width: 30px"></th>
                                                    <th>주문번호</th>
                                                    <th>주문일</th>
                                                    <th>주문자</th>
                                                    <th>연락처</th>
                                                    <th>주소</th>
                                                    <th>상품정보</th>
                                                    <th>총 금액</th>
                                                    <th>배송희망날짜</th>
                                                    <th>결제수단</th>
                                                    <th>결제상태</th>
                                                    <th style="width: 54px">메모</th>
                                                </tr>
                                            </thead>
                                            <tbody id="delivery_list">
                                            	<c:choose>
                                            		<c:when test="${output == null || fn:length(output) == 0}">
									                    <tr>
									                        <td colspan="12" align="center">조회결과가 없습니다.</td>
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
                                        <button type="button" class="btn btn-block btn-primary btn-sm select_complete" id="paytypechange">결제완료</button>
                                        <button type="button" class="btn btn-block btn-primary btn-sm select_complete" id="delivery_ready">배송준비</button>
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
        
                            <!-- 배송 준비 중 -->
                            <div class="col-md-12 content_ready">
                                <div class="card">
                                    <div class="card-header border-0">
                                        <h3 class="card-title">배송 준비 중</h3>
                                        <table class="table table-bordered delivery_table">
                                            <thead>
                                                <tr class="table_color">
                                                    <th style="width: 30px"></th>
                                                    <th>주문번호</th>
                                                    <th>주문일</th>
                                                    <th>주문자</th>
                                                    <th>연락처</th>
                                                    <th>주문자정보</th>
                                                    <th>배송일</th>
                                                    <th>운송장번호</th>
                                                    <th>상품정보</th>
                                                    <th>총 금액</th>
                                                    <th style="width: 54px">메모</th>
                                                </tr>
                                            </thead>
                                            <tbody id="delivery_list">
	                                            <c:choose>
                                            		<c:when test="${output == null || fn:length(output) == 0}">
									                    <tr>
									                        <td colspan="10" align="center">조회결과가 없습니다.</td>
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
                                        <button type="button" class="btn btn-block btn-primary btn-sm select_complete" id="delivery_stay">배송대기</button>
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
                            
                            <!-- 배송 대기 -->
                            <div class="col-md-12 content_stanby">
                                <div class="card">
                                    <div class="card-header border-0">
                                        <h3 class="card-title">배송 대기</h3>
                                        <table class="table table-bordered delivery_table">
                                            <thead>
                                                <tr class="table_color">
                                                    <th style="width: 30px"></th>
                                                    <th>주문번호</th>
                                                    <th>주문일</th>
                                                    <th>주문자</th>
                                                    <th>연락처</th>
                                                    <th>주문자정보</th>
                                                    <th>배송일</th>
                                                    <th>운송장번호</th>
                                                    <th>상품정보</th>
                                                    <th>총 금액</th>
                                                    <th style="width: 54px">메모</th>
                                                </tr>
                                            </thead>
                                            <tbody id="delivery_list">
                                            	<c:choose>
                                            		<c:when test="${output == null || fn:length(output) == 0}">
									                    <tr>
									                        <td colspan="10" align="center">조회결과가 없습니다.</td>
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
                                        <button type="button" class="btn btn-block btn-primary btn-sm select_complete" id="delivery_delivery">출고</button>
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

                            <!-- 배송 중 -->
                            <div class="col-md-12 content_delivery">
                                <div class="card">
                                    <div class="card-header border-0">
                                        <h3 class="card-title">배송 중</h3>
                                        <table class="table table-bordered delivery_table">
                                            <thead>
                                                <tr class="table_color">
                                                    <th style="width: 30px"></th>
                                                    <th>주문번호</th>
                                                    <th>주문일</th>
                                                    <th>주문자</th>
                                                    <th>연락처</th>
                                                    <th>주문자정보</th>
                                                    <th>배송일</th>
                                                    <th>운송장번호</th>
                                                    <th>상품정보</th>
                                                    <th>총 금액</th>
                                                    <th style="width: 54px">메모</th>
                                                </tr>
                                            </thead>
                                            <tbody id="delivery_list">
                                                <c:choose>
                                            		<c:when test="${output == null || fn:length(output) == 0}">
									                    <tr>
									                        <td colspan="10" align="center">조회결과가 없습니다.</td>
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
                                        <button type="button" class="btn btn-block btn-primary btn-sm select_complete" id="delivery_complete">배송완료</button>
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

                            <!-- 배송 완료 -->
                            <div class="col-md-12 content_complete">
                                <div class="card">
                                    <div class="card-header border-0">
                                        <h3 class="card-title">배송 완료</h3>
                                        <button type="button" class="btn btn-block btn-danger btn-sm pull-right" id="delivery_delete">배송삭제</button><br>
                                        <table class="table table-bordered delivery_table">
                                            <thead>
                                                <tr class="table_color">
                                                    <th style="width: 30px"></th>
                                                    <th>주문번호</th>
                                                    <th>주문일</th>
                                                    <th>주문자</th>
                                                    <th>연락처</th>
                                                    <th>주문자정보</th>
                                                    <th>배송일</th>
                                                    <th>운송장번호</th>
                                                    <th>상품정보</th>
                                                    <th>총 금액</th>
                                                    <th style="width: 54px">메모</th>
                                                </tr>
                                            </thead>
                                            <tbody id="delivery_list">
                                                <c:choose>
                                            		<c:when test="${output == null || fn:length(output) == 0}">
									                    <tr>
									                        <td colspan="10" align="center">조회결과가 없습니다.</td>
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

    <!-- Handlebar CDN 참조 -->
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
        
        /* input 숫자타입 최대 글자수 */
        function maxLengthCheck(object){
            if (object.value.length > object.maxLength){
              object.value = object.value.slice(0, object.maxLength);
            }    
          }
        
        /* 상단 메뉴 탭 관리 */
        $(function() {
            $(document).ready(function() {
	            $(".content_ready").hide();
	            $(".content_stanby").hide();
	            $(".content_delivery").hide();
	            $(".content_complete").hide();
	            $("#form_hidden").hide();
	            
	            // 상단 탭 수량표시
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

        /* 배송준비 버튼 toggle */
        $("#delivery_ready").click(function() {
        	$("#form_hidden").slideToggle(200);
        });
		
        /* 선택한 요소 */
        $(document).on("click",".check", function() {
        	var current = $("input:checkbox[name='chkn[]']:checked");														// 체크된 요소 담을 객체
			var orderno = $(current).parent().next().html();
			var userno = $(current).next().val();
			$("#orderno").val(orderno);
			$("#userno").val(userno);
        });
        
        /* 작성완료 버튼 */
        $(function() {
    		$("#delivery_form").ajaxForm({
    			method:"POST",
    			success: function(json) {
    				console.log(json);
    				
    				if (json.rt == "OK") {
    					alert("해당 주문은 배송준비 상태가 됩니다.")
    					window.location = "${pageContext.request.contextPath}/11_admin/admin_delivery.do?";
    				}
    			}
    		});
    	});
        
        /* 주문취소 버튼 */
		$(document).on("click","#select_delete", function() {
			
			var current = null;														// 체크된 요소 담을 객체
			var count = $("input:checkbox[name='chkn[]']").length;					// 총 갯수
			var ckcount = $("input:checkbox[name='chkn[]']:checked").length;		// 체크된 요소 갯수
				
			for (var i=0; i<count; i++) {
				if(ckcount != 1) {
					alert("주문정보 한개씩 선택해 주세요.");
					break;
				} else {
					current = $("input:checkbox[name='chkn[]']:checked").val();		// 체크된 주문정보
				}
			}
			
			var orderno = current;
			var paystatus = $(this).parent().find(".paystatus").val();
			var orderstatus = "CC";
			var ccstatus = "I";
			if (!confirm("해당 주문건은 관리자에 의해 취소 됩니다.")) {
				return false;
			}
			
			// put 메서드로 ajax 요청
			$.put("${pageContext.request.contextPath}/11_admin/admin_delivery", {
				"orderno":orderno,
				"paystatus":paystatus,
				"orderstatus":orderstatus,
				"ccstatus":ccstatus
			}, function(json) {
				if(json.rt == "OK") {
					alert("주문취소처리 되었습니다");
					// 변경 완료 후 목록 페이지 이동
					window.location = "${pageContext.request.contextPath}/11_admin/admin_cancel.do";
				}
			});
		});
        
        /* 결제완료 버튼 */
		$(document).on("click","#paytypechange", function() {
			
			var current = null;														// 체크된 요소 담을 객체
			var count = $("input:checkbox[name='chkn[]']").length;					// 총 갯수
			var ckcount = $("input:checkbox[name='chkn[]']:checked").length;		// 체크된 요소 갯수
				
			for (var i=0; i<count; i++) {
				if(ckcount != 1) {
					alert("주문정보 한개씩 선택해 주세요.");
					break;
				} else {
					current = $("input:checkbox[name='chkn[]']:checked").val();		// 체크된 주문정보
				}
			}
			
			var orderno = current;
			var paystatus = "Y";
			if (!confirm("주문번호 " + orderno + "을 결제완료처리 하시겠습니까?")) {
				return false;
			}
			// put 메서드로 ajax 요청
			$.put("${pageContext.request.contextPath}/11_admin/admin_delivery", {
				"orderno":orderno,
				"paystatus":paystatus
			}, function(json) {
				if(json.rt == "OK") {
					alert("변경되었습니다");
					// 변경 완료 후 목록 페이지 이동
					window.location = "${pageContext.request.contextPath}/11_admin/admin_delivery.do";
				}
			});
		});
        
		/* 배송대기 버튼 */
		$(document).on("click","#delivery_stay", function() {
			
			var current = null;														// 체크된 요소 담을 객체
			var count = $("input:checkbox[name='chkr[]']").length;					// 총 갯수
			var ckcount = $("input:checkbox[name='chkr[]']:checked").length;		// 체크된 요소 갯수
				
			for (var i=0; i<count; i++) {
				if(ckcount != 1) {
					alert("주문정보 한개씩 선택해 주세요.");
					break;
				} else {
					current = $("input:checkbox[name='chkr[]']:checked").val();		// 체크된 주문정보
				}
			}
			
			var deliveryno = current;
			var deliverystatus = "S";
			if (!confirm("해당 주문은 배송대기 상태가 됩니다.")) {
				return false;
			}
			
			// put 메서드로 ajax 요청
			$.put("${pageContext.request.contextPath}/11_admin/admin_delivery", {
				"deliveryno":deliveryno,
				"deliverystatus":deliverystatus
			}, function(json) {
				if(json.rt == "OK") {
					alert("변경되었습니다");
					// 변경 완료 후 목록 페이지 이동
					window.location = "${pageContext.request.contextPath}/11_admin/admin_delivery.do";
				}
			});
		});
		
		/* 배송중 버튼 */
		$(document).on("click","#delivery_delivery", function() {
			
			var current = null;														// 체크된 요소 담을 객체
			var count = $("input:checkbox[name='chks[]']").length;					// 총 갯수
			var ckcount = $("input:checkbox[name='chks[]']:checked").length;		// 체크된 요소 갯수

			for (var i=0; i<count; i++) {
				if(ckcount != 1) {
					alert("주문정보 한개씩 선택해 주세요.");
					break;
				} else {
					current = $("input:checkbox[name='chks[]']:checked").val();		// 체크된 주문정보
				}
			}
			
			var deliveryno = current;
			var deliverystatus = "D";
			if (!confirm("해당 주문은 배송중 상태가 됩니다.")) {
				return false;
			}
			
			// put 메서드로 ajax 요청
			$.put("${pageContext.request.contextPath}/11_admin/admin_delivery", {
				"deliveryno":deliveryno,
				"deliverystatus":deliverystatus
			}, function(json) {
				if(json.rt == "OK") {
					alert("변경되었습니다");
					// 변경 완료 후 목록 페이지 이동
					window.location = "${pageContext.request.contextPath}/11_admin/admin_delivery.do";
				}
			});
		});
		
		/* 배송완료 버튼 */
		$(document).on("click","#delivery_complete", function() {
			
			var current = null;														// 체크된 요소 담을 객체
			var count = $("input:checkbox[name='chkd[]']").length;					// 총 갯수
			var ckcount = $("input:checkbox[name='chkd[]']:checked").length;		// 체크된 요소 갯수
				
			for (var i=0; i<count; i++) {
				if(ckcount != 1) {
					alert("주문정보 한개씩 선택해 주세요.");
					break;
				} else {
					current = $("input:checkbox[name='chkd[]']:checked");		// 체크된 주문정보
				}
			}
			
			var deliveryno = current.val();
			//var userno = current.next().data('userno');					// 해당 고객번호
			//var point = Math.round(current.next().data('point'));		// 적립될 포인트
			//console.log(userno);
			//console.log(point);
			var deliverystatus = "C";
			if (!confirm("해당 주문은 배송완료 상태가 됩니다.")) {
				return false;
			}
			
			// put 메서드로 ajax 요청
			$.put("${pageContext.request.contextPath}/11_admin/admin_delivery", {
				"deliveryno":deliveryno,
				//"userno":userno,
				//"point":point,
				"deliverystatus":deliverystatus
			}, function(json) {
				if(json.rt == "OK") {
					alert("변경되었습니다");
					// 변경 완료 후 목록 페이지 이동
					window.location = "${pageContext.request.contextPath}/11_admin/admin_delivery.do";
				}
			});
		});
		
		/* 배송삭제 버튼 */
		$(document).on("click","#delivery_delete", function() {
			
			var current = null;														// 체크된 요소 담을 객체
			var count = $("input:checkbox[name='chkc[]']").length;					// 총 갯수
			var ckcount = $("input:checkbox[name='chkc[]']:checked").length;		// 체크된 요소 갯수
				
			for (var i=0; i<count; i++) {
				if(ckcount != 1) {
					alert("주문정보 한개씩 선택해 주세요.");
					break;
				} else {
					current = $("input:checkbox[name='chkc[]']:checked").val();		// 체크된 주문정보
				}
			}
			
			var deliveryno = current;
			if (!confirm("해당 배송건은 관리자에 의해 삭제 됩니다.")) {
				return false;
			}
			
			// delete 메서드로 ajax 요청
			$.delete("${pageContext.request.contextPath}/11_admin/admin_delivery", {
				"deliveryno":deliveryno
			}, function(json) {
				if(json.rt == "OK") {
					alert("배송삭제처리 되었습니다");
					// 변경 완료 후 목록 페이지 이동
					window.location = "${pageContext.request.contextPath}/11_admin/admin_cancel.do";
				}
			});
		});
        
    </script>
</body>
</html>