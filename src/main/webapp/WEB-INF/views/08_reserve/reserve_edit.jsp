<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>

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
    <link rel="stylesheet" href="../assets/css/confirm.css"/>
     <link rel="stylesheet" href="../assets/css/edit.css"/>
      <link rel="stylesheet" href="../assets/dist/css/metallic/zebra_datepicker.css" type="text/css">
			<!-- css경로 ../ << 넣고 만들기  -->
<!-- javascript -->
    <script src="http://code.jquery.com/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<!-- ajax-helper -->
    <link rel="stylesheet" href="../plugins/ajax/ajax_helper.css" />
    <script src="../assets/plugins/ajax/ajax_helper.js"></script>
    <script src="../assets/plugins/handlebars/handlebars-v4.0.11.js"></script>
    <script src="../assets/dist/zebra_datepicker.src.js"></script>
	<script>window.jQuery || document.write('<script src="path/to/jquery-3.5.0.js"><\/script>')</script>
    <style type="text/css">
    	
    </style>
</head>

<body>
	<%@ include file="../01_home/header.jsp" %>
	<%@ include file="../01_home/search.jsp"%>
<!-- 본문영역 -->
	<section>
<!-- 내용영역 -->
		<div class="confirm_tab">
			<ul class="confirm_tab_ul">
				<li class="confirm_tab_ul_li ">
					<a href="${pageContext.request.contextPath}/08_reserve/reserve_cfm.do?reserveno=${output.reserveno}"class="confirem_tab_ul_li_a">
					예약 확인
					</a>
				</li>
				<li class="confirm_tab_ul_li active">
					<a href="${pageContext.request.contextPath}/08_reserve/reserve_edit.do?reserveno=${output.reserveno}"class="confirem_tab_ul_li_a">
					예약 수정
					</a>
				</li>
			</ul>
		</div>
    <form class="confirm_content" id="editForm" action="${pageContext.request.contextPath}/08_reserve">
    	<h3 class="confirm_content_h32">예약 수정</h3>
    <input type="hidden" name="reserveno" value="${output.reserveno}"/>
  		<div class="editbox">
    		<div class="editbox_input">
    			<label class="input_txt" for="reserveno">예약번호 </label>
    			<h4 class="input_txt_h4">${output.reserveno}</h4>
    		</div>
    		<div class="editbox_input">
    			<label class="input_txt" for="name">예약자 </label>
    			<h4 class="input_txt_h4">${output.name}</h4>	
    		</div>
    	</div>
    <div class="editbox_input">
		<label class="input_txt" for="date"> 예약일자 </label>
		
		<input value="${output.date}" name="date" id="datepicker" type="text" class="form-control" data-zdp_readonly_element="false"
			placeholder="캘린더에서 날짜를 선택해주세요.">
	</div>
	
    <div class="editbox_input">
		<label class="input_txt" for="showroom">매장선택</label>
		<select name="showroom" class="input_default">
			<option value="A" class='editbox_select-box_option' <c:if test="${output.showroom == 'A'}">selected</c:if>>강남점</option>
			<option value="B" class='editbox_select-box_option' <c:if test="${output.showroom == 'B'}">selected</c:if>>광명점</option>
			<option value="C" class='editbox_select-box_option' <c:if test="${output.showroom == 'C'}">selected</c:if>>대구점</option>
		</select>
	</div>

	<div class="editbox_input" >
		<label class="input_txt" for="time">예약 시간</label>
		   <select name="time" class="input_default">
              <option value="9" class="call_time" <c:if test="${output.time == '9'}">selected</c:if> >오전 9시</option>
              <option value="10" class="call_time" <c:if test="${output.time == '10'}">selected</c:if> >오전 10시</option>
              <option value="11" class="call_time" <c:if test="${output.time == '11'}">selected</c:if> >오전 11시</option>
              <option value="12" class="call_time" <c:if test="${output.time == '12'}">selected</c:if> >오전 12시</option>
              <option value="1" class="call_time" <c:if test="${output.time == '1'}">selected</c:if> >오후 1시</option>
              <option value="2" class="call_time" <c:if test="${output.time == '2'}">selected</c:if> >오후 2시</option>
              <option value="3" class="call_time" <c:if test="${output.time == '3'}">selected</c:if> >오후 3시</option>
              <option value="4" class="call_time" <c:if test="${output.time == '4'}">selected</c:if> >오후 4시</option>
              <option value="5" class="call_time" <c:if test="${output.time == '5'}">selected</c:if> >오후 5시</option>
           </select>
	</div>
	<div class="editbox_input" >
		<label class="input_txt" for="area">컨설팅 영역</label>
		<select name="area" class="input_default">
			<option value="F" class="area_select" <c:if test="${output.area == 'F'}">selected</c:if>>가구</option>
			<option value="C" class="area_select" <c:if test="${output.area == 'C'}">selected</c:if>>소파/암체어</option>
			<option value="B" class="area_select" <c:if test="${output.area == 'B'}">selected</c:if>>침대</option>
			<option value="D" class="area_select" <c:if test="${output.area == 'D'}">selected</c:if>>수납/정리</option>
			<option value="K" class="area_select" <c:if test="${output.area == 'K'}">selected</c:if>>주방가구/용품</option>
			<option value="L" class="area_select" <c:if test="${output.area == 'L'}">selected</c:if>>조명</option>
		</select>
	</div>
	<div class="editbox_input"">
		<label class="input_txt" for="request">요청사항</label>
		<input value="${output.request}"class="input_default_txt" name="request" type="text" placeholder="요청 사항이 있으시면 남겨주세요."/>
	</div>
	
	<div class="confirm_txt">
		<span class="confirm_txt_icon"></span><p>컨설팅 서비스예약 취소는 예약24시간 전까지만 가능 합니다.</p>
		<span class="confirm_txt_icon"></span><p>컨설팅 서비스예약 수정/취소는 홈페이지 메뉴 및 고객센터를 통해 가능합니다.</p>
	</div>
	<div class="confirm_button">
	<button class="confirm_button_a3" type="submit">저장하기</button>
	<button class="confirm_button_a4" type="reset">다시작성</button>
	</div>
    </form>
    </section>
    	<%@ include file="../01_home/footer.jsp" %>
    <!-- swweetalert -->
 <!-- jQuery Ajax Form plugin CDN -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
     <!-- jQuery Ajax Setup -->
 <script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
