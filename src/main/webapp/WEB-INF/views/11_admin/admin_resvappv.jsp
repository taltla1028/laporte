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
	<link rel="stylesheet" href="../assets/css/admin_resvappv.css">

<!-- handlebar plugin -->
<script src="../plugins/handlebars/handlebars-v4.0.11.js"></script>

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
				<span><a class="navbar-brand" href="#">HOME</a></span>
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
						<li class="dropdown open"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><i class="glyphicon glyphicon-edit"></i>
								홈 퍼블리싱 예약관리 <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li class="active">
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
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h3 class="m-0">홈퍼니싱 예약관리</h3>
          </div>
          <!-- /.col -->
          <div class="col-sm-6 clearfix">
            <ol class="breadcrumb pull-right">
              <li class="breadcrumb-item"><a href="#">홈퍼니싱 예약관리</a></li>
              <li class="breadcrumb-item active">예약승인</li>
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
                  <h3 class="card-title">예약 승인 대기
                  </h3>
                  <br>
             
                      <li class="appv_before_head">
                        <span>예약매장</span>
                        <span>예약자</span>
                        <span>예약자연락처</span>
                        <span>예약시간</span>
                        <span>컨설팅영역</span>
                        <span>요청사항</span>
                        <span>변경</span>
                      </li>
                      
                    


                    <div id="appv_before_top">
                    	
                    		<%-- 조회결과가 없는경우 --%>
                    		<c:if test="${output==null || fn:length(output)==0 }">
                    		 	<div id="no_res_mssg">
                      				<p>승인 대기 중인 예약이 없습니다.</p>
                    			</div>
                    		</c:if>
                    		<%-- 조회결과가 있는 경우 --%>
                    		
                    			<%-- 조회 결과에 따른 반복 처리 --%>
                    			<c:forEach var="item" items="${output}" varStatus="status">
                    				<c:if test="${item.status == 'W'}">
                    				<li class="appv_before_li">
                    					<span class="reserveno">${item.reserveno}</span>
                       					<c:if test="${item.showroom=='A'}"><span>강남점</span></c:if>
                       					<c:if test="${item.showroom=='B'}"><span>광명점</span></c:if>
                       					<c:if test="${item.showroom=='C'}"><span>대구점</span></c:if>
                        				<span>${item.name}</span>
                       					<span>${item.phoneno}</span>
                        				<c:if test="${item.time=='9'}"><span>오전 9시</span></c:if>
                        				<c:if test="${item.time=='10'}"><span>오전 10시</span></c:if>
                        				<c:if test="${item.time=='11'}"><span>오전 11시</span></c:if>
                        				<c:if test="${item.time=='12'}"><span>오전 12시</span></c:if>
                        				<c:if test="${item.time=='1'}"><span>오후 1시</span></c:if>
                        				<c:if test="${item.time=='2'}"><span>오후 2시</span></c:if>
                        				<c:if test="${item.time=='3'}"><span>오후 3시</span></c:if>
                        				<c:if test="${item.time=='4'}"><span>오후 4시</span></c:if>
                        				<c:if test="${item.time=='5'}"><span>오후 5시</span></c:if>
                        				
                        				<c:if test="${item.area=='F'}"><span>가구</span></c:if>
                        				<c:if test="${item.area=='C'}"><span>소파/암체어</span></c:if>
                        				<c:if test="${item.area=='B'}"><span>침대</span></c:if>
                        				<c:if test="${item.area=='D'}"><span>수납/정리</span></c:if>
                        				<c:if test="${item.area=='K'}"><span>주방가구/용품</span></c:if>
                        				<c:if test="${item.area=='L'}"><span>조명</span></c:if>
                        				<span>${item.request}</span>
                        				<a href="${pageContext.request.contextPath}/08_reserve/reserve_update_ok.do?reserveno=${item.reserveno}" class="appv btn-success btn-xs" >예약승인</a>
                        				<a href="${pageContext.request.contextPath}/08_reserve/reserve_delete_ok.do?reserveno=${item.reserveno}" class="cancel btn-danger btn-xs">예약취소</a>   
                      				  </li>
                      				  </c:if>
                    			</c:forEach>
                    		
              
                      

               
                  </div>
                </div> 
              </div>
            </div>

         	<div class="col-md-12">
            <div class="card">
              <div class="card-header border-0">
                  <h3 class="card-title">예약 승인 완료
                  </h3>
                  <br>
             
                      <li class="appv_before_head">
                        <span>예약매장</span>
                        <span>예약자</span>
                        <span>예약자연락처</span>
                        <span>예약시간</span>
                        <span>컨설팅영역</span>
                        <span>요청사항</span>
                        <span>변경</span>
                      </li>
                      
                    


                    <div id="appv_before_top">
                    	
                    		<%-- 조회결과가 없는경우 --%>
                    		<c:if test="${output==null || fn:length(output)==0 }">
                    		 	<div id="no_res_mssg">
                      				<p>승인 완료된 예약이 없습니다.</p>
                    			</div>
                    		</c:if>
                    		<%-- 조회결과가 있는 경우 --%>
                    		
                    			<%-- 조회 결과에 따른 반복 처리 --%>
                    			<c:forEach var="item" items="${output}" varStatus="status">
                    				<c:if test="${item.status == 'CF'}">
                    				<li class="appv_before_li">
                    					<span class="reserveno">${item.reserveno}</span>
                       					<c:if test="${item.showroom=='A'}"><span>강남점</span></c:if>
                       					<c:if test="${item.showroom=='B'}"><span>광명점</span></c:if>
                       					<c:if test="${item.showroom=='C'}"><span>대구점</span></c:if>
                        				<span>${item.name}</span>
                       					<span>${item.phoneno}</span>
                        				<c:if test="${item.time=='9'}"><span>오전 9시</span></c:if>
                        				<c:if test="${item.time=='10'}"><span>오전 10시</span></c:if>
                        				<c:if test="${item.time=='11'}"><span>오전 11시</span></c:if>
                        				<c:if test="${item.time=='12'}"><span>오전 12시</span></c:if>
                        				<c:if test="${item.time=='1'}"><span>오후 1시</span></c:if>
                        				<c:if test="${item.time=='2'}"><span>오후 2시</span></c:if>
                        				<c:if test="${item.time=='3'}"><span>오후 3시</span></c:if>
                        				<c:if test="${item.time=='4'}"><span>오후 4시</span></c:if>
                        				<c:if test="${item.time=='5'}"><span>오후 5시</span></c:if>
                        				
                        				<c:if test="${item.area=='F'}"><span>가구</span></c:if>
                        				<c:if test="${item.area=='C'}"><span>소파/암체어</span></c:if>
                        				<c:if test="${item.area=='B'}"><span>침대</span></c:if>
                        				<c:if test="${item.area=='D'}"><span>수납/정리</span></c:if>
                        				<c:if test="${item.area=='K'}"><span>주방가구/용품</span></c:if>
                        				<c:if test="${item.area=='L'}"><span>조명</span></c:if>
                        				<span>${item.request}</span>
                        				<a href="${pageContext.request.contextPath}/08_reserve/reserve_delete_ok.do?reserveno=${item.reserveno}" class="cancel btn-danger btn-xs">예약취소</a>   
                      				  </li>
                      				  </c:if>
                    			</c:forEach>
                    	
              
                      

               
                  </div>
                </div> 
              </div>
            </div>
            <!-- /.card -->
            
			<div class="col-md-12">
            <div class="card">
              <div class="card-header border-0">
                  <h3 class="card-title">예약 취소 
                  </h3>
                  <br>
             
                      <li class="appv_before_head">
                        <span>예약매장</span>
                        <span>예약자</span>
                        <span>예약자연락처</span>
                        <span>예약시간</span>
                        <span>컨설팅영역</span>
                        <span>요청사항</span>
                        <span>변경</span>
                      </li>
                      
                    


                    <div id="appv_before_top">
                   
                    		<%-- 조회결과가 없는경우 --%>
                    		<c:if test="${output==null || fn:length(output)==0 }">
                    		 	<div id="no_res_mssg">
                      				<p>취소된 예약이 없습니다.</p>
                    			</div>
                    		</c:if>
                    		<%-- 조회결과가 있는 경우 --%>
                    		
                    			<%-- 조회 결과에 따른 반복 처리 --%>
                    			<c:forEach var="item" items="${output}" varStatus="status">
                    				<c:if test="${item.status == 'CC'}">
                    				<li class="appv_before_li">
                    					<span class="reserveno">${item.reserveno}</span>
                       					<c:if test="${item.showroom=='A'}"><span>강남점</span></c:if>
                       					<c:if test="${item.showroom=='B'}"><span>광명점</span></c:if>
                       					<c:if test="${item.showroom=='C'}"><span>대구점</span></c:if>
                        				<span>${item.name}</span>
                       					<span>${item.phoneno}</span>
                        				<c:if test="${item.time=='9'}"><span>오전 9시</span></c:if>
                        				<c:if test="${item.time=='10'}"><span>오전 10시</span></c:if>
                        				<c:if test="${item.time=='11'}"><span>오전 11시</span></c:if>
                        				<c:if test="${item.time=='12'}"><span>오전 12시</span></c:if>
                        				<c:if test="${item.time=='1'}"><span>오후 1시</span></c:if>
                        				<c:if test="${item.time=='2'}"><span>오후 2시</span></c:if>
                        				<c:if test="${item.time=='3'}"><span>오후 3시</span></c:if>
                        				<c:if test="${item.time=='4'}"><span>오후 4시</span></c:if>
                        				<c:if test="${item.time=='5'}"><span>오후 5시</span></c:if>
                        				
                        				<c:if test="${item.area=='F'}"><span>가구</span></c:if>
                        				<c:if test="${item.area=='C'}"><span>소파/암체어</span></c:if>
                        				<c:if test="${item.area=='B'}"><span>침대</span></c:if>
                        				<c:if test="${item.area=='D'}"><span>수납/정리</span></c:if>
                        				<c:if test="${item.area=='K'}"><span>주방가구/용품</span></c:if>
                        				<c:if test="${item.area=='L'}"><span>조명</span></c:if>
                        				<span>${item.request}</span>   
                      				  </li>
                      				  </c:if>
                    			</c:forEach>
                    	
              
                      

               
                  </div>
                </div> 
              </div>
            </div>           

              </div>
            </div>
          </div>
          <!-- /.col-md-6 -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

</section>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->


   <!--Google CDN 서버로부터 jQuery 참조 -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- Handlebar CDN 참조 -->
<script src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.4.2/handlebars.min.js"></script>
    <!-- jQuery Ajax Setup -->
<script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>    
    <!-- User code -->
<script type="text/javascript">
	
  $(function(){
	  
	  $('.reserveno').hide();
	  
		
	  $('#appv').onclick(function() {
		  location.reload();
		  });

	  $('#cancel').onclick(function() {
		  location.reload();
		  });

  });

  
</script>


<!-- AdminLTE -->
<script src="../assets/dist/js/adminlte.min.js"></script>

<!-- OPTIONAL SCRIPTS -->
<script src="../assets/plugins/chart.js/Chart.min.js"></script>

<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="../assets/dist/js/pages/dashboard3.js"></script>
</body>
</html>
