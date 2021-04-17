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
    <link rel="shortcut icon" href="../assets/img/laporte_favi.png" />
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <!-- stylesheet -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin_common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin_qanda.css">
    <!-- handlebar plugin -->
    <script src="${pageContext.request.contextPath}/assets/plugins/handlebars/handlebars-v4.0.11.js"></script>
    <!-- javascript -->
    <script src="http://code.jquery.com/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <!-- ajax-helper -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.css" />
    <script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
</head>

<body>
    <section>
        <nav id="navbar-white" class="navbar navbar-default navbar-fixed-top clearfix" role="navigation">
            <div class="navbar-header pull-left">
                <button class="slidebar-toggle" id="menu-toggle">
                    <span class="sr-only">Toggle sidebar</span> <span class="icon-bar"></span>
                    <span class="icon-bar"></span> <span class="icon-bar"></span>
                </button>
                <span><a class="navbar-brand" href="${pageContext.request.contextPath}/11_admin/admin_home.do">HOME</a></span>
            </div>
            <div class="navbar-button pull-right">
				<a href="${pageContext.request.contextPath}/11_admin/admin_logout.do" class="nav_logout_btn">LOGOUT</a>
			</div>
			
        </nav>
        <div id="wrapper">
            <!-- Sidebar -->
            <div id="slidebar-white" class="slidebar-nav">
                <nav id="navbar-white" class="navbar navbar-default" role="navigation">
                    <ul class="nav navbar-nav">
                        <li class="brand_logo_box">
                            <a href="#" class="brand_logo">
                                <span id="logo_img">la porte</span>
                            </a>
                        </li>
                        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-edit"></i>
                                홈 퍼블리싱 예약관리 <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="${pageContext.request.contextPath}/11_admin/admin_resvappv.do">
                                        <i class="glyphicon glyphicon-ok"></i>
                                        예약 승인
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-tags"></i>
                                제품 관리 <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="${pageContext.request.contextPath}/11_admin/stock_management.do">
                                        <i class="glyphicon glyphicon-briefcase"></i> 상품 관리</a></li>
                                <li><a href="${pageContext.request.contextPath}/11_admin/product_add.do">
                                        <i class="glyphicon glyphicon-plus"></i> 상품 등록</a></li>
                                <li><a href="${pageContext.request.contextPath}/11_admin/admin_review.do">
                                        <i class="glyphicon glyphicon-star-empty"></i> 리뷰 관리</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="glyphicon glyphicon-user"></i>
                                고객 관리 <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="${pageContext.request.contextPath}/11_admin/admin_userlist.do">
                                        <i class="glyphicon glyphicon-user"></i> 회원정보 관리</a></li>
                                <li><a href="${pageContext.request.contextPath}/11_admin/admin_order.do">
                                        <i class="glyphicon glyphicon-shopping-cart"></i> 주문내역 관리</a></li>
                                <li><a href="${pageContext.request.contextPath}/11_admin/admin_delivery.do">
                                        <i class="glyphicon glyphicon-transfer"></i> 배송정보 관리</a></li>
                                <li><a href="${pageContext.request.contextPath}/11_admin/admin_cancel.do">
                                        <i class="glyphicon glyphicon-retweet"></i> 취소/교환/반품/환불</a></li>
                                <li><a href="${pageContext.request.contextPath}/11_admin/admin_coupon.do">
                                        <i class="glyphicon glyphicon-credit-card"></i> 쿠폰 </a></li>
                            </ul>
                        </li>
                        <li class="dropdown open">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="glyphicon glyphicon-pencil"></i>
                                문의 관리 <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="active"><a href="${pageContext.request.contextPath}/11_admin/admin_qanda.do">
                                        <i class="glyphicon glyphicon-envelope"></i> 이메일 문의 관리</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
                <!--/.navbar -->
            </div>
            <!--/.sidebar-nav -->
            <div id="page-wrapper6">
                <!-- Content Header (Page header) -->
                <div class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h2 class="m-0">이메일문의 관리</h2>
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-6 clearfix">
                                <ol class="breadcrumb pull-right">
                                    <li class="breadcrumb-item"><a href="admin_home.html">홈</a></li>
                                    <li class="breadcrumb-item active">이메일문의 관리</li>
                                </ol>
                            </div>
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.container-fluid -->
                </div>
                <!-- Page Content -->
                <div class="content_wrapper">
                    <div class="container-fluid">
                        <!--본문 작성 영역-->
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">이메일문의 목록</h4>
                                    </div>
                                    <!-- /.card-header 끝 -->
                                    <!-- card-body  -->
                                    <div class="card-body">
                                        <!---------- 조건 검색 목록 ---------->
                                        <table class="table table-bordered search_table">
                                            <tr>
                                                <td class="search_title">카테고리 분류
                                                <td>
                                                    <form class="form-inline">
                                                        <div class="form-group">
                                                            <select id="parent" name="category" class="form-control">
                                                                <option value="">--전체보기--</option>
                                                                <option value="O">온라인 주문</option>
                                                                <option value="C">교환환불</option>
                                                                <option value="S">laporte 서비스</option>
                                                                <option value="P">제품정보</option>
                                                                <option value="A">laporte 웹사이트 이용 약관</option>
                                                            </select>
                                                        </div>
                                                    </form>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="search_title">답변 상태</td>
                                                <td>
                                                    <form class="form-inline">
                                                        <div class="form-group">
                                                            <select id="search_condition" name="status" class="form-control">
                                                                <option value="">---선택---</option>
                                                                <option value="W">답변대기</option>
                                                                <option value="A">답변완료</option>
                                                            </select>
                                                        </div>
                                                    </form>
                                                </td>
                                            </tr>
                                        </table>
                                        <button class="btn btn-block btn-info search_btn">검색</button>
                                        <!-- 조건 검색 목록 끝  -->
                                        <table class="table table-bordered qanda_table">
                                            <thead>
                                                <tr class="qanda_table_color">
                                                    <th>카테고리</th>
                                                    <th>작성일</th>
                                                    <th>작성자이름</th>
                                                    <th>이메일 주소</th>
                                                    <th>파일</th>
                                                    <th>문의내용</th>
                                                    <th>답변상태</th>
                                                    <td>기능</td>
                                                </tr>
                                            </thead>
                                            <tbody id="qanda_list">
                                                <c:choose>
                                                    <c:when test="${output == null || fn:length(output) == 0}">
                                                        <tr>
                                                            <td colspan="8" align="center">조회결과가 없습니다. </td>
                                                        </tr>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:forEach var="item" items="${output}" varStatus="status">
                                                            <tr>
                                                                <td>
                                                                    <c:if test="${item.category == 'O'}">
                                                                        온라인 주문
                                                                    </c:if>
                                                                    <c:if test="${item.category == 'C'}">
                                                                        교환환불
                                                                    </c:if>
                                                                    <c:if test="${item.category == 'S'}">
                                                                        laporte 서비스
                                                                    </c:if>
                                                                    <c:if test="${item.category == 'P'}">
                                                                        제품정보
                                                                    </c:if>
                                                                    <c:if test="${item.category == 'A'}">
                                                                        laporte 서비스 이용약관
                                                                    </c:if>
                                                                </td>
                                                                <td>${item.regdate}</td>
                                                                <td>${item.name}</td>
                                                                <td>${item.email}</td>
                                                                <c:choose>
                                                                    <c:when test="${item.file == null}">
                                                                        <td>첨부파일없음</td>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <td><a href="#" class="file_large" data-emailno="${item.emailno}" data-toggle="modal" data-target="#myModal">첨부파일보기</a>
                                                                        </td>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <td>${item.content}</td>
                                                                <c:choose>
                                                                    <c:when test="${item.status == 'W'}">
                                                                        <td class="answer_status">답변대기</td>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <td class="answer_status">답변완료</td>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <td class="clear">
                                                                    <a type="button" data-emailno="${item.emailno}" class="btn btn-warning btn-xs review_list_answer">답변</a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:otherwise>
                                                </c:choose>
                                            </tbody>
                                        </table>
                                        <form id="email-answer" action="${pageContext.request.contextPath}/09_cs">
                                            <table class="answer_box table table-bordered qanda_info_table">
                                                <tr>
                                                    <td class="info_table_color">문의번호</td>
                                                   <td>
                                                        <div class="form-inline">
                                                            <input type="text" id="this_emailno" name="emailno" class="form-control" readonly />
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="info_table_color">답변 내용</td>
                                                    <td>
                                                        <div class="form-inline">
                                                            <input type="text" name="answer" id="qanda_notes" class="form-control"></input>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                            <div class="btn_box">
                                                <button type="submit" id="answer_save" class="btn btn-block btn-primary btn-md">등록</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card 끝 -->
        </div>
        <!-- modal -->
        <div class="modal fade" id="myModal">
            <div class="post_modify_display">
                <div class="post_modify_content">
                    <div class="post_modify_header">
                        <button class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">첨부파일</h4>
                        <!-- Handlebar 탬플릿 코드 -->
                    </div>
                    <div class="post_modify_body">
                    </div>
                </div>
            </div>
        </div>
    </section>
    <footer></footer>
  <script id="email-list-tmpl" type="text/x-handlebars-template">
        {{#each email_list}}
                                                
                                                    <tr>
                                                        <td>{{email_category category}}</td>
                                                        
                                                        <td>{{regdate}}</td>
                                                        <td>{{name}}</td>
                                                        <td>{{email}}</td>

                                                        {{#if file}}
                                                        <td><a href="#" class="file_large" data-emailno ="{{emailno}}" data-toggle="modal" data-target="#myModal">첨부파일보기</a></td>
                                                        {{else}}
                                                        <td>첨부파일없음</td>
                                                        {{/if}}

                                                        <td>{{content}}</td>
                                                            
                                                            <td>{{email_status status}}</td>
                                                            
                                                
                                                    
                                                        <td class="clear">
                                                            <a type="button" data-emailno="{{emailno}}"
                                                                class="btn btn-warning btn-xs review_list_answer">답변</a>
                                                        </td>
                                                    </tr>
                                                                
                                            {{/each}}
                        
                   </script>
    <script id="email-item-tmpl" type="text/x-handlebars-template">
        <tbody id="post_list">
                                            <tr>
                                            <td><img class="file_size" src="{{email_item.file}}" /></td>
                                            </tr>
                                        </tbody>
                        
                   </script>
                   
                      <!-- jQuery Ajax Setup -->
    <!--Google CDN 서버로부터 jQuery 참조 -->
    <!-- jQuery Ajax Form plugin CDN -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
    <!-- Handlebar CDN 참조 -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.4.2/handlebars.min.js"></script>
   
    <script type="text/javascript">
    Handlebars.registerHelper('email_category', function(options) {

        if (this.category == 'O') {
            return "온라인 주문";
        } else if (this.category == 'C') {
            return "교환환불";
        } else if (this.category == 'S') {
            return "laporte 서비스";
        } else if (this.categroy == 'P') {
            return "제품정보";
        } else {
            return "laporte 웹사이트 이용 약관";
        }
    });

    Handlebars.registerHelper('email_status', function(options) {
        if (this.status == 'W') {
            return "답변대기";
        } else {
            return "답변완료";
        }
    });

    Handlebars.registerHelper('email_file', function(options) {
        if (this.file != 'null') {
            return options.fn(this);
        } else {
            return options.inverse(this);
        }
    });

    $(document).ready(function() {
        $('.answer_box').hide()
        $('.btn_box').hide()
    });

    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });

    $(function() {

        //검색 클릭 시
        $('.search_btn').click(function(e) {
            e.preventDefault();

            var category = $('#parent > option:selected').val();
            var status = $('#search_condition > option:selected').val();

            //Restful API에 GET 방식 요청
            $.get("${pageContext.request.contextPath}/09_cs", {
                "category": category,
                "status": status
            }, function(json) {
                var list_source = $("#email-list-tmpl").html();
                var list_template = Handlebars.compile(list_source);
                var list_result = list_template(json);
                $("#qanda_list").empty();
                $("#qanda_list").append(list_result);

            })
        });


        $(document).on("click", ".review_list_answer", function(e) {
            e.preventDefault();

            let click = $(this);
            let emailno = click.data('emailno');
            let insert_emailno = $('#this_emailno').val(emailno);

            $('.answer_box').show()
            $('.btn_box').show()
        });

        //put 메서드로 ajax 요청
        $('#email-answer').ajaxForm({
            // 전송 메서드 지정
            method: "PUT",
            // 서버에서 200 응답을 전달한 경우 실행됨
            success: function(json) {
                console.log(json);

                // json 결과가 OK일 시 로그인 페이지로 이동한다.
                if (json.rt == "OK") {
                    alert("이메일 문의 답변이 완료 되었습니다.");
                    location.reload();
                }
            }
        });

        //첨부파일보기 클릭 시
        $(document).on("click", ".file_large", function(e) {
            e.preventDefault();

            var current = $(this);
            var emailno = current.data('emailno');

            //Restful API에 GET 방식 요청
            $.get("${pageContext.request.contextPath}/09_cs", {
                "emailno": emailno
            }, function(json) {
                var source = $("#email-item-tmpl").html();
                var template = Handlebars.compile(source);
                var result = template(json);
                $(".post_modify_body").html(result);

            })
        });
    });
    </script>
</body>

</html>