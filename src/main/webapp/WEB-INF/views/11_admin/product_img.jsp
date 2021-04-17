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
								<h2 class="m-0">상세 이미지 관리</h2>
							</div>
							<!-- /.col -->
							<div class="col-sm-6 clearfix">
								<ol class="breadcrumb pull-right">
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/11_admin/admin_home.do">홈</a></li>
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/11_admin/stock_management.do">상품관리</a></li>
									<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/11_admin/product_view.do?prodno=${img.prodno}">상품정보</a></li>
									<li class="breadcrumb-item active">상세 이미지 관리</li>
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
									
                                    <!-- 상세 이미지 추가-->
                                    <div class="card-header">
                                        <h3 class="card-title">이미지 추가</h3>
                                    </div>
                                    <div class="card-body">
                                    
										<form method="post"
												action="${pageContext.request.contextPath}/11_admin/product_img"
												enctype="multipart/form-data" class="form-inline">
                                        	<table class="table table-bordered product_info_table">
                                            	<tr>
                                                <td class="info_table_color">파일 업로드</td>
                                                <td>
                                                  	<div class="filebox_thumb">
														<input type="file" name="product_detail_img" id="product_detail_img" class="form-control"/>
														<input class="upload-name form-control" placeholder="파일선택">
														<label for="product_detail_img">파일선택</label>
														<button type="submit" class="form-control btn btn-success" data-prodno="${img.prodno}">업로드</button>
														<input type="hidden" id="prodno" name="prodno" value="${img.prodno}">
													</div>
													* 파일 선택 후 업로드 버튼을 누르셔야 추가가 진행됩니다.
                                                </td>
                                            	</tr>
                                        	</table>
                                        </form>
                                    </div>
                                    <!-- 상세 이미지 추가 -->
                                   
                                    <!--상세 이미지-->
                                    <div class="card-header">
                                        <h3 class="card-title">상세 이미지</h3>
                                    </div>
                                    <div class="card-body">
                                        <table class="table table-bordered product_info_table">
                                            <tr>
                                                <td class="info_table_color">상세 이미지 </td>
                                                <td>
                                                	<div id="detail_img_box">
                                                	<c:choose>
                                                	<%--상세 이미지가 없다면? --%>
                                                	<c:when test="${imgList == null || fn:length(imgList) == 0}">
                                                		상세 이미지가 없습니다. 추가해주세요.
                                                	</c:when>
                                                	<%--상세 이미지가 있다면? --%>
                                                	<c:otherwise>
                                                		<c:forEach var="item" items="${imgList}" varStatus="status">
                                                			<div class="detailimg_wrap">
                                                				 <img src="${item.fileUrl}" width="240"  height="240"/>
        														 <a href="#" class="btn btn-block btn-danger detail_delete" data-detailimgno="${item.detailimgno}">삭제</a>
                                                			</div>
                                                		</c:forEach>
                                                	</c:otherwise>
                                                	</c:choose>
                                                	
                                                	
                                                	</div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <!--상세 이미지 끝-->

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
			$(".form-inline").ajaxForm({
	            // 전송 메서드 지정
	            method: "POST",
	            // 서버에서 200 응답을 전달한 경우 실행됨
	            success: function(json) {
	                console.log(json);
	                
	                // json에 포함된 데이터를 활용하여 상세페이지로 이동한다.
	                if (json.rt == "OK") {
	                    location.reload();
	                }
	            }
	        });
			
			 /* $(".btn-success").click(function() {
				
				let current = $(this); //이벤트가 발생한 객체 자신 
				let prodno = current.data('prodno');
				
				$.get("${pageContext.request.contextPath}/11_admin/product_img", {
                    "prodno": prodno     // 상품 번호는 GET 파라미터로 전송한다.
                }, function(json) {
                    var source = $("#detail-list-tmpl").html();   // 템플릿 코드 가져오기
                    var template = Handlebars.compile(source);  // 템플릿 코드 컴파일
                    var result = template(json);    // 템플릿 컴파일 결과물에 json 전달
                    $("#detail_img").append(result);      // 최종 결과물을 #detail_img 요소에 추가한다.
                    
                });
			}); */ 
			
			$(document).ready(function(){ 
	            var fileTarget = $('#product_detail_img'); 
	            fileTarget.on('change', function(){ // 값이 변경되면
	            var cur=$(".filebox_thumb input[type='file']").val();
	                $(".upload-name").val(cur);
	            }); 
	        }); 
		
	    	$(".detail_delete").click(function(e) {
	    		e.preventDefault();
	    		
	    		let current = $(this); //이벤트가 발생한 객체 자신
	    		let detailimgno = current.data('detailimgno');    //data-detailimgno 값을 가져옴
	    		
	    		//삭제확인
	    		if(!confirm("정말 삭제하시겠습니까?")){
	    			return false;
	    		}
	    		//delete 메서드로 Ajax 요청 --> <form>전송이 아니므로 직접 구현한다.
	    		$.delete("${pageContext.request.contextPath}/11_admin/product_img", {
	    			"detailimgno": detailimgno
	    		}, function(json) {
	    			if(json.rt=="OK"){
	    				alert("삭제되었습니다.");
	    				location.reload();
	    			}
	    		})
	    	});
	    });
		
	</script>
</body>
</html>