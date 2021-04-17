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
    <link rel="stylesheet" type="text/css" href="../assets/css/fa.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/common.css">
			<!-- css경로 ../ << 넣고 만들기  -->
<!-- javascript -->
    <script src="http://code.jquery.com/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<!-- ajax-helper -->
    <link rel="stylesheet" href="../plugins/ajax/ajax_helper.css" />
    <script src="../plugins/ajax/ajax_helper.js"></script>
    <style type="text/css">

    </style>
</head>

<body>
	<%@ include file="../01_home/header.jsp" %>
<!-- 본문영역 -->
	<section>
	<%@ include file="../01_home/search.jsp"%>
<!-- 자주묻는질문 -->
    <div class="container">
            <br>
        	    <div id="fa_csservice">고객문의 > 고객서비스</div>
              <hr>
            <br>
              <div id="fa_ask"><h1>자주 묻는 질문</h1></div>
            <br>
        <section class="fa_popular_box">
            <h4>가장 많이 찾은 질문과 답변</h4>
            <div class="faq">
                <div class="fa_collapse">
                    <a href="#fa_collapse_click">
                    <span id="fa_text">laporte의 운영시간과 휴무일을 알려주세요.</span></a>
                       <div id="fa_icon_q"></div>
                </div>
                <div id="fa_collapse_click" class="fa_collapse_content">
                    <div id="fa_icon_a"></div>
                        <div id="fa_time_holiday_content2">
                            <p class="txt">laporte는 설날과 추석 당일을 제외하고,
                            매일 오전 10시부터 밤 10시까지
                            운영합니다.편리한 시간에 매장에
                            방문하셔서 홈퍼니싱에 대한 멋진
                            아이디어를 만나보세요.
                            <br>
                            <br>
                            • laporte 매장: 10:00 am ~ 10:00 pm <br>
                            매장 별 상세 운영시간은 각 매장 홈페이지에서 확인해주세요.
                            <br>
                            <br>
                            ※ laporte 매장 정보 보기<br>
                            (설날과 추석 당일은 쉽니다)</p>
                            <hr>
                               <span class="txt">
                                   찾으시는 질문이 없나요?<br>
                                   laporte 고객지원센터로 문의해 주세요.<br>
                               </span>
                            <span class="txt">
                                (운영시간: 10:00 am ~ 10:00 pm, 설날과 추석 당일은 휴무)
                            </span>
                            <br>
                            <div id="fa_chat_icon"></div>
                            <span class="fa_chat"> 전화 문의하기</span>
                            <div id="fa_email_icon"></div>
                            <span class="fa_email"> 이메일 문의하기</span>
                        </div>
                </div>
            </div>
            <div class="faq">
                <div class="fa_collapse">
                    <a href="#fa_collapse_click2">
                    <span id="fa_text">어디에 laporte 매장이 있으며, 어떻게 찾아가나요?</span></a>
                        <div id="fa_icon_q"></div>
                </div>
                    <div id="fa_collapse_click2" class="fa_collapse_content">
                        <div id="fa_icon_a"></div>
                            <div id="fa_time_holiday_content2">
                                <p class="txt">laporte는 현재 한국에 광명점, 고양점, 기흥점, 3개 매장과 신도림점, 1개의 플래닝 스튜디오를 운영하고 있습니다. 약도와 오시는 길 안내를 각 매장 홈페이지에서 참고하세요.
                                <br>
                                <br>
                                ※ laporte 광명점 - 경기도 광명시 일직로 17<br>
                                ※ lapote 고양점 - 경기도 고양시 덕양구 권율대로 420<br>
                                ※ laporte 기흥점 - 경기도 용인시 기흥구 신고매로 62<br>
                                ※ laporte 플래닝 스튜디오 신도림 - 서울시 구로구 경인로 662<br>
                                <hr>
                                    <span class="txt">
                                        찾으시는 질문이 없나요?<br> laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과 추석 당일은 휴무)
                                    </span>
                                    <br>
                                <div id="fa_chat_icon"></div>
                                <span class="fa_chat"> 전화 문의하기</span>
                                <div id="fa_email_icon"></div>
                                <span class="fa_email"> 이메일 문의하기</span>
                            </div>
                    </div>
            </div>
            <div class="faq">
                <div class="fa_collapse">
                    <a href="#fa_collapse_click3">
                        <span id="fa_text">제품의 재고는 어떻게 확인할 수 있나요?</span></a>
                            <div id="fa_icon_q"></div>
                </div>
                <div id="fa_collapse_click3" class="fa_collapse_content">
                    <div id="fa_icon_a"></div>
                    <div id="fa_time_holiday_content2">
                        <p class="txt">구매하시고 싶은 제품의 재고를 laporte 웹사이트에서 확인해보세요. 다만, 매장의 실시간 재고상황이 반영되지 않을 수 있어, 정확한 재고량은 매장에서 확인해 주시기 바랍니다.<br><br>
                        laporte는 카탈로그 및 웹사이트에 소개된 제품을 항상 제공할 수 있도록 최선을 다하고 있으나, 일부 제품의 경우에는 높은 인기와 공급 등의 이유로 재고가 없을 수 있음을 참고해 주세요.
                        </p>
                        <hr>
                        <span class="txt">
                            찾으시는 질문이 없나요?<br> la porte 고객지원센터로 문의해 주세요.<br>
                        </span>
                        <span class="txt">
                            (운영시간: 10:00 am ~ 10:00 pm, 설날과 추석 당일은 휴무)
                        </span>
                        <br>
                       <div id="fa_chat_icon"></div>
                       <span class="fa_chat"> 전화 문의하기</span>
                       <div id="fa_email_icon"></div>
                       <span class="fa_email"> 이메일 문의하기</span>
                    </div>
                </div>
            </div>
            <div class="faq">
                <div class="fa_collapse">
                    <a href="#fa_collapse_click4">
                        <div id="fa_text4">매장에서 물건(소지품 및 결제한 laporte 제품)을 분실했는데 어떻게 찾을 수 있을까요?</div></a>
                            <div id="fa_icon_q4"></div>
                </div>
                <div id="fa_collapse_click4" class="fa_collapse_content">
                    <div id="fa_icon_a"></div>
                        <div id="fa_time_holiday_content2">
                            <p class="txt">매장에 머무르는 동안 소지품을 분실하셨다면, 매장의 교환환불 코너 직원에게 문의해 주세요.<br><br>
                            이미 매장을 떠나셨다면, 채팅 서비스를 통해 laporte 고객지원센터로 문의해 주세요. 다만, 당일 분실물의 경우 다음 날부터 분실물 시스템에서 확인할 수 있음을 참고해 주시기 바랍니다.</p>
                            <br>
                            <br>
                            <hr>
                                <span class="txt">
                                    찾으시는 질문이 없나요?<br> la porte 고객지원센터로 문의해 주세요.<br>
                                </span>
                                <span class="txt">
                                    (운영시간: 10:00 am ~ 10:00 pm, 설날과 추석 당일은 휴무)
                                </span>
                            <br>
                            <div id="fa_chat_icon"></div>
                            <span class="fa_chat"> 전화 문의하기</span>
                            <div id="fa_email_icon"></div>
                            <span class="fa_email"> 이메일 문의하기</span>
                        </div>
                </div>
            </div>
        </section>
<!-- 카테고리박스 -->
        <section class="fa_category_box">
            <h4>카테고리</h4>
                <div class="main_category_container">
                    <ul id="main_category">
                        <li id="fa_main" class="fa_color_change">
                            <a href="#fa_mainbox">전체보기</a>
                        </li>
                        <li id="fa_online" class="fa_color_change">
                            <a href="#fa_onlinebox">온라인 주문</a>
                        </li>
                        <li id="fa_refund" class="fa_color_change">
                            <a href="#fa_refundbox">교환환불</a>
                        </li>
                        <li id="fa_service" class="fa_color_change">
                            <a href="#fa_servicebox">laporte 서비스</a>
                        </li>
                        <li id="fa_product" class="fa_color_change">
                        <a href="#fa_productbox">제품정보</a>
                        </li>
                        <li id="fa_site" class="fa_color_change">
                            <a href="#fa_sitebox">laporte 웹사이트 이용 관련</a>
                        </li>
                    </ul>
                </div>
        </section>
