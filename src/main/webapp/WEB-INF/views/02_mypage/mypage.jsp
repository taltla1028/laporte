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
    <link rel="stylesheet" type="text/css" href="../assets/css/common.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/mypage.css">

<!-- javascript -->
    <script src="http://code.jquery.com/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<!-- ajax-helper -->
    <link rel="stylesheet" href="../assets/plugins/ajax/ajax_helper.css" />
    <script src="../assets/plugins/ajax/ajax_helper.js"></script>
    
    	<!-- sweetalert -->
    <link rel="stylesheet" href="../assets/plugins/sweetalert/sweetalert2.min.css">
   
</head>

<body>
	<%@ include file="../01_home/header.jsp" %>
	<section>
	<%@ include file="../01_home/search.jsp"%>
		<div class="container">
			<div class="profile_header">
				<div>
					<h3 id="profile_hi_msg">안녕하세요, ${output.name}님</h3>
				</div>
				<div class="profile_logout_box">
					<span class="profile_logout_txt">로그아웃을 하고 싶으신가요?</span>
					<a class="pofile_logout_link" href="${pageContext.request.contextPath}/logout.do">로그아웃</a>
				</div>
			</div>
			<div class="profile_body">
				<div class="row">
					<div class="col-sm-3 col-md-3 col-xs-12 profile_link_box">
						<div class="profile_bolder">
						<a class="profile_link_a" href="${pageContext.request.contextPath}/02_mypage/order.do">
						<div class="profile_link clearfix">
							<div class="profile_link_txt pull-left">
								<span class="profile_link_title">
									주문 내역
								</span>
								<span class="profile_link_status">
									완료된 주문 ${o_output}개
								</span>
							</div>
							<span class="profile_arrow_icon pull-right"></span>
						</div>
						</a>
						</div>
					</div>
					<div class="col-sm-3 col-md-3 col-xs-12 profile_link_box">
						<div class="profile_bolder">
						<a class="profile_link_a" href="${pageContext.request.contextPath}/05_wishlist/wishlist.do?userno=${output.userno}">
						<div class="profile_link clearfix">
							<div class="profile_link_txt pull-left">
								<span class="profile_link_title">
									위시리스트
								</span>
								<span class="profile_link_status">
									저장된 리스트 ${w_output}개
								</span>
							</div>
							<span class="profile_arrow_icon pull-right"></span>
						</div>
						</a>
					</div>
					</div>
						
					<div class="col-sm-3 col-md-3 col-xs-12 profile_link_box">
						<div class="profile_bolder">
						<a class="profile_link_a" href="${pageContext.request.contextPath}/08_reserve/reserve_list.do?userno=${output.userno}">
						<div class="profile_link clearfix">
							<div class="profile_link_txt pull-left">
								<span class="profile_link_title">
									홈퍼니싱 컨설팅 서비스
								</span>
								<span class="profile_link_status">
									예약된 서비스 ${r_output}개
								</span>
							</div>
							<span class="profile_arrow_icon pull-right"></span>
						</div>
						</a></div>
					</div>
					
					<div class="col-sm-3 col-md-3 col-xs-12 profile_link_box">
						<div class="profile_bolder">
							<div class="profile_link clearfix">
								<div class="profile_link_txt pull-left">
									<span class="profile_link_title">
										포인트
									</span>
									<span class="profile_link_status">
										${output.point}원
									</span>
								</div>
							</div>
						</div>
					</div>
			
				
				
				<!--row 끝-->
				<div class="profile_tab_box">
					<!-- 탭 버튼 구성 -->
					<ul class="nav nav-tabs" id="profile_tab">
						<li class="active profile_li"><a href="#profile_tab_page1" data-toggle="tab" id="myprofile">계정</a></li>
						<li class="profile_li"><a href="#profile_tab_page2" data-toggle="tab" id="address">주소</a></li>
						<li class="profile_li"><a href="#profile_tab_page3" data-toggle="tab" id="setting">설정</a></li>
					</ul>
					<!-- 탭 페이지 구성 -->
					<div class="tab-content">
						<!--계정 탭-->
						<div role="tabpanel" class="tab-pane fade active in" id="profile_tab_page1">
							<div id="profile_info" class="content_box">
								<div class="clearfix profile_title">
									<span class="prof_title pull-left">개인 정보</span>
									<button type="button" id="profile_info_alter" class="pull-right alter_btn">수정</button>
								</div>
								<div id="profile_info_box">
									<p id="name"></p>
									<p id="birthdate"></p>
									<p id="gender"></p>
								</div>
								<!--수정 버튼 클릭시 나오는 수정 박스-->
								<div id="info_alter">
									<form id="userinfo-form" action="${pageContext.request.contextPath}/02_mypage/pwrevise_ok">
										<div class="form-group">

											<label for="edit_user_name">이름</label>
											<input type="text" id="edit_user_name" name="name" class="form-control" value="${output.name}">
											
											<label for="edit_user_bd">생일</label>
											<!--숫자만 입력가능하게-->
											<input type="date" id="edit_user_bd" name="birthdate" class="form-control" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="${output.birthdate}"/>
											
											<label for="user_gender" id="select_gender_label">성별 (선택사항)</label>
											<select id="user_gender" name="gender">
												<option value=""></option>
												<option <c:if test="${output.gender == 'M'}" > selected </c:if> value="M">남자</option>
												<option <c:if test="${output.gender == 'F'}" > selected </c:if> value="F">여자</option>
												<option <c:if test="${output.gender == 'N'}" > selected </c:if> value="N">응답 거부</option>
											</select>

											<button type="reset" class="btn btn-default edit_btn_cancel">취소</button>
											<a id="edit_userinfo" href="#" data-userno="${output.userno}" class="btn btn-primary edit_btn_save info_alter_save">저장</a>
										</div>
									</form>
								</div>
								<!--수정 박스 끝-->
							</div>
							<div id="profile_contact" class="content_box">
								<div class="clearfix profile_title">
									<span class="prof_title pull-left">연락처</span>
									<button type="button" id="profile_contact_alter" class="pull-right alter_btn">수정</button>
								</div>
								<div id="profile_contact_box">
									<p id="tel"></p>
									<p id="email"></p>
								</div>
								<!--수정 버튼 클릭시 나오는 수정 박스-->
								<div id="contact_alter_box">
									<form id="usercon-form" action="${pageContext.request.contextPath}/02_mypage/userConRevise_ok">
										<div class="form-group">
											<label for="edit_tel">휴대폰</label>
											<input type="text" id="edit_tel" name="phoneno" value="${output.phoneno}" class="form-control" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
											
											<label for="edit_email">이메일</label>
											<input type="text" id="edit_email" name="email" value="${output.email}" class="form-control">
										
											<button type="reset" class="btn btn-default edit_btn_cancel">취소</button>
											<a id="edit_contact" href="#" data-userno= "${output.userno}" class="btn btn-primary edit_btn_save contact_alter_save">저장</a>
										</div>
									</form>
								</div>
								<!--수정 박스 끝-->
							</div>
							<div id="profile_pwd" class="content_box">
								<div class="clearfix profile_title">
									<span class="prof_title pull-left">비밀번호 수정</span>
									<button type="button" id="profile_pwd_alter" class="pull-right alter_btn">수정</button>
								</div>
								<div id="profile_pwd_box">
									<p id="pw"></p>
								</div>
								<!--수정 버튼 클릭시 나오는 수정 박스-->
								<div id="pwd_alter_box">
									<form id="userpw-form" action="${pageContext.request.contextPath}/02_mypage/pwrevise_ok">
										<div class="form-group">
											<div class="pwd_input_box">
											<input type="hidden" name="userno" value="${output.userno}" />
											
												<label for="new_pwd" class="pwd_label placeholder_event">새 비밀번호</label>
												<input id="new_pwd" name="userpwd" type="password" class="form-control pwd_label_event"/>
												<span class="new_pw_alert">비밀번호에는 다음이 포함되어야 합니다.</span>
												<button type="button" class= "showPassword">
													<span class="pw_hide_icon">비밀번호숨기기</span>
													<span class="pw_show_icon">비밀번호보이기</span>
												</button>
												<div class="new_pw_valid">
													<span id="pw_length">8-20자 ✓</span>
													<span id="pw_english">영문  ✓</span>
													<span id="pw_special">특수문자  ✓</span>
													<span id="pw_num">숫자  ✓</span>
												</div>
											</div>
											<div class="pwd_input_box">
												<label for="new_pwd_conf" class="pwd_label placeholder_event">새 비밀번호 확인</label>
												<input id="new_pwd_conf" name="new_pwd_conf" type="password" class="form-control pwd_label_event"/>
												<button type="button" class= "showPassword">
													<span class="pw_hide_icon">비밀번호숨기기</span>
													<span class="pw_show_icon">비밀번호보이기</span>
												</button>
												<span class="new_pwd_conf_alert">비밀번호를 다시 입력해야 합니다.</span>
											</div>
											<button type="reset" class="btn btn-defaults edit_btn_cancel">취소</button>
											<a id="edit_password" href="#" data-userno="${output.userno}" class="btn btn-primary edit_btn_save pwd_alter_save">저장</a>
										</div>
									</form>
								</div>
								<!--수정 박스 끝-->
							</div>
							
							<!-- 회원 쿠폰 조회 -->
							
							<div id="coupon_point" class="content_box">
								<div class="clearfix profile_title">
									<span class="prof_title pull-left">쿠폰</span>
								</div>
									<c:forEach var="item" items="${uc_output}" varStatus="stauts">
										<li class="coupon_list">
										<p class="coupon_name">${item.name}</p> 
										<hr />
										<p>${item.discount}
											<c:choose>
												<c:when test="${item.distype == 'P'}">
													<span class="coupon_type">% 할인</span>
												</c:when>
												<c:otherwise>
													<span class="coupon_type">원 할인</span>
												</c:otherwise>
											</c:choose> 
										</p>
											<p>${item.startdate} ~ ${item.enddate}</p>
										</li>
									</c:forEach>
								</div>
							</div>
						
						<!--주소 탭-->
						<div role="tabpanel" class="tab-pane fade" id="profile_tab_page2">
							<div id="profile_address" class="content_box">
								<div class="clearfix profile_title">
									<span class="prof_title pull-left">기본 주소</span>
									<button type="button" id="profile_address_alter" class="pull-right alter_btn">수정</button>
								</div>
								<div id="address_info">
									<p id="address_basic"></p>
									<p id="address_detail"></p>
									<p id="address_post"></p>
								</div>
								<!--수정 버튼 클릭시 나오는 수정 박스-->
								<div id="contact_address_box">
									<form role="useraddr-form">
										<div class="form-group">
											<button type="button" class="btn btn-primary" id="find_pc" onclick="sample3_execDaumPostcode()">우편번호 찾기</button>
											<div id="daum_pc_find">
												<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
													<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
												</div>
											</div>

											<div class="address_input_box">
												<label for="edit_address" class="edit_address_label">도로명 주소</label>
												<input type="text" id="edit_address" name="addr1" value="${output.addr1}" class="form-control address_label_event" readonly>
											</div>
											
											<div class="address_input_box">
												<label for="edit_address_detail" class="edit_address_label">상세 주소</label>
												<input type="text" id="edit_address_detail" name="addr2" value="${output.addr2}" class="form-control address_label_event">
											</div>
											
											<div class="address_input_box">
												<label for="edit_post" class="edit_address_label">우편번호</label>
												<input type="text" id="edit_post" name="postcode" value="${output.postcode}" class="form-control address_label_eventl" readonly>
											</div>
											
											<button type="reset" class="btn btn-default edit_btn_cancel">취소</button>
											<a id="edit_addr" data-userno="${output.userno}" class="btn btn-primary edit_btn_save contact_alter_save">저장</a>
										</div>
									</form>
								</div>
								<!--수정 박스 끝-->
							</div>
						</div>
						<!--설정 탭-->
						<div role="tabpanel" class="tab-pane fade" id="profile_tab_page3">
							
								<div class="delete_user_box">
									<span class="prof_title">회원 정보 삭제</span>
									<p class="delete_persuade">la Porte를 더 이상 이용하지 않는다면 언제든 탈퇴할 수 있습니다. 
										단, 회원 정보 및 구매 내역이 함께 삭제된다는 점을 참고해주세요.</p>
									<a href="#" data-userno= "${output.userno}" id="delete_user" class="delete_user">계정을 삭제하시겠어요?</a>
								</div>
						</div>
					</div>
				</div><!--profile_tab_box 끝-->
			</div><!--body 끝-->
		</div>
	</section>
	<%@ include file="../01_home/footer.jsp" %>
	
	<!-- swweetalert -->
