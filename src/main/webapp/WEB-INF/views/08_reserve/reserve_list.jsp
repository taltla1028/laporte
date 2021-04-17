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
    <link rel="stylesheet" type="text/css" href="../assets/css/common.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/reserve_list.css">
    <!-- javascript -->
    <script src="http://code.jquery.com/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<!-- ajax-helper -->
    <link rel="stylesheet" href="../plugins/ajax/ajax_helper.css" />
    <script src="../assets/plugins/ajax/ajax_helper.js"></script>
    <script src="../assets/plugins/handlebars/handlebars-v4.0.11.js"></script>
    <script src="../assets/dist/zebra_datepicker.src.js"></script>
	<script>window.jQuery || document.write('<script src="path/to/jquery-3.5.0.js"><\/script>')</script>
</head>

<body>
	<%@ include file="../01_home/header.jsp" %>
	<%@ include file="../01_home/search.jsp"%>
	<section>
	   
        
    <div class="list">
	 	<h3>예약 확인</h3>  		
   				<c:forEach var="item" items="${output}" varStatus="status">
   					<c:url value="/08_reserve/reserve_cfm.do" var="viewUrl">
   						<c:param name="reserveno" value="${item.reserveno}" />
   					</c:url>
   					
   					<c:set var="reserveno" value="${item.reserveno}"/>
   					<div class="list_card">
   						<span class="list_card_txt">${item.name}</span>
   						<span class="list_card_txt2">예약 날짜</span>
   						<span class="list_card_txt3">${item.date}</span>
   						<a class="list_card_link" href="${viewUrl}">자세히보기</a>
   					</div>
   				</c:forEach>

	</div>
    </section>
    <%@ include file="../01_home/footer.jsp" %>
      <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
     <!-- jQuery Ajax Setup -->
 <script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
<script src="../assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
<script src="../assets/js/home.js"></script>
<script type="text/javascript">
   
		
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
		/* ---------------------- footer --------------------------- */
    	/** 게시글의 제목을 클릭한 경우 호출되는 이벤트 정의 */
        $(".ft_collapse a").click(function(e) {
            // 링크의 기본 동작(페이지 이동) 방지
            e.preventDefault();
            // 클릭한 요소의 href 속성을 가져온다 --> 내용영역의 id
            var target = $(this).attr('href');
            // 가져온 내용영역의 id를 화면에 표시한다.
            $(target).slideToggle(100);
            // 내용영역(.content)중에서
            // 클릭한 요소가 지정한 항목만 제외(not($(target)))
            // 하고 화면에서 숨긴다.
            $(".content").not($(target)).slideUp(100);
        });
		

    
    </script>
</body>

</html>