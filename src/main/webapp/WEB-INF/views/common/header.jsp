<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
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
    <h1><a href="indexte.html"><img src="${pageContext.request.contextPath}/resources/statics/test_img/header_logo.png"
                                    alt=""></a></h1>
    <nav>
        <ul class="main_nav">
            <li><a href="#">메가스토리</a>
                <ul class="sub_nav">
                    <li><a href="#">브랜드</a></li>
                    <li><a href="#">BI</a></li>
                    <li><a href="./map.html">오시는길</a></li>
                </ul>
            </li>
            <li><a href="#">메뉴소개</a>
                <ul class="sub_nav" id="menu">
                </ul>
            </li>
            <li><a href="./map.html">매장</a>
                <ul class="sub_nav">
                    <li><a href="./map.html">매장 찾기</a></li>
                </ul>
            </li>
            <li><a href="#">판매</a>
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
            <li><a href="#">채용</a>
                <ul class="sub_nav">
                    <li><a href="#">채용안내</a></li>
                </ul>
            </li>
        </ul>
    </nav>
    <div id="login">
        <c:choose>
            <c:when test="${empty sessionScope}">
                <a href="/member/login">로그인</a>
            </c:when>
            <c:otherwise>
                <a href="/member/info">${sessionScope.member.memberId}</a>
            </c:otherwise>
        </c:choose>
        <a href="#" id="managerLogin">가맹점 로그인</a>
    </div>
    <div class="bg0"></div>
</header>

<script src="${pageContext.request.contextPath}/resources/statics/js/index.js"></script>
<script>

    $(document).ready(function () {
        $.ajax({
            url: "/category/getHeaderCategory",
            type: "POST",
            dataType: "json",
            success: function (data) {
                for (let i = 0; i < data.length; i++) {
                    $("#menu").append('<li><a href="/item/ItemList/' + data[i].categoryId + '">' + data[i].categoryName + '</a></li>');
                }
            },
            error: function () {
                alert("에러");
            }
        })
    });

    $("#managerLogin").click(function () {
        const memberType = $("#memberType").val();
        const permitStatus = $("#permitStatus").val();

        if (memberType === "BUYER" && permitStatus === "WAIT") {
            alert("본사에서 확인중입니다.");
        } else if (memberType === "MANAGER") {
            alert("환영합니다. 관리자님");
            return false;
            // 추후 관리자 페이지 작성 후 관리자 페이지로 이동할 예정
        }
        location.href="/member/manager";
    })

</script>
</body>
</html>