<!-- 카테고리 전체보기 -->
        <section id="fa_mainbox" class="fa_content_toggle">
            <ul class="fa_list">
                <li>
                    <div class="fa_article">
                        <a href="#fa_content1"></a>
                            <div class="fa_question">
                                <div id="fa_category_question_icon">Q</div>
                                <div class="fa_tag">카테고리 : 온라인 주문 > 쇼핑방법</div>
                                <span class="fa_title">위시리스트와 장바구니가 어떻게 다른가요?</span>
                            </div>
                    </div>
                        <div id="fa_content1" class="fa_content">
                            <div id="fa_category_answer_icon"></div>
                                <div id="fa_category_content">
                                    <p class="category_txt">
                                        위시리스트'는 매장에서 쇼핑하실 때 편리하도록 도움을 드리는. 도구입니다. 위시리스트에는 구매를 원하시는 제품의 위치가. 표시되어 있고, 총 금액을 미리 예상해 보실 수 있어요. '장바구니'는 온라인 구매 시에 사용되며, 카트에 담긴 제품을 주문 및 결제하실 수 있어요. 다만, 제품을 위시리스트에만. 담아놓으시면 결제하실 수 없는 점 유의해 주세요.
                                    </p>
                                    <hr>
                                        <span class="fa_category_txt">
                                            찾으시는 질문이 없나요?<br>
                                            laporte 고객지원센터로 문의해 주세요.<br>
                                        </span>
                                            <span class="fa_category_txt">
                                            (운영시간: 10:00 am ~ 10:00 pm, 설날과<br> 추석 당일은 휴무)
                                        </span>
                                    <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                                </div>
                        </div>
                </li>
                <li>
                    <div class="fa_article">
                            <a href="#fa_content2"></a>
                                <div class="fa_question">
                                    <div id="fa_category_question_icon">Q</div>
                                    <div class="fa_tag">카테고리 : 온라인 주문 > 쇼핑방법</div>
                                    <span class="fa_title">laporte의 모든 제품을 구매할 수 있나요?</span>
                                </div>
                    </div>
                    <div id="fa_content2" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                    가구 및 홈퍼니싱 액세서리를 구매하실 수 있으나, 식물과 음식은 온라인에서는 구매하실 수 없습니다. 온라인에서 구매가 어려운 제품은 매장에서 구매해 주세요.
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                        추석 당일은 휴무)
                                    </span>
                                <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                    </div>
                </li>
                <li>
                    <div class="fa_article">
                            <a href="#fa_content3"></a>
                        <div class="fa_question">
                            <div id="fa_category_question_icon">Q</div>
                            <div class="fa_tag">카테고리 : 온라인 주문 > 쇼핑방법</div>
                            <span class="fa_title">매장에는 물건이 있는데 왜 온라인에서는 품절로 표시되나요?</span>

                        </div>
                    </div>
                    <div id="fa_content3" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                매장과 온라인 재고는 따로 운영되고 있어, 재고 현황이 다릅니다.
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                         추석 당일은 휴무)
                                    </span>
                                <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                        </div>
                </li>
                <li>
                    <div class="fa_article">
                        <a href="#fa_content4"></a>
                            <div class="fa_question">
                                <div id="fa_category_question_icon">Q</div>
                                <div class="fa_tag">카테고리 : 온라인 주문 > 결제</div>
                                <span class="fa_title">비회원으로도 온라인 구매를 할 수 있나요?</span>
                            </div>
                    </div>
                        <div id="fa_content4" class="fa_content">
                            <div id="fa_category_answer_icon"></div>
                                <div id="fa_category_content">
                                    <p class="category_txt">
                                        비회원으로도 온라인 구매가
                                        가능합니다(만 14세 이상만 구매 가능.)
                                        laporte 웹사이트 회원에 가입하면 내가
                                        저장한 위시리스트와 온라인
                                        구매내역을 언제 어디서든 확인할 수
                                        있어요.
                                    </p>
                                    <hr>
                                        <span class="fa_category_txt">
                                            찾으시는 질문이 없나요?<br>
                                            laporte 고객지원센터로 문의해 주세요.<br>
                                        </span>
                                            <span class="fa_category_txt">
                                            (운영시간: 10:00 am ~ 10:00 pm, 설날과<br> 추석 당일은 휴무)
                                        </span>
                                    <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                                </div>
                        </div>
                </li>
                <li>
                    <div class="fa_article">
                            <a href="#fa_content5"></a>
                                <div class="fa_question">
                                    <div id="fa_category_question_icon">Q</div>
                                    <div class="fa_tag">카테고리 : 온라인 주문 > 결제</div>
                                    <span class="fa_title">온라인 구매 시 신용카드의 할부 결제가 가능한가요?</span>
                                </div>
                    </div>
                    <div id="fa_content5" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                    온라인 구매 시 신용카드 할부 거래가 가능합니다. 단, 해외 발행 카드는 할부 거래가 되지 않아요.<br>
                                    신용카드 할부 거래 안내는 이니시스 결제화면에서 확인하실 수 있습니다.
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                        추석 당일은 휴무)
                                    </span>
                                <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                    </div>
                </li>
                <li>
                    <div class="fa_article">
                            <a href="#fa_content6"></a>
                        <div class="fa_question">
                            <div id="fa_category_question_icon">Q</div>
                            <div class="fa_tag">카테고리 : 온라인 주문 > 결제</div>
                            <span class="fa_title">이미 주문을 완료했는데, 결제 수단을 변경할 수 있나요?</span>

                        </div>
                    </div>
                    <div id="fa_content6" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                이미 주문이 완료된 경우 결제 수단 변경이 어렵습니다. 결제 수단을 변경하시려면 주문을 취소하신 후 재결제를 하셔야 합니다.
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                         추석 당일은 휴무)
                                    </span>
                                <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                        </div>
                </li>
                <li>
                    <div class="fa_article">
                        <a href="#fa_content7"></a>
                            <div class="fa_question">
                                <div id="fa_category_question_icon">Q</div>
                                <div class="fa_tag">카테고리 : 온라인 주문 > 배송</div>
                                <span class="fa_title">온라인 구매 시 배송이 가능한 지역과 배송비를 알고 싶어요.</span>
                            </div>
                    </div>
                        <div id="fa_content7" class="fa_content">
                            <div id="fa_category_answer_icon"></div>
                                <div id="fa_category_content">
                                    <p class="category_txt">
                                        온라인 구매시 제주도를 포함한 전국으로 배송을 해드립니다. 다만, 육로로 연결되어 있지 않은 섬 지역으로의 배송은. 어렵습니다. 배송 서비스 비용은 전국 59,000원, 제주도는 109,000원이며, 택배 서비스 비용은 한 상자당 5,000원입니다. 서비스 비용은 주문하실 때 배송받을 지역을 선택하면 배송비를 확인하실 수 있어요. 배송 서비스의 경우, 주문하신 제품의 총 부피가 5 세제곱미터 (양문형 냉장고 약 2.5개 부피)가 넘는 경우 추가 배송비가 발생합니다.
                                    </p>
                                    <hr>
                                        <span class="fa_category_txt">
                                            찾으시는 질문이 없나요?<br>
                                            laporte 고객지원센터로 문의해 주세요.<br>
                                        </span>
                                            <span class="fa_category_txt">
                                            (운영시간: 10:00 am ~ 10:00 pm, 설날과<br> 추석 당일은 휴무)
                                        </span>
                                    <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                                </div>
                        </div>
                </li>
                <li>
                    <div class="fa_article">
                            <a href="#fa_content8"></a>
                                <div class="fa_question">
                                    <div id="fa_category_question_icon">Q</div>
                                    <div class="fa_tag">카테고리 : 온라인 주문 > 배송</div>
                                    <span class="fa_title">배송업체를 제가 지정할 수 있나요?</span>
                                </div>
                    </div>
                    <div id="fa_content8" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                    아니요, 배송업체 지정은 불가능합니다. laporte에서 지정한 배송업체를 통해 배송해 드립니다.
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                        추석 당일은 휴무)
                                    </span>
                                <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                    </div>
                </li>
                <li>
                    <div class="fa_article">
                            <a href="#fa_content9"></a>
                        <div class="fa_question">
                            <div id="fa_category_question_icon">Q</div>
                            <div class="fa_tag">카테고리 : 온라인 주문 > 배송</div>
                            <span class="fa_title">결제자와 배송받는 사람이 달라도 괜찮나요?</span>

                        </div>
                    </div>
                    <div id="fa_content9" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                결제자와 배송받는 사람이 달라도 주문하실 수 있어요. 배송지 입력란에 배송받으실 분의 이름과 연락처, 주소를 입력하시면 됩니다.
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                         추석 당일은 휴무)
                                    </span>
                                <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                        </div>
                </li>
                <li>
                    <div class="fa_article">
                        <a href="#fa_content10"></a>
                            <div class="fa_question">
                                <div id="fa_category_question_icon">Q</div>
                                <div class="fa_tag">카테고리 : 온라인 주문 > 부가서비스</div>
                                <span class="fa_title">배송서비스 외에 어떠한 서비스를 이용할 수 있나요?</span>
                            </div>
                    </div>
                        <div id="fa_content10" class="fa_content">
                            <div id="fa_category_answer_icon"></div>
                                <div id="fa_category_content">
                                    <p class="category_txt">
                                        배송서비스 외에도, 조립서비스, 사다리차, 기존 매트리스 내림. 서비스, 기존 소파 내림 서비스 등을 이용하실 수 있습니다. 다만, 지역과 배송방법에 따라서 서비스 가능 여부가 다르니 laporte 고객지원센터를 통해 확인해 주세요.
                                    </p>
                                    <hr>
                                        <span class="fa_category_txt">
                                            찾으시는 질문이 없나요?<br>
                                            laporte 고객지원센터로 문의해 주세요.<br>
                                        </span>
                                            <span class="fa_category_txt">
                                            (운영시간: 10:00 am ~ 10:00 pm, 설날과<br> 추석 당일은 휴무)
                                        </span>
                                    <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                                </div>
                        </div>
                </li>
                <li>
                    <div class="fa_article">
                            <a href="#fa_content11"></a>
                                <div class="fa_question">
                                    <div id="fa_category_question_icon">Q</div>
                                    <div class="fa_tag">카테고리 : 온라인 주문 > 부가서비스</div>
                                    <span class="fa_title">조립서비스는 어떻게 신청하며, 서비스 지역과 비용은 얼마인가요?</span>
                                </div>
                    </div>
                    <div id="fa_content11" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                    온라인에서 구매하신 제품에 대해 조립서비스 신청을 원하시면, 제품 구매 후 즉시 온라인으로 접수하시거나 laporte 고객지원센터 전화문의 0000-0000로 문의해 주세요.<br>
                                    배송을 받으신 이후에 조립서비스 신청 시에는 방문비가 발생하며, 서비스 진행은 조립을 원하시는 제품이 원 포장 상태인 경우에 가능합니다.<br>
                                    이용 요금, 지역 등 더 상세한 정보는 안내 페이지에서 확인해 주세요.
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                        추석 당일은 휴무)
                                    </span>
                                <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                    </div>
                </li>
                <li>
                    <div class="fa_article">
                            <a href="#fa_content12"></a>
                        <div class="fa_question">
                            <div id="fa_category_question_icon">Q</div>
                            <div class="fa_tag">카테고리 : 온라인 주문 > 부가서비스</div>
                            <span class="fa_title">어떠한 경우에 사다리차가 필요한가요?</span>

                        </div>
                    </div>
                    <div id="fa_content12" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                엘리베이터가 없는 4층 이상 건물의 경우 사다리차가 반드시 필요합니다. 또한, 부피가 큰 소파나 옷장을 주문하셨으나 반입경로가 좁은 경우에도 사다리차가 필요합니다. 사다리차가 필요한 환경이라면 고객지원센터를 통해 신청해 주세요. 다만, 일부 지역은 laporte에서 서비스 제공이 어려울 수 있습니다. 자세한 사항은 laporte 고객지원센터를 통해 상담받으시기 바랍니다.
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                         추석 당일은 휴무)
                                    </span>
                                <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                        </div>
                </li>
                <li>
                    <div class="fa_article">
                        <a href="#fa_content13"></a>
                            <div class="fa_question">
                                <div id="fa_category_question_icon">Q</div>
                                <div class="fa_tag">카테고리 : 온라인 주문 > laporte app</div>
                                <span class="fa_title">laporte 앱이 뭔가요?</span>
                            </div>
                    </div>
                        <div id="fa_content13" class="fa_content">
                            <div id="fa_category_answer_icon"></div>
                                <div id="fa_category_content">
                                    <p class="category_txt">
                                        laporte 앱은 고객이 모바일이나 태블릿 기기에서 laporte 제품을 쉽게 검색, 쇼핑, 구매할 수 있는 새로운 앱입니다. 이 앱은 laporte 스토어 앱을 대체합니다.
                                    </p>
                                    <hr>
                                        <span class="fa_category_txt">
                                            찾으시는 질문이 없나요?<br>
                                            laporte 고객지원센터로 문의해 주세요.<br>
                                        </span>
                                            <span class="fa_category_txt">
                                            (운영시간: 10:00 am ~ 10:00 pm, 설날과<br> 추석 당일은 휴무)
                                        </span>
                                    <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                                </div>
                        </div>
                </li>
                <li>
                    <div class="fa_article">
                            <a href="#fa_content14"></a>
                                <div class="fa_question">
                                    <div id="fa_category_question_icon">Q</div>
                                    <div class="fa_tag">카테고리 : 온라인 주문 > laporte app</div>
                                    <span class="fa_title">기존의 앱도 계속 사용할 수 있나요?</span>
                                </div>
                    </div>
                    <div id="fa_content14" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                    새로운 앱이 앱스토어에 추가되는 즉시 기존 laporte스토어 앱은 앱스토어에서 없어지고 따라서 기존 앱도 더이상 다운 받을 수 없게 됩니다.<br> 하지만, 이미 기존 laporte 스토어 앱을 다운받아 사용중인 고객들은 여전히 기존 앱을 사용할 수는 있습니다. laporte 앱 출시 후 2주 뒤에는 기존 laporte 스토어 앱이 차단되며, 고객들에게는 기존의 구 앱이 종료될 예정임을 알리고 새로운 앱 다운로드를 격려하는 메시지가 제공될 예정입니다.
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                        추석 당일은 휴무)
                                    </span>
                                <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                    </div>
                </li>
                <li>
                    <div class="fa_article">
                            <a href="#fa_content15"></a>
                        <div class="fa_question">
                            <div id="fa_category_question_icon">Q</div>
                            <div class="fa_tag">카테고리 : 온라인 주문 > laporte app</div>
                            <span class="fa_title">어떻게 다운로드 받을 수 있나요?</span>

                        </div>
                    </div>
                    <div id="fa_content15" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                Google play / AppStore에서 "laporte" 키워드 입력하시면 App을 확인하실 수 있습니다.
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                         추석 당일은 휴무)
                                    </span>
                                <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                        </div>
                </li>
                <li>
                    <div class="fa_article">
                        <a href="#fa_content16"></a>
                            <div class="fa_question">
                                <div id="fa_category_question_icon">Q</div>
                                <div class="fa_tag">카테고리 : 교환환불 > 온라인 구매</div>
                                <span class="fa_title">신용카드 결제 후 주문 취소했는데, 언제 환불되나요?</span>
                            </div>
                    </div>
                        <div id="fa_content16" class="fa_content">
                            <div id="fa_category_answer_icon"></div>
                                <div id="fa_category_content">
                                    <p class="category_txt">
                                        주문을 취소하신 날로부터 +3일 이내에 승인 취소가 진행되며, 승인. 취소 후 카드사 매출 취소까지는 이용하시는 카드사에 따라 최대 7일. 정도 소요됩니다.
                                    </p>
                                    <hr>
                                        <span class="fa_category_txt">
                                            찾으시는 질문이 없나요?<br>
                                            laporte 고객지원센터로 문의해 주세요.<br>
                                        </span>
                                            <span class="fa_category_txt">
                                            (운영시간: 10:00 am ~ 10:00 pm, 설날과<br> 추석 당일은 휴무)
                                        </span>
                                    <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                                </div>
                        </div>
                </li>
                <li>
                    <div class="fa_article">
                            <a href="#fa_content17"></a>
                                <div class="fa_question">
                                    <div id="fa_category_question_icon">Q</div>
                                    <div class="fa_tag">카테고리 : 교환 환불 > 온라인 구매</div>
                                    <span class="fa_title">교환환불 시 제품 수거를 위해 직접 포장해야 하나요?</span>
                                </div>
                    </div>
                    <div id="fa_content17" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                    교환환불 시 기사님이 수거할 수 있도록 제품을 포장해 주세요. 이미 조립을 완료하여 포장이 어렵다면 수거할 수 있도록 가구를 해체해 주세요.
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                        추석 당일은 휴무)
                                    </span>
                                <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                    </div>
                </li>
                <li>
                    <div class="fa_article">
                            <a href="#fa_content18"></a>
                        <div class="fa_question">
                            <div id="fa_category_question_icon">Q</div>
                            <div class="fa_tag">카테고리 : 교환환불 > 온라인 구매</div>
                            <span class="fa_title">변심으로 반품할 경우 반품 비용은 누가 부담하나요?</span>

                        </div>
                    </div>
                    <div id="fa_content18" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                제품의 하자가 아닌, 단순 변심으로 인한 교환환불의 경우에는 고객님께서 반품비를 부담하셔야 합니다.<br>
                                반품비는 처음 배송 받으셨을 때 내신 배송료와 동일합니다.
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                         추석 당일은 휴무)
                                    </span>
                                <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                        </div>
                </li>
                <li>
                    <div class="fa_article">
                        <a href="#fa_content19"></a>
                            <div class="fa_question">
                                <div id="fa_category_question_icon">Q</div>
                                <div class="fa_tag">카테고리 : 교환환불 > 매장 구매</div>
                                <span class="fa_title">모든 제품이 환불 가능한가요?</span>
                            </div>
                    </div>
                        <div id="fa_content19" class="fa_content">
                            <div id="fa_category_answer_icon"></div>
                                <div id="fa_category_content">
                                    <p class="category_txt">
                                        laporte의 365일 반품정책은 알뜰 코너 제품으 포함하여 laporte에서 구매하신 모든 제품에 적용됩니다.<br>
                                        단. 스웨디시 푸드 마켓에서 구매하신 제품은 유통기한 이내에 가져오시기 바랍니다.<br>
                                        <br>
                                        *laporte 식품의 유통기한 표기 방법: 일/월/년 순
                                    </p>
                                    <hr>
                                        <span class="fa_category_txt">
                                            찾으시는 질문이 없나요?<br>
                                            laporte 고객지원센터로 문의해 주세요.<br>
                                        </span>
                                            <span class="fa_category_txt">
                                            (운영시간: 10:00 am ~ 10:00 pm, 설날과<br> 추석 당일은 휴무)
                                        </span>
                                    <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                                </div>
                        </div>
                </li>
                <li>
                    <div class="fa_article">
                            <a href="#fa_content20"></a>
                                <div class="fa_question">
                                    <div id="fa_category_question_icon">Q</div>
                                    <div class="fa_tag">카테고리 : 교환 환불 > 매장 구매</div>
                                    <span class="fa_title">환불하고 싶어요.</span>
                                </div>
                    </div>
                    <div id="fa_content20" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                    ※ 온라인 주문 시에는 매장과 정책이 다를 수 있습니다. 자주 묻는 질문의 '온라인 주문' 항목을 참조해 주세요.<br><br>

                                    마음이 변해도 괜찮아요. laporte에서 구매한 제품이 마음에 들지 않으면 365일 이내에 언제든지 가져오세요. 구매 영수증과 사용하지 않은 제품을 가져오면 전액 환불해 드립니다.<br><br>

                                    카드로 구매한 경우에는 반드시 결제했던 카드를 지참해주세요. 환불은 구매 당시 사용하신 결제수단과 같은 방식으로 이루어집니다.다만, 구매 영수증이 없거나 365일이 지난 경우에는 매장에서 환불을 거절하거나 laporte 환불카드를 제공할 수도 있으며, 이 경우에는 사진이 있는 신분증이 필요합니다.<br>
                                    <br>
                                    ※ laporte 반품정책
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                        추석 당일은 휴무)
                                    </span>
                                <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                    </div>
                </li>
                <li>
                    <div class="fa_article">
                            <a href="#fa_content21"></a>
                        <div class="fa_question">
                            <div id="fa_category_question_icon">Q</div>
                            <div class="fa_tag">카테고리 : 교환환불 > 매장 구매</div>
                            <span class="fa_title">반품하려는데 영수증이 없어요.</span>

                        </div>
                    </div>
                    <div id="fa_content21" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                영수증이 없다면 laporte에서 거래하신 결제정보(거래 일자, 카드승인번호)를 준비해 주세요.<br>
                                다만, 일부 환불 조건이 충족되지 않는 경우에는 환불되지 않을 수도 있으며, 제품 교환 또는 laporte 환불카드를 받는 것으로 대체될 수 있음을 양해해 주세요.
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                         추석 당일은 휴무)
                                    </span>
                                <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                        </div>
                </li>
                <li>
                    <div class="fa_article">
                        <a href="#fa_content22"></a>
                            <div class="fa_question">
                                <div id="fa_category_question_icon">Q</div>
                                <div class="fa_tag">카테고리 : laporte서비스 > 공통</div>
                                <span class="fa_title">내 차에 제품을 실어주실 수 있나요?</span>
                            </div>
                    </div>
                        <div id="fa_content22" class="fa_content">
                            <div id="fa_category_answer_icon"></div>
                                <div id="fa_category_content">
                                    <p class="category_txt">
                                        laporte의 가구 제품은 조립 전 상태로 판매되고 있으며, 대부분 플랫 팩 방식으로 운반이 쉽도록 포장되어 있습니다. laporte 웹사이트나 모바일 앱에서 제품의 조립 전 패키지 개수와 규격을 미리 확인해 보세요. 도움이 필요하시다면 laporte의 유료 배송 서비스를 이용하실 수도 있어요.<br>
                                        <br>
                                        ※ 배송 서비스
                                    </p>
                                    <hr>
                                        <span class="fa_category_txt">
                                            찾으시는 질문이 없나요?<br>
                                            laporte 고객지원센터로 문의해 주세요.<br>
                                        </span>
                                            <span class="fa_category_txt">
                                            (운영시간: 10:00 am ~ 10:00 pm, 설날과<br> 추석 당일은 휴무)
                                        </span>
                                    <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                                </div>
                        </div>
                </li>
                <li>
                    <div class="fa_article">
                            <a href="#fa_content23"></a>
                                <div class="fa_question">
                                    <div id="fa_category_question_icon">Q</div>
                                    <div class="fa_tag">카테고리 : laporte서비스 > 공통</div>
                                    <span class="fa_title">laporte에서 제공하는 부가서비스에는 어떤것이 있나요?</span>
                                </div>
                    </div>
                    <div id="fa_content23" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                    ※ 온라인 주문 시에는 매장과 정책이 다를 수 있습니다. 자주 묻는 질문의 '온라인 주문' 항목을 참조해 주세요.<br><br>

                                    배송서비스, 조립서비스, 홈퍼니싱 컨설팅 서비스 등 다양한 서비스를 이용할 수 있습니다. 더 자세한 내용은 서비스 안내 페이지를 참고하세요.<br>
                                    <br>
                                    ※ laporte 서비스
                                    <br>
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                        추석 당일은 휴무)
                                    </span>
                                <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                    </div>
                </li>
                <li>
                    <div class="fa_article">
                            <a href="#fa_content24"></a>
                        <div class="fa_question">
                            <div id="fa_category_question_icon">Q</div>
                            <div class="fa_tag">카테고리 : laporte 서비스 > 공통</div>
                            <span class="fa_title">내 차에 제품을 실어주실 수 있나요?</span>

                        </div>
                    </div>
                    <div id="fa_content24" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                비회원으로도 온라인 구매가 가능합니다(만 14세 이상만 구매 가능.)<br>
                                laporte 웹사이트 회원에 가입하면 내가 저장한 위시리스트와 온라인 구매내역을 언제 어디서든 확인 할 수 있어요.</p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                         추석 당일은 휴무)
                                    </span>
                                <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                        </div>
                </li>
                <li>
                    <div class="fa_article">
                        <a href="#fa_content25"></a>
                            <div class="fa_question">
                                <div id="fa_category_question_icon">Q</div>
                                <div class="fa_tag">카테고리 : laporte 서비스 > 픽업서비스</div>
                                <span class="fa_title">픽업 서비스가 무엇이며, 어떻게 이용할 수 있나요?</span>
                            </div>
                    </div>
                        <div id="fa_content25" class="fa_content">
                            <div id="fa_category_answer_icon"></div>
                                <div id="fa_category_content">
                                    <p class="category_txt">
                                        매장에서 쇼핑하실 때 도움이 필요하신가요? 가구 제품을 직접 픽업하시기가 어렵다면 laporte의 픽업 서비스를 이용해 보세요. 매장의 가구 판매 데스크에 오셔서 구매를 원하는 제품을 말씀해 주시면 laporte 직원이 직접 해당 제품들을 찾아 드립니다. 일정 시간 대기 후 ‘제품 받는 곳’ 코너에서 영수증을 보여주시면 직원이 제품을 가져다드려요.<br>

                                        단, 홈퍼니싱 액세서리 및 화초 등의 일부 제품은 픽업 서비스 대상에 포함되지 않으며, 셀프서브와 풀 서브에 위치한 제품에 대해 픽업해 드릴 수 있음을 참고해 주세요.
                                    </p>
                                    <hr>
                                        <span class="fa_category_txt">
                                            찾으시는 질문이 없나요?<br>
                                            laporte 고객지원센터로 문의해 주세요.<br>
                                        </span>
                                            <span class="fa_category_txt">
                                            (운영시간: 10:00 am ~ 10:00 pm, 설날과<br> 추석 당일은 휴무)
                                        </span>
                                    <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                                </div>
                        </div>
                </li>
                <li>
                    <div class="fa_article">
                            <a href="#fa_content26"></a>
                                <div class="fa_question">
                                    <div id="fa_category_question_icon">Q</div>
                                    <div class="fa_tag">카테고리 : laporte 서비스 > 픽업서비스</div>
                                    <span class="fa_title">픽업 서비스 비용이 얼마인가요?</span>
                                </div>
                    </div>
                    <div id="fa_content26" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                    픽업 서비스 비용은 1만 원이며, 매장의 가구 판매 데스크에서 신청하실 수 있습니다.<br>
                                    만약 제품의 픽업부터 배송까지 원스톱 서비스를 원하시면 픽업 & 배송 서비스를 이용해 보세요. 지역별 배송 서비스 금액에 1만 원을 추가하시면 laporte 직원이 직접 해당 제품들을 찾아 배송 단계까지 처리해드립니다.<br>

                                    단, 홈퍼니싱 액세서리 및 화초 등의 일부 제품은 픽업 서비스 대상에 포함되지 않으며, 셀프서브와 풀 서브에 위치한 제품에 대해 픽업해 드릴 수 있음을 참고해 주세요.<br>
                                    <br>
                                    ※ 배송 서비스
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                        추석 당일은 휴무)
                                    </span>
                                <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                    </div>
                </li>
                <li>
                    <div class="fa_article">
                            <a href="#fa_content27"></a>
                        <div class="fa_question">
                            <div id="fa_category_question_icon">Q</div>
                            <div class="fa_tag">카테고리 : laporte 서비스 > 픽업서비스</div>
                            <span class="fa_title">픽업 서비스 개수나 품목에 제한이 있나요?</span>

                        </div>
                    </div>
                    <div id="fa_content27" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                픽업 서비스 이용 시 개수에 제한은 없습니다. 다만, 홈퍼니싱 액세서리 및 화초 등의 일부 제품은 픽업 서비스 대상에 포함되지 않습니다.<br>
                                셀프서브와 풀 서브에 위치한 가구 제품에 대해 픽업 서비스를 진행해 드립니다.<br>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                         추석 당일은 휴무)
                                    </span>
                                <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                        </div>
                </li>
                <li>
                    <div class="fa_article">
                        <a href="#fa_content28"></a>
                            <div class="fa_question">
                                <div id="fa_category_question_icon">Q</div>
                                <div class="fa_tag">카테고리 : laporte서비스 > 조립서비스</div>
                                <span class="fa_title">조립서비스 이용 방법이 궁금해요.</span>
                            </div>
                    </div>
                        <div id="fa_content28" class="fa_content">
                            <div id="fa_category_answer_icon"></div>
                                <div id="fa_category_content">
                                    <p class="category_txt">
                                        ※ 온라인 주문 시에는 매장과 정책이 다를 수 있습니다. 자주 묻는 질문의 '온라인 주문' 항목을 참조해 주세요.<br>

                                        laporte는 조립이 필요한 제품에는 모두 조립설명서를 제공하여 소비자가 직접 제품을 조립할 수 있도록 디자인하고 있습니다. 또한, laporte의 유료 조립 서비스를 이용하실 수도 있어요. 다만, 유료 조립 서비스는 배송 서비스와 함께 신청하실 수 있습니다. 서비스 이용 시의 유의사항과 약관을 해당 페이지에서 참고해 주세요.<br>
                                        <br>
                                        ※ 조립 서비스
                                    </p>
                                    <hr>
                                        <span class="fa_category_txt">
                                            찾으시는 질문이 없나요?<br>
                                            laporte 고객지원센터로 문의해 주세요.<br>
                                        </span>
                                            <span class="fa_category_txt">
                                            (운영시간: 10:00 am ~ 10:00 pm, 설날과<br> 추석 당일은 휴무)
                                        </span>
                                    <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                                </div>
                        </div>
                </li>
                <li>
                    <div class="fa_article">
                            <a href="#fa_content29"></a>
                                <div class="fa_question">
                                    <div id="fa_category_question_icon">Q</div>
                                    <div class="fa_tag">카테고리 : laporte 서비스 > 조립서비스</div>
                                    <span class="fa_title">조립서비스를 받았는데 제품에 문제가 있어요.</span>
                                </div>
                    </div>
                    <div id="fa_content29" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                    조립 서비스를 받으시는 과정에서 불편함이 있었거나, 조립 서비스를 받은 제품을 사용 중 문제를 발견하셨다면 서비스 신청 당시 받으신 주문서를 준비하셔서 laporte 고객지원센터로 문의해 주세요.
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                        추석 당일은 휴무)
                                    </span>
                                <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                    </div>
                </li>
                <li>
                    <div class="fa_article">
                            <a href="#fa_content30"></a>
                        <div class="fa_question">
                            <div id="fa_category_question_icon">Q</div>
                            <div class="fa_tag">카테고리 : laporte 서비스 > 홈퍼니싱 컨설팅</div>
                            <span class="fa_title">방을 디자인하고 꾸미는 데 도움이 필요해요.</span>

                        </div>
                    </div>
                    <div id="fa_content30" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                laporte의 담당자와 함께 집이나 사무실을 꾸며보세요. 홈퍼니싱 전문가가 우리 집 꾸미기 프로젝트를 도와드립니다.<br>
                                또한, laporte의 온라인 플래너로 직접 옷장과 수납, 사무실 가구 등을 포함한 다양한 제품을 구성해볼 수도 있어요.
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                         추석 당일은 휴무)
                                    </span>
                                <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                        </div>
                </li>
                <li>
                    <div class="fa_article">
                        <a href="#fa_content31"></a>
                            <div class="fa_question">
                                <div id="fa_category_question_icon">Q</div>
                                <div class="fa_tag">카테고리 : laporte 서비스 > 홈퍼니싱 컨설팅</div>
                                <span class="fa_title">홈퍼니싱플래닝 서비스란 무엇인가요?</span>
                            </div>
                    </div>
                        <div id="fa_content31" class="fa_content">
                            <div id="fa_category_answer_icon"></div>
                                <div id="fa_category_content">
                                    <p class="category_txt">
                                        집이나 사무실을 새롭게 꾸미고 싶다면, laporte의 홈퍼니싱 플래닝 서비스를 이용해 보세요.
                                    </p>
                                    <hr>
                                        <span class="fa_category_txt">
                                            찾으시는 질문이 없나요?<br>
                                            laporte 고객지원센터로 문의해 주세요.<br>
                                        </span>
                                            <span class="fa_category_txt">
                                            (운영시간: 10:00 am ~ 10:00 pm, 설날과<br> 추석 당일은 휴무)
                                        </span>
                                    <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                                </div>
                        </div>
                </li>
                <li>
                    <div class="fa_article">
                            <a href="#fa_content32"></a>
                                <div class="fa_question">
                                    <div id="fa_category_question_icon">Q</div>
                                    <div class="fa_tag">카테고리 : laporte 서비스 > 기타</div>
                                    <span class="fa_title">재봉 서비스란 무엇이며, 어떻게 신청하나요?</span>
                                </div>
                    </div>
                    <div id="fa_content32" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                    커튼 길이를 원하는 만큼 자르고 싶다면 재봉 서비스를 이용해 보세요.<br>
                                    먼저, 커튼을 설치할 곳의 천장 높이와 커튼 봉이 달린 높이를 재어서 매장에 오세요. 마음에 드는 커튼을 고른 뒤 직원에게 서비스를 신청하실 때 얼마나 잘라야 하는지 말씀해 주시기 바랍니다.<br>
                                    결제 후 배송 코너에서 구매한 커튼을 재봉 주문장과 함께 전달하면 3일 이후에 서비스가 완료됩니다.
                                    재봉된 커튼은 직접 매장으로 찾으러 오셔도 되고, 택배 배송(별도 가격)으로 받아 보실 수도 있어요.<br>

                                    * 재단된 커튼의 밑단은 2cm 두께로 마감됩니다. * 커튼 폭 연장 후, 패턴의 연속성이 유지되지 않을 수 있습니다. * 커튼 종류에 따라 최종 폭의 길이는 다를 수 있습니다. * 커튼 한 쌍 요금: 9,900<br>

                                    재봉 서비스는 매장의 홈텍스타일 코너에서 신청하실 수 있습니다. 다만, 일부 매장에서만 서비스가 제공되고 있는 점 참고해 주세요.<br>
                                    <br>
                                    ※ 택배 재봉 서비스
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                        추석 당일은 휴무)
                                    </span>
                                <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                    </div>
                </li>
                <li>
                    <div class="fa_article">
                            <a href="#fa_content33"></a>
                        <div class="fa_question">
                            <div id="fa_category_question_icon">Q</div>
                            <div class="fa_tag">카테고리 : 제품정보</div>
                            <span class="fa_title">부품이나 제품 일부분을 구매할 수 있나요?</span>

                        </div>
                    </div>
                    <div id="fa_content33" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                laporte에서는 부품(하드웨어)이나 제품의 일부분(파트)을 유료로 판매하고 있지 않습니다. 필요하신 경우, 매장의 교환환불 데스크에서 여분의 부품과 고정장치 등을 받을 수 있습니다.
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                         추석 당일은 휴무)
                                    </span>
                                <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                        </div>
                </li>
                <li>
                    <div class="fa_article">
                        <a href="#fa_content34"></a>
                            <div class="fa_question">
                                <div id="fa_category_question_icon">Q</div>
                                <div class="fa_tag">카테고리 : 제품정보</div>
                                <span class="fa_title">지퍼에 고리가 달려있지 않아요.</span>
                            </div>
                    </div>
                        <div id="fa_content34" class="fa_content">
                            <div id="fa_category_answer_icon"></div>
                                <div id="fa_category_content">
                                    <p class="category_txt">
                                        어린이용 제품과 일부 매트리스 제품 등에는 어린이 안전사고 예방을. 위해 아이들이 쉽게 열 수 없도록 손잡이가 달리지 않은 안심 지퍼를. 사용하였습니다.<br> 안심 지퍼를 열 때는 지퍼의 홈에 실이나 클립을 끼워 여실 수 있어요.
                                    </p>
                                    <hr>
                                        <span class="fa_category_txt">
                                            찾으시는 질문이 없나요?<br>
                                            laporte 고객지원센터로 문의해 주세요.<br>
                                        </span>
                                            <span class="fa_category_txt">
                                            (운영시간: 10:00 am ~ 10:00 pm, 설날과<br> 추석 당일은 휴무)
                                        </span>
                                    <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                                </div>
                        </div>
                </li>
                <li>
                    <div class="fa_article">
                            <a href="#fa_content35"></a>
                                <div class="fa_question">
                                    <div id="fa_category_question_icon">Q</div>
                                    <div class="fa_tag">카테고리 : 제품정보</div>
                                    <span class="fa_title">강화 유리 제품의 특성이 궁금합니다.</span>
                                </div>
                    </div>
                    <div id="fa_content35" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                    강화 유리는 일반적인 유리보다 내구성이 뛰어나고 충격에 강합니다. 그러나, 강화 유리도 다른 유리와 마찬가지로 충격 또는 긁힘에. 노출되면 깨질 수 있습니다. 그래서 유리는 항상 조심스럽게 다루는 것이 가장 중요합니다. laporte 제품은 가정에서만 사용하도록. 설계되었으므로 공공장소에서 사용은 권장하지 않습니다.
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                        추석 당일은 휴무)
                                    </span>
                                <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                    </div>
                </li>
                <li>
                    <div class="fa_article">
                            <a href="#fa_content36"></a>
                        <div class="fa_question">
                            <div id="fa_category_question_icon">Q</div>
                            <div class="fa_tag">카테고리 : laporte 웹사이트 / 계정</div>
                            <span class="fa_title">laporte 웹사이트에 가입하면 어떤 혜택이 있나요?</span>

                        </div>
                    </div>
                    <div id="fa_content36" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                laporte 웹사이트 회원에 가입하면 내가 저장한 위시리스트와 온라인 구매내역을 언제 어디서든 확인할 수 있고, 상품평을 작성할 수도 있어요. 또한, 웹사이트에서 진행되는 이벤트에 참여하거나 laporte의 다양한 온라인 플래닝 도구를 편리하게 이용하실 수 있어요!
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                         추석 당일은 휴무)
                                    </span>
                                <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                        </div>
                </li>
                <li>
                    <div class="fa_article">
                        <a href="#fa_content37"></a>
                            <div class="fa_question">
                                <div id="fa_category_question_icon">Q</div>
                                <div class="fa_tag">카테고리 : laporte웹사이트 / 계정</div>
                                <span class="fa_title">laporte웹사이트 아이디는 어떻게 찾나요?</span>
                            </div>
                    </div>
                        <div id="fa_content37" class="fa_content">
                            <div id="fa_category_answer_icon"></div>
                                <div id="fa_category_content">
                                    <p class="category_txt">
                                        가입했던 아이디(이메일)가 생각나지 않는다면, laporte 고객지원센터로 문의해 주세요. 다만, 고객님의 이메일이 laporte 웹사이트에 가입되어 있는지만 확인이 가능하며, 담당 부서에서 확인하여 안내해 드리기까지 최대 24시간이 소요될 수 있음을 참고해 주세요.
                                    </p>
                                    <hr>
                                        <span class="fa_category_txt">
                                            찾으시는 질문이 없나요?<br>
                                            laporte 고객지원센터로 문의해 주세요.<br>
                                        </span>
                                            <span class="fa_category_txt">
                                            (운영시간: 10:00 am ~ 10:00 pm, 설날과<br> 추석 당일은 휴무)
                                        </span>
                                    <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                                </div>
                        </div>
                </li>
                <li>
                    <div class="fa_article">
                            <a href="#fa_content38"></a>
                                <div class="fa_question">
                                    <div id="fa_category_question_icon">Q</div>
                                    <div class="fa_tag">카테고리 : laporte웹사이트 / 계정</div>
                                    <span class="fa_title">비밀번호를 잃어버렸어요.</span>
                                </div>
                    </div>
                    <div id="fa_content38" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                    로그인 화면의 '비밀번호 찾기' 기능을 이용해 보세요. 가입하신 이메일 계정으로 임시 비밀번호가 발송됩니다.<br>
                                    임시 비밀번호로 로그인하신 후에는 꼭 나만의 비밀번호로 변경해 주세요!<br>
                                    임시 비밀번호 발급에 어려움이 있다면, laporte 고객지원센터로 문의해 주세요.
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                        추석 당일은 휴무)
                                    </span>
                                <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                    </div>
                </li>
            </ul>
        </section>
