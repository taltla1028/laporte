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
<link rel="stylesheet" href="../assets/css/review_answer.css">

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
								<li><a href="${pageContext.request.contextPath}/11_admin/product_add.do"><i
										class="glyphicon glyphicon-plus"></i> 상품 등록</a></li>
								<li class="active"><a href="${pageContext.request.contextPath}/11_admin/admin_review.do"><i
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
								<h2 class="m-0">답변</h2>
							</div>
							<!-- /.col -->
							<div class="col-sm-6 clearfix">
								<ol class="breadcrumb pull-right">
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin_home.do">홈</a></li>
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/11_admin/admin_review.do">리뷰관리</a></li>
									<li class="breadcrumb-item active">답변</li>
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
                                        <h3 class="card-title">리뷰 내용</h3>
                                    </div>
                                    <!-- /.card-header -->
                                    <div class="card-body">
                                        <table class="table table-bordered product_info_table">
                                            <tr>
                                                <td class="info_table_color">리뷰 작성자</td>
                                                <td>
                                                    <p id="review_writer">${item.name }</p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="info_table_color">리뷰 작성일</td>
                                                <td>
                                                    <p id="review_date">${item.editdate }</p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="info_table_color">평균 별점</td>
                                                <td>
                                                    <p id="review_date">
														<c:choose>
																<c:when test="${item.avgscore==0 }">
																	☆☆☆☆☆
																</c:when>
																<c:when test="${item.avgscore==1 }">
																	★☆☆☆☆
																</c:when>
																<c:when test="${item.avgscore==2 }">
																	★★☆☆☆
																</c:when>
																<c:when test="${item.avgscore==3 }">
																	★★★☆☆
																</c:when>
																<c:when test="${item.avgscore==4 }">
																	★★★★☆
																</c:when>
																<c:when test="${item.avgscore==5 }">
																	★★★★★
																</c:when>
															</c:choose>
													</p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="info_table_color">제품 점수</td>
                                                <td>
                                                    <p id="assemble">손쉬운 조립 : ${item.easyscore }</p>
                                                    <p id="value">제품 가성비 : ${item.benefitscore }</p>
                                                    <p id="quality">제품 품질   : ${item.qualityscore }</p>
                                                    <p id="appearance">제품 외관   : ${item.appearscore }</p>
                                                    <p id="function">제품 기능   : ${item.funcscore }</p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="info_table_color">리뷰 제목</td>
                                                <td>
                                                    <p id='review_title'>${item.title }</p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="info_table_color">리뷰 내용</td>
                                                <td>
                                                    <p id='review_content'>${item.content }</p>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <!-- /.card-body -->
                                    <!--기본 정보 끝-->

                                    <!--가격 및 재고 시작-->
                                    <div class="card-header">
                                        <h3 class="card-title">답변</h3>
                                    </div>
                                    <div class="card-body">
                                        <table class="table table-bordered product_info_table">
                                            <tr>
                                                <td class="info_table_color">답변</td>
                                                <td>
                                                  ${comitem.content }
                                                </td>
                                            </tr>
                                        </table>
                                        <input type="hidden" name="reviewno" value="${item.reviewno }" />
                                        <div class="btn_box">
                                        	<a href="${pageContext.request.contextPath }/11_admin/admin_review_edit.do?reviewno=${item.reviewno}" class="btn btn-block btn-primary review_answer_edit_btn">수정</a>
                                    		<button type="button" id="delete_review_answer" class="btn btn-danger delete_revcomment" data-reviewno="${item.reviewno}">삭제</button>
                                    	</div>
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
		$(function() {
	    	$("#delete_review_answer").click(function(e) {
	    		e.preventDefault();
	    		
	    		let current = $(this); //이벤트가 발생한 객체 자신 ==> <a>태그
	    		let reviewno = current.data('reviewno');    //data-reviewno 값을 가져옴
	    		
	    		//삭제확인
	    		if(!confirm("정말 리뷰 답변을 삭제하시겠습니까?")){
	    			return false;
	    		}
	    		//delete 메서드로 Ajax 요청 --> <form>전송이 아니므로 직접 구현한다.
	    		$.delete("${pageContext.request.contextPath}/11_admin/admin_review_answer", {
	    			"reviewno": reviewno
	    		}, function(json) {
	    			if(json.rt=="OK"){
	    				alert("삭제되었습니다.");
	    				//삭제완료 후 목록 페이지로 이동
	    				window.location = "${pageContext.request.contextPath}/11_admin/admin_review.do";
	    			}
	    		})
	    	});
	    });
	</script>
</body>
</html>