<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>la porte</title>
    <link rel="shortcut icon" href="assets/img/laporte_favi.png" />
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <!-- stylesheet -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
    <link rel="stylesheet" type="text/css" href="assets/css/common.css">
    <link rel="stylesheet" type="text/css" href="assets/css/home.css">
    <!-- javascript -->
    <script src="http://code.jquery.com/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <!-- ajax-helper -->
    <link rel="stylesheet" href="assets/plugins/ajax/ajax_helper.css" />
    <script src="assets/plugins/ajax/ajax_helper.js"></script>
</head>

<body>
    <%@ include file="01_home/header.jsp" %>
    <section>
        <%@ include file="01_home/search.jsp"%>
        <!-- 검색제외 본문영역 -->
        <div class="container">
        
       <!-- Swiper -->
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<div class="banner-box">
				        <div class="home_banner_content">
                                <div class="row">
                                    <div class="home_banner_img col-sm-12 col-md-6">
                                    <img src="assets/img/banner_image.png" class="banner_carousel_img"></div>
                                    <div class="home_banner_txt col-sm-12 col-md-6">
                                    
                                        <h3>보다 지속가능한 삶을 위한 간단한 변화</h3>
                                        <p>laporte에서 지속가능한 삶을 위해 실천하고 있는 변화를 확인해보세요. 
                                        집에서 지속가능한 생활을 하기가 그 어느 때보다 쉬워졌고 비용도 합리적이에요. 그리고 돈도 절약하면서 소중한 자원도 보존할 수 있습니다.</p>
                                     	
                                     	<br/>
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
					
					<div class="swiper-slide">
						<div class="banner-box">
						<div class="home_banner_content" style="background-color: #333333;">
                                <div class="row">
                                    <div class="home_banner_img col-sm-12 col-md-6">
                                    <img src="assets/img/banner_caro_img1.png" class="banner_carousel_img"></div>
                                    <div class="home_banner_txt banner_secound col-sm-12 col-md-6">
                                    
                                        <h3>가장 밝은 아이디어를 소개합니다</h3>
                                        <p>la porte는 백열전구보다 에너지는 85% 적게 사용하면서 지속 시간은 15,000시간까지
                                        길어진 RYET 뤼에트 LED 전구를 개발했습니다. 매일 저녁 1시간 동안 조명을 켜고 독서를
                                        한다면 무려 41년 가까이 사용할 수 있죠. 3,900원으로 이 모든 것을 누릴 수 있다니, 놀랍지 않나요?</p>
           
                                       
                                    </div>
                                </div>
                            </div>
                            </div>
                        </div>
                        
                        <div class="swiper-slide">
						<div class="banner-box">
							<div class="home_banner_content"  style="background-color: #e69392;">
                                <div class="row">
                                    <div class="home_banner_img col-sm-12 col-md-6">
                                    <img src="assets/img/banner_caro_img2.png" class="banner_carousel_img"></div>
                                    <div class="home_banner_txt col-sm-12 col-md-6"> 
                                    
                                        <h3 style="color: white;">일회용 플라스틱 없는 세상 만들기</h3>
                            
                                    <p style="color:white;">
                                        일회용 플라스틱 제품을 무책임하게 폐기하면 환경에 심각한 피해를 줄 수 있습니다.
                                        la porte는 인간과 지구를 위한 노력의 일환으로 글로벌 홈퍼니싱 제품군에서 모든 일회용 플라스틱을 제외 하였습니다.
                                        여기에는 접시와 컵, 플라스틱 빨대도 포함됩니다.
                                    </p>
                                    <br />
                                    </div>
                                </div>
                            </div>
                            </div>
                        </div>
				</div>
				<!-- Add Pagination -->
				<div class="slider__controller">
					<div class="slider__controller__dot">
						<div
							class="fb__progressBar swiper-pagination swiper-pagination-progressbar">
							<span class="swiper-pagination-progressbar-fill"> </span>
						</div>
					</div>
				</div>
				<!--pagenation 끝-->
			</div>
			<!-- swiper 배너 영역 끝-->
			
       
            <!-- 배너 끝 -->
            <!-- 모든 제품 -->
            <div id="home_content">
                <h4>추천 제품</h4>
                <div id="home_item_box">
                    <ul id="home_item_listbox">
                        <c:forEach var="item" items="${output}" begin="0" end="10" step="1">
                            <li>
                                <div class="home_item">
                                    <div class="home_wishlist_loc">
                                        <input type="checkbox" class="chk_heart heart" style="display: none;" name="chk_heart" id="${item.prodno }" <c:set var="result" value="0" />
                                        <c:forEach var="wishitem" items="${wishoutput}">
                                            <c:if test="${item.prodno== wishitem.prodno}">
                                                <c:set var="result" value="${result+1 }" />
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
                                        </a> <a href="#">
                                            <c:set var="group" value="${item.group }" />
                                            <span class="home_item_title">${item.name}</span> <br /> <span class="home_item_info">${item.size} <br />${item.color}</span><br />
                                            <c:choose>
                                                <c:when test="${fn:contains(group, '세일') }">
                                                    <span class="home_item_info home_item_pricedown">&#8361;
                                                        <fmt:formatNumber value="${item.price}" pattern="#,###" />
                                                    </span>
                                                    <br />
                                                    <span class="home_item_price <c:if test=" ${fn:contains(group, '인기' ) }">home_item_mark</c:if>">&#8361;
                                                        <fmt:formatNumber value="${item.saleprice}" pattern="#,###" />
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="home_item_price <c:if test=" ${fn:contains(group, '인기' ) }">home_item_mark</c:if>">
                                                        ₩
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
            <!-- 이달의 제품 -->
            <div class="home_content">
                <h4 class="home_product_h4">이달의 제품</h4>
                <div class="home_product_listwrap">
                    <ul class="home_product_listwrap_ul">
                        <li class="home_product_listwrap_ul_li">
                        	<a href ="${pageContext.request.contextPath}/03_detail/detail.do?prodno=20001">
                        		<img class="home_product_listwrap_ul_li_img" src="assets/img/product1.png" />
                        	</a>
                            <div class="home_product_listwrap_ul_li_div">
                                <a class="home_product_listwrap_ul_li_div_a" href="${pageContext.request.contextPath}/03_detail/detail.do?prodno=20001">고양이와 집사가 함께 쓰는 가구</a>
                                <a class="home_product_listwrap_ul_li_div_span" data-userno="${userno}" data-prodno="20001"></a>
                            </div>
                        </li>
                        <li class="home_product_listwrap_ul_li">
                        	<a href ="${pageContext.request.contextPath}/03_detail/detail.do?prodno=20002">
                        		<img class="home_product_listwrap_ul_li_img" src="assets/img/product2.png" />
                        	</a>
                            <div class="home_product_listwrap_ul_li_div">
                                <a class="home_product_listwrap_ul_li_div_a" href="${pageContext.request.contextPath}/03_detail/detail.do?prodno=20002"> 침대같은 편안한 의자 수납공감은 덤</a>
                                <a class="home_product_listwrap_ul_li_div_span" data-userno="${userno}" data-prodno="20002"></a>
                            </div>
                        </li>
                        <li class="home_product_listwrap_ul_li">
                        	<a href ="${pageContext.request.contextPath}/03_detail/detail.do?prodno=20003">
                        		<img class="home_product_listwrap_ul_li_img" src="assets/img/product3.png" />
                        	</a>
                            <div class="home_product_listwrap_ul_li_div">
                                <a class="home_product_listwrap_ul_li_div_a" href="${pageContext.request.contextPath}/03_detail/detail.do?prodno=20003">선택까지 편안한 새로운 La porte 스프링 매트리스</a>
                                <a class="home_product_listwrap_ul_li_div_span" data-userno="${uesrno}" data-prodno="20003"></a>
                            </div>
                        </li>
                        <li class="home_product_listwrap_ul_li">
                        	<a href="#">
                        		<img class="home_product_listwrap_ul_li_img" src="assets/img/product4.png" />
                        	</a>
                            <div class="home_product_listwrap_ul_li_div">
                                <a class="home_product_listwrap_ul_li_div_a">서랍마다 라벨칸이 있어서 물건을 쉽게 정리하고 찾을 수 있습니다.</a>
                                <a class="home_product_listwrap_ul_li_div_span"></a>
                            </div>
                        </li>
                        <li class="home_product_listwrap_ul_li">
                        	<a href ="${pageContext.request.contextPath}/03_detail/detail.do?prodno=20004">
                        		<img class="home_product_listwrap_ul_li_img" src="assets/img/product5.png" />
                        	</a>
                            <div class="home_product_listwrap_ul_li_div">
                                <a class="home_product_listwrap_ul_li_div_a" >보기만해도 푹신푹신 하고 편안한 STOCKSUND 암체어</a>
                                <a class="home_product_listwrap_ul_li_div_span" data-userno="${userno}" data-prodno="20004"></a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- 이달의 제품 끝 -->
            <!-- 홈 퍼니싱 -->
            <div class="home_content">
                <h4>홈퍼니싱 아이디어</h4>
                <div class="idea_btn_box">
                    <!-- 탭 버튼 구성 -->
                    <ul class="nav nav-pills" id="mytab">
                        <li class="active"><a id="funiitem" href="#" data-toggle="tab">가구</a></li>
                        <li><a id="beditem" href="#" data-toggle="tab">침대</a></li>
                        <li><a id="more" href="#" data-toggle="tab">+4개 더보기</a></li>
                        <li><a id="kitchenitem" href="#" data-toggle="tab">주방</a></li>
                        <li><a id="sofaitem" href="#" data-toggle="tab">소파</a></li>
                        <li><a id="acceptitem" href="#" data-toggle="tab">수납</a></li>
                        <li><a id="lightitem" href="#" data-toggle="tab">조명</a></li>
                    </ul>
                </div>
                <!-- 이미지 구성 -->
                <div id="result">
                    <div class="home_idea_img">
                        <a href="#"><img src="https://www.ikea.com/ext/ingkadam/m/10fdb13d3fb1d53c/original/PH156758-crop001.jpg?f=s"></a>
                        <a href="#"><img src="https://www.ikea.com/ext/ingkadam/m/2b3e78607f1dab3a/original/PH159258-crop002.jpg?f=xxs"></a>
                        <a href="#"><img src="https://www.ikea.com/ext/ingkadam/m/5bcf59f5679f89a5/original/PH155458-crop001.jpg?f=xxs"></a>
                        <a href="#"><img src="https://www.ikea.com/ext/ingkadam/m/79a4a844140347b4/original/PH155058-crop001.jpg?f=xxs"></a>
                        <a href="#"><img src="https://www.ikea.com/ext/ingkadam/m/1b5af690c85957f6/original/PH156762-crop001.jpg?f=xxl"></a>
                        <a href="#"><img src="https://www.ikea.com/ext/ingkadam/m/c2cb76cd457a0cd/original/PH165571-crop001.jpg?f=xxl"></a>
                    </div>
                </div>
            </div>
            <!-- 홈 퍼니싱 끝 -->
        </div>
    </section>
    <%@ include file="01_home/footer.jsp" %>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- jQuery Ajax Form plugin CDN -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
    <!-- jQuery Ajax Setup -->
    <script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="assets/js/home.js"></script>
    <script type="text/javascript">
    /* 위시리스트 아이콘버튼 toggle */
    $(".home_wishlist_icon").click(function(e) {
        e.preventDefault();
        $(this).toggleClass("home_wishlist_icon_active")
    });

    $(function() {
        $("#kitchenitem").hide();
        $("#sofaitem").hide();
        $("#acceptitem").hide();
        $("#lightitem").hide();
    });

    $(function() {
 			$(document).ready(function(e){
            /*-------배너 플러그인-------*/
            var swiper = new Swiper('.swiper-container', {
                spaceBetween: 30,
                centeredSlides: true,
                autoplay: {
                    delay: 6000,
                    disableOnInteraction: false,
                },
                pagination: {
                    el: '.swiper-pagination',
                    type: 'progressbar',
                }
            });
            /*-------배너 플러그인 끝-------*/

        });

  




        /* section - idea */
        $("#funiitem").click(function(e) {
            $.ajax({
                /** ajax 기본 옵션 */
                cache: false, // 캐쉬 사용 금지 처리
                url: 'assets/api/funiitem.html', // 읽어들일 파일의 경로
                method: 'get', // 통신방법 (get(기본값), post)
                data: {}, // 접속대상에게 전달할 파라미터
                dataType: 'html', // 읽어올 내용 형식 (html,xml,json)
                timeout: 30000, // 타임아웃 (30초)

                // 읽어온 내용을 처리하기 위한 함수
                success: function(req) {
                    //result에 이미 존재 하는 갤러리 삭제
                    $("#result").empty();
                    // 준비된 요소에게 읽어온 내용을 출력한다.
                    $("#result").append(req);
                }
            }); //end $.ajax
        }); // end click

        $("#beditem").click(function(e) {
            $.ajax({
                /** ajax 기본 옵션 */
                cache: false, // 캐쉬 사용 금지 처리
                url: 'assets/api/beditem.html', // 읽어들일 파일의 경로
                method: 'get', // 통신방법 (get(기본값), post)
                data: {}, // 접속대상에게 전달할 파라미터
                dataType: 'html', // 읽어올 내용 형식 (html,xml,json)
                timeout: 30000, // 타임아웃 (30초)

                // 읽어온 내용을 처리하기 위한 함수
                success: function(req) {
                    //result에 이미 존재 하는 갤러리 삭제
                    $("#result").empty();
                    // 준비된 요소에게 읽어온 내용을 출력한다.
                    $("#result").append(req);
                }
            }); //end $.ajax
        }); // end click

        $("#kitchenitem").click(function(e) {
            $.ajax({
                /** ajax 기본 옵션 */
                cache: false, // 캐쉬 사용 금지 처리
                url: 'assets/api/kitchenitem.html', // 읽어들일 파일의 경로
                method: 'get', // 통신방법 (get(기본값), post)
                data: {}, // 접속대상에게 전달할 파라미터
                dataType: 'html', // 읽어올 내용 형식 (html,xml,json)
                timeout: 30000, // 타임아웃 (30초)


                // 읽어온 내용을 처리하기 위한 함수
                success: function(req) {
                    //result에 이미 존재 하는 갤러리 삭제
                    $("#result").empty();
                    // 준비된 요소에게 읽어온 내용을 출력한다.
                    $("#result").append(req);
                }
            }); //end $.ajax
        }); // end click

        $("#sofaitem").click(function(e) {
            $.ajax({
                /** ajax 기본 옵션 */
                cache: false, // 캐쉬 사용 금지 처리
                url: 'assets/api/sofaitem.html', // 읽어들일 파일의 경로
                method: 'get', // 통신방법 (get(기본값), post)
                data: {}, // 접속대상에게 전달할 파라미터
                dataType: 'html', // 읽어올 내용 형식 (html,xml,json)
                timeout: 30000, // 타임아웃 (30초)

                // 읽어온 내용을 처리하기 위한 함수
                success: function(req) {
                    //result에 이미 존재 하는 갤러리 삭제
                    $("#result").empty();
                    // 준비된 요소에게 읽어온 내용을 출력한다.
                    $("#result").append(req);
                }
            }); //end $.ajax
        }); // end click

        $("#acceptitem").click(function(e) {
            $.ajax({
                /** ajax 기본 옵션 */
                cache: false, // 캐쉬 사용 금지 처리
                url: 'assets/api/acceptitem.html', // 읽어들일 파일의 경로
                method: 'get', // 통신방법 (get(기본값), post)
                data: {}, // 접속대상에게 전달할 파라미터
                dataType: 'html', // 읽어올 내용 형식 (html,xml,json)
                timeout: 30000, // 타임아웃 (30초)

                // 읽어온 내용을 처리하기 위한 함수
                success: function(req) {
                    //result에 이미 존재 하는 갤러리 삭제
                    $("#result").empty();
                    // 준비된 요소에게 읽어온 내용을 출력한다.
                    $("#result").append(req);
                }
            }); //end $.ajax
        }); // end click

        $("#lightitem").click(function(e) {
            $.ajax({
                /** ajax 기본 옵션 */
                cache: false, // 캐쉬 사용 금지 처리
                url: 'assets/api/lightitem.html', // 읽어들일 파일의 경로
                method: 'get', // 통신방법 (get(기본값), post)
                data: {}, // 접속대상에게 전달할 파라미터
                dataType: 'html', // 읽어올 내용 형식 (html,xml,json)
                timeout: 30000, // 타임아웃 (30초)

                // 읽어온 내용을 처리하기 위한 함수
                success: function(req) {
                    //result에 이미 존재 하는 갤러리 삭제
                    $("#result").empty();
                    // 준비된 요소에게 읽어온 내용을 출력한다.
                    $("#result").append(req);
                }
            }); //end $.ajax
        }); // end click

        $("#more").click(function() {
            $("#more").hide(200);
            $("#kitchenitem").show(200);
            $("#sofaitem").show(200);
            $("#acceptitem").show(200);
            $("#lightitem").show(200);
            $("#mytab").css('width', '460px');
        }); // end #mybutton click


        $(document).on("change", ".heart", function() {
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


        // 1개 상품만 장바구니로 옮기기
        $(document).on("click", ".home_cartloc", function() {
            let current = $(this);
            let userno = current.data('userno');
            let prodno = current.data('prodno');

            $.post("${pageContext.request.contextPath}/06_cart/cart", {
                "userno": userno,
                "prodno": prodno,
            }, function(json) {
                if (json.rt == "OK")
                    alert("상품이 장바구니에 추가 되었습니다.");
                location.reload(); // 장바구니로 이동 수정 예
            })
        });
        
     // 1개 상품만 장바구니로 옮기기
        $(document).on("click", ".home_product_listwrap_ul_li_div_span", function() {
        	let current = $(this);
            let userno = current.data('userno');
            let prodno = current.data('prodno');
            
            if(userno == 0){
            	alert("로그인을 먼저 해주세요.");
            }else{
            	$.post("${pageContext.request.contextPath}/06_cart/cart", {
                    "userno": userno,
                    "prodno": prodno,
                }, function(json) {
                    if (json.rt == "OK")
                        alert("상품이 장바구니에 추가 되었습니다.");
                    location.reload(); // 장바구니로 이동 수정 예
                })
            }
        });
    });
    </script>
</body>

</html>