<!-- 카테고리 온라인주문 -->
    <section id="fa_onlinebox" class="fa_content_toggle">
        <div id="fa_sub_online_box">
            <span class="fa_sub_online">쇼핑방법
                <a href="#fa_sub_shop"></a>
            </span>
            <span class="fa_sub_online">결제
                <a href="#fa_sub_payment"></a>
            </span>
            <span class="fa_sub_online">배송
                <a href="#fa_sub_ship"></a>
            </span>
            <span class="fa_sub_online">부가서비스
                <a href="#fa_sub_subservice"></a>
            </span>
            <span class="fa_sub_online">laporte APP
                <a href="#fa_sub_app"></a>
            </span>
        </div>
            <ul id="fa_sub_shop" class="fa_refund_list">
                <li>
                    <div class="fa_article">
                        <a href="#fa_content43">
                            <div class="fa_question">
                                <div id="fa_category_question_icon">Q</div>
                                <div class="fa_tag">카테고리 : 온라인 주문 > 쇼핑방법</div>
                                <span class="fa_title">위시리스트와 장바구니가 어떻게 다른가요?</span>
                            </div>
                        </a>
                    </div>
                    <div id="fa_content43" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                    위시리스트'는 매장에서 쇼핑하실 때 편리하도록 도움을 드리는. 도구입니다. 위시리스트에는 구매를 원하시는 제품의 위치가. 표시되어 있고, 총 금액을 미리 예상해 보실 수 있어요. '장바구니'는 온라인 구매 시에 사용되며, 카트에 담긴 제품을 주문 및 결제하실 수  있어요. 다만, 제품을 위시리스트에만. 담아놓으시면 결제하실 수 없는 점 유의해 주세요.</p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                         추석 당일은 휴무)
                                    </span>
                                <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>.
                    </div>
                </li>
                <li>
                    <div class="fa_article">
                        <a href="#fa_content44">
                            <div class="fa_question">
                                <div id="fa_category_question_icon">Q</div>
                                <div class="fa_tag">카테고리 : 온라인 주문 > 쇼핑방법</div>
                                <span class="fa_title">laporte의 모든 제품을 구매할 수 있나요?</span>
                            </div>
                        </a>
                    </div>
                    <div id="fa_content44" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                    가구 및 홈퍼니싱 액세서리를 구매하실 수 있으나, 식물과 음식은 온라인에서는 구매하실 수 없습니다. 온라인에서 구매가 어려운 제품은 매장에서 구매해 주세요.</p>
                                <hr>
                                    <span class="fa_category_txt">
                                    찾으시는 질문이 없나요?<br> la porte 고객지원센터로. 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                    (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                    추석 당일은 휴무)
                                    </span>
                                 <br>
                                <div id="fa_category_chat_icon"></div>
                                <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                    </div>
                </li>
                <li>
                    <div class="fa_article">
                        <a href="#fa_content45">
                            <div class="fa_question">
                                <div id="fa_category_question_icon">Q</div>
                                <div class="fa_tag">카테고리 : 온라인 주문 > 쇼핑방법</div>
                                <span class="fa_title">매장에는 물건이 있는데 왜 온라인에서는 품절로 표시되나요?</span>
                            </div>
                        </a>
                    </div>
                    <div id="fa_content45" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                매장과 온라인 재고는 따로 운영되고 있어, 재고 현황이 다릅니다.
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는. 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                        추석 당일은 휴무)
                                    </span>
                                <br>
                               <div id="fa_category_chat_icon"></div>
                               <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                        </div>
                    </li>
            </ul>
            <ul id="fa_sub_payment" class="fa_refund_list">
                <li>
                    <div class="fa_article">
                        <a href="#fa_content46">
                            <div class="fa_question">
                                <div id="fa_category_question_icon">Q</div>
                                <div class="fa_tag">카테고리 : 온라인 주문 > 결제</div>
                                <span class="fa_title">비회원으로도 온라인 구매를 할 수 있나요?</span>
                            </div>
                        </a>
                    </div>
                    <div id="fa_content46" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                    비회원으로도 온라인 구매가 가능합니다(만 14세 이상만 구매 가능.)<br>
                                    laporte 웹사이트 회원에 가입하면 내가 저장한 위시리스트와 온라인 구매내역을 언제 어디서든 확인할 수 있어요.<br>
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                        추석 당일은 휴무)
                                    </span>
                                <br>
                                <div id="fa_category_chat_icon"></div>
                                <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                        </div>
                </li>
                <li>
                    <div class="fa_article">
                        <a href="#fa_content47">
                            <div class="fa_question">
                                <div id="fa_category_question_icon">Q</div>
                                <div class="fa_tag">카테고리 : 온라인 주문 > 결제</div>
                                    <span class="fa_title">온라인 구매 시 신용카드의 할부 결제가 가능한가요?</span>
                            </div>
                        </a>
                    </div>
                    <div id="fa_content47" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                    온라인 구매 시 신용카드 할부 거래가 가능합니다. 단, 해외 발행 카드는 할부 거래가 되지 않아요.<br>
                                    신용카드 할부 거래 안내는 이니시스 결제화면에서 확인하실 수 있습니다.<br><br>
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                    (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                    추석 당일은 휴무)
                                    </span>
                                <br>
                                <div id="fa_category_chat_icon"></div>
                                <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                    </div>
                </li>
                <li>
                    <div class="fa_article">
                            <a href="#fa_content48">
                                <div class="fa_question">
                                    <div id="fa_category_question_icon">Q</div>
                                    <div class="fa_tag">카테고리 : 온라인 주문 > 결제</div>
                                    <span class="fa_title">이미 주문을 완료했는데, 결제 수단을 변경할 수 있나요?</span>
                                </div>
                            </a>
                    </div>
                    <div id="fa_content48" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                   이미 주문이 완료된 경우 결제 수단 변경이 어렵습니다. 결제 수단을 변경하시려면 주문을 취소하신 후 재결제를 하셔야 합니다.
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                    (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                    추석 당일은 휴무)
                                    </span>
                                <br>
                                <div id="fa_category_chat_icon"></div>
                                <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                    </div>
            </ul>
