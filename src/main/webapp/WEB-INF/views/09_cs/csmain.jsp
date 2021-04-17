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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/csmain.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/common.css">
			
<!-- javascript -->
    <script src="http://code.jquery.com/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<!-- ajax-helper -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ajax/ajax_helper.css" />
    <script src="../plugins/ajax/ajax_helper.js"></script>
    <style type="text/css">

    </style>
</head>

<body>
	<%@ include file="../01_home/header.jsp" %>
<!-- 본문영역 -->
	<section>
	<%@ include file="../01_home/search.jsp"%>

<!-- csmain 영역 -->
    <div class="container">
        <br>
        <div id="csmain_nav">홈 > 고객 서비스</div>
        <hr>
            <section class="csmain_center">
                <div id="csmain_title"><h1>laporte 고객지원센터</h1></div>
                <br>
                <div id="csmain_title_content">
                    궁금한 점이 있으세요?<br>
                    전화, 채팅, 이메일 등 다양한 방법으로 laporte에 대한 궁금한 점을 문의해주세요.<br>
                    laporte 배송, 택배 서비스를 이용하셨다면 배송 조회도 가능합니다.<br>
                </div>
                <div class="csmain_inquire_box">
                    <div class="csmain_tabs">
                        <ul>
                            <li id="csmain_cell_click" class="csmain_button">
                                <a href="#csmain_cell_click">
                                    <span id="csmain_cell_icon"></span>
                                    <span id="csmain_cell_text">전화문의</span>
                                </a>
                            </li>
                            <li id="csmain_email_click" class="csmain_button">
                                <a href="#csmain_email_click">
                                    <span id="csmain_email_tap_icon"></span>
                                    <span id="csmain_email_tap_text">이메일 문의</span>
                               </a>
                            </li>
                            <li id="csmain_ship_click" class="csmain_button">
                                <a href="#csmain_ship_click">
                                    <span id="csmain_ship_tap_icon"></span>
                                    <span id="csmain_ship_tap_text">배송 조회</span>
                                </a>
                            </li>
                        </ul>
                        <div class="csmain_section1">
                            <div id="csmain_cell_icon2"></div>
                            <div id="csmain_title_cell"><h3>전화 문의</h3>
                            <div>고객지원센터 Tel 0000-0000<br>
                                월요일~일요일 오전 10시 ~ 오후 10시
                            </div>
                            <p>
                                빠른 해결책을 원하는 경우에는 자주 묻는 질문을 확인하세요.<br>
                                자주 묻는 질문에 원하는 내용이 없는 경우에는 이메일 문의를 통해 e-메일을 보내주시면 최대한 빨리 답변해 드리겠습니다.
                            </p>
                            <p>
                                제품 교환환불 문의 시 미리 제품사진을 찍어 국번 없이 1111-1111(고객지원센터)에 문자로 보내주세요. 그 후 연락 주시면 빠른 상담이 가능합니다.
                            </p>
                        </div>
                        <hr>
                    </div>
                    <div class="csmain_section2">
                        <div id="csmain_email_icon2"></div>
                        <div id="csmain_title_email"><h3>이메일 문의</h3>
                            <p>
                                자주 묻는 질문에 원하는 내용이 없는 경우에는 아래의 양식을 이용하여 e-메일을 보내주시면 최대한 빨리 답변해드리겠습니다.<br>
                                메일 내용에 욕설이나 비속어가 포함되어 있으면 laporte로 전달되지 않습니다.
                            </p>
                            <p id="csmain_email_red">
                                재고, 교환환불, 배송관련 문의는 이케아 고객지원센터(0000-0000)로 전화나 채팅 상담을 통해서만 가능합니다.<br>
                                문의 시 성함, 연락처, 구매정보(영수증/주문번호)를 준비해주세요.
                            </p>
                        </div>
                        <form id="email-inquiry-form" action="${pageContext.request.contextPath}/09_cs" class="csmain_email_section" enctype="multipart/form-data">
                            <div id="csmain_user_icon"></div>
                            <div class="csmain_user">
                                <input type="text" name="name" id="name" class="form-control2" placeholder="이름">
                            </div>
                            <div id="csmain_email_icon"></div>
                            <div class="csmain_email">
                                <input type="text" name="email" id="email" class="form-control2" placeholder="이메일 주소 입력">
                            </div>
                            <div id="csmain_topic_icon"></div>
                            <div class="csmain_topic">
                                <select id="csmain_category" name="category">
                                    <option value="">카테고리 선택</option>
                                    <option value="O">온라인주문</option>
                                    <option value="C">교환환불</option>
                                    <option value="S">laporte서비스</option>
                                    <option value="P">제품정보</option>
                                    <option value="A">laporte웹사이트 이용약관</option>

                                    </select>
                            </div>
                            <div id="csmain_file_icon"></div>
                            <div class="csmain_file">
                                <label for="csmain_file_choose">5MB 이하 첨부 가능</label>
                                <input type="file" name="file" id="csmain_file_choose" class="form-control2" />
                            </div>
                            <div id="csmain_message_icon"></div>
                            <div class="csmain_message">
                                <textarea id="csmain_message_content" name="content" placeholder="문의 내용을 입력해주세요."></textarea>
                            </div>
                            <button type="submit" id="csmain_email_send">이메일 보내기</button>
                        </form>
                    </div>
                    <hr>
                    <div class="csmain_section3">
                        <div id="csmain_track_icon2"></div>
                        <div id="csmain_title_track"><h3>배송 조회</h3>
                            <p>
                                구입한 제품의 배송 상태가 궁금하세요?<br>
                                아래 "주문 내역 보기" 버튼을 눌러 배송상태를 확인하세요.<br>
                                * 매장에서 구매한 주문서는 온라인에서 주문 취소가 불가능합니다.
                            </p>
                        </div>
                        <span id="csmain_order_list"><a href="#">주문 내역 보기</a></div>
                        <span id="csmain_order_cancel"><a href="#">주문 취소</a></div>
                    </div>
                </div>
            </section>
    <%@ include file="../01_home/footer.jsp" %>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/home.js"></script>
	<!-- jQuery Ajax Form plugin CDN -->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
	<!-- jQuery Ajax Setup -->
	<script
		src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>

	<script type="text/javascript">

        /* ---------------------- csmain --------------------------- */
            $(document).ready(function(){

            $('#csmain_cell_click').click(function(){

            var offset = $('.csmain_section1').offset(); //선택한 태그의 위치를 반환

                //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함

            $('html').animate({scrollTop : offset.top}, 400);

        });

    });

            $(document).ready(function(){

            $('#csmain_email_click').click(function(){

            var offset = $('.csmain_section2').offset(); //선택한 태그의 위치를 반환

                //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함

            $('html').animate({scrollTop : offset.top}, 400);

        });

    });


            $(document).ready(function(){

            $('#csmain_ship_click').click(function(){

            var offset = $('.csmain_section3').offset(); //선택한 태그의 위치를 반환

                //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함

            $('html').animate({scrollTop : offset.top}, 400);

        });

    });
            

         
            
            // 이메일 문의 Ajax로 저장
            $("#email-inquiry-form").ajaxForm({
                // 전송 메서드 지정
                method: "POST",
                // 서버에서 200 응답을 전달한 경우 실행됨
                success: function(json) {
                    console.log(json);
                    
                    // json 결과가 OK일 시 로그인 페이지로 이동한다.
                    if (json.rt == "OK") {
            			alert("이메일 문의가 등록되었습니다.");
                        location.reload();
                    }
                }
            });
    
    </script>
</body>
</html>