<script src="../assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
<script src="../assets/js/home.js"></script>
<script type="text/javascript">


$(document).ready(function() {
	$('#datepicker').Zebra_DatePicker({
	direction: [1,14],
	disabled_dates: ['* * * 0'] 
	});
});

$(function(){
  	$("#editForm").ajaxForm({
  		// 전송 메서드 지정
  		method: "PUT",
  		// 서버에서 200 응답을 전달한 경우 실행됨
  		success: function(json){
  			
  			if(json.rt == "OK"){
  				alert(json.item.name+"님 예약 수정이 완료 되었습니다.");
  				 window.location = "${pageContext.request.contextPath}/08_reserve/reserve_cfm.do?reserveno=" + json.item.reserveno;
  			}
  		}
  	});
    $('#reserve_submit').click(function(e){
        e.preventDefault();

        var reserveDate = $('#datepicker-always-visible').val();
        var reserveName = $('.name').val();
        var reserveEmail = $('.email').val();
        var reserveCall = $('.phoneno').val();
        var reserveAgr =  $("#reserve_arg:checked");

        if(!reserveDate){
            swal('확인', '날짜를 선택해주세요.', 'warning');
            return false;
        }

        if(!reserveName){
            swal('확인', '이름을 입력 해주세요.', 'warning');
            $('.name').focus();
            return false;
        }

        if(!reserveEmail){
            swal('확인', '이메일을 입력 해주세요.', 'warning');
            $('#email_id').focus();
            return false;
        }
        

        if(!reserveCall){
            swal('확인', '휴대폰번호를 입력 해주세요.', 'warning');
            $('#call_md').focus();
            return false;
        }

        if(!reserveAgr){
            swal('확인', '개인정보 동의를 해주셔야 예약이 가능합니다.', 'warning');
            return false;
        }

        swal('완료', '예약이 전송되었습니다. 예약 확정은 마이페이지에서 확인가능합니다.', 'success');

    });
    
});
/* 캘린더 플러그인 */
	

        /* header fixed */
            // 스크롤 체크 변수 선언
            var didScroll;
            var lastScrollTop = 0;
            var delta = 5; // 동작의 구현이 시작되는 위치
            var navbarHeight = $("header").outerHeight(); // 영향을 받을 요소
            // 스크롤시에 사용자가 스크롤했다는 것을 알림
            $(window).scroll(function(event) {
                didScroll = true;
            });
            // hasScrolled()를 실행하고 didScroll 상태를 재설정
            setInterval(function() {
                if (didScroll) {
                    hasScrolled();
                    didScroll = false;
                }
            }, 250);

            function hasScrolled() {
                var st = $(this).scrollTop();
                if (Math.abs(lastScrollTop - st) <= delta)
                    return;

                if (st > lastScrollTop && st > navbarHeight) {
                    // 스크롤 내릴때
                    $("header").removeClass("nav-down").addClass("nav-up");
                } else {
                    // 스크롤 올릴때
                    if(st + $(window).height() < $(document).height()) {
                        $("header").removeClass("nav-up").addClass("nav-down");
                    }
                }
                lastScrollTop = st;
            }

        $(function() {
        /* header - menu modalwindow*/
            $("#hd_menu_icon").click(function(e) {
                e.preventDefault();
                $("#hd_menu_background").fadeIn(300);
                $("#hd_menu_front").fadeIn(200);
            });
            // 배경을 클릭한 경우
            $("#hd_menu_background").click(function() {
                $(this).fadeOut(300);
                $("#hd_menu_front").fadeOut(200);
            });
            // x버튼 (self.close << 쓰는게 깔끔)
            $("#hd_menu_close").click(function(e) {
                e.preventDefault();
                $("#hd_menu_front").fadeOut(200);
                $("#hd_menu_background").fadeOut(100);
            });
       /* --------------------search modalwindow------------------ */
            $("#search_text").focus(function(e) {
                e.preventDefault();
                $("#hd_search_background").fadeIn(300);
                $("#hd_search_front").fadeIn(200);
                $("#modal_search_text").focus();
            });
            // 배경을 클릭한 경우
            $("#hd_search_background").click(function() {
                $(this).fadeOut(300);
                $("#hd_search_front").fadeOut(200);
            });
            // 왼쪽 x버튼 (self.close << 쓰는게 깔끔)
            $("#search_close_icon").click(function(e) {
                e.preventDefault();
                $("#hd_search_front").fadeOut(200);
                $("#hd_search_background").fadeOut(100);
            });
        /* ----------------- 함수 입력시 여기지우고부터 작성 시작 ------------------ */
    });
    </script>
 <script src="../assets/dist/zebra_datepicker.src.js"></script>
 
</body>

</html>