<!-- 온라인주문 배송 -->
            <ul id="fa_sub_ship" class="fa_refund_list">
                <li>
                    <div class="fa_article">
                        <a href="#fa_content49">
                            <div class="fa_question">
                                <div id="fa_category_question_icon">Q</div>
                                <div class="fa_tag">카테고리 : 온라인 주문 > 배송</div>
                                <span class="fa_title">온라인 구매 시 배송이 가능한 지역과 배송비를 알고 싶어요.</span>
                            </div>
                        </a>
                    </div>
                    <div id="fa_content49" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                    온라인 구매시 제주도를 포함한 전국으로 배송을 해드립니다. 다만, 육로로 연결되어 있지 않은 섬 지역으로의 배송은. 어렵습니다. 배송 서비스 비용은 전국 59,000원, 제주도는 109,000원이며, 택배 서비스 비용은 한 상자당 5,000원입니다. 서비스 비용은 주문하실 때 배송받을 지역을 선택하면 배송비를 확인하실 수 있어요. 배송 서비스의 경우, 주문하신 제품의 총 부피가 5 세제곱미터 (양문형 냉장고 약 2.5개 부피)가 넘는 경우 추가 배송비가 발생합니다.
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                    (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                    추석 당일은 휴무)
                                    </span>
                                <br>
                                <div id="fa_category_chat_icon"></div>
                                <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                    </div>
                <li>
                    <div class="fa_article">
                            <a href="#fa_content50">
                                <div class="fa_question">
                                    <div id="fa_category_question_icon">Q</div>
                                    <div class="fa_tag">카테고리 : 온라인 주문 > 배송</div>
                                    <span class="fa_title">배송업체를 제가 지정할 수 있나요?</span>
                                </div>
                            </a>
                    </div>
                    <div id="fa_content50" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                    아니요, 배송업체 지정은 불가능합니다. laporte에서 지정한 배송업체를 통해 배송해 드립니다.
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                        추석 당일은 휴무)
                                    </span>
                                <br>
                                <div id="fa_category_chat_icon"></div>
                                <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                    </div>
                </li>
                <li>
                    <div class="fa_article">
                            <a href="#fa_content51">
                                <div class="fa_question">
                                    <div id="fa_category_question_icon">Q</div>
                                    <div class="fa_tag">카테고리 : 온라인 주문 > 배송</div>
                                    <span class="fa_title">결제자와 배송받는 사람이 달라도 괜찮나요?</span>
                                </div>
                            </a>
                    </div>
                    <div id="fa_content51" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                    결제자와 배송받는 사람이 달라도 주문하실 수 있어요. 배송지 입력란에 배송받으실 분의 이름과 연락처, 주소를 입력하시면 됩니다.
                                </p>
                                <hr>
                                     <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                        추석 당일은 휴무)
                                    </span>
                                <br>
                                <div id="fa_category_chat_icon"></div>
                                <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                    </div>
                </li>
            </ul>
