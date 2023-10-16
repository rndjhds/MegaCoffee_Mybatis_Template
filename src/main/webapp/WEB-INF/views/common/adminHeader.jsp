<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/statics/style/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/statics/style/index.css">
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.min.js"></script>
    <title>푸드 | 메가커피</title>
</head>
<body>
<header>
    <input type="hidden" id="memberType" name="memberType" value="${sessionScope.member.memberType}">
    <input type="hidden" id="permitStatus" name="permitStatus" value="${sessionScope.member.permitStatus}">
    <h1><a href="indexte.html"><img src="${pageContext.request.contextPath}/resources/statics/test_img/header_logo.png" alt=""></a></h1>
    <nav>
        <ul class="main_nav">
            <li><a href="#">회원</a>
                <ul class="sub_nav">
                        <li><a href="/member/memberList">회원리스트</a></li>
                    <li><a href="/member/accessManager">가맹점주 승인</a></li>
                </ul>
            </li>
            <li><a href="/menu/menuView">메뉴</a>
                <ul class="sub_nav" id="menu">
                </ul>
            </li>
            <li><a href="">매장</a>
                <ul class="sub_nav">
                    <li><a href="/store/List">매장 관리</a></li>
                </ul>
            </li>
            <li><a href="#">판매 현환</a>
                <ul class="sub_nav">
                    <li><a href="/order/orderManagement">결제 요청</a></li>
                    <li><a href="/order/orderdItemList">판매 목록</a></li>
                </ul>
            </li>
            <li><a href="#">메가소식</a>
                <ul class="sub_nav">
                    <li><a href="#">공지사항</a></li>
                    <li><a href="#">이벤트</a></li>
                    <li><a href="#">FAQ</a></li>
                    <li><a href="./review.html">고객의 소리</a></li>
                </ul>
            </li>
            <li><a href="#">카테고리</a>
                <ul class="sub_nav">
                    <li><a href="/category/parentCategory">상위 카테고리</a></li>
                    <li><a href="/category/childCategory">하위 카테고리</a></li>
                </ul>
            </li>
        </ul>
    </nav>
    <div id="login">
        <a href="/member/logout">${sessionScope.member.memberId}</a>
    </div>
    <div class="bg0"></div>
</header>

<script src="${pageContext.request.contextPath}/resources/statics/js/index.js"></script>
<script>

    $.ajax({
        url: "/category/getHeaderCategory",
        type: "POST",
        dataType: "json",
        success: function (data) {
            for (let i = 0; i < data.length; i++) {
                $("#menu").append('<li><a href="/item/manageItemList/' + data[i].categoryId + '">' + data[i].categoryName + '</a></li>');
            }
        },
        error: function () {
            alert("에러");
        }
    });

</script>
</body>
</html>