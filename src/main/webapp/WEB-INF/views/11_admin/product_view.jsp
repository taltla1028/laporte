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
<link rel="stylesheet" href="../assets/css/product_add.css">

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
						<li class="brand_logo_box"><a href="${pageContext.request.contextPath}/11_admin/admin_home.do" class="brand_logo">
								<span></span> <span id="logo_img">la porte</span>
						</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><i class="glyphicon glyphicon-edit"></i>
								홈 퍼블리싱 예약관리 <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath}/11_admin/admin_resvappv.do"><i
										class="glyphicon glyphicon-ok"></i> 예약 승인</a></li>
							</ul></li>
						<li class="dropdown open"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><i class="glyphicon glyphicon-tags"></i>
								제품 관리 <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath}/11_admin/stock_management.do"><i
										class="glyphicon glyphicon-briefcase"></i> 상품 관리</a></li>
								<li class="active"><a href="${pageContext.request.contextPath}/11_admin/product_add.do"><i
										class="glyphicon glyphicon-plus"></i> 상품 등록</a></li>
								<li><a href="${pageContext.request.contextPath}/11_admin/admin_review.do"><i
										class="glyphicon glyphicon-star-empty"></i> 리뷰 관리</a></li>
								
							</ul></li>
						<li class="dropdown">
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
								<li>
									<a href="${pageContext.request.contextPath}/11_admin/admin_qanda.do"><i class="glyphicon glyphicon-envelope"></i> 이메일 문의 관리</a>
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
								<h2 class="m-0">상품 정보</h2>
							</div>
							<!-- /.col -->
							<div class="col-sm-6 clearfix">
								<ol class="breadcrumb pull-right">
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/11_admin/admin_home.do">홈</a></li>
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/11_admin/stock_management.do">상품관리</a></li>
									<li class="breadcrumb-item active">상품정보</li>
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
                                        <h3 class="card-title">기본 정보</h3>
                                    </div>
                                    <!-- /.card-header -->
                                    <div class="card-body">
                                        <table class="table table-bordered product_info_table">
                                            <tr>
                                                <td class="info_table_color">상품 분류 *</td>
                                                <td>
                                                   ${output.catname2}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="info_table_color">상품 그룹</td>
                                                <td>
                                                    ${output.group}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="info_table_color">상품명 *</td>
                                                <td>
                                                    ${output.name}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="info_table_color">상품 색상 *</td>
                                                <td>
                                                    ${output.color}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="info_table_color">상품 크기</td>
                                                <td>
                                                    ${output.size}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="info_table_color">상품 진열 *</td>
                                                <td>
                                                	<c:if test="${output.display =='Y'}">
                                                	O
                                                	</c:if>
                                                    <c:if test="${output.display =='N'}">
                                                	X
                                                	</c:if>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <!-- /.card-body -->
                                    <!--기본 정보 끝-->

                                    <!--가격 및 재고 시작-->
                                    <div class="card-header">
                                        <h3 class="card-title">가격 및 재고</h3>
                                    </div>
                                    <div class="card-body">
                                        <table class="table table-bordered product_info_table">
                                            <tr>
                                                <td class="info_table_color">판매가 *</td>
                                                <td>
                                                   <fmt:formatNumber value="${output.price}" pattern="#,###" />원
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="info_table_color">할인가</td>
                                                <td>
                                                <!-- 할인가가 0원이면 할인을 하지 않음(데이터베이스 상에서는 NULL로 입력되어있음) -->
                                                	<c:if test="${output.saleprice != 0}">
                                                	<fmt:formatNumber value="${output.saleprice}" pattern="#,###" />원
                                                	</c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="info_table_color">재고 *</td>
                                                <td>
                                               		<fmt:formatNumber value="${output.stock}" pattern="#,###" />개
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <!--가격 및 재고 끝-->
    
                                    <!-- 상품 설명 시작-->
                                    <div class="card-header">
                                        <h3 class="card-title">상품 설명</h3>
                                    </div>
                                    <div class="card-body">
                                        <table class="table table-bordered product_info_table">
                                            <tr>
                                                <td class="info_table_color" width="20%">관리자 주석</td>
                                                <td width="80%">
                                                   ${output.adminnote}
                                                </td>
                                            </tr>
                                            <tr id="product_detail_text">
                                                <td class="info_table_color">상세 설명 *</td>
                                                <td>
                                                   ${output.detailnote}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="info_table_color">상품 상세크기 *</td>
                                                <td>
                                                    ${output.detailsize}
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <!-- 상품 설명 끝-->
                                    
                                    <!--상품 이미지-->
                                    <div class="card-header">
                                        <h3 class="card-title">상품 이미지</h3>
                                    </div>
                                    <div class="card-body">
                                        <table class="table table-bordered product_info_table">
                                            <tr>
                                                <td class="info_table_color">대표 이미지 *</td>
                                                <td>
                                                   <img src="${imgoutput.fileUrl}" width="240" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="btn_box">
                                    	<a href="${pageContext.request.contextPath}/11_admin/product_img.do?prodno=${output.prodno}"  class="btn btn-block btn-success prod_img_add">상세 이미지 추가</a>
                                    	<a href="#" id="deleteProduct" data-prodno="${output.prodno}" data-name="${output.name}" class="btn btn-block btn-danger prod_delete">삭제</a>
                                    	<a href="${pageContext.request.contextPath}/11_admin/product_edit.do?prodno=${output.prodno}"  class="btn btn-block btn-primary prod_edit">수정</a>
                                    </div>
                                    
                                    <!--상품 이미지 끝-->

								</div>
								<!-- /.card 끝 -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /wrapper  끝-->
	</section>
	<footer></footer>
	 <!-- Handlebar 탬플릿 코드 -->
	<!-- Handlebar CDN 참조 -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.4.2/handlebars.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <!-- jQuery Ajax Form plugin CDN -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
	<script type="text/javascript">
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
        });
		
		$(function() {
	    	$("#deleteProduct").click(function(e) {
	    		e.preventDefault();
	    		
	    		let current = $(this); //이벤트가 발생한 객체 자신 ==> <a>태그
	    		let prodno = current.data('prodno');    //data-profno 값을 가져옴
	    		let name =current.data('name');         //data-name 값을 가져옴
	    		let target = name + " 상품" ;       //이름+공백+직급 형식의 문자열
	    		
	    		//삭제확인
	    		if(!confirm("정말 " + target + "을(를) 삭제하시겠습니까?")){
	    			return false;
	    		}
	    		//delete 메서드로 Ajax 요청 --> <form>전송이 아니므로 직접 구현한다.
	    		$.delete("${pageContext.request.contextPath}/11_admin/product_view", {
	    			"prodno": prodno
	    		}, function(json) {
	    			if(json.rt=="OK"){
	    				alert("삭제되었습니다.");
	    				//삭제완료 후 목록 페이지로 이동
	    				window.location = "${pageContext.request.contextPath}/11_admin/stock_management.do";
	    			}
	    		})
	    	});
	    });
		
	</script>
</body>
</html>