<!-- 온라인주문 부가서비스 -->
            <ul id="fa_sub_subservice" class="fa_refund_list">
                <li>
                    <div class="fa_article">
                        <a href="#fa_content52">
                            <div class="fa_question">
                                <div id="fa_category_question_icon">Q</div>
                                <div class="fa_tag">카테고리 : 온라인 주문 > 부가서비스</div>
                                <span class="fa_title">배송서비스 외에 어떠한 서비스를  이용할 수 있나요?</span>
                            </div>
                        </a>
                    </div>
                    <div id="fa_content52" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                    배송서비스 외에도, 조립서비스, 사다리차, 기존 매트리스 내림. 서비스, 기존 소파 내림 서비스 등을 이용하실 수 있습니다. 다만, 지역과 배송방법에 따라서 서비스 가능 여부가 다르니 laporte 고객지원센터를 통해 확인해 주세요.
                                </p>
                                <hr>
                                     <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                        추석 당일은 휴무)
                                    </span>
                                <br>
                                <div id="fa_category_chat_icon"></div>
                                <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                    </div>
                </li>
                <li>
                    <div class="fa_article">
                            <a href="#fa_content53">
                                <div class="fa_question">
                                    <div id="fa_category_question_icon">Q</div>
                                    <div class="fa_tag">카테고리 : 온라인주문 > 부가서비스</div>
                                    <span class="fa_title">조립서비스는 어떻게 신청하며, 서비스 지역과 비용은 얼마인가요?</span>
                                </div>
                            </a>
                    </div>
                    <div id="fa_content53" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                    온라인에서 구매하신 제품에 대해 조립서비스 신청을 원하시면, 제품 구매 후 즉시 온라인으로 접수하시거나 laporte 고객지원센터 전화문의 0000-0000로 문의해 주세요.<br>
                                    배송을 받으신 이후에 조립서비스 신청 시에는 방문비가 발생하며, 서비스 진행은 조립을 원하시는 제품이 원 포장 상태인 경우에 가능합니다.<br>
                                    이용 요금, 지역 등 더 상세한 정보는 안내 페이지에서 확인해 주세요.
                                </p>
                                <hr>
                                     <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                        추석 당일은 휴무)
                                    </span>
                                <br>
                                <div id="fa_category_chat_icon"></div>
                                <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                    </div>
                </li>
                <li>
                    <div class="fa_article">
                        <a href="#fa_content54">
                            <div class="fa_question">
                                 <div id="fa_category_question_icon">Q</div>
                                 <div class="fa_tag">카테고리 : 온라인주문 > 부가서비스</div>
                                 <span class="fa_title">어떤한 경우에 사다리차가 필요한가요?</span>
                            </div>
                        </a>
                    </div>
                    <div id="fa_content54" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                    엘리베이터가 없는 4층 이상 건물의 경우 사다리차가 반드시 필요합니다. 또한, 부피가 큰 소파나 옷장을 주문하셨으나 반입경로가 좁은 경우에도 사다리차가 필요합니다. 사다리차가 필요한 환경이라면 고객지원센터를 통해 신청해 주세요. 다만, 일부 지역은 laporte에서 서비스 제공이 어려울 수 있습니다. 자세한 사항은 laporte 고객지원센터를 통해 상담받으시기 바랍니다.
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                        추석 당일은 휴무)
                                    </span>
                                <br>
                                <div id="fa_category_chat_icon"></div>
                                <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                    </div>
                </li>
            </ul>
<!-- 온라인주문 APP -->
            <ul id="fa_sub_app" class="fa_refund_list">
                <li>
                    <div class="fa_article">
                        <a href="#fa_content55">
                            <div class="fa_question">
                                <div id="fa_category_question_icon">Q</div>
                                <div class="fa_tag">카테고리 : 온라인 주문 > laporte app</div>
                                <span class="fa_title">laporte 앱이 뭔가요?</span>
                            </div>
                        </a>
                    </div>
                    <div id="fa_content55" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                    laporte 앱은 고객이 모바일이나 태블릿 기기에서 laporte 제품을 쉽게 검색, 쇼핑, 구매할 수 있는 새로운 앱입니다. 이 앱은 laporte 스토어 앱을 대체합니다.
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                        추석 당일은 휴무)
                                    </span>
                                <br>
                                <div id="fa_category_chat_icon"></div>
                                <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                    </div>
                </li>
                <li>
                    <div class="fa_article">
                        <a href="#fa_content56">
                            <div class="fa_question">
                                <div id="fa_category_question_icon">Q</div>
                                <div class="fa_tag">카테고리 : 온라인 주문 > laporte app</div>
                                <span class="fa_title">기존의 앱도 계속 사용할 수 있나요?</span>
                            </div>
                        </a>
                    </div>
                    <div id="fa_content56" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                    새로운 앱이 앱스토어에 추가되는 즉시 기존 laporte스토어 앱은 앱스토어에서 없어지고 따라서 기존 앱도 더이상 다운 받을 수 없게 됩니다. 하지만, 이미 기존 laporte 스토어 앱을 다운받아 사용중인 고객들은 여전히 기존 앱을 사용할 수는 있습니다. laporte 앱 출시 후 2주 뒤에는 기존 laporte 스토어 앱이 차단되며, 고객들에게는 기존의 구 앱이 종료될 예정임을 알리고 새로운 앱 다운로드를 격려하는 메시지가 제공될 예정입니다.
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                        추석 당일은 휴무)
                                    </span>
                                <br>
                                <div id="fa_category_chat_icon"></div>
                                <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                    </div>
                </li>
                <li>
                    <div class="fa_article">
                        <a href="#fa_content57">
                            <div class="fa_question">
                                <div id="fa_category_question_icon">Q</div>
                                <div class="fa_tag">카테고리 : 온라인 주문 > laporte app</div>
                                <span class="fa_title">어떻게 다운로드 받을 수 있나요?</span>
                            </div>
                        </a>
                    </div>
                    <div id="fa_content57" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                    Google play / AppStore에서 "laporte" 키워드 입력하시면 App을 확인하실 수 있습니다.
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                        추석 당일은 휴무)
                                    </span>
                                <br>
                                <div id="fa_category_chat_icon"></div>
                                <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                    </div>
                </li>
            </ul>
    </section>
