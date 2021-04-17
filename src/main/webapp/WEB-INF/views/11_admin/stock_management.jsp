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
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<link rel="stylesheet" href="../assets/css/admin_common.css">
<link rel="stylesheet" href="../assets/css/stock_management.css">

<!-- handlebar plugin -->
<script src="../assets/plugins/handlebars/handlebars-v4.0.11.js"></script>

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
				<span><a class="navbar-brand"
					href="${pageContext.request.contextPath}/11_admin/admin_home.do">HOME</a></span>
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
								홈 퍼블리싱 예약관리 <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a
									href="${pageContext.request.contextPath}/11_admin/admin_resvappv.do"><i
										class="glyphicon glyphicon-ok"></i> 예약 승인</a></li>
							</ul></li>
						<li class="dropdown open"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><i class="glyphicon glyphicon-tags"></i>
								제품 관리 <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li class="active"><a
									href="${pageContext.request.contextPath}/11_admin/stock_management.do"><i
										class="glyphicon glyphicon-briefcase"></i> 상품 관리</a></li>
								<li><a
									href="${pageContext.request.contextPath}/11_admin/product_add.do"><i
										class="glyphicon glyphicon-plus"></i> 상품 등록</a></li>
								<li><a
									href="${pageContext.request.contextPath}/11_admin/admin_review.do"><i
										class="glyphicon glyphicon-star-empty"></i> 리뷰 관리</a></li>

							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="glyphicon glyphicon-user"></i>
								고객 관리 <b class="caret"></b>
						</a>
							<ul class="dropdown-menu">
								<li><a
									href="${pageContext.request.contextPath}/11_admin/admin_userlist.do">
										<i class="glyphicon glyphicon-user"></i> 회원정보 관리
								</a></li>
								<li><a
									href="${pageContext.request.contextPath}/11_admin/admin_order.do">
										<i class="glyphicon glyphicon-shopping-cart"></i> 주문내역 관리
								</a></li>
								<li><a
									href="${pageContext.request.contextPath}/11_admin/admin_delivery.do">
										<i class="glyphicon glyphicon-transfer"></i> 배송정보 관리
								</a></li>
								<li><a
									href="${pageContext.request.contextPath}/11_admin/admin_cancel.do">
										<i class="glyphicon glyphicon-retweet"></i> 취소/교환/반품/환불
								</a></li>
								<li><a
									href="${pageContext.request.contextPath}/11_admin/admin_coupon.do">
										<i class="glyphicon glyphicon-credit-card"></i> 쿠폰
								</a></li>

							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="glyphicon glyphicon-pencil"></i>
								문의 관리 <b class="caret"></b>
						</a>
							<ul class="dropdown-menu">
								<li><a
									href="${pageContext.request.contextPath}/11_admin/admin_qanda.do"><i
										class="glyphicon glyphicon-envelope"></i> 이메일 문의 관리</a></li>

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
								<h2 class="m-0">상품 관리</h2>
							</div>
							<!-- /.col -->
							<div class="col-sm-6 clearfix">
								<ol class="breadcrumb pull-right">
									<li class="breadcrumb-item"><a
										href="${pageContext.request.contextPath}/11_admin/admin_home.do">홈</a></li>
									<li class="breadcrumb-item active">상품 관리</li>
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
						<!--본문 작성 영역-->
						<div class="row">
							<div class="col-md-12">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">제품 목록</h4>
									</div>
									<!-- /.card-header 끝 -->
									<!-- card-body  -->
									<div class="card-body">
										<!---------- 조건 검색 목록 ---------->
										<form class="form-inline" action="${pageContext.request.contextPath}/11_admin/stock_management.do" method="get">
											<table class="table table-bordered search_table">
												<tr>
													<td class="search_title">상품 분류</td>
													<td>
														<!-- 1차 카테고리 -->
														<div class="form-group">
															<select id="category1"
																class="form-control prod_category1" name="catno1">
																<option value="">--1차 분류--</option>
																<%-- 조회 결과에 따른 반복 처리 --%>
																<c:forEach var="item" items="${category1}"
																	varStatus="status">
																	<option value="${item.catno1}" <c:if test="${catno1 == item.catno1}">selected</c:if>>${item.catname1}</option>
																</c:forEach>
															</select>
														</div> <!-- 1차 카테고리 끝 --> <!-- 2차 카테고리 -->
														<div class="form-group">
															<select id="category2"
																class="form-control prod_category2" name="search_catno2">
																<option value="">--2차 분류--</option>
																<c:forEach var="item" items="${category2}"
																	varStatus="status">
																	<option value="${item.catno2}" <c:if test="${item.catno2 ==  search_catno2}">selected</c:if>>${item.catname2}</option>
																</c:forEach>
															</select>
														</div> <!-- 2차 카테고리 끝 -->
														<input type="hidden" value="${search_catno2}" id="search_catno2"/>
													</td>
												</tr>

												<tr>
													<td class="search_title">검색 조건</td>
													<td>
														<div class="form-group">
															<select id="search_condition" name="search_condition"
																class="form-control">
																<option value="product_name" <c:if test="${search_condition.equals('product_name')}">selected</c:if>>제품명</option>
																<option value="product_num" <c:if test="${search_condition.equals('product_num')}">selected</c:if>>제품번호</option>
															</select> <input type="text" name ="search_name_number" class="form-control" value="${search_name_number}">
														</div>
													</td>
												</tr>

												<tr>
													<td class="search_title">재고 여부</td>
													<td>
														<div class="form-group">
															<select id="search_quantity" name="search_count"
																class="form-control">
																<option value="">재고 여부</option>
																<option value="Y" <c:if test="${search_count.equals('Y')}">selected</c:if>>재고 존재</option>
																<option value="N" <c:if test="${search_count.equals('N')}">selected</c:if>>재고 없음</option>
															</select> <input type="text" name="search_stock" class="form-control quantity_input" <c:if test="${search_stock != 0}">value="${search_stock}"</c:if>><span>개
																이하</span>
														</div>
													</td>
												</tr>

												<tr>
													<td class="search_title">그룹</td>
													<td>
														<div class="form-group">
															<select id="search_group" name="search_group"
																class="form-control">
																<option value="">그룹선택</option>
																<option value="세일" <c:if test="${search_group.equals('세일')}">selected</c:if>>세일</option>
																<option value="신제품" <c:if test="${search_group.equals('신제품')}">selected</c:if>>신제품</option>
																<option value="인기" <c:if test="${search_group.equals('인기')}">selected</c:if>>인기</option>
																<option value="이달의제품" <c:if test="${search_group.equals('이달의제품')}">selected</c:if>>이달의제품</option>
															</select>
														</div>
													</td>
												</tr>

												<tr>
													<td class="search_title">진열 여부</td>
													<td>
														<div class="form-group">
															<select id="search_display" name="search_display"
																class="form-control">
																<option value="">선택</option>
																<option value="Y" <c:if test="${search_display.equals('Y')}">selected</c:if>>O</option>
																<option value="N" <c:if test="${search_display.equals('N')}">selected</c:if>>X</option>
															</select>
														</div>
													</td>
												</tr>
											</table>
											<button type="submit"
												class="btn btn-block btn-info search_btn">검색</button>
											<!-- // 조건 검색 목록 끝 -->
										</form>
										<div class="clearfix product_additional_box">
											<div class="product_number_box pull-left">
												<span>총 상품수 : <b class="total_number">${allcount}</b>
													,
												</span> <span>검색 상품 수 : <b class="search_number">${pageData.totalCount}</b></span>
											</div>
											<div class="product_add_box pull-right">
												<a
													href="${pageContext.request.contextPath}/11_admin/product_add.do"
													class="btn btn-success btn-sm">상품 등록</a>
											</div>
										</div>

										<table class="table table-bordered product_table">
											<thead>
												<tr class="product_table_color">
													<th>제품번호</th>
													<th>이미지</th>
													<th>상품명</th>
													<th>상품가격</th>
													<th>재고</th>
													<th>진열여부</th>
													<th>기능</th>
												</tr>
											</thead>
											<tbody id="product_list">
												<c:forEach var="item" items="${output }">
													<tr>
														<td>${item.prodno }</td>
														<td><img src="${item.thumbnailUrl }"
															class="product_img"></td>
														<td><a href="${pageContext.request.contextPath}/03_detail/detail.do?prodno=${item.prodno}" class="a_link">${item.name }</a></td>
														<td><fmt:formatNumber value="${item.price}"
																pattern="#,###" /></td>
														<td><fmt:formatNumber value="${item.stock }"
																pattern="#,###" /></td>
														<td><c:if test="${item.display =='Y'}">
	                                                	O
	                                                	</c:if> <c:if
																test="${item.display =='N'}">
	                                                	X
	                                                	</c:if></td>
														<td class="clear"><a type="button"
															class="btn btn-secondary btn-xs product_list_edit"
															href="${pageContext.request.contextPath}/11_admin/product_view.do?prodno=${item.prodno }">수정</a>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<!--페이지 네이션-->
										<div class="product_footer">
											<div class="pagination_box">
												<ul class="pagination pagination-sm m-0">
													<li class="page-item"><a class="page-link" href="#">&laquo;</a></li>

													<c:forEach var="i" begin="${pageData.startPage}"
														end="${pageData.endPage}" varStatus="status">
														<%-- 이동할 URL 생성 --%>
														<c:url value="/11_admin/stock_management.do" var="pageUrl">
															<c:param name="page" value="${i}" />
														</c:url>

														<%-- 페이지 번호 출력 --%>
														<c:choose>
															<%-- 현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
															<c:when test="${pageData.nowPage == i}">
																<li class="page-item"><span class="page-link"><strong>${i}</strong></span></li>
															</c:when>
															<%-- 나머지 페이지의 경우 링크 적용함 --%>
															<c:otherwise>
																<li class="page-item"><a class="page-link"
																	href="${pageUrl}">${i}</a></li>
															</c:otherwise>
														</c:choose>
													</c:forEach>
													<li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
												</ul>
											</div>
										</div>
										<!--페이지네이션 끝-->
									</div>
									<!-- /.card-body -->
								</div>
								<!-- /.card 끝 -->
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /wrapper  끝-->
		</div>
	</section>
	<footer></footer>

	<script id="cat2-list-tmpl" type="text/x-handlebars-template">
        {{#each item}}
		<option value="{{catno2}}">{{catname2}}</option>
        {{/each}}
    </script>
	<!-- Handlebar CDN 참조 -->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.4.2/handlebars.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<!-- jQuery Ajax Form plugin CDN -->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
	<!-- jQuery Ajax Setup -->
	<script
		src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
	<script type="text/javascript">
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
		});

		$(document)
				.on(
						"change",
						"#category1",
						function() {
							var catno1 = $("#category1 option:selected").val();
							//선택한 1차카테고리 콘솔에서 확인
							// console.log(catno1); 

							$
									.post(
											"${pageContext.request.contextPath}/11_admin/product_add/category",
											{
												"catno1" : catno1

											},
											function(json) {
												$("#category2 option").remove();
												$("#category2")
														.append(
																'<option value="">--2차 분류--</option>');
												var source = $(
														"#cat2-list-tmpl")
														.html();
												var template = Handlebars
														.compile(source);
												var result = template(json);
												$("#category2").append(result);
											});
						});

		$(function() {
			var product_list_num = $('.product_table tbody tr').length;
			$('.search_number').html(product_list_num);
			
		});
		$(function() {
			/** 드롭다운의 선택 변경 이벤트 */
			$("#parent").change(
					function() {
						// 결과가 표시될 #child에 내용 지우기
						$("#child").empty();
						// 사용자 선택값 가져오기
						var choice = $(this).find("option:selected").val();
						// 선택값이 없다면 처리 중단
						if (!choice) {
							$("#child").html(
									"<option value=''>--2차분류--</option>")
						}

						$.get('../api/category.do', {
							type : choice
						}, function(req) {
							// 미리 준비한 HTML틀을 읽어온다.
							var template = Handlebars.compile($(
									"#category_item_tmpl").html());
							// Ajax를 통해서 읽어온 JSON을 템플릿에 병합한다.
							var html = template(req);
							// #child 읽어온 내용을 추가한다.
							$("#child").append(html);
						}); // end $.get
					}); // end change
			/**드롭다운 1차 > 2차 선택변경 이벤트 끝 */
			/* `#all_check`의 선택 상태가 변경되었을 때의 이벤트 */
			$("#all_check").change(function() {
				// 모든 `.delete_check`의 선택 상태를 `#all_check`와 동일하게 맞춘다.
				$(".delete_check").prop('checked', $(this).prop('checked'));
			});
			
			
			
			//상품 목록이 하나도 없을시 
			if ($('#product_list .a_link').length == 0) {
				$('#product_list')
						.html(
								'<tr id="product_none_msg"><td colspan="7">검색된 상품이 없습니다.</td></tr>');
			}
		});
		
		
	</script>
</body>
</html>