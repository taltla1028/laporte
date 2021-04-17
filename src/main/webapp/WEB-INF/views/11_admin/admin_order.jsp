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
<link rel="stylesheet" href="../assets/css/admin_order.css">

<!-- javascript -->
<script src="http://code.jquery.com/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<!-- ajax-helper -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.css" />
<script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
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
                                <li class="active"><a href="${pageContext.request.contextPath}/11_admin/admin_order.do">
                                    <i class="glyphicon glyphicon-shopping-cart"></i> 주문내역 관리</a></li>
                                <li><a href="${pageContext.request.contextPath}/11_admin/admin_delivery.do">
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
								<h2 class="m-0">주문 관리</h2>
							</div>
							<!-- /.col -->
							<div class="col-sm-6 clearfix">
								<ol class="breadcrumb pull-right">
									<li class="breadcrumb-item"><a href="#">홈</a></li>
									<li class="breadcrumb-item active">주문 관리</li>
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
                            <!-- 검색 -->
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header border-0">
                                        <div class="search_box">
                                            <table class="search_table">
                                                <tr>
                                                    <td class="search_title">주문자이름</td>
                                                    <td class="search_data">
                                                    	<form method="get" action="${pageContext.request.contextPath}/11_admin/admin_order.do">
                                                    		<select name="searchOption">
	                                                            <optgroup label="-검색항목선택-"></optgroup>
	                                                            <option value="name">주문자명</option>
	                                                            <option value="orderno">주문번호</option>
                                                       		</select>
	                                                        <input id="order_name" type="search" name="keyword" value="${keyword}">
				                                            <button type="submit" class="btn btn-primary" id="search_submit">검색</button>
			                                            </form>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        
                            <!-- 주문내역 -->
                            <div class="col-md-12 content_nopay">
                                <div class="card">
                                    <div class="card-header border-0">
                                        <h3 class="card-title">주문 내역</h3><br/>
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr class="table_color">
                                                    <th>주문번호</th>
                                                    <th>주문일</th>
                                                    <th>주문자</th>
                                                    <th>연락처</th>
                                                    <th>상품정보</th>
                                                    <th>총 금액</th>
                                                    <th>결제수단</th>
                                                    <th>결제상태</th>
                                                    <th>배송희망날짜</th>
                                                    <th>배송상태</th>
                                                    <th>주문상태</th>
                                                    <th width='54px' >메모</th>
                                                </tr>
                                            </thead>
                                            <tbody id="order_list">
                                            	<c:choose>
                                            		<c:when test="${output == null || fn:length(output) == 0}">
									                    <tr>
									                        <td colspan="11" align="center">조회결과가 없습니다.</td>
									                    </tr>
								                    </c:when>
								                    <c:otherwise>
	                                            		<c:forEach var="item" items="${output }" varStatus="status">
			                                                <tr>
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
			                                                    <td>${item.pname }</td>
			                                                    <td>
			                                                    	&#8361; <fmt:formatNumber pattern="###,###,###" value='${item.totalprice }'/>
		                                                    	</td>
			                                                    <td>
			                                                    	<c:if test="${item.paytype=='C'}">
			                                                    		신용카드
			                                                    	</c:if>
			                                                    	<c:if test="${item.paytype=='D'}">
			                                                    		무통장입금
		                                                    		</c:if>
		                                                    		<c:if test="${item.paytype=='M'}">
			                                                    		휴대폰결제
		                                                    		</c:if>
		                                                    		<c:if test="${item.paytype=='D2'}">
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
			                                                    	<fmt:parseDate value="${item.deldate}" var="deldate" pattern="yyyy-MM-dd" />
			                                                    	<fmt:formatDate value="${deldate }" pattern="yyyy-MM-dd" />
			                                                    </td>
			                                                    <td>
			                                                    	<c:choose>
				                                                    	<c:when test="${deliveryOutput[status.index].deliverystatus=='N' }">
				                                                    		결제 확인 중
				                                                    	</c:when>
				                                                    	<c:when test="${deliveryOutput[status.index].deliverystatus=='R' }">
				                                                    		준비중
				                                                    	</c:when>
				                                                    	<c:when test="${deliveryOutput[status.index].deliverystatus=='S' }">
				                                                    		배송대기
				                                                    	</c:when>
				                                                    	<c:when test="${deliveryOutput[status.index].deliverystatus=='D' }">
				                                                    		배송중
				                                                    	</c:when>
				                                                    	<c:when test="${deliveryOutput[status.index].deliverystatus=='C' }">
				                                                    		배송완료
				                                                    	</c:when>
				                                                    	<c:otherwise>
				                                                    		관리자 확인 전
				                                                    	</c:otherwise>
			                                                    	</c:choose>
		                                                    	</td>
			                                                    <td>
			                                                    	<c:if test="${item.orderstatus=='N' }">
			                                                    		일반주문
			                                                    	</c:if>
			                                                    	<c:if test="${item.orderstatus=='CC' }">
			                                                    		취소
			                                                    	</c:if>
			                                                    	<c:if test="${item.orderstatus=='CH' }">
			                                                    		교환
			                                                    	</c:if>
			                                                    	<c:if test="${item.orderstatus=='RT' }">
			                                                    		반품
			                                                    	</c:if>
			                                                    	<c:if test="${item.orderstatus=='RF' }">
			                                                    		환불
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
                                                <%-- 이전 그룹에 대한 링크 --%>
                                                <c:choose>
                                                    <%-- 이전 그룹으로 이동 가능하다면? --%>
                                                    <c:when test="${pageData.prevPage > 0 }">
                                                        <%-- 이동할 URL 생성 --%>
                                                        <c:url value="${pageContext.request.contextPath}/11_admin/admin_order.do" var="prevPageUrl">
                                                            <c:param name="page" value="${pageData.prevPage}" />
                                                            <c:param name="keyword" value="${keyword }" />
                                                        </c:url>
                                                        <li class="page-item"><a class="page-link" href="${pageData.prevPage}">&laquo;</a></li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                                                    </c:otherwise>
                                                </c:choose>
                                                
                                                <%-- 페이지 번호 (시작 페이지 부터 끝 페이지까지 반복) --%>
                                                <c:forEach var="i" begin="${pageData.startPage}" end="${pageData.endPage}" varStatus="status">
                                                    <%-- 이동할 URL 생성 --%>
                                                    <c:url value="${pageContext.request.contextPath}/11_admin/admin_order.do" var="pageUrl">
                                                        <c:param name="page" value="${i}" />
                                                        <c:param name="keyword" value="${keyword}" />
                                                    </c:url>
                                                    
                                                    <%-- 페이지 번호 출력 --%>
                                                    <c:choose>
                                                        <%-- 현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
                                                        <c:when test="${pageData.nowPage == i}">
                                                            <li class="page-item"><span class="page-link"><strong>${i}</strong></span></li>
                                                        </c:when>
                                                        <%-- 나머지 페이지의 경우 링크 적용함 --%>
                                                        <c:otherwise>
                                                            <li class="page-item"><a class="page-link" href="${pageUrl}">${i}</a></li>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                                
                                                <%-- 다음 그룹에 대한 링크 --%>
                                                <c:choose>
                                                    <%-- 다음 그룹으로 이동 가능하다면? --%>
                                                    <c:when test="${pageData.nextPage > 0 }">
                                                        <%-- 이동할 URL 생성 --%>
                                                        <c:url value="${pageContext.request.contextPath}/11_admin/admin_order.do" var="nextPageUrl">
                                                            <c:param name="page" value="${pageData.nextPage}" />
                                                            <c:param name="keyword" value="${keyword }" />
                                                        </c:url>
                                                            <li class="page-item"><a class="page-link" href="${pageData.nextPage}">&raquo;</a></li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                                                    </c:otherwise>
                                                </c:choose>
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
	</script>
</body>
</html>