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
<link rel="stylesheet" type="text/css" href="../assets/css/common.css">
<link rel="stylesheet" type="text/css" href="../assets/css/wishlist.css">

<!-- javascript -->
<script src="http://code.jquery.com/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<!-- ajax-helper -->
<link rel="stylesheet" href="../assets/plugins/ajax/ajax_helper.css" />
<script src="../assets/plugins/ajax/ajax_helper.js"></script>
</head>

<body>
	<%@ include file="../01_home/header.jsp"%>
	<section>
	<%@ include file="../01_home/search.jsp"%>
		<!-- 검색제외 본문영역 -->
		<div id="wishlist_container">
			<c:if test="${userno == 0 }">
				<a href="#" id="wish_title_box"><span id="wish_title">위시리스트</span>
				<img class="wish_arrow_icon"
				src="https://www.ikea.com/kr/ko/shoppinglist/static/media/chevron-down-thin-24.1667eab2.svg"
				alt="아래 방향 화살표"></a>
			</c:if>
			<c:if test="${userno != 0 }">
			<a href="#" id="wish_title_box"><span id="wish_title">${nowwilist.title}</span>
				<img class="wish_arrow_icon"
				src="https://www.ikea.com/kr/ko/shoppinglist/static/media/chevron-down-thin-24.1667eab2.svg"
				alt="아래 방향 화살표"></a>
			<div class="wish_gray_layer" id="wish_background"></div>
			<div class="wish_over_layer" id="wish_front">
				<h4>나의 리스트</h4>
				<span class="wish_close_button"></span>
				<div class="wishlist_list_box">
					<div class="wishlist_list_container">
						<div class="wishlist_list clear">
							<a href="#" data-wishno="${basicoutput.wishno }" class="move_wish_title">
								<span class="wishlist_select pull-left <c:if test="${nowwilist.wishno==basicoutput.wishno}">bold_class</c:if>">위시리스트</span>
							</a>
							 <span class="wishlist_delete_icon pull-right"></span> 
							 <span class="wishlist_rename_icon"></span>
						</div>
						<div id="alert_basic_wishlist"></div>
						<div class="rename_edit_box"></div>
						
						<!-- forEach 돌아가 곳 -->
						<div id="wishlist_foreach">
						<c:forEach var="item" items="${wishlist}">
						<div class="new_wishlist_list clear">
							<hr class="wish_hr" />
							<div class="wishlist_hide_box">
								<a href="#" data-wishno="${item.wishno}" class="move_wish_title">
									<span class="wishlist_select pull-left <c:if test="${item.wishno == nowwilist.wishno}">bold_class</c:if>">${item.title}</span>
								</a>
								<span class="wishlist_delete_icon pull-right"></span>
								<span class="wishlist_rename_icon"></span>
							</div>
							<div class="wishlist_edit_hide">
								<input type='text' value="${item.title}" class='editname'/>
								<button type='reset' class='wish_edit_cancel btn btn-default'>취소</button>
								<button type='button' class='wish_edit_save btn btn-primary' data-wishno='${item.wishno}'>저장</button>
							</div>
							<div class="wishlist_delete_hide">
								<p>리스트를 삭제하시겠습니까?</p>
								<button type='button' class='not_remove btn btn-default'>취소</button>
								<button type='button' class='real_remove btn btn-danger' data-wishno='${item.wishno}'>삭제</button>
							</div>
						</div>
						</c:forEach>
						</div>
						 <!-- forEach 끝-->
					</div>
					<div class="add_wishlist_box clear">
						<span class="add_wish_icon"></span><span class="add_wish_text">새로운
							리스트 만들기</span>
					</div>
					<div id="add_wishlist_container">
						<form class="add_wishlist_form" action="${pageContext.request.contextPath}/05_wishlist/wishlist">
							<label for="title">이름:</label> 
							<input type="text" name="title" id="title" />
							<div id="alert_none_name"></div>
							<div class="wish_add_btn_box clear">
								<button type="button" id="wishlist_add_reset"
									class="btn btn-default pull-left">취소</button>
								<button type="submit" id="wishlist_name_add"
									class="btn btn-primary pull-right">리스트 만들기</button>
							</div>
							<input type="hidden" name="userno" value="${userno}" />
						</form>
					</div>
				</div>
			</div>
			</c:if>
			<!-- 위시리스트에 상품이 없는경우 -->
			<c:if test="${basicwishprod.size()==0||(basicwishprod==null&&userno==0)}">
			<div class="change_add_wishitem">
				<img class="wish_img"
					src="https://www.ikea.com/kr/ko/shoppinglist/static/media/ill-alien.cb42647f.svg"
					alt="위시리스트 사진">
				<div id="wishlist_textbox">
					<p>
						시간이 더 필요하신가요?<br>저장한 후 나중에 구매해보세요.
					</p>
					<!-- 로그인을 안한경우 -->
					<c:if test="${userno==0}">
					<!-- <a href="../02_mypage/join.html" class="link"> --><a href="${pageContext.request.contextPath}/02_mypage/join.do" class="link">계정 만들기</a>
					<div class="wish_btn_box_container clear">
						<a href="#" class="wish_btn pull-left">제품검색</a>
						<a href="${pageContext.request.contextPath}/02_mypage/login.do" class="wish_btn pull-right">로그인</a>
					</div>
					</c:if>
				</div>
			</div>
			</c:if>
			<!-- 위시리스트에 상품이 추가 되었을때 바뀐는 부분 끝 -->
			<c:if test="${basicwishprod.size()!=0 && userno!=0}">
			<div class="change_add_wishlist">
			<div class="wish_contour"></div>
			<c:forEach var="item" items="${basicwishprod}">
				<div class="wish_item_contents clear">
				<div class="wish_img_box">
					<a href="${pageContext.request.contextPath}/03_detail/detail.do?prodno=${item.prodno}">
						<img src="${item.thumbnailurl}" alt="${item.name}" class="wish_prod_thumb"/>
					</a>
				</div>
				<div class="wish_item_desc clear">
					<h4 class="wish_item_name"><a href="${pageContext.request.contextPath}/03_detail/detail.do?prodno=${item.prodno}">STRÅLA 스트롤라</a></h4>
					<ul class="wish_item_desc_list">
						<%-- <li class="wish_desc_type">${item.catname2}</li> --%>
						<li class="wish_desc_color">${item.color} </li>
						<li class="wish_desc_num">상품번호 : ${item.prodno}</li>
					</ul>
				</div>
				<div class="wish_item_price">
					<c:if test="${item.saleprice!=0}">
						<div class="wish_item_total_price_sale">₩ <fmt:formatNumber value="${item.price * item.ea}" pattern="#,###" /></div>
						<div class="wish_item_sale_price">₩ <fmt:formatNumber value="${item.saleprice * item.ea}" pattern="#,###" /></div>
					</c:if>
					<c:if test="${item.saleprice==0}">
						<div class="wish_item_total_price">₩ <fmt:formatNumber value="${item.price * item.ea}" pattern="#,###" /></div>
					</c:if>
					<c:if test="${item.ea>1}" >
						<c:if test="${item.saleprice==0}">
							<div class="wish_item_1ea_price">₩ <fmt:formatNumber value="${item.price}" pattern="#,###" /> / 개 </div>
						</c:if>
						<c:if test="${item.saleprice!=0}">
							<div class="wish_item_1ea_price_sale_after">₩ <fmt:formatNumber value="${item.price}" pattern="#,###" /> / 개 </div>
							<div class="wish_item_1ea_saleprice">₩ <fmt:formatNumber value="${item.saleprice}" pattern="#,###" /> / 개 </div>
						</c:if>
					</c:if>
				</div>
				<div class="wish_item_control">
					<div class="wish_movetolist_box">
						<div class="wish_movetolist clear">
							<button type="button" class="btn-blue-color movewishbutton">다른 리스트로 이동</button>
						</div>
					</div>
					<div class="wish_control_btn_box clearfix">
						<div class="wish_item_remove">
							<button type="button" class="btn btn-default clear prod_delete_btn">
								<span class="wish_item_remove_img"></span>
							</button>
						</div>
						<div class="wish_item_quantity_box">
							<div class="form-group">
								<select name = "wish_item_count" class='wish_item_count' title="제품 수량 선택" class="form-control wish_item_quantity"
								data-wishno="${item.wishno}" data-prodno="${item.prodno}">
									<c:forEach begin="1" end="10" var="i">
                    					<option value="${i}" <c:if test="${i == item.ea}">selected</c:if>>${i}</option>
                					</c:forEach>
								</select>
							</div>
						</div>
						<div class="wish_item_addtobag">
							<button type="button" class="btn btn-primary addtobag_btn" data-prodno="${item.prodno}" data-ea="${item.ea}" data-userno="${userno }" data-wishno="${nowwilist.wishno }">
								<span class="addtobag_img"></span>장바구니에 추가
							</button>
						</div>
					</div>
				</div>
				<div class="wish_item_delete_box">
					<span class="wish_item_delete_text">이 제품을 삭제하시겠어요?</span>
					<div class="wish_delte_btn_box clear">
						<button type="button" class="btn wish_item_btn wish_item_delete_cancel">취소</button>
						<button type="button" class="btn wish_item_btn wish_item_delete_real pull-right" data-wishno="${item.wishno }" data-prodno="${item.prodno}">삭제</button>
					</div>
				</div>
				<!-- 다른 위시리스트로 이동 모달 -->
			<div class="wish_over_layer wishmove_front">
				<h4>나의 리스트</h4>
				<span class="wish_close_button"></span>
				<div class="wishlist_list_box">
					<div class="wishlist_list_container">
						<div class="wishlist_list clear">
							<a href="#" data-newwishno="${basicoutput.wishno }" class="move_wish_item" data-prodno="${item.prodno }" data-wishno="${nowwilist.wishno }">
								<span class="wishlist_select pull-left <c:if test="${nowwilist.wishno==basicoutput.wishno}">bold_class</c:if>">위시리스트</span>
							</a>
						</div>
						<!-- forEach 돌아가 곳 -->
						<c:forEach var="list" items="${wishlist}">
						<div class="new_wishlist_list clear">
							<hr class="wish_hr" />
							<div class="wishlist_hide_box">
								<a href="#" data-newwishno="${list.wishno}" class="move_wish_item" data-prodno="${item.prodno}" data-wishno="${nowwilist.wishno }">
									<span class="wishlist_select pull-left <c:if test="${list.wishno == nowwilist.wishno}">bold_class</c:if>">${list.title}</span>
								</a>
							</div>
							</div>
						</c:forEach>
						</div>
						 <!-- forEach 끝-->
					</div>
				</div>
			</div>
			<!-- 다른 위시리스트로 이동 모달  -->
			</c:forEach>
			
			<div class="wish_order_total">
				<div class="wish_order_total_row clear">
					<span class="wish_order_total_text">총 주문 금액</span>
					<c:set var="total" value="0" />
					<c:forEach var="result" items="${basicwishprod }" varStatus="status">
						<c:if test="${result.saleprice!=0 }">
							<c:set var="total" value="${total+result.saleprice*result.ea}" />
						</c:if>
						<c:if test="${result.saleprice==0 }">
							<c:set var="total" value="${total+result.price*result.ea}" />
						</c:if>
					</c:forEach>
					<span class="wish_order_total_price">₩ <fmt:formatNumber value="${total}" pattern="#,###" /></span>
				</div>
			</div>
			<c:if test="${basicwishprod.size()>1 }">
				<div class="add_alltobag">
					<button type="button" class="btn btn-primary all_addtobag_btn"data-wishno="${nowwilist.wishno}" data-userno="${userno }">
						<span class="addtobag_img"></span>모두 장바구니에 추가
					</button>
				</div>
			</c:if>
			
		</div>
		<!-- // 위시리스트에 상품을 추가 했을때 바뀌는 부분 끝 -->
		</c:if>
		</div>
	</section>
	
	<%@ include file="../01_home/footer.jsp"%>
	<!-- Handlebar 탬플릿 코드 -->
    <script id="prof-list-tmpl" type="text/x-handlebars-template">
		<div class="new_wishlist_list clear">
			<hr class="wish_hr" />
			<div class="wishlist_hide_box">
			<a href='#' data-wishno='{{item.wishno}}' class="move_wish_title">
				<span class="wishlist_select pull-left">{{item.title}}</span>
			</a>
			<span class="wishlist_delete_icon pull-right"></span>
			<span class="wishlist_rename_icon"></span>
			</div>
			<div class="wishlist_edit_hide">
				<input type='text' value="{{item.title}}" class='editname'/>
				<button type='reset' class='wish_edit_cancel btn btn-default'>취소</button>
				<button type='button' class='wish_edit_save btn btn-primary' data-wishno='{{item.wishno}}'>저장</button>
			</div>
			<div class="wishlist_delete_hide">
				<p>리스트를 삭제하시겠습니까?</p>
					<button type='button' class='not_remove btn btn-default'>취소</button>
					<button type='button' class='real_remove btn btn-danger' data-wishno='{{item.wishno}}'>삭제</button>
			</div>
		</div>
    </script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- Handlebar CDN 참조 -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.4.2/handlebars.min.js"></script>
	<!-- jQuery Ajax Form plugin CDN -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
    <!-- jQuery Ajax Setup -->
    <script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
	<script src="../assets/js/home.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$(".wish_item_delete_box").hide(); // 휴지통 아이콘을 클릭했을 때만 나타나게 함
    	$(".wishlist_edit_hide").hide();
    	$(".wishlist_delete_hide").hide();
		
		//$(".add_alltobag").hide(); // 상품이 리스트가 2개이상 일때 나타나게 함
	});
	$(function() {
 		//위시리스트 휴지통 버튼 클릭시
    	$(document).on('click','.wish_item_remove',function(e){
    		e.preventDefault();
			$(this).parents(".wish_item_control").hide();
			$(this).parents(".wish_item_contents").find(".wish_item_delete_box").show();
      	});
    	// 휴지통 버튼 > 취소 클릭시
    	$(document).on('click','.wish_item_delete_cancel',function(e){
    		e.preventDefault();
    		$(this).parents(".wish_item_contents").find(".wish_item_control").show();
			$(this).parents(".wish_item_delete_box").hide();
      	}); 
    	
    });  
	
		$(function() {
			/* --------------------wish modalwindow-------------------*/
			$("#wish_title").click(function(e) {
				e.preventDefault();
				$("#wish_background").fadeIn(300);
				$("#wish_front").fadeIn(200);
				$("#add_wishlist_container").hide();
				$(".add_wishlist_box").show();
			});
			// 배경을 클릭한 경우
			$("#wish_background").click(function(e) {
				e.preventDefault();
				$(this).fadeOut(300);
				$("#wish_front").fadeOut(200);
			});
			// 오른쪽 x버튼 (self.close << 쓰는게 깔끔)
			$(".wish_close_button").click(function(e) {
				e.preventDefault();
				$("#wish_front").fadeOut(200);
				$("#wish_background").fadeOut(100);
			});
			// 새로운 리스트 만들기 클릭시 리스트만들기 영역 보이기
			$(".add_wishlist_box").click(function(e) {
				e.preventDefault();
				$("#add_wishlist_container").show();
				$(".add_wishlist_box").hide();

			});
			// 새로운 리스트 만들기 취소 버튼 클릭시
			$("#wishlist_add_reset").click(function(e) {
				e.preventDefault();
				$("#add_wishlist_container").hide();
				$(".add_wishlist_box").show();
				$("#alert_none_name").html("");
			});
			// 새로운 리스트 만들기 리스트 만들기 버튼 클릭시
			
		});
		
		/** 다른 리스트로 이동 모달 */
		$(function() {
			/* --------------------wish modalwindow-------------------*/
			$(".movewishbutton").click(function(e) {
				e.preventDefault();
				$("#wish_background").fadeIn(300);
				$(".wishmove_front").fadeIn(200);
				$("#add_wishlist_container").hide();
				$(".add_wishlist_box").show();
			});
			// 배경을 클릭한 경우
			$("#wish_background").click(function(e) {
				e.preventDefault();
				$(this).fadeOut(300);
				$("#wish_front").fadeOut(200);
			});
			// 오른쪽 x버튼 (self.close << 쓰는게 깔끔)
			$(".wish_close_button").click(function(e) {
				e.preventDefault();
				$(".wishmove_front").fadeOut(200);
				$("#wish_background").fadeOut(100);
			});
		});
			
			//리스트 삭제 버튼 클릭시
			$(document)
					.on(
							'click',
							'.wishlist_delete_icon',
							function(e) {
								e.preventDefault();
								var delete_wishlist = $(this).parent();
								var delete_wishlist_box = $(this).parents(
										".new_wishlist_list").find(
										".wishlist_delete_hide");

								if ($(delete_wishlist)
										.hasClass("wishlist_list")) {
									var wishlist_delete_impo = $("<p>");
									wishlist_delete_impo
											.html("기본 위시리스트는 삭제 할 수 없습니다.");
									wishlist_delete_impo
											.css("color", "#f74b4b");
									wishlist_delete_impo.css("font-size",
											"14px");
									wishlist_delete_impo.css("margin-top",
											"-20px");
									$("#alert_basic_wishlist").html(
											wishlist_delete_impo);
									setTimeout(function() {
										$("#alert_basic_wishlist").html("");
									}, 2000); // 기본 위시리스트 삭제 클릭시 2초간 삭제불가 메시지 띄움
								} else {
									$(delete_wishlist_box).show();
								}
								//새로추가한 위시리스트일 경우에만 삭제 , 삭제 확인 박스 생성
							});

			//삭제 아이콘 > 취소 버튼 클릭시
			$(document).on('click', '.not_remove', function(e) {
				$(this).parents(".wishlist_delete_hide").hide();
			});

			//수정 버튼 클릭시
			$(document)
					.on(
							'click',
							'.wishlist_rename_icon',
							function(e) {
								e.preventDefault();
								var rename_wishlist_box = $(this).parent();
								var rename_wishlist_box2 = $(this).parent()
										.parent();
								var rename_wishlist_box3 = $(this).parents(
										".new_wishlist_list").find(
										".wishlist_edit_hide");
								var rename_text = $(rename_wishlist_box).eq(0);

								if ($(rename_wishlist_box).hasClass(
										"wishlist_list")) {
									var wishlist_edit_impo = $("<p>");
									wishlist_edit_impo
											.html("기본 위시리스트는 수정 할 수 없습니다.");
									wishlist_edit_impo.css("color", "#f74b4b");
									wishlist_edit_impo.css("font-size", "14px");
									wishlist_edit_impo.css("margin-top",
											"-20px");
									$("#alert_basic_wishlist").html(
											wishlist_edit_impo);
									setTimeout(function() {
										$("#alert_basic_wishlist").html("");
									}, 2000); // 기본 위시리스트 수정 클릭시 2초간 수정불가 메시지 띄움
								} else {
									$(rename_wishlist_box).hide();
									rename_wishlist_box3.css('height', '100px');
									var text = $(rename_text).text();
									
									$(rename_wishlist_box3).show();
								}//기본 위시리스트가 아닐 경우에만 수정 가능
							});
			// 수정 > 저장 버튼 클릭시 변경완료 및 수정 박스 숨기기
			$(document).on(
					'click',
					'.wish_edit_save',
					function(e) {
						e.preventDefault();

						var rename_parent = $(this).parents(
								".new_wishlist_list")
								.find(".wishlist_hide_box");
						var rename_name = $(this).parents(".new_wishlist_list")
								.find(".wishlist_select");
						var rename_text_new = $(this).parent()
								.find(".editname").val();
						var rename_edit_box = $(this).parent();

						$(rename_name).html(rename_text_new);
						$(rename_parent).show();
						$(rename_edit_box).hide();

					});
			// 수정 > 취소 버튼 클릭시 이전 화면으로 돌아가기
			$(document).on(
					'click',
					'.wish_edit_cancel',
					function(e) {
						e.preventDefault();
						var wish_rename_cancel = $(this).parents(
								".new_wishlist_list")
								.find(".wishlist_hide_box")
						var wish_rename_cancel_parent = $(this).parents(".wishlist_edit_hide");

						$(wish_rename_cancel).show();
						$(wish_rename_cancel_parent).hide();

					});
			//위시리스트 이름 클릭시 wishlist.html의 wish_title 변경
			$(document).on('click', '.move_wish_title', function(e) {
				e.preventDefault();
				
				let current = $(this);
				let wishno = current.data('wishno');
				window.location = "${pageContext.request.contextPath}/05_wishlist/wishlist.do?wishno="+wishno;
				
			});
		
		$(function() {
	    	$(".wish_item_count").change(function(e) {
	    		e.preventDefault();
	    		
	    		let current = $(this); //이벤트가 발생한 객체 자신 ==> <a>태그
	    		let prodno = current.data('prodno');    //data-prodno 값을 가져옴
	    		let wishno =current.data('wishno');         //data-wishno 값을 가져옴
	    		let ea = current.val();   //선택된 드롭다운의 값을 가져옴
	    		
	    		$.put("${pageContext.request.contextPath}/05_wishlist/wishlist", {
	    			"prodno": prodno,
	    			"wishno": wishno,
	    			"ea": ea
	    		}, function(json) {
	    			if(json.rt=="OK"){
	    				alert("수정되었습니다.");
	    				//삭제완료 후 목록 페이지로 이동
	    				location.reload();
	    			}
	    		})
	    	});
	    });
		
		 $(function() {
		    	//.add_wishlist_form에 대한 submit이벤트를 가로채서 Ajax 요청을 전송한다.
		    	$(".add_wishlist_form").ajaxForm({
		    		//전송 메서드 지정
		    		method: "POST",
		    		//서버에서 200 응답을 전달한 경우 실행됨
		    		success: function(json){
		    			//json에 포함된 데이터를 활용하여 상세페이지로 이동한다.
		    			if(json.rt == "OK"){
		    				console.log(json);
		    				var source = $("#prof-list-tmpl").html();   // 템플릿 코드 가져오기
		                    var template = Handlebars.compile(source);  // 템플릿 코드 컴파일
		                    var result = template(json);    // 템플릿 컴파일 결과물에 json 전달
		                    $("#wishlist_foreach").append(result);      // 최종 결과물을 #list 요소에 추가한다.
		                    $("#title").val("");
		    			}
		    		}
		    	});
		    });
		 
		 $(document).on("click",".real_remove",function(){
			 let current = $(this); //이벤트가 발생한 객체 자신 ==> <a>태그
	    		let wishno = current.data('wishno');    //data-wishno 값을 가져옴
	    		
	    		//delete 메서드로 Ajax 요청 --> <form>전송이 아니므로 직접 구현한다.
	    		$.delete("${pageContext.request.contextPath}/05_wishlist/wishlist", {
	    			"wishno": wishno
	    		}, function(json) {
	    			if(json.rt=="OK")
	    				console.log("위시리스트 삭제완료");
	    		})
	    		$(this).parents(".new_wishlist_list").remove();
		 }); 
		 
		 $(document).on("click",".wish_edit_save",function(){
			 let current = $(this); 
	    		let wishno = current.data('wishno');    //data-wishno 값을 가져옴
	    		let title = current.parent().find(".editname").val();
	    		
	    		//delete 메서드로 Ajax 요청 --> <form>전송이 아니므로 직접 구현한다.
	    		$.put("${pageContext.request.contextPath}/05_wishlist/wishlist/rename", {
	    			"wishno": wishno,
	    			"title": title
	    		}, function(json) {
	    			if(json.rt=="OK")
	    				console.log("위시리스트 수정 완료");
	    		})
		 }); 
		 
		 $(document).on("click",".wish_item_delete_real",function(){
			 let current = $(this); 
	    		let wishno = current.data('wishno');    //data-wishno 값을 가져옴
	    		let prodno = current.data('prodno');
	    		
	    		//delete 메서드로 Ajax 요청 --> <form>전송이 아니므로 직접 구현한다.
	    		$.delete("${pageContext.request.contextPath}/05_wishlist/wishlist/item", {
	    			"wishno": wishno,
	    			"prodno": prodno
	    		}, function(json) {
	    			if(json.rt=="OK")
	    			location.reload();
	    		})
		 }); 
		 
		 //위시리스트에 있는 상품 다른 리스트로 옮기기
		 $(document).on("click",".move_wish_item",function(){
			    let current = $(this); 
	    		let newwishno = current.data('newwishno');
	    		let prodno = current.data('prodno');
	    		let wishno = current.data('wishno');
	    		
	    		$.put("${pageContext.request.contextPath}/05_wishlist/wishlist/moveitem", {
	    			"newwishno": newwishno,
	    			"prodno": prodno,
	    			"wishno": wishno
	    		}, function(json) {
	    			if(json.rt=="OK")
	    				alert("상품이 이동되었습니다.");
	    				location.reload();
	    		})
		 }); 
		 
		 // 1개 상품만 장바구니로 옮기기
		 $(document).on("click",".addtobag_btn",function(){
			    let current = $(this); 
	    		let userno = current.data('userno');
	    		let prodno = current.data('prodno');
	    		let ea = current.data('ea');
	    		let wishno = current.data('wishno');
	    		
	    		$.post("${pageContext.request.contextPath}/06_cart/cart", {
	    			"userno": userno,
	    			"prodno": prodno,
	    			"ea": ea,
	    			"wishno": wishno
	    		}, function(json) {
	    			if(json.rt=="OK")
	    				alert("상품이 장바구니에 추가 되었습니다.");
	    				location.reload(); // 장바구니로 이동 수정 예
	    		})
		 });
		 
		 
		 // 모두 장바구니로 옮기기 
		 $(document).on("click",".all_addtobag_btn",function(){
			    let current = $(this); 
	    		let userno = current.data('userno');
	    		let wishno = current.data('wishno');
	    		
	    		$.delete("${pageContext.request.contextPath}/05_wishlist/wishlist/moveitem", {
	    			"userno": userno,
	    			"wishno": wishno,
	    		}, function(json) {
	    			if(json.rt=="OK")
	    			var result = confirm('상품이 모두 장바구니에 추가되었습니다. 지금 바로 장바구니로 이동 하시겠습니까?');
	    			
	    			if(result){
	    				window.location = "${pageContext.request.contextPath}/06_cart/cart.do?userno="+userno;
	    			}else{
	    				location.reload();
	    			}
	    		})
		 });
		 
		 
	</script>
</body>
</html>