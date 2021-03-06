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
								??? ???????????? ???????????? <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li class="active">
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
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="glyphicon glyphicon-user"></i>
                                ?????? ?????? <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="${pageContext.request.contextPath}/11_admin/admin_userlist.do">
                                    <i class="glyphicon glyphicon-user"></i> ???????????? ??????</a></li>
                                <li><a href="${pageContext.request.contextPath}/11_admin/admin_order.do">
                                    <i class="glyphicon glyphicon-shopping-cart"></i> ???????????? ??????</a></li>
                                <li><a href="${pageContext.request.contextPath}/11_admin/admin_delivery.do">
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
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h3 class="m-0">???????????? ????????????</h3>
          </div>
          <!-- /.col -->
          <div class="col-sm-6 clearfix">
            <ol class="breadcrumb pull-right">
              <li class="breadcrumb-item"><a href="#">???????????? ????????????</a></li>
              <li class="breadcrumb-item active">????????????</li>
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
                  <h3 class="card-title">?????? ?????? ??????
                  </h3>
                  <br>
             
                      <li class="appv_before_head">
                        <span>????????????</span>
                        <span>?????????</span>
                        <span>??????????????????</span>
                        <span>????????????</span>
                        <span>???????????????</span>
                        <span>????????????</span>
                        <span>??????</span>
                      </li>
                      
                    


                    <div id="appv_before_top">
                    	
                    		<%-- ??????????????? ???????????? --%>
                    		<c:if test="${output==null || fn:length(output)==0 }">
                    		 	<div id="no_res_mssg">
                      				<p>?????? ?????? ?????? ????????? ????????????.</p>
                    			</div>
                    		</c:if>
                    		<%-- ??????????????? ?????? ?????? --%>
                    		
                    			<%-- ?????? ????????? ?????? ?????? ?????? --%>
                    			<c:forEach var="item" items="${output}" varStatus="status">
                    				<c:if test="${item.status == 'W'}">
                    				<li class="appv_before_li">
                    					<span class="reserveno">${item.reserveno}</span>
                       					<c:if test="${item.showroom=='A'}"><span>?????????</span></c:if>
                       					<c:if test="${item.showroom=='B'}"><span>?????????</span></c:if>
                       					<c:if test="${item.showroom=='C'}"><span>?????????</span></c:if>
                        				<span>${item.name}</span>
                       					<span>${item.phoneno}</span>
                        				<c:if test="${item.time=='9'}"><span>?????? 9???</span></c:if>
                        				<c:if test="${item.time=='10'}"><span>?????? 10???</span></c:if>
                        				<c:if test="${item.time=='11'}"><span>?????? 11???</span></c:if>
                        				<c:if test="${item.time=='12'}"><span>?????? 12???</span></c:if>
                        				<c:if test="${item.time=='1'}"><span>?????? 1???</span></c:if>
                        				<c:if test="${item.time=='2'}"><span>?????? 2???</span></c:if>
                        				<c:if test="${item.time=='3'}"><span>?????? 3???</span></c:if>
                        				<c:if test="${item.time=='4'}"><span>?????? 4???</span></c:if>
                        				<c:if test="${item.time=='5'}"><span>?????? 5???</span></c:if>
                        				
                        				<c:if test="${item.area=='F'}"><span>??????</span></c:if>
                        				<c:if test="${item.area=='C'}"><span>??????/?????????</span></c:if>
                        				<c:if test="${item.area=='B'}"><span>??????</span></c:if>
                        				<c:if test="${item.area=='D'}"><span>??????/??????</span></c:if>
                        				<c:if test="${item.area=='K'}"><span>????????????/??????</span></c:if>
                        				<c:if test="${item.area=='L'}"><span>??????</span></c:if>
                        				<span>${item.request}</span>
                        				<a href="${pageContext.request.contextPath}/08_reserve/reserve_update_ok.do?reserveno=${item.reserveno}" class="appv btn-success btn-xs" >????????????</a>
                        				<a href="${pageContext.request.contextPath}/08_reserve/reserve_delete_ok.do?reserveno=${item.reserveno}" class="cancel btn-danger btn-xs">????????????</a>   
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
                  <h3 class="card-title">?????? ?????? ??????
                  </h3>
                  <br>
             
                      <li class="appv_before_head">
                        <span>????????????</span>
                        <span>?????????</span>
                        <span>??????????????????</span>
                        <span>????????????</span>
                        <span>???????????????</span>
                        <span>????????????</span>
                        <span>??????</span>
                      </li>
                      
                    


                    <div id="appv_before_top">
                    	
                    		<%-- ??????????????? ???????????? --%>
                    		<c:if test="${output==null || fn:length(output)==0 }">
                    		 	<div id="no_res_mssg">
                      				<p>?????? ????????? ????????? ????????????.</p>
                    			</div>
                    		</c:if>
                    		<%-- ??????????????? ?????? ?????? --%>
                    		
                    			<%-- ?????? ????????? ?????? ?????? ?????? --%>
                    			<c:forEach var="item" items="${output}" varStatus="status">
                    				<c:if test="${item.status == 'CF'}">
                    				<li class="appv_before_li">
                    					<span class="reserveno">${item.reserveno}</span>
                       					<c:if test="${item.showroom=='A'}"><span>?????????</span></c:if>
                       					<c:if test="${item.showroom=='B'}"><span>?????????</span></c:if>
                       					<c:if test="${item.showroom=='C'}"><span>?????????</span></c:if>
                        				<span>${item.name}</span>
                       					<span>${item.phoneno}</span>
                        				<c:if test="${item.time=='9'}"><span>?????? 9???</span></c:if>
                        				<c:if test="${item.time=='10'}"><span>?????? 10???</span></c:if>
                        				<c:if test="${item.time=='11'}"><span>?????? 11???</span></c:if>
                        				<c:if test="${item.time=='12'}"><span>?????? 12???</span></c:if>
                        				<c:if test="${item.time=='1'}"><span>?????? 1???</span></c:if>
                        				<c:if test="${item.time=='2'}"><span>?????? 2???</span></c:if>
                        				<c:if test="${item.time=='3'}"><span>?????? 3???</span></c:if>
                        				<c:if test="${item.time=='4'}"><span>?????? 4???</span></c:if>
                        				<c:if test="${item.time=='5'}"><span>?????? 5???</span></c:if>
                        				
                        				<c:if test="${item.area=='F'}"><span>??????</span></c:if>
                        				<c:if test="${item.area=='C'}"><span>??????/?????????</span></c:if>
                        				<c:if test="${item.area=='B'}"><span>??????</span></c:if>
                        				<c:if test="${item.area=='D'}"><span>??????/??????</span></c:if>
                        				<c:if test="${item.area=='K'}"><span>????????????/??????</span></c:if>
                        				<c:if test="${item.area=='L'}"><span>??????</span></c:if>
                        				<span>${item.request}</span>
                        				<a href="${pageContext.request.contextPath}/08_reserve/reserve_delete_ok.do?reserveno=${item.reserveno}" class="cancel btn-danger btn-xs">????????????</a>   
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
                  <h3 class="card-title">?????? ?????? 
                  </h3>
                  <br>
             
                      <li class="appv_before_head">
                        <span>????????????</span>
                        <span>?????????</span>
                        <span>??????????????????</span>
                        <span>????????????</span>
                        <span>???????????????</span>
                        <span>????????????</span>
                        <span>??????</span>
                      </li>
                      
                    


                    <div id="appv_before_top">
                   
                    		<%-- ??????????????? ???????????? --%>
                    		<c:if test="${output==null || fn:length(output)==0 }">
                    		 	<div id="no_res_mssg">
                      				<p>????????? ????????? ????????????.</p>
                    			</div>
                    		</c:if>
                    		<%-- ??????????????? ?????? ?????? --%>
                    		
                    			<%-- ?????? ????????? ?????? ?????? ?????? --%>
                    			<c:forEach var="item" items="${output}" varStatus="status">
                    				<c:if test="${item.status == 'CC'}">
                    				<li class="appv_before_li">
                    					<span class="reserveno">${item.reserveno}</span>
                       					<c:if test="${item.showroom=='A'}"><span>?????????</span></c:if>
                       					<c:if test="${item.showroom=='B'}"><span>?????????</span></c:if>
                       					<c:if test="${item.showroom=='C'}"><span>?????????</span></c:if>
                        				<span>${item.name}</span>
                       					<span>${item.phoneno}</span>
                        				<c:if test="${item.time=='9'}"><span>?????? 9???</span></c:if>
                        				<c:if test="${item.time=='10'}"><span>?????? 10???</span></c:if>
                        				<c:if test="${item.time=='11'}"><span>?????? 11???</span></c:if>
                        				<c:if test="${item.time=='12'}"><span>?????? 12???</span></c:if>
                        				<c:if test="${item.time=='1'}"><span>?????? 1???</span></c:if>
                        				<c:if test="${item.time=='2'}"><span>?????? 2???</span></c:if>
                        				<c:if test="${item.time=='3'}"><span>?????? 3???</span></c:if>
                        				<c:if test="${item.time=='4'}"><span>?????? 4???</span></c:if>
                        				<c:if test="${item.time=='5'}"><span>?????? 5???</span></c:if>
                        				
                        				<c:if test="${item.area=='F'}"><span>??????</span></c:if>
                        				<c:if test="${item.area=='C'}"><span>??????/?????????</span></c:if>
                        				<c:if test="${item.area=='B'}"><span>??????</span></c:if>
                        				<c:if test="${item.area=='D'}"><span>??????/??????</span></c:if>
                        				<c:if test="${item.area=='K'}"><span>????????????/??????</span></c:if>
                        				<c:if test="${item.area=='L'}"><span>??????</span></c:if>
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


   <!--Google CDN ??????????????? jQuery ?????? -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- Handlebar CDN ?????? -->
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
