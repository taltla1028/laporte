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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" />
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css">
<link rel="stylesheet" type="text/css" href="../assets/css/common.css">
<link rel="stylesheet" type="text/css" href="../assets/css/cart.css">
<link rel="stylesheet" type="text/css" href="../assets/css/detail.css">
<link rel="stylesheet" type="text/css" href="../assets/css/review.css">


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
		<div class="container">
			<div class="page-header">
				<ol class="breadcrumb">
					<li><a href="#">${category.catname1}</a></li>
					<!-- 여기가 현재 페이지를 의미합니다. - active클래스 적용됨 -->
					<li class="active">${category.catname2}</li>
				</ol>
			</div>
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<img src="${imgoutput.fileUrl}" class="swiper-slide">
					<c:forEach var="item" items="${imgList}" varStatus="status">
						<img src="${item.fileUrl}" class="swiper-slide" />
					</c:forEach>

				</div>
				<div class="swiper-scrollbar"></div>
			</div>
			<div class="detail_buy_module">
				<div class="price_package_box">
					<div class="price_package_wrapper">
						<div class="price_package_left clearfix">
							<c:set var="group" value="${output.group }" />
							<c:if test="${fn:contains(group, '신제품') }">
								<span class="group_info">new</span>
							</c:if>
							<c:if test="${fn:contains(group, '세일') }">
								<span class="group_info">sale</span>
							</c:if>
							<h3 class="detail_info_name">${output.name }</h3>


							<c:choose>
								<c:when test="${fn:contains(group, '세일') }">
									<div class="clearfix sale_price_box">
										<div class="price_package_right sale_before">
											₩
											<fmt:formatNumber value="${output.price}" pattern="#,###" />
										</div>
										<div
											class="sale_info <c:if test="${fn:contains(group, '인기') }">best_mark</c:if>">
											₩
											<fmt:formatNumber value="${output.saleprice}" pattern="#,###" />
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<span
										class="price_package_right pull-right price_font <c:if test="${fn:contains(group, '인기') }">best_mark</c:if>">
										₩<fmt:formatNumber value="${output.price}" pattern="#,###" />
									</span>
								</c:otherwise>
							</c:choose>

							<span class="detail_info_text pull-left">${output.color}</span><br />
							<span class="detail_info_text pull-left"> ${output.size}</span>
						</div>

						<button class="btn btn-link review_btn clearfix">
							<div class="avg_all_star" data-rate="<c:if test="${reviewList!=null}">
									<c:set var="sum_star" value="0" />
								<c:forEach var="item" items="${reviewList }">
									<c:set var="sum_star" value="${sum_star+item.avgscore }" />
								</c:forEach>
								<fmt:parseNumber var="avg_star" integerOnly= "true" value= "${sum_star/reviewList.size() }" />
								${avg_star}</c:if>
								<c:if test="${reviewList==null}">0</c:if>">
								<i class="fas fa-star"></i> 
								<i class="fas fa-star"></i> 
								<i class="fas fa-star"></i> 
								<i class="fas fa-star"></i> 
								<i class="fas fa-star"></i>
							</div>
							 <span class="review_num pull-right">(${reviewList.size()})</span>
						</button>
						<!-- 리뷰 모달  -->
						<div class="review_gray_layer" id="review_background"></div>
						<div class="review_over_layer" id="review_front">
							<div id="review_big_box" class="clearfix">
							<c:forEach var="item" items="${reviewList}" >
							
							</c:forEach>
								<div class="review_title_top">
									<h3>상품평</h3>
									<span class="review_close_button"></span>
									<div class="avg_all_star" data-rate="<c:if test='${reviewList.size()==0 }'>0</c:if>
									<c:set var="total_avgstar" value="0" />
									<c:if test='${reviewList!=null }'>
										<c:set var="total" value="0" />
										<c:forEach var="item" items="${reviewList }" varStatus="status">
											<c:set var="total" value="${total+item.avgscore }" />
										</c:forEach>
										<fmt:parseNumber var="num" integerOnly= "true" value= "${total/reviewList.size() }" />
										<c:set var="total_avgstar" value="${num}" />
										${num }
									</c:if>">
										<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
											class="fas fa-star"></i> <i class="fas fa-star"></i> <i
											class="fas fa-star"></i> <span class="review_count">(${reviewList.size()})</span>
									</div>
								</div>
								<!-- 평균 고객 평가시작 -->
								<c:if test="${reviewList.size() != 0}">
									<c:set var="sum_easy" value="0" />
									<c:set var="sum_bene" value="0" />
									<c:set var="sum_qual" value="0" />
									<c:set var="sum_apear" value="0" />
									<c:set var="sum_func" value="0" />
								<c:forEach var="item" items="${reviewList }">
									<c:set var="sum_easy" value="${sum_easy+item.easyscore }" />
									<c:set var="sum_bene" value="${sum_bene+item.benefitscore }" />
									<c:set var="sum_qual" value="${sum_qual+item.qualityscore }" />
									<c:set var="sum_apear" value="${sum_apear+item.appearscore }" />
									<c:set var="sum_func" value="${sum_func+item.funcscore }" />
								</c:forEach>
									
									
									<fmt:parseNumber var="avg_easy" integerOnly= "true" value= "${sum_easy/reviewList.size() }" />
									<fmt:parseNumber var="avg_bene" integerOnly= "true" value= "${sum_bene/reviewList.size() }" />
									<fmt:parseNumber var="avg_qual" integerOnly= "true" value= "${sum_qual/reviewList.size() }" />
									<fmt:parseNumber var="avg_apear" integerOnly= "true" value= "${sum_apear/reviewList.size() }" />
									<fmt:parseNumber var="avg_func" integerOnly= "true" value= "${sum_func/reviewList.size() }" />	
								<c:set var="sum_easy" value="${avg_easy}" />
								<c:set var="sum_bene" value="${avg_bene}" />
								<c:set var="sum_qual" value="${avg_qual}" />
								<c:set var="sum_apear" value="${avg_apear}" />
								<c:set var="sum_func" value="${avg_func}" />
									
								<div class="avg_custom_result">
									<h4>평균 고객평가</h4>
									<div class="avg_custom_result_output">
										<div class="avg_custom_star clearfix">
											<div class="pull-left score_row">전반적으로</div>
											<div class="pull-right">
												<div class="avg_all_star" data-rate="${total_avgstar}">
													<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
														class="fas fa-star"></i> <i class="fas fa-star"></i> <i
														class="fas fa-star"></i>
												</div>
											</div>
										</div>
										<div class="avg_score_group">
											<div class="score_row clearfix position-r">
												<div class="pull-left score_name">손쉬운 조립</div>
												<div class="pull-right position-a">
													<span class="range_box position-r"> <input
														type="range" class="range-css avg_easysccore" min="0"
														max="5" step="1" value="${sum_easy }" disabled /> <span
														class="avg_easy_num star_num position-p">${sum_easy }</span>
													</span>
												</div>
											</div>
											<div class="score_row clearfix position-r">
												<div class="pull-left score_name">제품 가성비</div>
												<div class="pull-right position-a">
													<span class="range_box position-r"> <input
														type="range" class="range-css avg_benesccore" min="0"
														max="5" step="1" value="${sum_easy }" disabled /> <span
														class="avg_bene_num star_num position-p">${sum_easy }</span>
													</span>
												</div>
											</div>
											<div class="score_row clearfix position-r">
												<div class="pull-left score_name">제품 품질</div>
												<div class="pull-right position-a">
													<span class="range_box position-r"> <input
														type="range" class="range-css avg_qualsccore" min="0"
														max="5" step="1" value="${sum_qual }" disabled /> <span
														class="avg_qual_num star_num position-p">${sum_qual }</span>
													</span>
												</div>
											</div>
											<div class="score_row clearfix position-r">
												<div class="pull-left score_name">제품 외관</div>
												<div class="pull-right position-a">
													<span class="range_box position-r"> <input
														type="range" class="range-css avg_apearsccore" min="0"
														max="5" step="1" value="${sum_apear }" disabled /> <span
														class="avg_apear_num star_num position-p">${sum_apear }</span>
													</span>
												</div>
											</div>
											<div class="score_row clearfix position-r">
												<div class="pull-left score_name">제품 기능</div>
												<div class="pull-right position-a">
													<span class="range_box position-r"> <input
														type="range" class="range-css avg_funcsccore" min="0"
														max="5" step="1" value="${sum_func }" disabled /> <span
														class="avg_func_num star_num position-p">${sum_func }</span>
													</span>
												</div>
											</div>

										</div>
									</div>
								</div>
								<!-- 평균 고개평가 끝 -->
								<!-- 리뷰 반복문시작 -->
								<c:forEach var="review" items="${reviewList }">
								<div class="review_parent">
								<div class="custom_result">
									<div class="clearfix">
										<div class="avg_all_star pull-left" data-rate="${review.avgscore}">
											<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
												class="fas fa-star"></i> <i class="fas fa-star"></i> <i
												class="fas fa-star"></i>
										</div>
										<div class="date pull-right">
											${review.editdate}
										</div>
									</div>
									<div class="clearfix">
										<div class="revtitle pull-left">${review.title}</div>
										<c:if test="${userno==review.userno }">
										<div class="pull-right edit_box">
											<a href="#" class="revdelete" data-reviewno="${review.reviewno }"><span class="delete_img"></span>삭제</a>
											<a href="#" class="revedit">수정</a>
										</div>
										</c:if>
									</div>

									<div class="revcontent">${review.content}</div>
									<div class="revcommend">
										<c:if test="${review.recommend=='Y'}">예, 이 제품을 추천합니다.</c:if>
										<c:if test="${review.recommend=='N'}">아니요, 이 제품을 추천하지 않니다.</c:if>
									</div>
									<div class="custom_result_output">
										<div class="avg_score_group">
											<div class="score_row clearfix position-r">
												<div class="pull-left score_name">손쉬운 조립</div>
												<div class="pull-right position-a">
													<span class="range_box position-r"> <input
														type="range" class="range-css avg_easysccore" min="0"
														max="5" step="1" value="${review.easyscore}" disabled /> <span
														class="avg_easy_num star_num position-p">${review.easyscore}</span>
													</span>
												</div>
											</div>
											<div class="score_row clearfix position-r">
												<div class="pull-left score_name">제품 가성비</div>
												<div class="pull-right position-a">
													<span class="range_box position-r"> <input
														type="range" class="range-css avg_benesccore" min="0"
														max="5" step="1" value="${review.benefitscore}" disabled /> <span
														class="avg_bene_num star_num position-p">${review.benefitscore}</span>
													</span>
												</div>
											</div>
											<div class="score_row clearfix position-r">
												<div class="pull-left score_name">제품 품질</div>
												<div class="pull-right position-a">
													<span class="range_box position-r"> <input
														type="range" class="range-css avg_qualsccore" min="0"
														max="5" step="1" value="${review.qualityscore}" disabled /> <span
														class="avg_qual_num star_num position-p">${review.qualityscore}</span>
													</span>
												</div>
											</div>
											<div class="score_row clearfix position-r">
												<div class="pull-left score_name">제품 외관</div>
												<div class="pull-right position-a">
													<span class="range_box position-r"> <input
														type="range" class="range-css avg_apearsccore" min="0"
														max="5" step="1" value="${review.appearscore}" disabled /> <span
														class="avg_apear_num star_num position-p">${review.appearscore}</span>
													</span>
												</div>
											</div>
											<div class="score_row clearfix position-r">
												<div class="pull-left score_name">제품 기능</div>
												<div class="pull-right position-a">
													<span class="range_box position-r"> <input
														type="range" class="range-css avg_funcsccore" min="0"
														max="5" step="1" value="${review.funcscore}" disabled /> <span
														class="avg_func_num star_num position-p">${review.funcscore}</span>
													</span>
												</div>
											</div>

										</div>
									</div>
								</div>
								<!-- 리뷰 수정하기 페이지 시작 -->
								<div class="edit_review_box">
									<form action="${pageContext.request.contextPath}/04_review/review" class="edit_review_form">
 									<h3>상품평 수정하기</h3>
 									<span class="review_write_close_button"></span>
 									
									<div class="ratebar_box">
										<div class="score_row clearfix position-r">
											<div class="pull-left score_name">손쉬운 조립</div>
											<div class="pull-right position-a">
												<span class="range_box position-r"> <input
													type="range" class="range-css avg_easysccore edit_score" min="0"
													max="5" step="1" value="${review.easyscore}" name="easyscore"/> <span
													class="avg_easy_num star_num position-p edit_result">${review.easyscore}</span>
												</span>
											</div>
										</div>
										<div class="score_row clearfix position-r">
											<div class="pull-left score_name">제품 가성비</div>
											<div class="pull-right position-a">
												<span class="range_box position-r"> <input
													type="range" class="range-css avg_benesccore edit_score" min="0"
													max="5" step="1" value="${review.benefitscore}" name="benefitscore" /> <span
													class="avg_bene_num star_num position-p">${review.benefitscore}</span>
												</span>
											</div>
										</div>
										<div class="score_row clearfix position-r">
											<div class="pull-left score_name">제품 품질</div>
											<div class="pull-right position-a">
												<span class="range_box position-r"> <input
													type="range" class="range-css avg_qualsccore edit_score" min="0"
													max="5" step="1" value="${review.qualityscore}" name="qualityscore"/> <span
													class="avg_qual_num star_num position-p">${review.qualityscore}</span>
												</span>
											</div>
										</div>
										<div class="score_row clearfix position-r">
											<div class="pull-left score_name">제품 외관</div>
											<div class="pull-right position-a">
												<span class="range_box position-r"> <input
													type="range" class="range-css avg_apearsccore edit_score" min="0"
													max="5" step="1" value="${review.appearscore}" name="appearscore"/> <span
													class="avg_apear_num star_num position-p">${review.appearscore}</span>
												</span>
											</div>
										</div>
										<div class="score_row clearfix position-r">
											<div class="pull-left score_name">제품 기능</div>
											<div class="pull-right position-a">
												<span class="range_box position-r"> <input
													type="range" class="range-css avg_funcsccore edit_score" min="0"
													max="5" step="1" value="${review.funcscore}" name="funcscore" /> <span
													class="avg_func_num star_num position-p">${review.funcscore}</span>
												</span>
											</div>
										</div>

										<div class="add_avg_star">
											<h4>평균별점</h4>
											<div class="avg_all_star pull-left edit_avgstar" data-rate="${review.avgscore}">
												<i class="fas fa-star"></i> 
												<i class="fas fa-star"></i> 
												<i class="fas fa-star"></i> 
												<i class="fas fa-star"></i> 
												<i class="fas fa-star"></i>
											</div>
											<input type="hidden" name="avgscore" value="${review.avgscore}"/>
										</div>
									</div>
									<input type="text" class="form-control title_input"
										placeholder="제목을 입력해주세요." name="title" value="${review.title}"/>
									<textarea class="form-control content_input" rows="6"
										placeholder="내용을 입력해주세요." name="content">${review.content}</textarea>
									<div class="commend_box">
										<div>
											<input type="radio" name="recommend" value="Y" <c:if test="${review.recommend=='Y' }">checked</c:if> />
											<label for="y">이 제품을 추천합니다.</label> 
										</div>
										<div>
											<input type="radio" name="recommend" value="N"<c:if test="${review.recommend=='N' }">checked</c:if>/> 
											<label for="n">이 제품을 추천하지 않습니다.</label>
										</div>
									</div>
									<input type="hidden" name="reviewno" value="${review.reviewno }" />	
									<div class="btn_box_submit">
										<button type="submit" class="edit_review_btn">수정 완료</button>
									</div>
									</form>
								</div>
								</div>
								<!-- 리뷰 수정하기 페이지 끝 -->
								<!-- 관리자 리뷰 답변 -->
								<c:if test="${revcom.size() != 0 }">
									<c:forEach var="revcom" items="${revcom }" >
										<c:if test="${revcom.reviewno == review.reviewno}">
										<div class="revcomment_box">
											<div><b>La Porte의 답변</b></div>
											<div class="answer_date">${revcom.editdate }</div>
											<p class="revcomment_content">${revcom.content }</p>
										</div>
										</c:if>
									</c:forEach>
								</c:if>
								
								<!-- 관리자 리뷰 답변 끝 -->
								</c:forEach>
								
								
								
								</c:if>
								<c:if test="${reviewList.size() ==0 }">
									<div class="no_review">
										<p>작성된 상품평이 없습니다.</p>
									</div>
								</c:if>
								
								<!-- 리뷰 반복문 끝 -->
								<c:if test="${orderno != 0 }">
								<div class="add_review pull-right">
									<a href="#">상품평 작성하기</a>
								</div>
								</c:if>
								
								
								<!-- 상품평 작성하기 페이지 시작 -->
								<div id="add_review_box">
									<form action="${pageContext.request.contextPath}/04_review/review" class="write_review_form">
 									<h3>상품평 작성하기</h3>
 									<span class="review_write_close_button"></span>
 									
									<div class="ratebar_box">
										<div class="score_row clearfix position-r">
											<div class="pull-left score_name">손쉬운 조립</div>
											<div class="pull-right position-a">
												<span class="range_box position-r"> <input
													type="range" class="range-css avg_easysccore add_score" min="0"
													max="5" step="1" value="5" name="easyscore"
													oninput="document.getElementById('easy_num').innerHTML=this.value;"  id="write_es"/> <span
													class="avg_easy_num star_num position-p" id="easy_num">5</span>
												</span>
											</div>
										</div>
										<div class="score_row clearfix position-r">
											<div class="pull-left score_name">제품 가성비</div>
											<div class="pull-right position-a">
												<span class="range_box position-r"> <input
													type="range" class="range-css avg_benesccore add_score" min="0"
													max="5" step="1" value="5" name="benefitscore" 
													oninput="document.getElementById('bene_num').innerHTML=this.value;"  id="write_bs"/> <span
													class="avg_bene_num star_num position-p" id="bene_num">5</span>
												</span>
											</div>
										</div>
										<div class="score_row clearfix position-r">
											<div class="pull-left score_name">제품 품질</div>
											<div class="pull-right position-a">
												<span class="range_box position-r"> <input
													type="range" class="range-css avg_qualsccore add_score" min="0"
													max="5" step="1" value="5" name="qualityscore" 
													oninput="document.getElementById('qual_num').innerHTML=this.value;" id="write_qs"/> <span
													class="avg_qual_num star_num position-p" id="qual_num">5</span>
												</span>
											</div>
										</div>
										<div class="score_row clearfix position-r">
											<div class="pull-left score_name">제품 외관</div>
											<div class="pull-right position-a">
												<span class="range_box position-r"> <input
													type="range" class="range-css avg_apearsccore add_score" min="0"
													max="5" step="1" value="5" name="appearscore"
													oninput="document.getElementById('apear_num').innerHTML=this.value;" id="write_as"/> <span
													class="avg_apear_num star_num position-p" id="apear_num">5</span>
												</span>
											</div>
										</div>
										<div class="score_row clearfix position-r">
											<div class="pull-left score_name">제품 기능</div>
											<div class="pull-right position-a">
												<span class="range_box position-r"> <input
													type="range" class="range-css avg_funcsccore add_score" min="0"
													max="5" step="1" value="5" name="funcscore" 
													oninput="document.getElementById('func_num').innerHTML=this.value;" id="write_fs"/> <span
													class="avg_func_num star_num position-p" id="func_num">5</span>
												</span>
											</div>
										</div>

										<div class="add_avg_star">
											<h4>평균별점</h4>
											<div class="avg_all_star pull-left" id="add_review_avgstar" data-rate="5">
												<i class="fas fa-star"></i> 
												<i class="fas fa-star"></i> 
												<i class="fas fa-star"></i> 
												<i class="fas fa-star"></i> 
												<i class="fas fa-star"></i>
											</div>
											<input type="hidden" name="avgscore" value="5" id="avgscore"/>
										</div>
									</div>
									<input type="text" class="form-control title_input"
										placeholder="제목을 입력해주세요." name="title"/>
									<textarea class="form-control content_input" rows="6"
										placeholder="내용을 입력해주세요." name="content"></textarea>
									<div class="commend_box">
										<div>
											<input type="radio" name="recommend" value="Y" id="y" checked />
											<label for="y">이 제품을 추천합니다.</label> 
										</div>
										<div>
											<input type="radio" name="recommend" value="N" id="n" /> 
											<label for="n">이 제품을 추천하지 않습니다.</label>
										</div>
									</div>
									<input type="hidden" name="prodno" value="${output.prodno }" />	
									<input type="hidden" name="userno" value="${userno }" />	
									<input type="hidden" name="orderno" value="${orderno }" />									
									<div class="btn_box_submit">
										<button type="submit" class="submit_review_btn">작성 완료</button>
									</div>
									</form>
								</div>
								<!-- 상품평 작성하기 페이지 끝 -->
							</div>
						</div>
						<!-- 리뷰 모달 -->
					</div>
					<!-- 리뷰 모달 끝 -->
				</div>
				<div class="buy_module_btn_box clearfix">
					<button class="btn btn-primary" id="addCartDetail" data-prodno="${output.prodno}" data-userno="${userno}">구매하기</button>
					<div class="heart_box pull-right">
						<input type="checkbox" id="chk_heart" class="chk_heart"
							name="chk_heart" style="display: none;"
							<c:if test="${wishoutput!=null }">checked</c:if>
							data-wishno="${my_wish}" data-prodno="${output.prodno }"
							data-userno="${userno}" /> <label class="heart" for="chk_heart"></label>
					</div>
				</div>
			</div>
			<div class="product_info_txt">
				<div class="product_available">
					<span class="delivery_icon"></span>
					<p class="delivery_txt">배송 가능 (배송지에 따라 구매가능 여부가 변경 될 수 있습니다.)</p>
				</div>
				<div class="product_return">
					<span class="return_icon"></span>
					<p class="return_txt">마음이 바뀌어도 괜찮아요. 구입한 제품은 365일 이내에 반품할 수
						있어요. 영수증을 잘 보관하면 반품이 한결 쉬워져요.</p>
				</div>
				<div class="product_num" data-prodno="${output.prodno}">${output.prodno}</div>
				<div class="detail_text">${output.adminnote}</div>
			</div>
			<!-- 아코디언 영역 -->
			<div class="panel-group  detail_accordion" id="accordion">
				<!-- 제품 설명 -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<a class="accordion-toggle" data-toggle="collapse"
							data-parent="#accordion" href="#collapseOne"> <span
							class="panel-title">제품 설명</span> <span
							class="detail_dropdown_icon"></span>
						</a>
					</div>
					<div id="collapseOne" class="panel-collapse collapse">
						<div class="panel-body">
							<p>${output.detailnote}</p>
						</div>
					</div>
				</div>
				<!-- 제품 크기 -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<a class="accordion-toggle" data-toggle="collapse"
							data-parent="#accordion" href="#collapseTwo"> <span
							class="panel-title">제품 크기</span> <span
							class="detail_dropdown_icon"></span>
						</a>
					</div>
					<div id="collapseTwo" class="panel-collapse collapse">
						<div class="panel-body">
							<p>${output.detailsize}</p>
						</div>
					</div>
				</div>
			</div>
			<!--// 아코디언 영역 -->
			<!-- 모든 제품 -->
			<div id="home_content">
				<h4>유사한 제품</h4>
				<div id="home_item_box">
					<ul id="home_item_listbox">
						<c:forEach var="item" items="${similar}">
							<li>
								<div class="home_item">
									<div class="home_wishlist_loc">
											<input type="checkbox" class="chk_heart heart" style="display: none;" name="chk_heart" id="${item.prodno }"
												<c:set var ="result" value="0" />
												<c:forEach var="wishitem" items="${wishoutputs}" >
													<c:if test="${item.prodno== wishitem.prodno}">
														<c:set var ="result" value="${result+1 }" />
													</c:if>
												</c:forEach>
												<c:if test="${result>0 }">checked</c:if>
													data-wishno=<c:if test='${my_wish !=0 }'>"${my_wish}"</c:if><c:if test='${my_wish ==0 }'>"${basicoutput.wishno}"</c:if> data-prodno="${item.prodno }"
													data-userno="${userno}"/>
											<label class="heart" for="${item.prodno }"></label>
										</div>
									<div>
										<a
											href="${pageContext.request.contextPath}/03_detail/detail.do?prodno=${item.prodno}">
											<img class="home_item_img" alt="${item.name}"
											src="${item.fileUrl}">
										</a> <a href="#"> <c:set var="group" value="${item.group }" />
											<span class="home_item_title">${item.name}</span> <br /> <span
											class="home_item_info">${item.size} <br />${item.color}</span><br />
											<c:choose>
												<c:when test="${fn:contains(group, '세일') }">
													<span class="home_item_info home_item_pricedown">&#8361;
														<fmt:formatNumber value="${item.price}" pattern="#,###" />
													</span>
													<br />
													<span
														class="home_item_price <c:if test="${fn:contains(group, '인기') }">home_item_mark</c:if>">&#8361;
														<fmt:formatNumber value="${item.saleprice}"
															pattern="#,###" />
													</span>
												</c:when>
												<c:otherwise>
													<span
														class="home_item_price <c:if test="${fn:contains(group, '인기') }">home_item_mark</c:if>">
														₩ <fmt:formatNumber value="${item.price}" pattern="#,###" />
													</span>
												</c:otherwise>
											</c:choose></a>
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
			<!-- 최근 본 제품 -->
			<div class="recently_view_page">
				<h4>최근 본 제품</h4>
				<div class="recently_img_box">
					<c:choose>
						<c:when test="${my_cookie == ''}">
            		최근 본 제품이 없습니다.
        		</c:when>
						<c:otherwise>
							<c:forEach var="item" items="${my_cookie}" varStatus="status">
								<a
									href="${pageContext.request.contextPath}/03_detail/detail.do?prodno=${item.prodno}">
									<img src="${item.fileUrl}" class="recntly_img" />
								</a>
							</c:forEach>
							<%-- <c:forEach var ="item" items="${cookie_img_array}" varStatus="status">
        				<img src="${item}" class="recntly_img" />
        			</c:forEach> --%>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="totop_box">
				<div class="totop">맨위로 이동</div>
			</div>

		</div>
	</section>
	<%@ include file="../01_home/footer.jsp"%>
	<script src="../assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"></script>
	<script src="../assets/js/review_common.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- Handlebar CDN 참조 -->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.4.2/handlebars.min.js"></script>
	<!-- jQuery Ajax Form plugin CDN -->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
	<!-- jQuery Ajax Setup -->
	<script
		src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script src="../assets/plugins/toTop/totop.min.js"></script>
	<script src="../assets/js/home.js"></script>
	<script type="text/javascript">
		var swiper = new Swiper('.swiper-container', {
			scrollbar : {
				el : '.swiper-scrollbar',
				hide : false,
			},
		});
		$('.totop').tottTop({
			scrollTop : 0
		});
		$(function() {
			/* --------------------wish modalwindow-------------------*/
			$(".review_btn").click(function(e) {
				e.preventDefault();
				$("#review_background").fadeIn(300);
				$("#review_front").fadeIn(200);
			});
			// 오른쪽 x버튼 (self.close << 쓰는게 깔끔)
			$(".review_close_button").click(function(e) {
				e.preventDefault();
				$("#review_front").fadeOut(200);
				$("#review_background").fadeOut(100);
			});
			$("#add_review_box").hide();
			$(".edit_review_box").hide();
			
		});
		
		<!-- 버튼 누를 시 삭제 알림기능 -->
		$(function() {
    		
			$("#chk_heart").click(function(e) {
				let current = $(this); 
	    		let userno = current.data('userno');
				if(userno==0){
					alert("로그인을 먼저 하세요");
					return false;
				}else if($("#chk_heart").is(":checked") == true){
		    		let prodno = current.data('prodno');
		    		let wishno = current.data('wishno');
		    		
		    		$.post("${pageContext.request.contextPath}/05_wishlist/wishlist/item", {
		    			"userno": userno,
		    			"prodno": prodno,
		    			"wishno": wishno
		    		} , function(json) {
		    			if(json.rt=="OK")
		    				alert("상품이 위시리스트에 추가 되었습니다.");
		    				location.reload();
		    		})
				}else{
					let current = $(this); 
		    		let prodno = current.data('prodno');
		    		let wishno = current.data('wishno');
		    		
		    		$.delete("${pageContext.request.contextPath}/05_wishlist/wishlist/item", {
		    			"prodno": prodno,
		    			"wishno": wishno
		    		}, function(json) {
		    			if(json.rt=="OK")
		    				alert("상품이 위시리스트에서 삭제 되었습니다.");
		    				location.reload();
		    		})
				}	
				});
			
			});
		
		$(function(){
			var rating = $(".avg_all_star");
			rating.each(function(){
				var targetScore=$(this).attr('data-rate');
				$(this).find('svg:nth-child(-n+'+targetScore+')').css({color:'#172f50'});
			});
		});
		
		$(function(){
			var rating = $("#add_review_avgstar");
			rating.each(function(){
				var targetScore=$(this).attr('data-rate');
				$(this).find('svg:nth-child(-n+'+targetScore+')').css({color:'#172f50'});
			});
		});
			
		$(document).on("change",".add_score",function(){
			var easyscore = parseInt($('#write_es').val());
			var benescore = parseInt($('#write_bs').val());
			var qualscore = parseInt($('#write_qs').val());
			var apearscore = parseInt($('#write_as').val());
			var funcscore = parseInt($('#write_fs').val());
			
			var avg_star = Math.floor((easyscore+benescore+qualscore+apearscore+funcscore)/5);
			$("#add_review_avgstar").attr('data-rate' , avg_star);
			$("#add_review_avgstar").find('svg:nth-child(-n+6)').css({color:'#dee3e6'});
			$("#add_review_avgstar").find('svg:nth-child(-n+'+avg_star+')').css({color:'#172f50'});
			$("#avgscore").val(avg_star);
		});
		
		$(document).on("click",".add_review",function(){
			$(".custom_result").hide();
			$(".review_title_top").hide();
			$(".review_title_top").hide();
			$(".avg_custom_result").hide();
			$(".add_review").hide();
			$(".no_review").hide();
			$(".edit_review_box").hide();
			$("#add_review_box").show();
			
		});
		
		$(document).on("click",".review_write_close_button",function(){
			$(".custom_result").show();
			$(".review_title_top").show();
			$(".review_title_top").show();
			$(".avg_custom_result").show();
			$(".edit_review_box").hide();
			$(".add_review").show();
			$("#add_review_box").hide();
		});
		
		$(function() {
	    	//.add_wishlist_form에 대한 submit이벤트를 가로채서 Ajax 요청을 전송한다.
	    	$("#add_review_box").ajaxForm({
	    		//전송 메서드 지정
	    		method: "POST",
	    		//서버에서 200 응답을 전달한 경우 실행됨
	    		success: function(json){
	    			//json에 포함된 데이터를 활용하여 상세페이지로 이동한다.
	    			if(json.rt == "OK"){
	    				console.log(json);
	    				alert("리뷰가 작성 되었습니다.");
	    				
	    				location.reload();
	    			}
	    		}
	    	});
	    	
	    });
		
		 // 리뷰 삭제
		 $(document).on("click",".revdelete",function(){
			    let current = $(this); 
	    		let reviewno = current.data('reviewno');
	    		var result = confirm("정말 리뷰를 삭제하시겠습까?");
	    		if(result){
	    			$.delete("${pageContext.request.contextPath}/04_review/review", {
		    			"reviewno": reviewno
		    		}, function(json) {
		    			if(json.rt=="OK")
		    			alert("리뷰가 삭제되었습니다.");
		    			location.reload();
		    		})
	    		}
		 });
		
		 //리뷰 수정
		 $(document).on("change",".edit_score",function(){
			 var current = $(this).parents(".ratebar_box");
			var easyscore = parseInt(current.find('.avg_easysccore').val());
			current.find('.avg_easysccore').next().html(easyscore);
			var benescore = parseInt(current.find('.avg_benesccore').val());
			current.find('.avg_benesccore').next().html(benescore);
			var qualscore = parseInt(current.find('.avg_qualsccore').val());
			current.find('.avg_qualsccore').next().html(qualscore);
			var apearscore = parseInt(current.find('.avg_apearsccore').val());
			current.find('.avg_apearsccore').next().html(apearscore);
			var funcscore = parseInt(current.find('.avg_funcsccore').val());
			current.find('.avg_funcsccore').next().html(funcscore);
			
			var avg_star = Math.floor((easyscore+benescore+qualscore+apearscore+funcscore)/5);
			var avg = current.find(".edit_avgstar");
			avg.attr('data-rate' , avg_star);
			avg.find('svg:nth-child(-n+6)').css({color:'#dee3e6'});
			avg.find('svg:nth-child(-n+'+avg_star+')').css({color:'#172f50'});
			avg.next().val(avg_star);
		});
		 
		 $(function() {
		    	//.add_wishlist_form에 대한 submit이벤트를 가로채서 Ajax 요청을 전송한다.
		    	$(".edit_review_form").ajaxForm({
		    		//전송 메서드 지정
		    		method: "PUT",
		    		//서버에서 200 응답을 전달한 경우 실행됨
		    		success: function(json){
		    			//json에 포함된 데이터를 활용하여 상세페이지로 이동한다.
		    			if(json.rt == "OK"){
		    				console.log(json);
		    				alert("리뷰가 수정 되었습니다.");
		    				
		    				location.reload();
		    			}
		    		}
		    	});
		    });
		 
		 $(document).on("click",".revedit",function(){
			 	$(".custom_result").hide();
				$(".review_title_top").hide();
				$(".avg_custom_result").hide();
				$(".add_review").hide();
				$(".no_review").hide();
				$("#add_review_box").hide();
				$(this).parents(".review_parent").find(".edit_review_box").show();
				
			});
		 
		// 1개 상품만 장바구니로 옮기기
		 $(document).on("click","#addCartDetail",function(){
			 	let current = $(this); 
	    		let userno = current.data('userno');
	    		let prodno = current.data('prodno');
				if(userno=='0'){
					alert("로그인을 먼저 해주세요.")
				}else{
		    		$.post("${pageContext.request.contextPath}/06_cart/cart", {
		    			"userno": userno,
		    			"prodno": prodno,
		    		}, function(json) {
		    			if(json.rt=="OK")
		    				alert("상품이 장바구니에 추가 되었습니다.");
		    				location.reload(); // 장바구니로 이동 수정 예
		    		})
				}
		 });
		
		 /** 추천제품 - 장바구니 클릭 */
			$(document).on("click",".home_cartloc",function() {
			    let current = $(this); 
			  		let userno = current.data('userno');
			  		let prodno = current.data('prodno');
			  		
			  		$.post("${pageContext.request.contextPath}/06_cart/cart", {
			  			"userno": userno,
			  			"prodno": prodno,
			  		}, function(json) {
			  			if(json.rt=="OK")
			  				alert("상품이 장바구니에 추가 되었습니다.");
			  				location.reload();
			  		})
			});
		 
			/** 추천제품 - 위시리스트 클릭 */
			$(document).on("change",".home_wishlist_loc > .chk_heart",function() {
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
		 
	</script>
</body>
</html>