<script src="../assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
	
	
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="../assets/js/home.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	
		  <!--Google CDN 서버로부터 jQuery 참조 -->
    <!-- jQuery Ajax Form plugin CDN -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
    <!-- jQuery Ajax Setup -->
    <script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
    
    
    <script type="text/javascript">
		$(document).ready(function(){
			
			$("#info_alter").hide();
			$("#contact_alter_box").hide();
			$("#pwd_alter_box").hide();
			$(".pw_show_icon").hide();
			$(".new_pw_alert").hide();
			$(".new_pw_valid").hide();
			$(".new_pwd_conf_alert").hide();
			$("#contact_address_box").hide();
			$(".marketing_box_alter").hide();
		});

    /* ------------ 탭 컨텐츠에 출력하는 내용 ------------ */
		$(function() {
				
				var name = $('#edit_user_name').val();
				$("#name").html(name);
				
				var bd= $('#edit_user_bd').val();
				var bd_y = bd.substring(0,4);
				var bd_m = bd.substring(6,7);
				var bd_d = bd.substring(8);
				$("#birthdate").html(bd_y+"년 "+bd_m+"월 "+bd_d+"일");

				var gender_eng=$('#user_gender > option:selected').val();
				var gender_kor="";
				if(gender_eng=="M"){
					gender_kor="남자";
				}else if(gender_eng=="F"){
					gender_kor="여자";
				}else if(gender_eng=="N"){
					gender_kor="응답 거부";
				}else{
					$("#select_gender_label").addClass("select_label_ani");
				}
				$('#gender').html(gender_kor);
			
				//개인 정보 수정하기
				$('#edit_userinfo').click(function(e){
					e.preventDefault();
					
					let current = $(this);
					let userno = current.data('userno');
					let name = $('#edit_user_name').val();
					let birthdate = $('#edit_user_bd').val();
					let gender = $('#user_gender > option:selected').val();
					
					//put 메서드로 ajax 요청
					$.put("${pageContext.request.contextPath}/02_mypage/userInfoRevise_ok",{
						"userno" : userno,
						"name" : name,
						"birthdate" : birthdate,
						"gender" : gender
					},function(json){
						if(json.rt == "OK"){
						alert('개인정보가 수정되었습니다.');
						location.reload();
					}
				 });
			});
				
				//핸드폰번호 11자리일 경우
				var tel = $('#edit_tel').val();
				if(tel.length==11){
					var tel1=tel.substring(0,3);
					var tel2=tel.substring(3,7);
					var tel3=tel.substring(7);
					$("#tel").html(tel1+"-"+tel2+"-"+tel3);
				}//핸드폰 번호가 10자리일 경우
					else if(tel.length==10){
					var tel1=tel.substring(0,3);
					var tel2=tel.substring(3,6);
					var tel3=tel.substring(6);
					$("#tel").html(tel1+"-"+tel2+"-"+tel3);
				}
				
				//이메일 출력
				var email = $('#edit_email').val();
				$('#email').html(email);
		
				//연락처 수정하기
				$('#edit_contact').click(function(e){
					e.preventDefault();
					
					let current = $(this);
					let userno = current.data('userno');
					let phoneno = $('#edit_tel').val();
					let email = $('#edit_email').val();
					
					//put 메서드로 ajax 요청
					$.put("${pageContext.request.contextPath}/02_mypage/userConRevise_ok",{
						"userno" : userno,
						"phoneno" : phoneno,
						"email" : email
					},function(json){
						if(json.rt == "OK"){
						alert('연락처가 수정되었습니다.');
						location.reload();
					}
				 });
			});
		});

		
		//수정 버튼 클릭시 
		$(function(){
			$("#profile_info_alter").click(function() {
				$("#profile_info_box").toggleClass("hide");
				$("#info_alter").toggleClass("show");
				
			});
			$("#profile_contact_alter").click(function() {
				$("#profile_contact_box").toggleClass("hide");
				$("#contact_alter_box").toggleClass("show");

			});
			$("#profile_pwd_alter").click(function() {
				$("#profile_pwd_box").toggleClass("hide");
				$("#pwd_alter_box").toggleClass("show");
			});

			/*--------주소 창에서 수정 버튼 클릭시 ------------*/
			$("#profile_address_alter").click(function() {
				$("#address_info").toggleClass("hide");
				$("#contact_address_box").toggleClass("show");
			});

			$(".address_label_event").focus(function() {
					var label_event = $(this).parent(".address_input_box").find('.edit_address_label');
					$(label_event).removeClass('placeholder_event');
			});

			//주소창 입력창 포커스를 벗어났을때 placeholder 이벤트효과 적용 - 입력값이 없는경우에만.
			$(".address_label_event").focusout(function() {
				var value=$(this).val();
				if(!value){
					var label_event = $(this).parent(".address_input_box").find('.edit_address_label');
					$(label_event).addClass('placeholder_event');
				}
			});
			
			var addr1 = $('#edit_address').val();
			var addr2 = $('#edit_address_detail').val();
			var postcode = $('#edit_post').val();
			
			$("#address_basic").html(addr1);
			$("#address_detail").html(addr2);
			$("#address_post").html(postcode);
			
			
			//주소 수정하기
			$('#edit_addr').click(function(e){
				e.preventDefault();
				
				let current = $(this);
				let userno = current.data('userno');
				let addr1 = $('#edit_address').val();
				let addr2 = $('#edit_address_detail').val();
				let postcode = $('#edit_post').val();
				
				//put 메서드로 ajax 요청
				$.put("${pageContext.request.contextPath}/02_mypage/userAddrRevise_ok",{
					"userno" : userno,
					"addr1" : addr1,
					"addr2" : addr2,
					"postcode" : postcode
				},function(json){
					if(json.rt == "OK"){
					alert('주소가 수정되었습니다.');
					location.reload();
				}
			 });
		});
		});

		/*-------비밀번호 보기 (눈) 버튼 클릭시 이벤트 처리--------*/
		$(function() { 
			$(document).ready(function(){
				$('.showPassword').on('click', function(){
					var passwordField = $(this).parents('.pwd_input_box').find('.form-control');
					var passwordFieldType = passwordField.attr('type');
					if(passwordFieldType == 'password'){
            			// input type을 text로 바꿈
						passwordField.attr('type', 'text');
						//password 가리기 아이콘 숨기고 password보이기 아이콘 보여주기                
						$(this).find(".pw_hide_icon").hide()
						$(this).find(".pw_show_icon").show()
					} else {
                		// input type이 password가 아닐경우 password로 변경
						passwordField.attr('type', 'password');

                		// password보여주기 아이콘 숨기고, password숨기기 아이콘 보여주기
						$(this).find(".pw_show_icon").hide()
						$(this).find(".pw_hide_icon").show() 
					}
				});

				//비밀번호 입력창에 포커스 이벤트가 일어나면 placeholder이벤트 없애기
				$(".pwd_label_event").focus(function() {
					var label_event = $(this).parent(".pwd_input_box").find('.pwd_label');
					$(label_event).removeClass('placeholder_event');
				});

				//비밀번호 입력창 포커스를 벗어났을때 placeholder 이벤트효과 적용 - 입력값이 없는경우에만.
				$(".pwd_label_event").focusout(function() {
					var value=$(this).val();
					if(!value){
						var label_event = $(this).parent(".pwd_input_box").find('.pwd_label');
						$(label_event).addClass('placeholder_event');
					}
				});
			});
		});

		$(function(){
			// 새비밀번호 유효성 검사
			$('#new_pwd').keyup(function(e){
				e.preventDefault;

			$(".new_pw_alert").show()
			$(".new_pw_valid").show()

			var new_pw_input = $('#new_pwd').val();
			var num = new_pw_input.search(/[0-9]/g);
			var eng = new_pw_input.search(/[a-z]/ig);
			var spe = new_pw_input.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
			var red_line = 0;

            if(eng > -1){
				$('#pw_english').css("color","#437fb3");
			}else{ 
				$('#pw_english').css("color","#333");
				red_line++;
			}

        
            if(num > -1){
				$('#pw_num').css("color","#437fb3");
            }else{
				$('#pw_num').css("color","#333");
				red_line++;
			}

            if(spe > -1){
				$('#pw_special').css("color","#437fb3");
			}else{
				$('#pw_special').css("color","#333");
				red_line++;
			}
        
            if(new_pw_input.length > 7 && new_pw_input.length < 21){
				$('#pw_length').css("color","#437fb3");
            }else{
				$('#pw_length').css("color","#333");
				red_line++;
			}

			if(red_line>0){
				$("#new_pwd").addClass("red_line");
				$(".new_pw_alert").show();
				$(".new_pw_valid").show();
			}else{
				$("#new_pwd").removeClass("red_line");
				$(".new_pw_alert").hide();
				$(".new_pw_valid").hide();
			}

			if(!new_pw_input){
				var label_event = $(this).parent(".pwd_input_box").find('.pwd_label');
				$(label_event).removeClass('placeholder_event');
			}
		});

		//새비밀번호 확인하기
		$('#new_pwd_conf').keyup(function(e){
			e.preventDefault;

			var pwInput = $('#new_pwd').val();
			var pwInputCheck = $('#new_pwd_conf').val();
			if(pwInput == pwInputCheck){
				$("#new_pwd_conf").removeClass("red_line");
				$(".new_pwd_conf_alert").hide();

			}else{
				$("#new_pwd_conf").addClass("red_line");
				$(".new_pwd_conf_alert").show();
			}
		});
		
		//새 비밀번호로 수정하기
		$('#edit_password').click(function(e){
			e.preventDefault();
			
			let current = $(this);
			let userno = current.data('userno');
			let userpwd = $('#new_pwd').val();
			
			//put 메서드로 ajax 요청
			$.put("${pageContext.request.contextPath}/02_mypage/pwrevise_ok",{
				"userno" : userno,
				"userpwd" : userpwd
			},function(json){
				if(json.rt == "OK"){
				alert('비밀번호가 재설정되었습니다.');
				location.reload();
			}
		 });
	});
	});