<!-- 카테고리 교환환불 -->
    <section id="fa_refundbox" class="fa_content_toggle">
        <div id="fa_sub_refund_box">
            <span class="fa_sub_online">온라인 구매
                <a href="#fa_sub_onlinebuy"></a>
            </span>
            <span class="fa_sub_online">매장 구매
                <a href="#fa_sub_storebuy"></a>
            </span>
        </div>
<!-- 교환환불 온라인 구매 -->
        <ul id="fa_sub_onlinebuy" class="fa_refund_list">
            <li>
                <div class="fa_article">
                    <a href="#fa_content58">
                        <div class="fa_question">
                            <div id="fa_category_question_icon">Q</div>
                            <div class="fa_tag">카테고리 : 교환환불 > 온라인 구매</div>
                            <span class="fa_title">신용카드 결제 후 주문 취소했는데, 언제 환불되나요?</span>
                        </div>
                    </a>
                </div>
                <div id="fa_content58" class="fa_content">
                    <div id="fa_category_answer_icon"></div>
                        <div id="fa_category_content">
                            <p class="category_txt">
                                주문을 취소하신 날로부터 +3일 이내에 승인 취소가 진행되며, 승인. 취소 후 카드사 매출 취소까지는 이용하시는 카드사에 따라 최대 7일. 정도 소요됩니다.
                            </p>
                            <hr>
                                <span class="fa_category_txt">
                                    찾으시는 질문이 없나요?<br>
                                    laporte 고객지원센터로 문의해 주세요.<br>
                                </span>
                                <span class="fa_category_txt">
                                    (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                    추석 당일은 휴무)
                                </span>
                            <br>
                                <div id="fa_category_chat_icon"></div>
                                <span class="fa_category_chat"> 전화 문의하기</span>
                        </div>
                </div>
            </li>
            <li>
                <div class="fa_article">
                    <a href="#fa_content59">
                        <div class="fa_question">
                            <div id="fa_category_question_icon">Q</div>
                            <div class="fa_tag">카테고리 : 교환환불 > 온라인 구매</div>
                            <span class="fa_title">교환환불 시 제품 수거를 위해 직접 포장해야 하나요?</span>
                        </div>
                    </a>
                </div>
                    <div id="fa_content59" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                    교환환불 시 기사님이 수거할 수 있도록 제품을 포장해 주세요. 이미 조립을 완료하여 포장이 어렵다면 수거할 수 있도록 가구를 해체해 주세요.
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                         추석 당일은 휴무)
                                    </span>
                                <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                    </div>
            </li>
            <li>
                <div class="fa_article">
                    <a href="#fa_content60">
                        <div class="fa_question">
                            <div id="fa_category_question_icon">Q</div>
                            <div class="fa_tag">카테고리 : 교환환불 > 온라인 구매</div>
                            <span class="fa_title">변심으로 반품할 경우 반품 비용은 누가 부담하나요?</span>
                        </div>
                    </a>
                </div>
                <div id="fa_content60" class="fa_content">
                    <div id="fa_category_answer_icon"></div>
                        <div id="fa_category_content">
                            <p class="category_txt">
                                제품의 하자가 아닌, 단순 변심으로 인한 교환환불의 경우에는 고객님께서 반품비를 부담하셔야 합니다.<br>
                                반품비는 처음 배송 받으셨을 때 내신 배송료와 동일합니다.
                            </p>
                            <hr>
                                <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                </span>
                                <span class="fa_category_txt">
                                    (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                    추석 당일은 휴무)
                                </span>
                            <br>
                                <div id="fa_category_chat_icon"></div>
                                <span class="fa_category_chat"> 전화 문의하기</span>
                        </div>
                </div>
            </li>
<!-- 교환환불 매장구매 -->
            </ul>
            <ul id="fa_sub_storebuy" class="fa_refund_list">
                <li>
                    <div class="fa_article">
                        <a href="#fa_content61">
                            <div class="fa_question">
                                <div id="fa_category_question_icon">Q</div>
                                <div class="fa_tag">카테고리 : 교환환불 > 매장 구매</div>
                                <span class="fa_title">모든 제품이 환불 가능한가요?</span>
                            </div>
                        </a>
                    </div>
                    <div id="fa_content61" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                    laporte의 365일 반품정책은 알뜰 코너 제품으 포함하여 laporte에서 구매하신 모든 제품에 적용됩니다. 단. 스웨디시 푸드 마켓에서 구매하신 제품은 유통기한 이내에 가져오시기. 바랍니다.

                                <br>
                                <br>
                                    *laporte 식품의 유통기한 표기 방법: 일/월/년 순
                                </p>
                                <br>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                        추석 당일은 휴무)
                                    </span>
                                <br>
                                <div id="fa_category_chat_icon"></div>
                                <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                    </div>
                </li>
                <li>
                    <div class="fa_article">
                        <a href="#fa_content62">
                            <div class="fa_question">
                                <div id="fa_category_question_icon">Q</div>
                                <div class="fa_tag">카테고리 : 교환 환불 > 매장 구매</div>
                                <span class="fa_title">환불하고 싶어요.</span>
                            </div>
                        </a>
                    </div>
                    <div id="fa_content62" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                    ※ 온라인 주문 시에는 매장과 정책이 다를 수 있습니다. 자주 묻는 질문의 '온라인 주문' 항목을 참조해 주세요.<br><br>
                                      마음이 변해도 괜찮아요. laporte에서 구매한 제품이 마음에 들지 않으면 365일 이내에 언제든지 가져오세요. 구매 영수증과 사용하지 않은 제품을 가져오면 전액 환불해 드립니다.<br><br>
                                      카드로 구매한 경우에는 반드시 결제했던 카드를 지참해주세요. 환불은 구매 당시 사용하신 결제수단과 같은 방식으로 이루어집니다.다만, 구매 영수증이 없거나 365일이 지난 경우에는 매장에서 환불을 거절하거나 laporte 환불카드를 제공할 수도 있으며, 이 경우에는 사진이 있는 신분증이 필요합니다.<br><br>

                                      ※ laporte 반품정책
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                        추석 당일은 휴무)
                                    </span>
                                <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                    </div>
                </li>
                <li>
                    <div class="fa_article">
                        <a href="#fa_content63">
                            <div class="fa_question">
                                <div id="fa_category_question_icon">Q</div>
                                <div class="fa_tag">카테고리 : 교환환불 > 매장 구매</div>
                                <span class="fa_title">반품하려는데 영수증이 없어요.</span>
                            </div>
                        </a>
                    </div>
                    <div id="fa_content63" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                    영수증이 없다면 laporte에서 거래하신 결제정보(거래 일자, 카드승인번호)를 준비해 주세요.<br>
                                    다만, 일부 환불 조건이 충족되지 않는 경우에는 환불되지 않을 수도 있으며, 제품 교환 또는 laporte 환불카드를 받는 것으로 대체될 수 있음을 양해해 주세요.<br><br>
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                        추석 당일은 휴무)
                                    </span>
                                <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                    </div>
                </li>
    </section>
<!-- 카테고리 laporte 서비스 -->
    <section id="fa_servicebox" class="fa_content_toggle">
        <div id="fa_sub_service_box">
            <span class="fa_sub_online">공통
                <a href="#fa_sub_same"></a>
            </span>
            <span class="fa_sub_online">픽업서비스
                <a href="#fa_sub_pickupservice"></a>
            </span>
            <span class="fa_sub_online">조립서비스
                <a href="#fa_sub_installservice"></a>
            </span>
            <span class="fa_sub_online">홈퍼니싱 컨설팅
                <a href="#fa_sub_consulting"></a>
            </span>
            <span class="fa_sub_online">기타
                <a href="#fa_sub_guitar"></a>
            </span>
        </div>
<!-- laporte 서비스 공통 -->
        <ul id="fa_sub_same" class="fa_refund_list">
            <li>
                <div class="fa_article">
                    <a href="#fa_content64">
                        <div class="fa_question">
                            <div id="fa_category_question_icon">Q</div>
                            <div class="fa_tag">카테고리 : laporte 서비스 > 공통</div>
                            <span class="fa_title">내 차에 제품을 실어주실 수 있나요?</span>
                        </div>
                    </a>
                </div>
                <div id="fa_content64" class="fa_content">
                    <div id="fa_category_answer_icon"></div>
                    <div id="fa_category_content">
                        <p class="category_txt">
                            laporte의 가구 제품은 조립 전 상태로 판매되고 있으며, 대부분 플랫 팩 방식으로 운반이 쉽도록 포장되어 있습니다.
                            laporte 웹사이트나 모바일 앱에서 제품의 조립 전 패키지 개수와 규격을 미리 확인해 보세요. 도움이 필요하시다면 laporte의 유료 배송 서비스를 이용하실 수도 있어요.<br><br>

                            ※ 배송 서비스
                        </p>
                        <hr>
                            <span class="fa_category_txt">
                                찾으시는 질문이 없나요?<br>
                                laporte 고객지원센터로 문의해 주세요.<br>
                            </span>
                            <span class="fa_category_txt">
                                (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                추석 당일은 휴무)
                            </span>
                        <br>
                            <div id="fa_category_chat_icon"></div>
                            <span class="fa_category_chat"> 전화 문의하기</span>
                    </div>
                </div>
            </li>
            <li>
                <div class="fa_article">
                    <a href="#fa_content65">
                        <div class="fa_question">
                            <div id="fa_category_question_icon">Q</div>
                            <div class="fa_tag">카테고리 : laporte 서비스 > 공통</div>
                            <span class="fa_title">laporte에서 제공하는 부가서비스에는 어떤것이 있나요?</span>
                        </div>
                    </a>
                </div>
                <div id="fa_content65" class="fa_content">
                    <div id="fa_category_answer_icon"></div>
                        <div id="fa_category_content">
                            <p class="category_txt">
                                ※ 온라인 주문 시에는 매장과 정책이 다를 수 있습니다. 자주 묻는 질문의 '온라인 주문' 항목을 참조해 주세요.<br><br>
                                배송서비스, 조립서비스, 홈퍼니싱 컨설팅 서비스 등 다양한 서비스를 이용할 수 있습니다. 더 자세한 내용은 서비스 안내 페이지를 참고하세요.<br><br>

                                ※ laporte 서비스
                            </p>
                            <hr>
                                <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                </span>
                                <span class="fa_category_txt">
                                    (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                    추석 당일은 휴무)
                                </span>
                            <br>
                                <div id="fa_category_chat_icon"></div>
                                <span class="fa_category_chat"> 전화 문의하기</span>
                        </div>
                </div>
            </li>
            <li>
                <div class="fa_article">
                    <a href="#fa_content66">
                        <div class="fa_question">
                            <div id="fa_category_question_icon">Q</div>
                            <div class="fa_tag">카테고리 : laporte 서비스 > 공통</div>
                            <span class="fa_title">내 차에 제품을 실어주실 수 있나요?</span>
                        </div>
                    </a>
                </div>
                <div id="fa_content66" class="fa_content">
                    <div id="fa_category_answer_icon"></div>
                    <div id="fa_category_content">
                        <p class="category_txt">
                            비회원으로도 온라인 구매가<br>
                            가능합니다(만 14세 이상만 구매 가능.)<br>
                            laporte 웹사이트 회원에 가입하면 내가<br>
                            저장한 위시리스트와 온라인<br>
                            구매내역을 언제 어디서든 확인할 수<br>
                            있어요.
                        </p>
                        <hr>
                            <span class="fa_category_txt">
                                찾으시는 질문이 없나요?<br>
                                laporte 고객지원센터로 문의해 주세요.<br>
                            </span>
                            <span class="fa_category_txt">
                                (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                추석 당일은 휴무)
                            </span>
                        <br>
                            <div id="fa_category_chat_icon"></div>
                            <span class="fa_category_chat"> 전화 문의하기</span>
                    </div>
                </div>
            </li>
        </ul>
