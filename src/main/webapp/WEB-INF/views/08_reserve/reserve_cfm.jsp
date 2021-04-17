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
                <li class="confirm_tab_ul_li active">
                    <a href="#"class="confirem_tab_ul_li_a">
                    예약 확인
                    </a>
                </li>
                <li class="confirm_tab_ul_li">
                    <a href="${pageContext.request.contextPath}/08_reserve/reserve_edit.do?reserveno=${output.reserveno}"class="confirem_tab_ul_li_a">
                    예약 수정
                    </a>
                </li>
            </ul>
        </div>
        <div class="container">
            <div class=confirm>


        <div class="bookedInformation confirm_wrap">
            <div class="confirm_content">
                <div role="tabpanel" class="tab-pane fade" id="dept"></div>
                <h3 class="confirm_content_h3">예약정보확인</h3>
                <!-- 결과가 출력될 DIV -->
                <div>
                    <table class="confirm_table">
            <thead>
                <tr>
                    <th class="confirm_th"> 예약상태</th>
                    <c:if test="${output.status=='W'}"><td class="confirm_td">예약대기중</td></c:if>
                    <c:if test="${output.status=='CF'}"><td class="confirm_td">예약완료</td></c:if>
                    <c:if test="${output.status=='CC'}"><td class="confirm_td">예약취소</td></c:if>

                </tr>
            </thead>
            <tbody>
                <tr>
                    <th class="confirm_th">예약번호</th>
                    <td class="confirm_td">${output.reserveno}</td>
                </tr>
                <tr>
                    <th class="confirm_th">예약자</th>
                    <td class="confirm_td">${output.name}</td>
                </tr>
                <tr>
                    <th class="confirm_th">예약일자</th>
                    <td class="confirm_td">${output.date}</td>
                </tr>
                <tr>
                    <th class="confirm_th">예약 시간</th>
                    <c:if test="${output.time==9}"><td class="confirm_td">오전 9시</td></c:if>
                    <c:if test="${output.time==10}"><td class="confirm_td">오전 10시</td></c:if>
                    <c:if test="${output.time==11}"><td class="confirm_td">오전 11시</td></c:if>
                    <c:if test="${output.time==12}"><td class="confirm_td">오전 12시</td></c:if>
                    <c:if test="${output.time==1}"><td class="confirm_td">오후 1시</td></c:if>
                    <c:if test="${output.time==2}"><td class="confirm_td">오후 2시</td></c:if>
                    <c:if test="${output.time==3}"><td class="confirm_td">오후 3시</td></c:if>
                    <c:if test="${output.time==4}"><td class="confirm_td">오후 4시</td></c:if>
                    <c:if test="${output.time==5}"><td class="confirm_td">오후 5시</td></c:if>
                </tr>
                <tr>
                    <th class="confirm_th">컨설팅 영역</th>
                    <c:if test="${output.area=='F'}"><td class="confirm_td">가구</td></c:if>
                    <c:if test="${output.area=='C'}"><td class="confirm_td">소파</td></c:if>
                    <c:if test="${output.area=='B'}"><td class="confirm_td">침대</td></c:if>
                    <c:if test="${output.area=='D'}"><td class="confirm_td">수납/정리</td></c:if>
                    <c:if test="${output.area=='K'}"><td class="confirm_td">주방가구/용품</td></c:if>
                    <c:if test="${output.area=='L'}"><td class="confirm_td">조명</td></c:if>
                </tr>
                <tr>
                    <th class="confirm_th">요청 사항</th>
                    <td class="confirm_td">${output.request}</td>
                </tr>
            </tbody>
        </table>
                </div>
            </div>
            <div class="confirm_txt">
                <span class="confirm_txt_icon"></span><p>컨설팅 서비스예약 취소는 예약24시간 전까지만 가능 합니다.</p>
                <span class="confirm_txt_icon"></span><p>컨설팅 서비스예약 수정/취소는 홈페이지 메뉴 및 고객센터를 통해 가능합니다.</p>
            </div>

            <div class="confirm_button">
                <a href="#" id="deletereserve" data-reserveno="${output.reserveno}" class="confirm_button_a">예약 취소</a>
                <a href="${pageContext.request.contextPath}/08_reserve/reserve_list.do?userno=${output.userno}"class="confirm_button_a2">목록으로</a>
            </div>
        </div>

    </div>
   </div>

    </section>
<!-- 하단영역 -->
    <%@ include file="../01_home/footer.jsp" %>
 <!-- jQuery Ajax Form plugin CDN -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- jQuery Ajax Form plugin CDN -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
    <!-- jQuery Ajax Setup -->
    <script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
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

        $(function(){
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


        });
        $(function(){
            $(document).on('click','#deletereserve',function(e){
                e.preventDefault();

                let current = $(this); // 이벤트가 발생한 객체 자 ==> <a> 태그
                let reserveno = current.data('reserveno');
                console.log(reserveno);


                // 취소확인
                if(!confirm("취소하시겠습니까?")){
                    return false;
                }
                $.put("${pageContext.request.contextPath}/08_reserve_ok",{
                    "reserveno":reserveno

                    }, function(json){
                        if(json.rt =="OK"){
                            alert("예약이 취소되었습니다.");
                            // 변경 완료후 목록페이지 이동
                            window.location = "${pageContext.request.contextPath}/08_reserve/reserve_cfm.do?reserveno=" + json.item.reserveno;
                        }
                    });
            });

        });
    </script>


<!-- 사용자 정의 스크립트 -->

  </body>
</html>