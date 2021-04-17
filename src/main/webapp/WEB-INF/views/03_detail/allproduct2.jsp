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

<link rel="stylesheet" type="text/css" href="../assets/css/common.css">
<link rel="stylesheet" type="text/css" href="../assets/css/home.css">
<link rel="stylesheet" type="text/css"
	href="../assets/css/allproduct.css">

<!-- javascript -->
<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>


<!-- ajax-helper -->
<link rel="stylesheet" href="../assets/plugins/ajax/ajax_helper.css" />
<script src="../assets/plugins/ajax/ajax_helper.js"></script>



</head>

<body>
	<%@ include file="../01_home/header.jsp"%>
	<%@ include file="../01_home/search.jsp"%>
	<div class="allproduct">
		<div class="ul_wrap">
			<ul class="allproduct_category">
				<c:forEach var="item" items="${category1}" varStatus="status">
					<li
						class="category <c:if test="${item.catno1==input.catno1}">active</c:if>">
						<a class="category_a"
						href="${pageContext.request.contextPath}/03_detail/allproduct2.do?page=1&catno1=${item.catno1}">${item.catname1}</a>
					</li>
				</c:forEach>
			</ul>
		</div>

		<div id="result">
			<div class="result_content">
				<div class="allproduct_top">
					<c:if test="${input.catno1==101}">
						<h3 class="pdh3">소파/암체어</h3>
					</c:if>
					<c:if test="${input.catno1==102}">
						<h3 class="pdh3">침대</h3>
					</c:if>
					<c:if test="${input.catno1==103}">
						<h3 class="pdh3">수납/정리</h3>
					</c:if>
					<c:if test="${input.catno1==104}">
						<h3 class="pdh3">주방가/용품</h3>
					</c:if>
					<c:if test="${input.catno1==105}">
						<h3 class="pdh3">조명</h3>
					</c:if>
					<div class="allproduct_slide">

						<ul class="allproduct_slide_ul category2">
							<c:forEach var="item2" items="${category2}" varStatus="status">
								<c:if test="${item2.catno1==input.catno1}">
									<li
										class="category3 <c:if test="${item2.catno2==input.catno2}">active2</c:if>"><a
										class="category_a2"
										href="${pageContext.request.contextPath}/03_detail/allproduct2.do?catno1=${item2.catno1}&catno2=${item2.catno2}">${item2.catname2}</a></li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="allproduct_product">
					<ul class="allproduct_product_ul">
						<c:forEach var="proditem" items="${output}" varStatus="status">
							<c:url value="/03_detail/detail.do" var="viewUrl">
								<c:param name="prodno" value="${proditem.prodno}" />
							</c:url>

							<c:set var="prodno" value="${proditem.prodno}" />
							<li class="allproduct_product_ul_li"><input type="checkbox"
								id="chk_heart" class="chk_heart" style="display: none;"
								<c:if test="${wishoutput!=null }">checked</c:if>
								data-wishno="${my_wish}" data-prodno="${proditem.prodno }"
								data-userno="${userno}" /> <label class="heart" for="chk_heart"></label>
								<a href="${viewUrl}"> <img class="product_img"
									src="${proditem.thumbnailUrl}" />
							</a> <a href="${viewUrl}" class="text_box"> <c:if
										test="${fn:contains(proditem,'세일')}">
										<span class="sail">더낮은 새로운가격</span>
									</c:if> <c:if test="${fn:contains(proditem,'신제품')}">
										<span class="new">NEW</span>
									</c:if> <strong class="product_a">${proditem.name}</strong> <span
									class="mini_font">${proditem.size }</span> <span
									class="mini_font">${proditem.color}</span> <c:if
										test="${proditem.saleprice!=0}">
										<span class="sail_money">₩ <fmt:formatNumber
												value="${proditem.saleprice}" pattern="#,###" /></span>
									</c:if> <span
									class="money <c:if test="${fn:contains(proditem,'인기')}">home_item_mark</c:if>">
										<span class="money_won">₩</span> <span class="money_won2 "><fmt:formatNumber
												value="${proditem.price}" pattern="#,###" /></span>
								</span>



							</a> <a class="addcart" data-userno="${userno}"
								data-prodno="${proditem.prodno }"></a></li>
						</c:forEach>

						<!-- 구분선  -->
					</ul>
					<div class="page_box">
					<c:choose>
						<c:when test="${pageData.prevPage > 0}">
							<%-- 이동할 URL 생성 --%>
							<c:if test='${input.catno2!=0 }'>
							<c:url
								value="/03_detail/allproduct2.do?catno1=${input.catno1}&catno2=${input.catno2}"
								var="prevPageUrl">
								<c:param name="page" value="${pageData.prevPage}" />
							</c:url>
							</c:if>
							<c:if test='${input.catno2==0 }'>
							<c:url
								value="/03_detail/allproduct2.do?catno1=${input.catno1}"
								var="prevPageUrl">
								<c:param name="page" value="${pageData.prevPage}" />
							</c:url>
							</c:if>
							<a href="${prevPageUrl}">[이전]</a>
						</c:when>
						<c:otherwise>
           			 	[이전]
       				 	</c:otherwise>
					</c:choose>

					<c:forEach var="i" begin="${pageData.startPage}"
						end="${pageData.endPage}" varStatus="status">
						<%-- 이동할 URL 생성 --%>
						<c:if test='${input.catno2!=0 }'>
							<c:url
								value="/03_detail/allproduct2.do?catno1=${input.catno1}&catno2=${input.catno2}"
								var="pageUrl">
								<c:param name="page" value="${i}" />
							</c:url>
						</c:if>
						<c:if test='${input.catno2==0 }'>
							<c:url
							value="/03_detail/allproduct2.do?catno1=${input.catno1}"
							var="pageUrl">
							<c:param name="page" value="${i}" />
							</c:url>
						</c:if>

						<%-- 페이지 번호 출력 --%>
						<c:choose>
							<%-- 현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
							<c:when test="${pageData.nowPage == i}">
								<strong>[${i}]</strong>
							</c:when>
							<%-- 나머지 페이지의 경우 링크 적용함 --%>
							<c:otherwise>
								<a href="${pageUrl}">[${i}]</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<%-- 다음 그룹으로 이동 가능하다면? --%>
						<c:when test="${pageData.nextPage > 0}">
							<%-- 이동할 URL 생성 --%>
							<c:if test='${input.catno2!=0 }'>
							<c:url
								value="/03_detail/allproduct2.do?catno1=${input.catno1}&catno2=${input.catno2}"
								var="nextPageUrl">
								<c:param name="page" value="${pageData.nextPage}" />
							</c:url>
							</c:if>
							<c:if test='${input.catno2==0 }'>
							<c:url
								value="/03_detail/allproduct2.do?catno1=${input.catno1}"
								var="nextPageUrl">
								<c:param name="page" value="${pageData.nextPage}" />
							</c:url>
							</c:if>
							<a href="${nextPageUrl}">[다음]</a>
						</c:when>
						<c:otherwise>
            			[다음]
        				</c:otherwise>
					</c:choose>
					</div> <!-- // page_box -->
				</div>
				<!-- //allproduct_product -->
			</div>

		</div>
		<!-- //result -->
		<a href="#" class="moveup">맨 위로 이동</a>
	</div>
	<%@ include file="../01_home/footer.jsp"%>
	<script src="../assets/js/home.js"></script>
	<script src="../assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
	<script src="../assets/plugins/toTop/totop.min.js"></script>
	<script type="text/javascript">
	 
	 $('.moveup').tottTop({
			scrollTop:0
		});
	
	 $(function() {
 		
			$("#chk_heart").click(function(e) {
				let current = $(this); 
	    		let userno = current.data('userno');
				if(userno==0){
					alert("로그인을 먼저 하세요");
					return false;
				}else if($("#chk_heart").is(":checked") == true){
		    		let prodno = current.data('prodno');
		    		let wishno = current.data('wishno');
		    		
		    		$.post("${pageContext.request.contextPath}/05_wishlist/wishlist/item", {
		    			"userno": userno,
		    			"prodno": prodno,
		    			"wishno": wishno
		    		} , function(json) {
		    			if(json.rt=="OK")
		    				alert("상품이 위시리스트에 추가 되었습니다.");
		    		})
				}else{
					let current = $(this); 
		    		let prodno = current.data('prodno');
		    		let wishno = current.data('wishno');
		    		
		    		$.delete("${pageContext.request.contextPath}/05_wishlist/wishlist/item", {
		    			"prodno": prodno,
		    			"wishno": wishno
		    		}, function(json) {
		    			if(json.rt=="OK")
		    				alert("상품이 위시리스트에서 삭제 되었습니다.");
		    				location.reload();
		    		})
				}	
				});
			
			if($('.allproduct_product_ul li').length == 0){
				$('.allproduct_product').html("<div class='no_prod'>검색된 상품이 없습니다.</div>");
			}
			
			});
			
			 
			// 1개 상품만 장바구니로 옮기기
			 $(document).on("click",".addcart",function(){
				    let current = $(this); 
		    		let userno = current.data('userno');
		    		let prodno = current.data('prodno');
		    		
		    		$.post("${pageContext.request.contextPath}/06_cart/cart", {
		    			"userno": userno,
		    			"prodno": prodno,
		    		}, function(json) {
		    			if(json.rt=="OK")
		    				alert("상품이 장바구니에 추가 되었습니다.");
		    				location.reload(); // 장바구니로 이동 수정 예
		    		})
			 });
				
	    		
	
	</script>
</body>
</html>