<!-- laporte 서비스 픽업서비스 -->
        <ul id="fa_sub_pickupservice" class="fa_refund_list">
            <li>
                <div class="fa_article">
                    <a href="#fa_content67">
                        <div class="fa_question">
                            <div id="fa_category_question_icon">Q</div>
                            <div class="fa_tag">카테고리 : laporte 서비스 > 픽업서비스</div>
                            <span class="fa_title">픽업 서비스가 무엇이며, 어떻게 이용할 수 있나요?</span>
                        </div>
                    </a>
                </div>
                <div id="fa_content67" class="fa_content">
                    <div id="fa_category_answer_icon"></div>
                    <div id="fa_category_content">
                        <p class="category_txt">
                            매장에서 쇼핑하실 때 도움이 필요하신가요?
                            가구 제품을 직접 픽업하시기가 어렵다면 laporte의 픽업 서비스를 이용해 보세요. 매장의 가구 판매 데스크에 오셔서 구매를 원하는 제품을 말씀해 주시면 laporte 직원이 직접 해당 제품들을 찾아 드립니다. 일정 시간 대기 후 ‘제품 받는 곳’ 코너에서 영수증을 보여주시면 직원이 제품을 가져다드려요.<br><br>

                            단, 홈퍼니싱 액세서리 및 화초 등의 일부 제품은 픽업 서비스 대상에 포함되지 않으며, 셀프서브와 풀 서브에 위치한 제품에 대해 픽업해 드릴 수 있음을 참고해 주세요.<br><br>
                        </p>
                        <hr>
                            <span class="fa_category_txt">
                                찾으시는 질문이 없나요?<br>
                                laporte 고객지원센터로 문의해 주세요.<br>
                            </span>
                            <span class="fa_category_txt">
                                (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                추석 당일은 휴무)
                            </span>
                        <br>
                            <div id="fa_category_chat_icon"></div>
                            <span class="fa_category_chat"> 전화 문의하기</span>
                    </div>
                </div>
            </li>
            <li>
                <div class="fa_article">
                    <a href="#fa_content68">
                        <div class="fa_question">
                            <div id="fa_category_question_icon">Q</div>
                            <div class="fa_tag">카테고리 : laporte 서비스 > 픽업서비스</div>
                            <span class="fa_title">픽업 서비스 비용이 얼마인가요?</span>
                        </div>
                    </a>
                </div>
                <div id="fa_content68" class="fa_content">
                    <div id="fa_category_answer_icon"></div>
                        <div id="fa_category_content">
                            <p class="category_txt">
                                픽업 서비스 비용은 1만 원이며, 매장의 가구 판매 데스크에서 신청하실 수 있습니다.<br>
                                만약 제품의 픽업부터 배송까지 원스톱 서비스를 원하시면 픽업 & 배송 서비스를 이용해 보세요. 지역별 배송 서비스 금액에 1만 원을 추가하시면 laporte 직원이 직접 해당 제품들을 찾아 배송 단계까지 처리해드립니다.<br><br>

                                단, 홈퍼니싱 액세서리 및 화초 등의 일부 제품은 픽업 서비스 대상에 포함되지 않으며, 셀프서브와 풀 서브에 위치한 제품에 대해 픽업해 드릴 수 있음을 참고해 주세요.<br><br>

                                ※ 배송 서비스
                            </p>
                            <hr>
                                <span class="fa_category_txt">
                                    찾으시는 질문이 없나요?<br>
                                    laporte 고객지원센터로 문의해 주세요.<br>
                                </span>
                                <span class="fa_category_txt">
                                    (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                    추석 당일은 휴무)
                                </span>
                            <br>
                                <div id="fa_category_chat_icon"></div>
                                <span class="fa_category_chat"> 전화 문의하기</span>
                        </div>
                </div>
            </li>
            <li>
                <div class="fa_article">
                    <a href="#fa_content69">
                        <div class="fa_question">
                            <div id="fa_category_question_icon">Q</div>
                            <div class="fa_tag">카테고리 : laporte 서비스 > 픽업서비스</div>
                            <span class="fa_title">픽업 서비스 개수나 품목에 제한이 있나요?</span>
                        </div>
                    </a>
                </div>
                <div id="fa_content69" class="fa_content">
                    <div id="fa_category_answer_icon"></div>
                    <div id="fa_category_content">
                        <p class="category_txt">
                          픽업 서비스 이용 시 개수에 제한은 없습니다. 다만, 홈퍼니싱 액세서리 및 화초 등의 일부 제품은 픽업 서비스 대상에 포함되지 않습니다.<br> 셀프서브와 풀 서브에 위치한 가구 제품에 대해 픽업 서비스를 진행해 드립니다.<br>
                        </p>
                        <hr>
                            <span class="fa_category_txt">
                                찾으시는 질문이 없나요?<br>
                                laporte 고객지원센터로 문의해 주세요.<br>
                            </span>
                            <span class="fa_category_txt">
                                (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                추석 당일은 휴무)
                            </span>
                        <br>
                            <div id="fa_category_chat_icon"></div>
                            <span class="fa_category_chat"> 전화 문의하기</span>
                    </div>
                </div>
            </li>
            </ul>
<!-- laporte 서비스 조립서비스 -->
            <ul id="fa_sub_installservice" class="fa_refund_list">
                <li>
                    <div class="fa_article">
                        <a href="#fa_content70">
                            <div class="fa_question">
                                <div id="fa_category_question_icon">Q</div>
                                <div class="fa_tag">카테고리 : laporte 서비스 > 조립서비스</div>
                                <span class="fa_title">조립서비스 이용 방법이 궁금해요.</span>
                            </div>
                        </a>
                    </div>
                    <div id="fa_content70" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                        <div id="fa_category_content">
                            <p class="category_txt">
                                ※ 온라인 주문 시에는 매장과 정책이 다를 수 있습니다. 자주 묻는 질문의 '온라인 주문' 항목을 참조해 주세요.<br><br>

                                laporte는 조립이 필요한 제품에는 모두 조립설명서를 제공하여 소비자가 직접 제품을 조립할 수 있도록 디자인하고 있습니다. 또한, laporte의 유료 조립 서비스를 이용하실 수도 있어요. 다만, 유료 조립 서비스는 배송 서비스와 함께 신청하실 수 있습니다. 서비스 이용 시의 유의사항과 약관을 해당 페이지에서 참고해 주세요.<br><br>

                                ※ 조립 서비스<br><br>
                            </p>
                            <hr>
                                <span class="fa_category_txt">
                                    찾으시는 질문이 없나요?<br>
                                    laporte 고객지원센터로 문의해 주세요.<br>
                                </span>
                                <span class="fa_category_txt">
                                    (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                    추석 당일은 휴무)
                                </span>
                            <br>
                                <div id="fa_category_chat_icon"></div>
                                <span class="fa_category_chat"> 전화 문의하기</span>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="fa_article">
                        <a href="#fa_content71">
                            <div class="fa_question">
                                <div id="fa_category_question_icon">Q</div>
                                <div class="fa_tag">카테고리 : laporte 서비스 > 조립서비스</div>
                                <span class="fa_title">조립서비스를 받았는데 제품에 문제가 있어요.</span>
                            </div>
                        </a>
                    </div>
                    <div id="fa_content71" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                    조립 서비스를 받으시는 과정에서 불편함이 있었거나, 조립 서비스를 받은 제품을 사용 중 문제를 발견하셨다면 서비스 신청 당시 받으신 주문서를 준비하셔서 laporte 고객지원센터로 문의해 주세요.
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                        추석 당일은 휴무)
                                    </span>
                                <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                    </div>
                </li>
            </ul>
<!-- laporte 서비스 홈퍼니싱 컨설팅 -->
            <ul id="fa_sub_consulting" class="fa_refund_list">
                <li>
                    <div class="fa_article">
                        <a href="#fa_content72">
                            <div class="fa_question">
                                <div id="fa_category_question_icon">Q</div>
                                <div class="fa_tag">카테고리 : laporte 서비스 > 홈퍼니싱 컨설팅</div>
                                <span class="fa_title">방을 디자인하고 꾸미는 데 도움이 필요해요.</span>
                            </div>
                        </a>
                    </div>
                    <div id="fa_content72" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                    laporte의 담당자와 함께 집이나 사무실을 꾸며보세요. 홈퍼니싱 전문가가 우리 집 꾸미기 프로젝트를 도와드립니다.<br>또한, laporte의 온라인 플래너로 직접 옷장과 수납, 사무실 가구 등을 포함한 다양한 제품을 구성해볼 수도 있어요.<br>
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                        추석 당일은 휴무)
                                    </span>
                                <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                    </div>
                </li>
                <li>
                    <div class="fa_article">
                        <a href="#fa_content73">
                            <div class="fa_question">
                                <div id="fa_category_question_icon">Q</div>
                                <div class="fa_tag">카테고리 : laporte 서비스 > 홈퍼니싱 컨설팅</div>
                                <span class="fa_title">홈퍼니싱플래닝 서비스란 무엇인가요?</span>
                            </div>
                        </a>
                    </div>
                    <div id="fa_content73" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                            <div id="fa_category_content">
                                <p class="category_txt">
                                    집이나 사무실을 새롭게 꾸미고 싶다면, laporte의 홈퍼니싱 플래닝 서비스를 이용해 보세요.<br>
                                </p>
                                <hr>
                                    <span class="fa_category_txt">
                                        찾으시는 질문이 없나요?<br>
                                        laporte 고객지원센터로 문의해 주세요.<br>
                                    </span>
                                    <span class="fa_category_txt">
                                        (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                        추석 당일은 휴무)
                                    </span>
                                <br>
                                    <div id="fa_category_chat_icon"></div>
                                    <span class="fa_category_chat"> 전화 문의하기</span>
                            </div>
                    </div>
                </li>
            </ul>
<!-- laporte 서비스 기타 -->
            <ul id="fa_sub_guitar" class="fa_refund_list">
                <li>
                    <div class="fa_article">
                        <a href="#fa_content74">
                            <div class="fa_question">
                                <div id="fa_category_question_icon">Q</div>
                                <div class="fa_tag">카테고리 : laporte 서비스 > 기타</div>
                                <span class="fa_title">재봉 서비스란 무엇이며, 어떻게 신청하나요?</span>
                            </div>
                        </a>
                    </div>
                    <div id="fa_content74" class="fa_content">
                        <div id="fa_category_answer_icon"></div>
                        <div id="fa_category_content">
                            <p class="category_txt">
                                커튼 길이를 원하는 만큼 자르고 싶다면 재봉 서비스를 이용해 보세요.<br>
                                먼저, 커튼을 설치할 곳의 천장 높이와 커튼 봉이 달린 높이를 재어서 매장에 오세요. 마음에 드는 커튼을 고른 뒤 직원에게 서비스를 신청하실 때 얼마나 잘라야 하는지 말씀해 주시기 바랍니다.<br>
                                결제 후 배송 코너에서 구매한 커튼을 재봉 주문장과 함께 전달하면 3일 이후에 서비스가 완료됩니다.<br>
                                재봉된 커튼은 직접 매장으로 찾으러 오셔도 되고, 택배 배송(별도 가격)으로 받아 보실 수도 있어요.<br><br>

                                * 재단된 커튼의 밑단은 2cm 두께로 마감됩니다.
                                * 커튼 폭 연장 후, 패턴의 연속성이 유지되지 않을 수 있습니다.
                                * 커튼 종류에 따라 최종 폭의 길이는 다를 수 있습니다.
                                * 커튼 한 쌍 요금: 9,900<br><br>

                                재봉 서비스는 매장의 홈텍스타일 코너에서 신청하실 수 있습니다. 다만, 일부 매장에서만 서비스가 제공되고 있는 점 참고해 주세요.<br><br>

                                ※ 택배 재봉 서비스<br><br>
                            </p>
                            <hr>
                                <span class="fa_category_txt">
                                    찾으시는 질문이 없나요?<br>
                                    laporte 고객지원센터로 문의해 주세요.<br>
                                </span>
                                <span class="fa_category_txt">
                                    (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                    추석 당일은 휴무)
                                </span>
                            <br>
                                <div id="fa_category_chat_icon"></div>
                                <span class="fa_category_chat"> 전화 문의하기</span>
                        </div>
                    </div>
                </li>
            </ul>
    </section>
