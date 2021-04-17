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

<!-- font stylesheet -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
	rel="stylesheet">

<!-- stylesheet -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/dist/css/metallic/zebra_datepicker.css" type="text/css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/cart.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/purchase.css">


<!-- javascript -->
<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<!-- ajax-helper -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.css" />
<script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>


</head>

<body>
	<%@ include file="../01_home/header.jsp"%>
	<section>
	<%@ include file="../01_home/search.jsp"%>
	<div id="purchase">
		<form id='purchase-form'
			action='${pageContext.request.contextPath}/07_purchase'>
			<input type="hidden" name="userno" value="${u_output.userno}"/>
		<!-- 주문 정보 시작 -->
		<div class="purchase_detail">
			<div class="cart_item">
				<h4>주문 정보</h4>
				<a class="product_revise"
					href="${pageContext.request.contextPath}/06_cart/cartlist.do?userno=<%out.print(session.getAttribute("my_session"));%>">수정</a>

				<c:set var="sum" value="0" />
				<c:forEach var="item" items="${output}" varStatus= "status">

				<input type="hidden" name="cartno[]" value="${item.cartno}" />
				<br /> <img class="cart_item_img" src="${item.thumbnailUrl}"></img>
					<span class="cart_item_title">${item.pname}</span> <br /> <span
						class="cart_item_info">${item.color}, ${item.size}</span> <span
						class="cart_item_num">${item.prodno}</span>
						<div class= "cart_item_1ea"> 수량 : ${item.ea}</div>
						<br />
						<div class= "cart_item_price">
						가격 : &#8361; <fmt:formatNumber value="${item.price}" pattern="#,###" />
					</div>
					<c:set var="sum" value="${sum + (item.ea * item.price)}" />

				</c:forEach>

			</div>
			<br />

			<div class="purchase_msg clearfix">
				<span id="info_icon">정보</span> 이 금액에는 배송비가 포함되어 있지 않으며, 배송지에 따라 구매가
				불가 할 수 있습니다.
			</div>
			<hr class="clearfix">

			<div class="purchase_total_price">
				<p>총 주문 금액</p>
				<span class="cart_item_price">
				&#8361;
				<fmt:formatNumber
							value="${sum}" pattern="#,###" />
				
				</span>
			</div>

			<hr class="clearfix">
		</div>
		<!-- 주문 정보 끝 -->

		<!-- 우편번호 조회 시작 -->
		<div class="purchase_postcode step_line">
			<h3 class="step_label">1</h3>
			<h3>기본배송지</h3>
			<hr />
			<h4 class="user_addrinfo">주소</h4> <p class="user_addrinfo_data">${u_output.addr1}</p>
			<h4 class="user_addrinfo">상세주소</h4> <p class= "user_addrinfo_data">${u_output.addr2}</p>
			<h4 class="user_addrinfo">우편번호</h4> <p class="user_addrinfo_data">${u_output.postcode}</p>
			<hr />
			
			<p class="step_text">새로운 배송지를 입력하시려면</p>
			<p class="step_text">아래 우편번호 찾기 버튼을 눌러주세요.</p>

			<button id="find_pc">우편번호 찾기</button>

			<div id="daum_pc_find"></div>
			<button id="find_pc_save" class="purchase_btn">다음</button>
		</div>
		<!-- 우편번호 조회 끝 -->

		<!-- 배송방법 선택 시작 -->
			<div id="purchase_del_type" class="step_line">
				<div class="delivery_pc_add">
					<span class="loc_icon">위치표시</span>
					<a id="pc_revise" class="product_revise" href="#">수정</a>
					<div id="pc_address_input"><p>${u_output.addr1}</p></div>
				</div>

				<div class="delivery_type_select clearfix">
					<span id="delivery_icon">배송아이콘</span>
					<p>배송</p>

					<div id="delivery_type_select_li">
						<input type="radio" name="deltypeno"
							class="delivery_type  clearfix" id="normal_del" value="1"
							 /> <label for="normal_del">일반배송</label> <span
							class="delivery_price">&#8361; 5,000 </span>
						<input type="radio"
							name="deltypeno" class="delivery_type clearfix" id="truck_del"
							value="2" /> <label for="truck_del">트럭배송</label> <span
							class="delivery_price">&#8361; 30,000 </span>
					</div>

					<br /> <br class="clearfix" />
					<p>배송 예정일</p>
					<span class="est_delivery_date" id="est_delivery_date_input"></span>
				</div>
				<hr>

				<div class="del_service_cost">
					<span>전체 서비스 비용</span> <span id="selected_delivery"
						class="delivery_price"></span>
				</div>

				<button id="next_step" class="purchase_btn">다음</button>

			</div>
			<!-- 배송방법 선택 끝 -->

			<!-- 배송 요약 정보 -->
			<div id="mydelinfo_summary" class="step_line">
				<h4>배송정보</h4>
				<a id="del_revise" class="product_revise" href="#">수정</a> <span>일반
					배송(택배는 아래 선택한 배송 날짜로 부터 3-5일 소요되며, 제품 특성에 따라 2박스 이상으로 분리배송 될 수
					있습니다.</span>
				<ul class="my_del_summary_li clearfix">
					<span class="loc_icon">위치아이콘</span>
					<li id="pc_address_input1"><p>${u_output.addr1}</p></li>
				</ul>


				<ul class="my_del_summary_li clearfix">
					<span class="cal_icon">달력아이콘</span>
					<li id="date_input"><p>2020.12.30 09:00-13:00</p></li>
				</ul>

			</div>



			<!-- 구매-배송지입력 시작 -->
			<div class="purchase_delivery step_line">

				<div id="step_sec">
					<h3 class="step_label">2</h3>
					<p class="step_text">배송지 정보를 입력해주세요.</p>
				</div>

				<div id="purchase_delivery_first" class="purchase_delivery_first1">

					<li class="delivery_address_li">
						<p>이름</p>
						<input type="text" id="delivery_name" name="name" value="${u_output.name}"
 						class="delivery_address">
					</li>

					<li class="delivery_address_li">
						<p>이메일</p>
						<input type="text" id="delivery_email" name="email" value="${u_output.email}"
						class="delivery_address">
					</li>

					<li class="delivery_address_li">
						<p>전화번호(국가번호없이 전화번호 11자리만 입력해주세요.예:01012345678)</p> <input
						type="text" id="delivery_phone" class="delivery_address" name="phoneno" value="${u_output.phoneno}"
						onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
					</li>

					<li class="delivery_address_li">
						<p>주소(한국어 주소만 가능/Please write in Korean only)</p> <input
						type="text" id="delivery_address01" class="delivery_address"
						name= "addr1" value="${u_output.addr1}"
						readonly>
					</li>

					<li class="delivery_address_li">
						<p>상세주소</p>
						<input type="text" id="delivery_address02"
						class="delivery_address" name="addr2" value="${u_output.addr2}" readonly>
						<input type="hidden" name="postcode" value="${u_output.postcode}">
					</li>

					<button id="purchase_con" class="purchase_btn">계속</button>
				</div>




				<div id="purchase_delivery_sec">
					<p>배송지 유형은 어떻게 되나요?</p>
					<li class="delivery_type_li">
					<input type="radio"
						name="loctype" value="A" class="purchase_type select"><span>아파트</span>
					</li> <br />
					<li class="delivery_type_li"><input type="radio"
						name="loctype" value="O" class="purchase_type select"><span>사무실</span>
					</li> <br />
					<li class="delivery_type_li"><input type="radio"
						name="loctype" value="H" class="purchase_type select"><span>단독주택</span>
					</li>

					<p>엘레베이터 없이 호수 기준으로 4층 이상으로 배송시 사다리차가 필요합니다. 사다리차가 서비스(9만원)가
						필요한가요?</p>
					<li class="delivery_type_li">
					<input type="radio"
						name="servicetype" value="N" class="purcahse_type select"><span>아니요</span>
					</li> <br />
					<li class="delivery_type_li"><input type="radio"
						name="servicetype" value="Y" class="purcahse_type select"><span>네</span>
					</li> <br />

					<p>배송기사님이 배송 전 꼭 알아야 하는 정보가 있나요?(예:주차제한, 출입 가능 시간 제한 등)</p>
					<p>자세한 내용을 알려주세요.</p>
					<input type="text" name="request" class="purchase_type detail_text"> <br />

					<p>배송 중 제품이 안전하게 옮겨질 수 있도록 계단 및 복도의 폭이 150cm 이상이거나 현관문의 폭이 90cm
						이상인가요?</p>
					<li class="delivery_type_li">
					<input type="radio"
						name="sizelimit" value="N" class="purcahse_type select"><span>아니요</span>
					</li> <br />
					<li class="delivery_type_li"><input type="radio"
						name="sizelimit" value="NA" class="purcahse_type select"><span>해당
							없음</span></li> <br />
					<li class="delivery_type_li"><input type="radio"
						name="sizelimit" value="N" class="purcahse_type select"><span>네</span>
					</li> <br />
					<button id="purchase_save" class="purchase_btn">답변
						저장하기</button>
				</div>


				<div id="purchase_delivery_third">
					<div id="step_sec">
						<h3 class="step_label">2</h3>
						<p class="step_text">배송일 정보를 입력해주세요.</p>
					</div>

					<div class="purchase_calendar">
						<span id="delivery_icon2">트럭아이콘</span>
						<h4>배송</h4>
						<br />

						<li class="purchase_service_cost">
							<p class="delivery_final_type"></p>
							<p>배송: 4-10일</p> <span class="delivery_price_1 clearfix">&#8361;
								</span>
						<hr>
						</li> <br /> <span class="est_delivery_date_title">희망 배송일</span> 
						<div id="container"
							style="margin: 10px 0 15px 0; height: 255px; position: relative"></div>
						<input id="datepicker-always-visible" type="text"
							class="form-control" data-zdp_readonly_element="false" name="deldate"
							placeholder="캘린더에서 날짜를 선택하세요."> <br />
					<!-- 	<li class="delivery_time_li"><input type="radio"
							name="delivery_time" class="delivery_time select"><span>13:00-17:00</span>
						</li>
						<li class=delivery_time_li><input type="radio"
							name="delivery_time" class="delivery_time select"><span>17:00-21:00</span>
						</li> -->

					</div>
					<hr>
					<div class="purchase_summary">
						<li class="purchase_total_cost"><span>전체 서비스 비용</span> <span
							class="delivery_final_price"></span> <span class="price_won">&#8361;</span>
						</li>
						<hr>
						<li class="purchase_total_cost"><span>주문 금액</span> <span
							class="purchase_final_price"><fmt:formatNumber
							value="${sum}" pattern="#,###" />
							</span> <span class="price_won">&#8361;</span>
						</li>
						<li class="purchase_total_cost">
							<hr> <span>쿠폰 / 적립금</span> <label
							class="purchase_summary_coupon">보너스 쿠폰</label>
							<select id="coupon_select" name="usrcouponno">
							<c:choose>
								<c:when test="${coupon.usrcouponno == 0}">
								<option>보유한 쿠폰이 없습니다. </option>
								</c:when>
								<c:otherwise>
								<option value="0">쿠폰을 선택 해주세요.</option>
								<c:forEach var = "coupon" items="${uc_output}" varStatus="status">
								<option id="join_coupon" value="${coupon.usrcouponno}">
								${coupon.name}/${coupon.discount} 
								<c:if test="${coupon.distype== 'P'}">%</c:if>
								<c:if test="${coupon.distype== 'W'}">원</c:if>
								</option>
								
								</c:forEach>
								</c:otherwise>
							</c:choose>
						</select>
						<label class="purchase_summary_point">적립금</label>
							<input id="point_input" name="point" type="text" value="0">
							<button class="point_useall">사용하기</button>
							<button type="reset" class="point_reset">다시입력하기</button>
							<p class="point_left">적립 마일리지</p>
							<p class="point_left" id="user_point">${u_output.point}p</p>
							<p class="point_info">-할인쿠폰 제외 상품이 포함되어 있는 경우, 해당 제품을 제외하고
								할인이 적용됩니다</p>
							<p class="point_info">-쿠폰에 따라 최대 쿠폰 사용 금액이 제한될 수 있습니다.</p>
							<hr> <span>총 결제 금액</span> <span id="delandpur_final_price"></span>
							<span class="price_won">&#8361;</span>

						</li>
						<hr>
					</div>

					<button id="purchase_next" class="purchase_btn">다음</button>

				</div>
			</div>


			<div id="myinfo_summary" class="step_line">
				<h4>나의 세부 정보</h4>
				<a id="myinfo_revise" class="product_revise" href="#">수정</a>
				<li class="my_summary_li clearfix"><span id="my_icon">사람아이콘</span>
					<span id="customer_name"></span></li>

				<li class="my_summary_li clearfix"><span id="email_icon">이메일아이콘</span>
					<span id="customer_email"></span></li>

				<li class="my_summary_li clearfix"><span id="phone_icon">전화아이콘</span>
					<span id="customer_phone"></span></li>

				<li class="my_summary_li clearfix"><span class="loc_icon">위치아이콘</span>
					<span id="customer_address"></span></li>


			</div>

			<div class="purchase_payment step_line">
				<h3 class="step_label">3</h3>
				<p class="step_text">어떤 방법으로 결제하시겠어요?</p>

				<div class="payment_type_btn">
					<input type="button" id="pay_card" value="신용/체크카드" />
					<input type="button" id="pay_remit" value="무통장입금(가상계좌)" />
					<input type="button" id="pay_mobile" value="휴대폰결제" />
					<input type="button" id="pay_remit_d" value="실시간계좌이체" />
					<input type="text" name="paytype" id="paytype" class="input_hidden" />
				</div>
			</div>
			<input type="text" id="final_total_price" name="totalprice" class="input_hidden">
			<button type="submit" id="pur_finish_btn">결제완료</button>
		</form>


	</div>
	</section>
	<%@ include file="../01_home/footer.jsp"%>

	<script src="${pageContext.request.contextPath}/assets/js/home.js"></script>

	<!--Google CDN 서버로부터 jQuery 참조 -->
    <!-- jQuery Ajax Form plugin CDN -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
    <!-- jQuery Ajax Setup -->
    <script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>

	<script type="text/javascript">
$(document).ready(function() {

    //구매 첫번째를 제외한 단계 숨기기
    $('#purchase_del_type').hide()
	$('#purchase_delivery_first').hide()
    $('#purchase_delivery_sec').hide()
    $('#purchase_delivery_third').hide()
    $('#mydelinfo_summary').hide()
    $('#myinfo_summary').hide()
    $('.payment_type_btn').hide()
    $('#pur_finish_btn').hide()
   

	//달력 불러오기
	$('#datepicker-always-visible').Zebra_DatePicker({
        always_visible: $('#container'),
        direction: [4,14],
        disabled_dates: ['* * * 0']
    });
});

$(function(){
    
//불러온 우편번호 및 주소 저장
  $('#find_pc_save').click(function(e){
      e.preventDefault();

      var pcAddr= $("#sample3_address").val();
      var p = $("<p>");
      p.html(pcAddr);

      var pcAddr1= $("#sample3_address").val();
      var p1 = $("<p>");
      p1.html(pcAddr1);

      var pcAddrDetail = $("#sample3_detailAddress").val();

      if(pcAddr && pcAddrDetail){
      $("#pc_address_input").html(p);
      $("#pc_address_input1").html(p1);
      $("#delivery_address01").val(pcAddr);
      $("#delivery_address02").val(pcAddrDetail);
      $('.purchase_postcode').hide();
  	}
      $('#purchase_del_type').show();
      
      //배송 예상 날짜 계산하기 , 오늘 날짜 +5
      var date= new Date();
      date.setDate(date.getDate()+5);

      var yy= date.getFullYear() ;
      var mm= date.getMonth()+1;
      var dd=date.getDate();

      //배송 유형 선택 단계에 예상 날짜 전달
      var estDelDate = yy + "." + ("0" + mm).slice(-2)+ "."
      + ("0" + dd).slice(-2);
      var p = $("<p>");
      p.html(estDelDate);
      $('.est_delivery_date').html(p);

      //배송 날짜 배송 정보 요약 단계로 전달
      var estDelDate1 = yy + "." + ("0" + mm).slice(-2)+ "."
      + ("0" + dd).slice(-2);
      var p1 = $("<p>");
      p1.html(estDelDate1);
      $('#date_input').html(p1);
      
  });

    //우편번호 찾기
    $('#find_pc').click(function(e){
        e.preventDefault();
        //다음 API 불러오기
        $.ajax({
		url: '${pageContext.request.contextPath}/07_purchase/daum_pc_find',
		type : 'post',
		dataType : 'text',
		success : function(data){

		//통신이 성공했을 떄 실행되는 함수.
        $("#daum_pc_find").empty();
        // 준비된 요소에게 읽어온 내용을 출력한다.
        $("#daum_pc_find").html(data);
        $("#find_pc").hide()
					}
				});
    });

    //배송 선택 단계에서 수정 클릭 시
    $('#pc_revise').click(function(e){
        e.preventDefault();
        //배송 선택 단계 숨기기
        $('#purchase_del_type').hide()
        //우편번호 찾기 보이기
        $('.purchase_postcode').show()
    });

    //배송 선택 시
    $('.delivery_type').change(function(e){
        e.preventDefault();
        var deliveryType = $("input[name='deltypeno']:checked").val();

        //일반배송 선택 시
        if(deliveryType == "1"){
            //배송정보가 필요한 단계에 배송 정보 전달
            $('#selected_delivery').html("&#8361; 5,000");
            $('.delivery_final_type').html("일반배송");
            $('.delivery_price_1').html("5,000");
            $('.delivery_final_price').html("5,000");

        }

        //트럭배송 선택 시
        else if(deliveryType == "2"){
            //배송정보가 필요한 단계에 배송 정보 전달
            $('#selected_delivery').html("&#8361; 30,000");
            $('.delivery_final_type').html("트럭배송");
            $('.delivery_price_1').html("30,000");
            $('.delivery_final_price').html("30,000");
        }
        
     

        /* 선택한 배송비와 함께 총 금액 계산하기 */
        var delFprice = $('.delivery_final_price').html();
        var purFprice = $('.purchase_final_price').html();
       	delFprice = noComma(delFprice);
        purFprice = noComma(purFprice);
        var delandpurPrice = parseInt(delFprice) + parseInt(purFprice);
    	var delandpurFprice = addComma(delandpurPrice);
        
        $('#final_total_price').val(delandpurPrice);
        $('#delandpur_final_price').html(delandpurFprice);
        
    });


    //배송 선택 단계 다음버튼 클릭 시
    $('#next_step').click(function(e){
    	var deliveryType = $("input[name='deltypeno']:checked").val();
    	
    	   if(!deliveryType){
           	alert("배송유형을 선택해주세요.");
           	return false;
           }
    	   
    	  //총 결제 금액 = 장바구니 총 금액 + 배송비 
        e.preventDefault();
        $('#purchase_del_type').hide()
        $('#purchase_delivery_first').show()
        $('#mydelinfo_summary').show()

        });


     //배송정보 요약에서 수정 클릭 시
     $('#del_revise').click(function(e){
        e.preventDefault();
        //배송 요약 단계 숨기기
        $('#mydelinfo_summary').hide()
        //우편번호 찾기 보이기
        $('.purchase_postcode').show()
    });

    //배송지 정보 입력 후 ->입력값 나의 세부 정보로 넘어감
    $('#purchase_con').click(function(e){
        e.preventDefault();
        var delName= $('#delivery_name').val();
        var delEmail= $('#delivery_email').val();
        var delPhoneNo = $('#delivery_phone').val();
        var delHomeAddress= $('#delivery_address01').val();


        if(!delName){
            alert('이름을 입력 해주세요.');
            $('#delivery_name').focus();
            return false;
        }

        if(!delEmail){
            alert('이메일을 입력 해주세요.');
            $('#delivery_emiail').focus();
            return false;
        }


        if(!delPhoneNo){
            alert('핸드폰 번호를 입력 해주세요.');
            $('#delivery_phone').focus();
            return false;
        }

        var NameP = $("<p>");
        NameP.html(delName);

        var emailP = $("<p>");
        emailP.html(delEmail);

        var phoneP = $("<p>");
        phoneP.html(delPhoneNo);

        var addressP = $("<p>");
        addressP.html(delHomeAddress);

        $('#customer_name').html(NameP);
        $('#customer_email').html(emailP);
        $('#customer_phone').html(phoneP);
        $('#customer_address').html(addressP);

        $('#purchase_delivery_first').hide()
        $('#purchase_delivery_first').next().show()
    });

    //배송지 유형의 질문을 선택하지 않았을때, alert 창이 뜨도록 설정
    $('#purchase_save').click(function(e){
        e.preventDefault();
        
        var builType = $("input[name='loctype']:checked").val();
        if(!builType){
            alert('배송지 유형을 선택해주세요.');
            return false;
        }
        var serviceAdd = $("input[name='servicetype']:checked").val();
        if(!serviceAdd){
            alert('사다리차 서비스 필요 여부를 선택해주세요.');
            return false;
        }

        var sizeLimit = $("input[name='sizelimit']:checked").val();
        if(!sizeLimit){
            alert('계단 및 복도의 폭에 대한 정보를 선택해주세요.');
            return false;
        }

     $('#purchase_delivery_sec').hide()
     $('#step_sec').hide()
     $('#purchase_delivery_sec').next().show()

    });

    //배송일과 시간 선택하지 않았을 때, alert창이 뜨도록 설정
    $('#purchase_next').click(function(e){
         e.preventDefault();

         var datePick = $("#datepicker-always-visible").val();
         if(!datePick){
             alert('배송일을 선택해주세요.');
             return false;
         }

        $('#purchase_delivery_third').hide()
        $('.purchase_delivery').hide()
        $('#myinfo_summary').show()
        $('.payment_type_btn').show()
        $('#pur_finish_btn').show()

    });
    
    //쿠폰선택 시 총 결제 금액에 적용
    $('#coupon_select').change(function(e){
    	
    	 var delFprice = $('.delivery_final_price').html();
         var purFprice = $('.purchase_final_price').html();
        	delFprice = noComma(delFprice);
         purFprice = noComma(purFprice);
         var delandpurPrice = parseInt(delFprice) + parseInt(purFprice);
     	var delandpurFprice = addComma(delandpurPrice);
         
         $('#delandpur_final_price').html(delandpurFprice);
         
        e.preventDefault();
        var couponSelect = $('#coupon_select > option:selected').html();
        var discountAmount = couponSelect.indexOf("/");
        var discount = couponSelect.substring(discountAmount+1);
        var discountType = discount.substring(discount.length-1, discount.length);
        

        // 쿠폰 금액의 단위가 '원'일 떄,
        if(discountType == "원"){
        	var discountWon = discount.substring(0, discount.length-1);
        	var totalFprice = delandpurPrice - parseInt(discountWon);
        	totalFprice = addComma(totalFprice);
        
       // 쿠폰 금액의 단위가 '퍼센트' 일 때,
        }else if(discountType == "%"){
            var discountPer = discount.substring(0, discount.length-1);
            var totalFprice = delandpurPrice * (100-parseInt(discountPer))/100;
            console.log(totalFprice);
        	totalFprice = addComma(totalFprice);
          
        }else{
        	var delFprice = $('.delivery_final_price').html();
            var purFprice = $('.purchase_final_price').html();
            
         	//입력한 적립금
            var pointInput = $('#point_input').val();
            pointInput = parseInt(pointInput);
            
           	delFprice = noComma(delFprice);
            purFprice = noComma(purFprice);
            var delandpurPrice = parseInt(delFprice) + parseInt(purFprice) - pointInput;
            
        	var totalFprice = addComma(delandpurPrice);
   
        }
        
        $('#delandpur_final_price').html(totalFprice);
        $('#final_total_price').val(delandpurPrice);

  
    });

    /* 적립금 사용 하기 */
    var count = 0;
    var count_reset = 0;
   	
    //적립금 사용 시 총 결제 금액에 적용
    $('.point_useall').click(function(e){
        e.preventDefault();
        
    	// 사용할 적립금 입력
        var pointInput = $('#point_input').val();
        pointInput = parseInt(pointInput);
        var delandpurFprice = $('#delandpur_final_price').html();
        delandpurFprice = noComma(delandpurFprice);
        
		// 사용자가 보유한 포인트
        var userPoint = $('#user_point').html();
        userPoint = userPoint.substring(0, userPoint.length-1);
        
        //입력한 포인트 사용하여 총 결제 금액에서 차감하기
        delandpurFprice = parseInt(delandpurFprice) - pointInput;
        delandpurFprice1 = addComma(delandpurFprice)
        var usedPoint = parseInt(userPoint) - pointInput;
        
        count++;
       
        if(usedPoint < 0){
        	alert("보유한 포인트가 모자랍니다. 사용하실 포인트를 다시 입력 해주세요.");
        	$('#point_input').val("0");
        	return false;
        }
        
        if(count > 1){
        	count = 0;
        	return false;
        }
        
		 $('#user_point').html(usedPoint + "p");
		 $('#point_input').prop("readonly", true);
         $('#delandpur_final_price').html(delandpurFprice1);
         $('#final_total_price').val(delandpurFprice);
    });
    
    //적립금 다시 입력 클릭 시
    $('.point_reset').click(function(e){
   		e.preventDefault();

   		// 사용할 적립금 입력
        var pointInput_re = $('#point_input').val();
        var pointDiscount_re = parseInt(pointInput_re);
        var delandpurFprice_re = $('#delandpur_final_price').html();
        delandpurFprice_re = noComma(delandpurFprice_re);
        delandpurFprice_re = parseInt(delandpurFprice_re) + pointDiscount_re;
        delandpurFprice_re1 = addComma(delandpurFprice_re);
        
		// 사용자가 보유한 포인트
        var userPoint_re = $('#user_point').html();
        var userPointSub_re = userPoint_re.substring(0, userPoint_re.length-1);
        console.log(userPointSub_re);
       	var userPointPar_re = parseInt(userPointSub_re);
        var userPointReset = userPointPar_re + pointDiscount_re;
        count_reset++
        
        if(count_reset > 1){
        	count_reset = 0;
        	return false;
        }
        
        $('#user_point').html(userPointReset + "p");
		 $('#point_input').val("0").prop("readonly", false);
        $('#delandpur_final_price').html(delandpurFprice_re1);
        $('#final_total_price').val(delandpurFprice_re);
   		
   	
    });

     //나의 세부 정보 수정 클릭 시
        $('#myinfo_revise').click(function(e){
            e.preventDefault();
            //나의 세부 정보 숨기기
            $('#myinfo_summary').hide()
            //배송지 정보 입력 단계로 이동
            $('.purchase_delivery').show()
            $('#step_sec').show()
            $('#purchase_delivery_first').show()

        });
     
     //신용/체크카드 버튼 클릭 시
     $('#pay_card').click(function(e){
    	e.preventDefault(); 
    	$('#paytype').val("C");
     });

     //무통장입금(가상계좌) 버튼 클릭 시
     $('#pay_remit').click(function(e){
    	e.preventDefault(); 
    	$('#paytype').val("D");
     });
     
   //휴대폰 결제 버튼 클릭 시
     $('#pay_mobile').click(function(e){
    	e.preventDefault(); 
    	$('#paytype').val("M");
     });
   
   //휴대폰 결제 버튼 클릭 시
     $('#pay_remit_d').click(function(e){
    	e.preventDefault(); 
    	$('#paytype').val("D2");
     });
   
   
   //가격에서 콤마 제거
   function noComma(value){
	   value = value.replace(/[^\d]+/g, "");
	   return value;
   }
   
   //가격에서 콤마 추가
   function addComma(value){
       value = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
       return value; 
   }
     
     //#purchase-form에 대한 submit 이벤트를 가로채서 Ajax요청을 전송한다.
     $("#purchase-form").ajaxForm({
    	 //전송 메서드 지정
    	 method : "POST",
    	 //서버에서 200 응답을 전달한 경우 실행됨
    	 success: function(json) {
    		 console.log(json);

    		 //json 결과가 OK 일 시 마이페이지로 이동한다.
    		 if(json.rt == "OK"){
    			 alert("구매가 완료되었습니다.");
    			 window.location = "${pageContext.request.contextPath}/home.do";
    		 }
    	 }
    });
});



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
	<script src="${pageContext.request.contextPath}/assets/dist/zebra_datepicker.src.js"></script>

</body>
</html>