/*-------------------------우편번호 ------------------------------------*/
		   // 우편번호 찾기 화면을 넣을 element
		 // 우편번호 찾기 찾기 화면을 넣을 element
	var element_wrap = document.getElementById('wrap');

function foldDaumPostcode() {
	// iframe을 넣은 element를 안보이게 한다.
	element_wrap.style.display = 'none';
}

function sample3_execDaumPostcode() {
	// 현재 scroll 위치를 저장해놓는다.
	var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
	new daum.Postcode({
		oncomplete: function(data) {
			// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('edit_post').value = data.zonecode;
			document.getElementById("edit_address").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("edit_address_detail").focus();

			// iframe을 넣은 element를 안보이게 한다.
			// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
			element_wrap.style.display = 'none';

			// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
			document.body.scrollTop = currentScroll;
		},
		// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
		onresize : function(size) {
			element_wrap.style.height = size.height+'px';
		},
		width : '100%',
		height : '100%'
	}).embed(element_wrap);

	// iframe을 넣은 element를 보이게 한다.
	element_wrap.style.display = 'block';
}

	
//회원 탈퇴하기
$('#delete_user').click(function(e){
	e.preventDefault();
	
	let current = $(this);
	let userno = current.data('userno');
	let outreason = "";
	
	if(!confirm("정말 탈퇴하시겠습니까? 탈퇴하신 후에는 회원 복구가 불가능 합니다.")){
		return false;
	}else{
	outreason = prompt("탈퇴하시는 이유를 laporte에게 알려주시면 추후 서비스에 참고하겠습니다.");
	}
	//put 메서드로 ajax 요청
	$.delete("${pageContext.request.contextPath}/02_mypage",{
		"userno" : userno,
		"outreason" : outreason
	},function(json){
		if(json.rt == "OK"){
		alert("회원 탈퇴가 정상적으로 되었습니다. 그동안 저희 laporte를 이용해주셔서 감사합니다.");
		window.location = "${pageContext.request.contextPath}/logout.do"
	}
 });
});
    </script>
</body>
</html>