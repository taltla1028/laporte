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
                                <li  class="active"><a href="${pageContext.request.contextPath}/11_admin/admin_userlist.do">
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
                                <h3 class="m-0">고객관리</h3>
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-6 clearfix">
                                <ol class="breadcrumb pull-right">
                                    <li class="breadcrumb-item"><a href="#">고객관리</a></li>
                                    <li class="breadcrumb-item active">회원정보 관리</li>
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
											<h4 class="card-title">회원목록</h4>
											<br>
											<!-- 회원 목록 -->
											<table class="user_list">
												<thead class="join_users_head">
													<tr>
														<th class="select-user"><input type="checkbox" /></th>
														<th>고객번호</th>
														<th>이름</th>
														<th>이메일</th>
														<th>생년월일</th>
														<th>연락처</th>
														<th>가입일</th>
														<th>변경</th>
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
																data-userno="${item.userno}" class=" btn-success btn-xs">자세히보기</a>
																<a href="#" data-userno="${item.userno}" id="delete_user" class="user-delete btn-danger btn-xs"> X
																	회원삭제</a></td>
														</tr>
													</c:forEach>
												</tbody>




											</table>

											<br />
											
						
											<div id="userdetail-list">
											
											<table class="table table-bordered">
											<thead>
													<tr class="table_color">
														<th>고객번호</th>
														<th>보유 포인트</th>
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
														<th>주문번호</th>
														<th>주문일</th>
														<th>연락처</th>
														<th>상품정보</th>
														<th>총 금액</th>
														<th>결제수단</th>
														<th>결제상태</th>
														<th>배송예정일</th>
														<th>배송상태</th>
														<th>주문상태</th>
													</tr>
												</thead>

												<tbody id="order_list">
													<c:choose>
														<c:when
															test="${o_output == null || fn:length(o_output) == 0}">
															<tr>
																<td colspan="11" align="center">조회결과가 없습니다.</td>
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
																	<td>상품 이름 자리------------------</td>
																	<td>&#8361; <fmt:formatNumber
																			pattern="###,###,###" value='${order.totalprice }' />
																	</td>
																	<td><c:if test="${order.paytype=='C'}">
                                                                                            신용카드
                                                                                        </c:if>
																		<c:if test="${order.paytype=='D'}">
                                                                                            무통장입금
                                                                                        </c:if>
																		<c:if test="${order.paytype=='M'}">
                                                                                            휴대폰결제
                                                                                        </c:if>
																		<c:if test="${order.paytype=='D2'}">
                                                                                            실시간계좌이체
                                                                                        </c:if>
																	</td>
																	<td><c:if test="${order.paystatus=='N' }">
                                                                                            결제전
                                                                                        </c:if>
																		<c:if test="${order.paystatus=='Y' }">
                                                                                            결제완료
                                                                                        </c:if>
																	</td>
																	<td>${order.deldate}</td>
																	<td><c:if test="${order.deliverystatus=='N' }">
                                                                                            입금전
                                                                                        </c:if>
																		<c:if test="${order.deliverystatus=='R' }">
                                                                                            준비중
                                                                                        </c:if>
																		<c:if test="${order.deliverystatus=='S' }">
                                                                                            배송대기
                                                                                        </c:if>
																		<c:if test="${order.deliverystatus=='D' }">
                                                                                            배송중
                                                                                        </c:if>
																		<c:if test="${order.deliverystatus=='C' }">
                                                                                            배송완료
                                                                                        </c:if>
																	</td>
																	<td><c:if test="${order.orderstatus=='N' }">
                                                                                            주문
                                                                                        </c:if>
																		<c:if test="${order.orderstatus=='CC' }">
                                                                                            취소
                                                                                        </c:if>
																		<c:if test="${order.orderstatus=='CH' }">
                                                                                            교환
                                                                                        </c:if>
																		<c:if test="${order.orderstatus=='RT' }">
                                                                                            반품
                                                                                        </c:if>
																		<c:if test="${order.orderstatus=='RF' }">
                                                                                            환불
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
														<th>쿠폰명</th>
														<th>기간</th>
														<th>할인</th>
														<th>중복가능여부</th>
														<th>쿠폰링크</th>
														<th>변경</th>
													</tr>
												</thead>

												<tbody id="coupon_list">
													<c:choose>
													<c:when test="${uc_output == null || fn:length(uc_output) == 0 }">
														<tr class="coupon_li">
															<td colspan="7">보유한 쿠폰이 없습니다.</td>
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
																			<span>원</span>
																		</c:otherwise>
																	</c:choose>
																</td>
																<td>${coupon.dupliuse}</td>
																<td>${coupon.link}</td>
																<td class="coupon_li_btns">
																 <a href="#" id="deleteCoupon"
																	data-couponno="${item.couponno}"
																	data-name="${item.name}" class="delete btn-danger btn-xs">삭제</a></td>
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
								<!-- 회원 목록 -->
                                <!--탈퇴 회원 목록  -->
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="card-header border-0">
                                            <h3 class="card-title">탈퇴회원목록</h3>
                                            <br>
                                            <table class="user_list">
                                                <thead class="out_users_head">
                                                    <tr>
                                                        <th class="select-user"><input type="checkbox" class="select-user" /></th>
                                                        <th>고객번호</th>
                                                        <th>이름</th>
                                                        <th>아이디</th>
                                                        <th>가입일</th>
                                                        <th>탈퇴일</th>
                                                        <th>탈퇴사유</th>
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
                                                            		탈퇴이유없음
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
                                <!-- 탈퇴회원 목록 -->
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
        
      //회원 탈퇴하기
       $(document).on("click","#delete_user", function(e){
        	e.preventDefault();
        	
        	let current = $(this);
        	let outuserno = current.data('userno');
        	let outreason = "";
        	
        	if(!confirm('정말 삭제하시겠습니까? 삭제한 회원은 회원 복구가 불가능 합니다.')){
        		return false;
        	}else{
        	outreason = prompt("회원 삭제 이유를 기재해주세요.");
        	}
        	//put 메서드로 ajax 요청
        	$.delete("${pageContext.request.contextPath}/02_mypage",{
        		"userno" : outuserno,
        		"outreason" : outreason
        	},function(json){
        		if(json.rt == "OK"){
        		alert("회원 삭제가 정상적으로 되었습니다.");
        		location.reload();
        	}
         });
        });
        
      

    });
    </script>
</body>

</html>