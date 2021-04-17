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
		<link rel="stylesheet" href="../assets/plugins/sweetalert/sweetalert2.min.css"/>
	    <link rel="stylesheet" type="text/css" href="../assets/css/common.css">
	    <link rel="stylesheet" type="text/css" href="../assets/css/order.css">
	    <!-- <link rel="stylesheet" type="text/css" href="../assets/css/order_return.css"> -->
	
	<!-- javascript -->
	    <script src="http://code.jquery.com/jquery.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	
	<!-- ajax-helper -->
	    <link rel="stylesheet" href="../assets/plugins/ajax/ajax_helper.css" />
	    <script src="../assets/plugins/ajax/ajax_helper.js"></script>
	</head>

	<body>
		<%@ include file="../01_home/header.jsp" %>
		<section>
			<!-- 검색 -->
	        <%@ include file="../01_home/search.jsp"%>
			
			<!-- 탭 전체 박스 -->
			<div class="order_tab">
				<!-- 탭 버튼 영역 -->
				<ul class="order_tab_button clearfix">
					<li class="order_tab_item">
						<a class="order_tab_itemlink selected" id="order_tab_link01" href="#">처리중 주문</a>
					</li>
					<li class="order_tab_item">
						<a class="order_tab_itemlink" id="order_tab_link02" href="#">지난 주문</a>
					</li>
				</ul>
			</div>
			
			<!-- 공통 -->
			<div class="container">
				<!-- 처리중 주문 -->
				<div id="order_tab_page01">
					<c:choose>
						<c:when test="${output == null || fn:length(output) == 0}">
							<div>
								<div class="order_tab_pagenone">
									<p class="order_none_title">현재 진행중인 주문이 없습니다.</p>
								</div>
							</div>
							<div class="order_none">
								<span id="order_search_icon"></span>
								<div>
									<p><b>찾는 주문 내역이 없으신가요?</b></p>
									<p>매장에서 주문하신 경우, 여기서 주문내역을 확인할 수 있습니다.
										<a href="#" class="orderfna_link">주문 내역 확인</a>
									</p>
								</div>
								<div class="order_blank">
									<p>찾는 주문 내역이 없으신가요?
										<a href="${pageContext.request.contextPath}/09_cs/csmain.do" class="orderfna_link">고객지원센터</a> 로 문의해 주세요.
									</p>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach var="item" items="${output }" varStatus="status">
								<c:if test="${item.delistatus='N' || item.ccstatus=='I' || deliveryOutput[status.index].deliverystatus!='C'}" >
									<!-- 주문 목록 -->
									<div class="order_page01">
										<p>
											주문 번호 - 
											<span class="order_orderno">${item.orderno }</span><br/>
											주문 날짜 - 
											<span class="order_date">
				                               	<fmt:parseDate value="${item.regdate}" var="regdate" pattern="yyyy-MM-dd" />
				                               	<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" />
											</span><br/>
											현황 - 
											<span class="order_condition">
												<c:if test="${item.orderstatus=='N' }">
													일반주문
												</c:if>
												<c:if test="${item.orderstatus=='CC' }">
													취소
												</c:if>
												<c:if test="${item.orderstatus=='CH' }">
													교환
												</c:if>
												<c:if test="${item.orderstatus=='RT' }">
													반품
												</c:if>
												<c:if test="${item.orderstatus=='RF' }">
													환불
												</c:if>
										   </span>
										</p>
										<a class="order_link" href="#">주문 내역 보기</a>
										<hr/>
									</div>
									
									<!-- 주문내역 -->
									<div class="order_list">
									    <div>
									        <div class="order_info01">
									            <h3>주문 내역</h3>
									            <p>주문 번호 : <span class="order_orderno">${item.orderno }</span></p>
									        </div>
									    </div>
									    <hr/>
									    <div class="order_info02">
									        <p>
									            <b>주문 날짜</b><br/>
									            <span class="order_date">
									            	<fmt:parseDate value="${item.regdate}" var="regdate" pattern="yyyy-MM-dd" />
					                              		<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" />
								            	</span><br/>
									            <b>주문 번호</b><br/>
									            <span class="order_orderno">${item.orderno }</span><br/>
									            <b>최종 결제 금액</b><br/>
									            &#8361; <span class="order_totalprice"><fmt:formatNumber pattern="###,###,###" value='${item.totalprice }'/></span><br/>
									            <b>결제 현황</b><br/>
									            <span>
													<c:if test="${item.paystatus=='N' }">
                                                   		결제전
                                                   	</c:if>
                                                   	<c:if test="${item.paystatus=='Y' }">
                                                   		결제완료
                                                   	</c:if>
                                               	</span>
									        </p>
									        <div>
									            <span id="order_icon"></span>
									            <a class="order_return" href="#">주문취소</a>
									        </div>
									    </div>
									    <hr/>
									    <div class="order_info03">
									        <div class="order_line">
									            <p><b>택배 배송 제품</b></p>
									            <a href="#"><b><span class="order_delivery_product">+</span></b></a>
									        </div>
									        <div class="order_hidden">
									            <form class="order_itemlist">
									                <img class="order_item_img" src="${item.thumbnailUrl}">
									                <div class="order_item">
									                    <span class="order_item_title"><a href="${pageContext.request.contextPath}/03_detail/detail.do?prodno=${item.prodno }">${item.pname }</a></span><br/>
									                    <span class="order_item_info">${item.color }, ${item.size }</span><br/>
									                    <span class="order_item_productno">${item.prodno }</span><br/>
									                    <span class="order_item_price">
									                    	&#8361; <span class="order_totalprice"><fmt:formatNumber pattern="###,###,###" value='${item.price * item.ea }'/></span>
									                    </span>
									                </div>
									            </form>
									        </div>
									        <div class="order_userinfo">
									            <p>
									            	<b>배송예약 날짜</b><br/>
									            	<span>
									            		<fmt:parseDate value="${item.deldate}" var="deldate" pattern="yyyy-MM-dd" />
                                                    	<fmt:formatDate value="${deldate }" pattern="yyyy-MM-dd" />
									            	</span><br/>
									            	<b>배송 현황</b><br/>
									            	<span>
									            		<c:choose>
	                                                    	<c:when test="${deliveryOutput[status.index].deliverystatus=='N' }">
	                                                    		결제 확인 중
	                                                    	</c:when>
	                                                    	<c:when test="${deliveryOutput[status.index].deliverystatus=='R' }">
	                                                    		준비중
	                                                    	</c:when>
	                                                    	<c:when test="${deliveryOutput[status.index].deliverystatus=='S' }">
	                                                    		배송대기
	                                                    	</c:when>
	                                                    	<c:when test="${deliveryOutput[status.index].deliverystatus=='D' }">
	                                                    		배송중
	                                                    	</c:when>
	                                                    	<c:when test="${deliveryOutput[status.index].deliverystatus=='C' }">
	                                                    		배송완료
	                                                    	</c:when>
	                                                    	<c:otherwise>
	                                                    		관리자 확인 전
	                                                    	</c:otherwise>
                                                    	</c:choose>
									            	</span><br/>
									                <b>주소</b><br/>
									                <span>${item.name }</span><br/>
									                <span>${item.addr1 } ${item.addr2 }</span><br/>
									                <span>${item.email }</span><br/>
									            </p>
									        </div>
									    </div>
									    <hr/>
									    <div>
									        <p><b>결제 방법</b><br/>
									        <span class="order_payment">
									        	<c:if test="${item.paytype=='C'}">
						                       		신용카드
						                       	</c:if>
						                       	<c:if test="${item.paytype=='D'}">
					                       			무통장입금
					                      		</c:if>
					                      		<c:if test="${item.paytype=='M'}">
					                       			휴대폰결제
					                      		</c:if>
					                      		<c:if test="${item.paytype=='D2'}">
					                       			실시간계좌이체
					                      		</c:if>
									        </span>
									    </div>
									    <hr/>
									    <div>
									        <div>
									            <span>
									                <b>총 주문금액</b>
									            </span>
									            <span class="pull_right">
									                <b><span class="order_price">
						                					&#8361; <span class="order_totalprice"><fmt:formatNumber pattern="###,###,###" value='${item.price * item.ea }'/></span>
					                				   </span>
				                				   </b>
									            </span>
									        </div>
									        <br/>
									        <div>
									            <span>
									                배송비
									            </span>
									            <span class="pull_right">+ &#8361; 
									            	<span class="order_deliveryprice">
							               				<c:if test="${item.deltypeno == 1 }">
							               					<fmt:formatNumber pattern="###,###,###" value='5000'/>
							               				</c:if>
							               				<c:if test="${item.deltypeno == 2 }">
							               					<fmt:formatNumber pattern="###,###,###" value='30000'/>
							               				</c:if>
							               			</span>
									            </span>
									            <br/>
									            <span>
									                쿠폰할인
									            </span>
									            <span class="pull_right">
									            	<span class="order_deliveryprice">- &#8361; 
									            		<c:choose>
										            		<c:when test="${item.distype=='P'}">
								                       			<fmt:formatNumber pattern="###,###,###" value='${(item.price * item.ea) * (item.discount * 1/100) }'/>
									                       	</c:when>
									                       	<c:when test="${item.distype=='W'}">
								                       			<fmt:formatNumber pattern="###,###,###" value='${item.discount }'/>
								                      		</c:when>
								                      		<c:otherwise>
								                      			0
								                      		</c:otherwise>
							                      		</c:choose>
									            	</span>
									            </span>
									            <br/>
									            <span>
									                적립금사용
									            </span>
									            <span class="pull_right">- &#8361;
									            	<span class="order_deliveryprice">
									               		<fmt:formatNumber pattern="###,###,###" value='${item.point }'/>
									                </span>
									            </span>
									        </div>
									        <hr/>
									        <div>
									            <p>
									                <span>
									                    <b>최종 결제금액</b>
									                </span>
									                <span class="pull_right"><b>&#8361; 
									                	<span class="order_totalprice">
						                    			  <fmt:formatNumber pattern="###,###,###" value='${item.totalprice }'/>
						                    		   </span></b>
									                </span>
									            </p>
									        </div>							
									    </div>
									</div>
										
									<!-- 주문 수정 modal -->
									<div class="hd_gray_layer" id="hd_menu_background"></div>
									<div class="order_over_layer" id="hd_menu_front">
										<div>
											<span class="back">뒤로가기</span>
											<div class="cancel_title">
												<span class="cancel_icon"></span>
												<div>
													<h4>주문 취소</h4>
													<p>취소 형식을 선택해주세요.</p>
												</div>
											</div>
											<div>
												<div>
													<form class="form-horizontal" role="form">
														<select class="form-control" name="orderstatus">
															<option value="CC">취소</option>
															<option value="CH">교환</option>
															<option value="RT">반품</option>
															<option value="RF">환불</option>
														</select>
														<button type="submit" class="btn btn-primary cancel_btn" data-orderno="${item.orderno }">확인</button>
													</form>
												</div>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
				
				<!-- 지난 주문 -->
				<div id="order_tab_page02">
					<c:choose>
						<c:when test="${deliveryOutput != 'C'}">
							<div>
								<div class="order_tab_pagenone">
									<p class="order_none_title">지난 주문이 없습니다.</p>
								</div>
							</div>
							<div class="order_none">
								<span id="order_search_icon"></span>
								<div>
									<p><b>찾는 주문 내역이 없으신가요?</b></p>
									<p>매장에서 주문하신 경우, 여기서 주문내역을 확인할 수 있습니다.
										<a href="#" class="orderfna_link">주문 내역 확인</a>
									</p>
								</div>
								<div class="order_blank">
									<p>찾는 주문 내역이 없으신가요?
										<a href="${pageContext.request.contextPath}/09_cs/csmain.do" class="orderfna_link">고객지원센터</a> 로 문의해 주세요.
									</p>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach var="item" items="${deliveryOutput }" varStatus="status">
								<c:if test="${item.deliverystatus=='C' || item.ccstatus=='C'}" >
									<!-- 주문 목록 -->
									<div class="order_page01">
										<p>
											주문 번호 - 
											<span class="order_orderno">${item.orderno }</span><br/>
											주문 날짜 - 
											<span class="order_date">
				                               	<fmt:parseDate value="${item.regdate}" var="regdate" pattern="yyyy-MM-dd" />
				                               	<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" />
											</span><br/>
											현황 - 
											<span class="order_condition">
												<c:if test="${item.orderstatus=='N' }">
													일반주문
												</c:if>
												<c:if test="${item.orderstatus=='CC' }">
													취소
												</c:if>
												<c:if test="${item.orderstatus=='CH' }">
													교환
												</c:if>
												<c:if test="${item.orderstatus=='RT' }">
													반품
												</c:if>
												<c:if test="${item.orderstatus=='RF' }">
													환불
												</c:if>
										   </span>
										</p>
										<a class="order_link" href="#">주문 내역 보기</a>
										<hr/>
									</div>
									
									<!-- 주문내역 -->
									<div class="order_list">
									    <div>
									        <div class="order_info01">
									            <h3>주문 내역</h3>
									            <p>주문 번호 : <span class="order_orderno">${item.orderno }</span></p>
									        </div>
									    </div>
									    <hr/>
									    <div class="order_info02">
									        <p>
									            <b>주문 날짜</b><br/>
									            <span class="order_date">
									            	<fmt:parseDate value="${item.regdate}" var="regdate" pattern="yyyy-MM-dd" />
					                              		<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" />
								            	</span><br/>
									            <b>주문 번호</b><br/>
									            <span class="order_orderno">${item.orderno }</span><br/>
									            <b>최종 결제 금액</b><br/>
									            &#8361; <span class="order_totalprice"><fmt:formatNumber pattern="###,###,###" value='${item.totalprice }'/></span>
									        </p>
									        <div>
									            <span id="order_icon"></span>
									            <a class="order_return" href="#">주문취소</a>
									        </div>
									    </div>
									    <hr/>
									    <div class="order_info03">
									        <div class="order_line">
									            <p><b>택배 배송 내역</b></p>
									            <a href="#"><b><span class="order_delivery_info">+</span></b></a>
									        </div>
									        <div class="order_line">
									            <p><b>택배 배송 제품</b></p>
									            <a href="#"><b><span class="order_delivery_product">+</span></b></a>
									        </div>
									        <div class="order_hidden">
									            <form class="order_itemlist">
									                <img class="order_item_img">
									                <div class="order_item">
									                    <span class="order_item_title">${item.pname }</span><br/>
									                    <span class="order_item_info">${item.color }, ${item.size }</span><br/>
									                    <span class="order_item_productno">${item.prodno }</span><br/>
									                    <span class="order_item_price">
									                    	&#8361; <span class="order_totalprice"><fmt:formatNumber pattern="###,###,###" value='${item.price * item.ea }'/></span>
									                    </span>
									                </div>
									            </form>
									        </div>
									        <div class="order_userinfo">
									            <p>
									                <b>주소</b><br/>
									                <span class="order_name">${item.name }</span><br/>
									                <span class="order_address">${item.addr1 } ${item.addr2 }</span><br/>
									                <span class="order_email">${item.email }</span><br/>
									            </p>
									        </div>
									    </div>
									    <hr/>
									    <div>
									        <p><b>결제 방법</b><br/>
									        <span class="order_payment">
									        	<c:if test="${item.paytype=='C'}">
						                       		신용카드
						                       	</c:if>
						                       	<c:if test="${item.paytype=='D'}">
					                       			무통장입금
					                      		</c:if>
					                      		<c:if test="${item.paytype=='M'}">
					                       			휴대폰결제
					                      		</c:if>
					                      		<c:if test="${item.paytype=='D2'}">
					                       			실시간계좌이체
					                      		</c:if>
									        </span>
									    </div>
									    <hr/>
									    <div>
									        <div>
									            <span>
									                <b>총 주문금액</b>
									            </span>
									            <span class="pull_right">
									                <b><span class="order_price">
						                					&#8361; <span class="order_totalprice"><fmt:formatNumber pattern="###,###,###" value='${item.price * item.ea }'/></span>
					                				   </span>
				                				   </b>
									            </span>
									        </div>
									        <br/>
									        <div>
									            <span>
									                배송비
									            </span>
									            <span class="pull_right">+ &#8361; 
									            	<span class="order_deliveryprice">
							               				<c:if test="${item.deltypeno == 1 }">
							               					<fmt:formatNumber pattern="###,###,###" value='5000'/>
							               				</c:if>
							               				<c:if test="${item.deltypeno == 2 }">
							               					<fmt:formatNumber pattern="###,###,###" value='30000'/>
							               				</c:if>
							               			</span>
									            </span>
									            <br/>
									            <span>
									                쿠폰할인
									            </span>
									            <span class="pull_right">
									            	<span class="order_deliveryprice">- &#8361; 
									            		<c:choose>
										            		<c:when test="${item.distype=='P'}">
								                       			<fmt:formatNumber pattern="###,###,###" value='${(item.price * item.ea) * (item.discount * 1/100) }'/>
									                       	</c:when>
									                       	<c:when test="${item.distype=='W'}">
								                       			<fmt:formatNumber pattern="###,###,###" value='${item.discount }'/>
								                      		</c:when>
								                      		<c:otherwise>
								                      			0
								                      		</c:otherwise>
							                      		</c:choose>
									            	</span>
									            </span>
									            <br/>
									            <span>
									                적립금사용
									            </span>
									            <span class="pull_right">- &#8361;
									            	<span class="order_deliveryprice">
									               		<fmt:formatNumber pattern="###,###,###" value='${item.point }'/>
									                </span>
									            </span>
									        </div>
									        <hr/>
									        <div>
									            <p>
									                <span>
									                    <b>최종 결제금액</b>
									                </span>
									                <span class="pull_right"><b>&#8361; 
									                	<span class="order_totalprice">
						                    			  <fmt:formatNumber pattern="###,###,###" value='${item.totalprice }'/>
						                    		   </span></b>
									                </span>
									            </p>
									        </div>							
									    </div>
									</div>
								</c:if>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</section>
		<%@ include file="../01_home/footer.jsp" %>
		
		<!-- Handlebar CDN 참조 -->
    	<script src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.4.2/handlebars.min.js"></script>
    	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
   		<!-- jQuery Ajax Form plugin CDN -->
   		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
    	<script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
		<script src="../assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
	    <script src="../assets/js/home.js"></script>
	    <script type="text/javascript">
			
	    	$(document).ready(function() {
	    		$("#order_tab_page02").hide();
	    		$(".order_list").hide();
	    	});
	    	
			/* 탭 - 처리중 주문 클릭시 */
			$(document).on("click", "#order_tab_link01", function(e) {
				e.preventDefault();
				
				$("#order_tab_page01").show();
				$(".order_page01").show();
				$(".order_list").hide();
				$("#order_tab_page02").hide();
				$("#order_tab_link01").addClass("selected");
				$("#order_tab_link02").removeClass("selected");
			});

			/* 탭 - 지난 주문 클릭시 */
			$(document).on("click", "#order_tab_link02", function(e) {
				e.preventDefault();
				
				$("#order_tab_page02").show();
				$(".order_page02").show();
				$(".order_list").hide();
				$("#order_tab_page01").hide();
				$("#order_tab_link02").addClass("selected");
				$("#order_tab_link01").removeClass("selected");
			});

			/* 주문내역 클릭시 */
			$(document).on("click", ".order_link", function(e) {
				e.preventDefault();
				
				var content = $(this).parent().next();
				//$(content).show();
				$(content).slideToggle(200);
				$(".order_page01").hide();
				$(".order_page02").hide();
			});

			/* 주문취소 버튼 */
			$(document).on("click",".order_return", function(e) {
	       	 	e.preventDefault();
	       	 	$("#hd_menu_background").fadeIn(300);
	        	$(".order_over_layer").fadeIn(200);
	    	});
			
	    	// 배경을 클릭한 경우
			$(document).on("click","#hd_menu_background", function(e) {
	        	$(this).fadeOut(300);
	        	$(".order_over_layer").fadeOut(200);
	    	});
	    	
	    	// modal창 닫기
			$(document).on("click",".back", function(e) {
	        	e.preventDefault();
	        	$(".order_over_layer").fadeOut(200);
	        	$("#hd_menu_background").fadeOut(100);
	    	});
			
			/* 택배배송 제품 더보기 버튼 */
			$(document).on("click", ".order_delivery_product", function(e) {
				e.preventDefault();

				$(".order_hidden").slideToggle(200);
				if ( $(this).html() == "+" ) {
					$(this).html("-")
					} else {
						$(this).html("+");
					}
			});
			
			/* 수정 버튼 */
			$(document).on("click",".cancel_btn", function(e) {
				e.preventDefault();
				
				var current = $(this);					// 이벤트가 발생한 버튼
				var orderno = current.data('orderno');	// data-orderno 값을 가져옴
				var orderstatus = current.parent().find("select[name=orderstatus]").val();	// 드롭다운 선택 값 가져옴
				if (!confirm("정말 주문정보를 수정하시겠습니까?")) {
					return false;
				}
				
				// put 메서드로 ajax 요청
				$.put("${pageContext.request.contextPath}/02_mypage/order", {
					"orderno":orderno,
					"orderstatus":orderstatus,
					"ccstatus":"I"
				}, function(json) {
					if(json.rt == "OK") {
						alert("변경되었습니다");
						// 변경 완료 후 목록 페이지 이동
						window.location = "${pageContext.request.contextPath}/02_mypage/order.do?userno="+ <%out.print(session.getAttribute("my_session"));%>;
					}
				});
			});
		</script>
	</body>
</html>