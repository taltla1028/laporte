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

		<link rel="preconnect" href="https://fonts.gstatic.com">

	<!-- stylesheet -->
		<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
		<link rel="stylesheet" href="../assets/plugins/sweetalert/sweetalert2.min.css"/>
	    <link rel="stylesheet" type="text/css" href="../assets/css/common.css">
	    <link rel="stylesheet" type="text/css" href="../assets/css/home.css">
	    <link rel="stylesheet" type="text/css" href="../assets/css/cart.css">
	
	<!-- javascript -->
	    <script src="http://code.jquery.com/jquery.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	
	<!-- ajax-helper -->
	    <link rel="stylesheet" href="../assets/plugins/ajax/ajax_helper.css" />
	    <script src="../assets/plugins/ajax/ajax_helper.js"></script>
	</head>

	<body>
		<%@ include file="../01_home/header.jsp" %>
		<section>
			<!-- 검색 -->
			<%@ include file="../01_home/search.jsp"%>
	        
			<!-- 검색제외 본문영역 -->
	        <div class="container">
	        
	        	<!-- 비 로그인 상태 -->
	            <c:if test = "${my_session == null }">
		            <div class="cart_none">
		                <div class="cart_login">
		                    <div><h4>로그인</h4>
		                        <div class="cart_text"><a href="${pageContext.request.contextPath}/02_mypage/login.do">로그인 또는 회원가입</a>하시면 더 편리하게 이용하실 수 있어요</div>
		                    </div><span id="hd_mypage_icon"></span>
		                </div>
		            </div>
	            </c:if>
	            <!-- 비 로그인 상태 끝 -->
	        
		       <c:choose>
			        <c:when test="${output == null || fn:length(output) == 0}">
			        	<h4 class="cart_title">장바구니가 비어있습니다.</h4>
		        	</c:when>
		        	<c:otherwise>
			         	<div class="cart_form">
			         		<h4 class="cart_title">장바구니</h4>
			         		<form id="cart_itemlist" method="post" name="cartform" action="${pageContext.request.contextPath}/07_purchase/purchase/<%out.print(session.getAttribute("my_session"));%>">
			         			<c:set var="sum" value="0" />
			         			<c:forEach var="item" items="${output }" varStatus="status">
									<div class="cart_itembox">
										<input type="checkbox" class="cart_checkbox" name="chk[]" value="${item.cartno }" data-cartno="${item.cartno }" checked>
										<div class="cart_item">
											<img class="cart_item_img" src="${item.thumbnailUrl}">
											<div>
												<a class="cart_item_title" href="${pageContext.request.contextPath}/03_detail/detail.do?prodno=${item.prodno }">${item.pname }</a>
												<p class="cart_item_info">${item.color}, ${item.size }</p>
											</div>
											<div class="cart_item_1ea">${item.ea } 개</div><br/>
											<div class="cart_item_price">&#8361; 
												<span class="cart_price">
													<fmt:formatNumber pattern="#,###" value='${item.price * item.ea }'/>
												</span>
											</div>
										</div>
									</div>
									<div class="cart_count" data-cartno="${item.cartno }">
										<select class="cart_productcount" name="ea">
						      				<optgroup label="수량">
						        				<c:forEach begin="1" end="10" var="i">
		                    						<option value="${i }" <c:if test="${item.ea == i }">selected</c:if>>${i }</option>
		                    					</c:forEach>	
						      				</optgroup>
						       			</select>
										<a href="#" class="cart_delete" data-cartno="${item.cartno }">삭제</a>
									</div>
									<c:set var="sum" value="${sum + (item.price * item.ea)}" />
								</c:forEach>
								<div id="cart_purchase">
					            	<div class="cart_info clearfix">
					            		<p><strong>주문 내역</strong><br/>
					           		 	이 금액에는 배송비가 포함되어 있지 않으며, 
					            		배송지에 따라 구매가 불가할 수 있습니다.</p>
					            		<hr>
					            		<div>
					            			<p class="cart_total"><b>총 주문금액</b></p>
					            			<span class="cart_totalprice">
					            				&#8361; <fmt:formatNumber pattern="#,###" value='${sum }'/>
				            				</span>
					           			</div>
					           	 	</div>
					            	<div>
					            		<button type="submit" id="cart_payment">결제하기</button>
					          	 	</div>
				            	</div>
							</form>
			         	</div>
		        	</c:otherwise>
	        	</c:choose>
        	
	            <div class="cart_footer">
	                <div>
	                    <div>
	                    	<button id="cart_toggle">제품번호로 제품 추가하기</button>
	                    	<form id="cart_hidden" action="${pageContext.request.contextPath}/06_cart/cart">
	                    		<div id="cart_productbox">
		                    		<input type="hidden" name="userno" value="<%out.print(session.getAttribute("my_session"));%>" />
		                    		<input type="text" id="cart_productno" name="prodno" placeholder="예 : 20001" />
		                    		<select class="cart_productcount" name="ea">
		                    			<optgroup label="수량">
			                    			<c:forEach begin="1" end="10" var="i">
			                    				<option value="${i }">${i }</option>
			                    			</c:forEach>
		                    			</optgroup>
		                    		</select>
	                    		</div>
	                    		<div id="cart_addproductbox">
	                    			<button type="submit" id="cart_addproduct">제품추가하기</button>
	                   			</div>
	                    	</form>
	                    </div>
	                </div>
	                <div id="cart_return">
	                    <span id="cart_return_icon"></span>반품 정책 365일 이내에 제품 환불 가능
	                </div>
	           	</div>
	           	
				<!-- 모든 제품 -->
				<div id="home_content">
					<h4>추천 제품</h4>
					<div id="home_item_box">
						<ul id="home_item_listbox">
							<c:forEach var="item" items="${productOutput}" begin="0" end="10" step="1">
								<li>
									<div class="home_item">
										<div class="home_wishlist_loc">
											<input type="checkbox" class="chk_heart heart" style="display: none;" name="chk_heart" id="${item.prodno }"
												<c:set var ="result" value="0" />
												<c:forEach var="wishitem" items="${wishoutput}" >
													<c:if test="${item.prodno== wishitem.prodno}">
														<c:set var ="result" value="${result+1 }" />
													</c:if>
												</c:forEach>
												<c:if test="${result>0 }">checked</c:if>
													data-wishno="${my_wish}" data-prodno="${item.prodno }"
													data-userno="${userno}"/>
											<label class="heart" for="${item.prodno }"></label>
										</div>
										<div>
											<a href="${pageContext.request.contextPath}/03_detail/detail.do?prodno=${item.prodno}">
												<img class="home_item_img" alt="${item.name}" src="${item.thumbnailUrl}">
											</a> 
											<a href="#"> <c:set var="group" value="${item.group }" />
												<span class="home_item_title">${item.name}</span> <br />
												<span class="home_item_info">${item.size} <br />${item.color}</span><br />
												<c:choose>
													<c:when test="${fn:contains(group, '세일') }">
														<span class="home_item_info home_item_pricedown">&#8361;
															<fmt:formatNumber value="${item.price}" pattern="#,###" />
														</span>
														<br />
														<span class="home_item_price <c:if test="${fn:contains(group, '인기') }">home_item_mark</c:if>">&#8361;
															<fmt:formatNumber value="${item.saleprice}" pattern="#,###" />
														</span>
													</c:when>
													<c:otherwise>
														<span class="home_item_price <c:if test="${fn:contains(group, '인기') }">home_item_mark</c:if>">&#8361;
															<fmt:formatNumber value="${item.price}" pattern="#,###" />
														</span>
													</c:otherwise>
												</c:choose>
											</a>
										</div>
										<a class="home_cartloc" href="#" data-userno="${userno}" data-prodno="${item.prodno }"><span class="cart_icon"></span></a>
										<c:if test="${fn:contains(group, '세일') }">
											<p class="home_item_down">할인가격</p>
										</c:if>
										<c:if test="${fn:contains(group, '신제품') }">
											<p class="home_item_new">new</p>
										</c:if>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<!-- 모든 제품 끝 -->
	        </div>
		</section>
		<%@ include file="../01_home/footer.jsp" %>
		
	    <!-- Handlebar CDN 참조 -->
    	<script src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.4.2/handlebars.min.js"></script>
    	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
   		<!-- jQuery Ajax Form plugin CDN -->
   		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
    	<script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
		<script src="../assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
	    <script src="../assets/js/home.js"></script>
	    <script type="text/javascript">
	    	
	    	/** 총 금액 단위에 천의자리만큼 (,) 찍기 함수 */
	    	function addComma(num) {
	    	  var regexp = /\B(?=(\d{3})+(?!\d))/g;
	    	  return num.toString().replace(regexp, ',');
	    	}
	    
			$(function() {
				
				/* 위시리스트 아이콘버튼 toggle */
				$(".home_wishlist_icon").click(function(e) {
					e.preventDefault();
					$(this).toggleClass("home_wishlist_icon_active")
				});
				
				
				/* 제품번호 버튼 toggle */
				$("#cart_toggle").click(function() { $("#cart_hidden").slideToggle(200); });
				$("#cart_toggle").click(function() { 
					if ( $(this).html() == "제품번호로 제품 추가하기" ) {
						$(this).html("닫기")
						} else {
							$(this).html("제품번호로 제품 추가하기");
						}
				});
				
				
				/* 총 가격 */
				$(".cart_checkbox").change(function() {
					var sum = 0;
					var count = $("input:checkbox[name='chk[]']").length;
					
					$(".cart_checkbox").each(function() {
						if($(this).is(":checked") == true ) {
							sum += parseInt($(this).parent().find(".cart_price").text().replace(",",""));
						} 
					});
					
					// 미리 정의해둔 (,) 찍는 함수에 대입
					sum = addComma(sum);
					
					$(".cart_totalprice").html("&#8361; " + sum);
				});
			
				
				/* 추가 버튼 */
				// 제품번호로 등록 submit 이벤트 Ajax요청
				$("#cart_hidden").ajaxForm({
					method:"POST",
					success:function(json) {
						console.log(json);
						
						if(json.rt == "OK") {
							alert("장바구니에 추가되었습니다.");
							window.location = "${pageContext.request.contextPath}/06_cart/cart.do?userno="+ <%out.print(session.getAttribute("my_session"));%>;
						}
					}
				});
			});
				
			/* 삭제 버튼 */
			$(document).on("click", ".cart_delete", function(e) {
				e.preventDefault();
				
				var current = $(this);					// 이벤트가 발생한 버튼
				var cartno = current.data('cartno');	// data-cartno 값을 가져옴
				
				// 삭제확인
				if (!confirm("정말 장바구니를 삭제하시겠습니까?")) {
					return false;
				}
				
				// delete 메서드로 ajax 요청
				$.delete("${pageContext.request.contextPath}/06_cart/cart", {
					"cartno":cartno
				}, function(json) {
					if(json.rt == "OK") {
						alert("삭제되었습니다");
						// 삭제 완료 후 목록 페이지 이동
						window.location = "${pageContext.request.contextPath}/06_cart/cart.do?userno="+ <%out.print(session.getAttribute("my_session"));%>;
					}
				});
			});
			
			/* 수정 버튼 */
			$(document).on("change",".cart_productcount", function(e) {
				e.preventDefault();
				
				var current = $(this);										// 이벤트가 발생한 버튼
				var cartno = current.parents(".cart_count").data('cartno');	// data-cartno 값을 가져옴
				var ea = current.val();										// 드롭다운 선택 값 가져옴
				if (!confirm("정말 수정하시겠습니까?")) {
					return false;
				}
				
				// put 메서드로 ajax 요청
				$.put("${pageContext.request.contextPath}/06_cart/cart", {
					"cartno":cartno,
					"ea":ea
				}, function(json) {
					if(json.rt == "OK") {
						alert("변경되었습니다");
						// 변경 완료 후 목록 페이지 이동
						window.location = "${pageContext.request.contextPath}/06_cart/cart.do?userno="+ <%out.print(session.getAttribute("my_session"));%>;
					}
				});
			});
			
			/** 추천제품 - 위시리스트 클릭 */
			$(document).on("change",".home_wishlist_loc > .chk_heart",function() {
				let current = $(this);
	            let userno = current.data('userno');
	            if (userno == 0) {
	                alert("로그인을 먼저 하세요");
	                location.reload();
	            } else if ($(this).is(":checked") == true) {

	                let prodno = current.data('prodno');
	                let wishno = current.data('wishno');

	                $.post("${pageContext.request.contextPath}/05_wishlist/wishlist/item", {
	                    "userno": userno,
	                    "prodno": prodno,
	                    "wishno": wishno
	                }, function(json) {
	                    if (json.rt == "OK")
	                        alert("상품이 위시리스트에 추가 되었습니다.");
	                })
	            } else {
	                let current = $(this);
	                let prodno = current.data('prodno');
	                let wishno = current.data('wishno');

	                $.delete("${pageContext.request.contextPath}/05_wishlist/wishlist/item", {
	                    "prodno": prodno,
	                    "wishno": wishno
	                }, function(json) {
	                    if (json.rt == "OK") {
	                        alert("상품이 위시리스트에서 삭제 되었습니다.");
	                        location.reload();
	                    }
	                })
	            }

	        });
			
			/** 추천제품 - 장바구니 클릭 */
			$(document).on("click",".home_cartloc",function() {
			    let current = $(this); 
			  		let userno = current.data('userno');
			  		let prodno = current.data('prodno');
			  		
			  		$.post("${pageContext.request.contextPath}/06_cart/cart", {
			  			"userno": userno,
			  			"prodno": prodno,
			  		}, function(json) {
			  			if(json.rt=="OK")
			  				alert("상품이 장바구니에 추가 되었습니다.");
			  				location.reload();
			  		})
			});
		</script>
	</body>
</html>