<!-- 카테고리 제품정보 -->
    <section id="fa_productbox" class="fa_content_toggle">
        <ul class="fa_list">
            <li>
                <div class="fa_article">
                    <a href="#fa_content75">
                        <div class="fa_question">
                            <div id="fa_category_question_icon">Q</div>
                            <div class="fa_tag">카테고리 : 제품정보</div>
                            <span class="fa_title">부품이나 제품 일부분을 구매할 수 있나요?</span>
                        </div>
                    </a>
                </div>
                <div id="fa_content75" class="fa_content">
                    <div id="fa_category_answer_icon"></div>
                    <div id="fa_category_content">
                        <p class="category_txt">
                           laporte에서는 부품(하드웨어)이나 제품의 일부분(파트)을 유료로 판매하고 있지 않습니다. 필요하신 경우, 매장의 교환환불 데스크에서 여분의 부품과 고정장치 등을 받을 수 있습니다.
                        </p>
                        <hr>
                            <span class="fa_category_txt">
                                찾으시는 질문이 없나요?<br>
                                laporte 고객지원센터로 문의해 주세요.<br>
                            </span>
                            <span class="fa_category_txt">
                                (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                추석 당일은 휴무)
                            </span>
                        <br>
                            <div id="fa_category_chat_icon"></div>
                            <span class="fa_category_chat"> 전화 문의하기</span>
                    </div>
                </div>
            </li>
            <li>
                <div class="fa_article">
                    <a href="#fa_content76">
                        <div class="fa_question">
                            <div id="fa_category_question_icon">Q</div>
                            <div class="fa_tag">카테고리 : 제품정보</div>
                            <span class="fa_title">지퍼에 고리가 달려있지 않아요.</span>
                        </div>
                    </a>
                </div>
                <div id="fa_content76" class="fa_content">
                    <div id="fa_category_answer_icon"></div>
                        <div id="fa_category_content">
                            <p class="category_txt">
                               어린이용 제품과 일부 매트리스 제품 등에는 어린이 안전사고 예방을. 위해 아이들이 쉽게 열 수 없도록 손잡이가 달리지 않은 안심 지퍼를. 사용하였습니다. 안심 지퍼를 열 때는 지퍼의 홈에 실이나 클립을 끼워 여실 수 있어요.
                           </p>
                           <hr>
                               <span class="fa_category_txt">
                                    찾으시는 질문이 없나요?<br>
                                    laporte 고객지원센터로 문의해 주세요.<br>
                                </span>
                                <span class="fa_category_txt">
                                    (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                    추석 당일은 휴무)
                                </span>
                            <br>
                                <div id="fa_category_chat_icon"></div>
                                <span class="fa_category_chat"> 전화 문의하기</span>
                        </div>
                </div>
            </li>
            <li>
                <div class="fa_article">
                    <a href="#fa_content77">
                        <div class="fa_question">
                            <div id="fa_category_question_icon">Q</div>
                            <div class="fa_tag">카테고리 : 제품정보</div>
                            <span class="fa_title">강화 유리 제품의 특성이 궁금합니다.</span>
                        </div>
                    </a>
                </div>
                <div id="fa_content77" class="fa_content">
                    <div id="fa_category_answer_icon"></div>
                        <div id="fa_category_content">
                            <p class="category_txt">
                                강화 유리는 일반적인 유리보다 내구성이 뛰어나고 충격에 강합니다. 그러나, 강화 유리도 다른 유리와 마찬가지로 충격 또는 긁힘에. 노출되면 깨질 수 있습니다. 그래서 유리는 항상 조심스럽게 다루는 것이 가장 중요합니다. laporte 제품은 가정에서만 사용하도록. 설계되었으므로 공공장소에서 사용은 권장하지 않습니다.
                            </p>
                            <hr>
                                <span class="fa_category_txt">
                                    찾으시는 질문이 없나요?<br>
                                    laporte 고객지원센터로 문의해 주세요.<br>
                                </span>
                                <span class="fa_category_txt">
                                    (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                    추석 당일은 휴무)
                                </span>
                            <br>
                                <div id="fa_category_chat_icon"></div>
                                <span class="fa_category_chat"> 전화 문의하기</span>
                        </div>
                </div>
            </li>
        </ul>
    </section>
<!-- 카테고리 웹사이트 이용 관련 -->
    <section id="fa_sitebox" class="fa_content_toggle">
        <ul class="fa_list">
            <li>
                <div class="fa_article">
                    <a href="#fa_content78">
                        <div class="fa_question">
                            <div id="fa_category_question_icon">Q</div>
                            <div class="fa_tag">카테고리 : laporte 웹사이트 / 계정</div>
                            <span class="fa_title">laporte 웹사이트에 가입하면 어떤 혜택이 있나요?</span>
                        </div>
                    </a>
                </div>
                <div id="fa_content78" class="fa_content">
                    <div id="fa_category_answer_icon"></div>
                    <div id="fa_category_content">
                        <p class="category_txt">
                            laporte 웹사이트 회원에 가입하면 내가 저장한 위시리스트와 온라인 구매내역을 언제 어디서든 확인할 수 있고, 상품평을 작성할 수도 있어요. 또한, 웹사이트에서 진행되는 이벤트에 참여하거나 laporte의 다양한 온라인 플래닝 도구를 편리하게 이용하실 수 있어요!
                        </p>
                        <hr>
                            <span class="fa_category_txt">
                                찾으시는 질문이 없나요?<br>
                                laporte 고객지원센터로 문의해 주세요.<br>
                            </span>
                            <span class="fa_category_txt">
                                (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                추석 당일은 휴무)
                            </span>
                        <br>
                            <div id="fa_category_chat_icon"></div>
                            <span class="fa_category_chat"> 전화 문의하기</span>
                    </div>
                </div>
            </li>
            <li>
                <div class="fa_article">
                    <a href="#fa_content79">
                        <div class="fa_question">
                            <div id="fa_category_question_icon">Q</div>
                            <div class="fa_tag">카테고리 : laporte 웹사이트 / 계정</div>
                            <span class="fa_title">laporte 웹사이트 아이디는 어떻게 찾나요?</span>
                        </div>
                    </a>
                </div>
                <div id="fa_content79" class="fa_content">
                    <div id="fa_category_answer_icon"></div>
                    <div id="fa_category_content">
                        <p class="category_txt">
                            가입했던 아이디(이메일)가 생각나지 않는다면, laporte 고객지원센터로 문의해 주세요.
                            다만, 고객님의 이메일이 laporte 웹사이트에 가입되어 있는지만 확인이 가능하며, 담당 부서에서 확인하여 안내해 드리기까지 최대 24시간이 소요될 수 있음을 참고해 주세요.
                        </p>
                        <hr>
                            <span class="fa_category_txt">
                                찾으시는 질문이 없나요?<br>
                                laporte 고객지원센터로 문의해 주세요.<br>
                            </span>
                            <span class="fa_category_txt">
                                (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                추석 당일은 휴무)
                            </span>
                        <br>
                            <div id="fa_category_chat_icon"></div>
                            <span class="fa_category_chat"> 전화 문의하기</span>
                    </div>
                </div>
            </li>
            <li>
                <div class="fa_article">
                    <a href="#fa_content80">
                        <div class="fa_question">
                            <div id="fa_category_question_icon">Q</div>
                            <div class="fa_tag">카테고리 : laporte 웹사이트 / 계정</div>
                            <span class="fa_title">비밀번호를 잃어버렸어요.</span>
                        </div>
                    </a>
                </div>
                <div id="fa_content80" class="fa_content">
                    <div id="fa_category_answer_icon"></div>
                        <div id="fa_category_content">
                            <p class="category_txt">
                                로그인 화면의 '비밀번호 찾기' 기능을 이용해 보세요. 가입하신 이메일 계정으로 임시 비밀번호가 발송됩니다.<br>
                                임시 비밀번호로 로그인하신 후에는 꼭 나만의 비밀번호로 변경해 주세요!<br>
                                임시 비밀번호 발급에 어려움이 있다면, laporte 고객지원센터로 문의해 주세요.<br>
                            </p>
                            <hr>
                                <span class="fa_category_txt">
                                    찾으시는 질문이 없나요?<br>
                                    laporte 고객지원센터로 문의해 주세요.<br>
                                </span>
                                <span class="fa_category_txt">
                                    (운영시간: 10:00 am ~ 10:00 pm, 설날과<br>
                                    추석 당일은 휴무)
                                </span>
                            <br>
                                <div id="fa_category_chat_icon"></div>
                                <span class="fa_category_chat"> 전화 문의하기</span>
                        </div>
                </div>
            </li>
        </ul>
    </section>
    </div>
    </section>

<!------- fa_content 끝 -------->



<!-- 하단영역 -->
    <%@ include file="../01_home/footer.jsp" %>

     <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
     <script src="../assets/js/home.js"></script>
     <script type="text/javascript">

       /* -----------------------fa content-------------------------*/
         /*--상단 아코디언--*/
       $(function() {
            /** 게시글의 제목을 클릭한 경우 호출되는 이벤트 정의 */
            $(".fa_collapse").click(function(e) {
                // 링크의 기본 동작(페이지 이동) 방지
                e.preventDefault();

                $(this).css('background-color', '#eff5fa');
                $('.fa_collapse').not(this).css('background-color', '#fff');

                // 클릭한 요소의 href 속성을 가져온다 --> 내용영역의 id
                var target = $(this).find('a').attr('href');
                // 가져온 내용영역의 id를 화면에 표시한다.
                $(target).slideToggle(100);
                // 내용영역(.content)중에서
                // 클릭한 요소가 지정한 항목만 제외(not($(target)))
                // 하고 화면에서 숨긴다.
                $(".fa_collapse_content").not($(target)).slideUp(100);
            });
        });

        /*--하단 아코디언 버튼 클릭시 내용 나옴 */
         $(function() {
            /** 게시글의 제목을 클릭한 경우 호출되는 이벤트 정의 */
            $(".fa_color_change").click(function(e) {
                // 링크의 기본 동작(페이지 이동) 방지
                e.preventDefault();

                $(this).css('background-color', '#cebea7');
                $('.fa_color_change').not(this).css('background-color', '#fff');

                var target = $(this).find('a').attr('href');
                // 가져온 내용영역의 id를 화면에 표시한다.
                $(target).fadeToggle(100);
                // 내용영역(.content)중에서
                // 클릭한 요소가 지정한 항목만 제외(not($(target)))
                // 하고 화면에서 숨긴다.
                $(".fa_content_toggle").not($(target)).fadeOut(100);
            });
        });
         /**서브메뉴 아코디언*/
          $(function() {
            /** 게시글의 제목을 클릭한 경우 호출되는 이벤트 정의 */
            $(".fa_sub_online").click(function(e) {
                // 링크의 기본 동작(페이지 이동) 방지
                e.preventDefault();

                $(this).css('color', '#111111');
                $('.fa_sub_online').not(this).css('color', '#999999');

                // 클릭한 요소의 href 속성을 가져온다 --> 내용영역의 id
                var target = $(this).find('a').attr('href');
                // 가져온 내용영역의 id를 화면에 표시한다.
                $(target).fadeToggle(100);
                // 내용영역(.content)중에서
                // 클릭한 요소가 지정한 항목만 제외(not($(target)))
                // 하고 화면에서 숨긴다.
                $(".fa_refund_list").not($(target)).fadeOut(100);
            });
        });

        /*----카테고리전체 내용 아코디언----*/
            $(function() {
            $(".fa_article").click(function(e) {
            // 링크의 기본 동작(페이지 이동) 방지
            e.preventDefault();

            $(this).css('background-color', '#eff5fa');
            $('.fa_article').not(this).css('background-color', '#fff');

                // 클릭한 요소의 href 속성을 가져온다 --> 내용영역의 id
            var target = $(this).find('a').attr('href');
            // 가져온 내용영역의 id를 화면에 표시한다.
            $(target).slideToggle(100);
            // 내용영역(.content)중에서
            // 클릭한 요소가 지정한 항목만 제외(not($(target)))
            // 하고 화면에서 숨긴다.
            $(".fa_content").not($(target)).slideUp(100);
        });
        });

    </script>
  </body>
</html>