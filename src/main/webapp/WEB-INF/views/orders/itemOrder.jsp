<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@include file="../common/header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/statics/style/orderItem.css">
    <title>메뉴상세페이지</title>
</head>
<body>
<main>
    <section class="deta_top">
        <div class="deta_page">
            <p>Menu Details</p>
            <p class="deta_page_info">
                메뉴의 자세한 정보를 알려드립니다.
            </p>
        </div>
    </section>
    <section class="deta_title">
        <p>메가 MGC 투명한 메뉴</p>
        <div class="deta_title_center">
            <span></span>
            <p>MEGA MENU</p>
            <span></span>
        </div>
        <p>*메뉴 이미지는 연출컷이라 실물과 다를수 있습니다.</p>
    </section>
    <section class="contents1">
        <div class="menuimg">
            <p><img src="${pageContext.request.contextPath}/resources/statics/img/${findItem.img}" alt=""></p>
            <p>${findItem.title}</p>
        </div>
        <div class="op">
            <ul>
                <li><p>컵 선택</p>
                    <ul class="sub">
                        <li><a href="#">일회용컵 사용</a></li>
                        <li><a href="#">텀블러 사용</a></li>
                        <li><a href="#">매장컵(먹고 갈게요)</a></li>
                    </ul>
                </li>
                <li><p>OPTION</p>
                    <ul class="sub">
                        <li><a href="#">ICE</a></li>
                        <li><a href="#">HOT</a></li>
                    </ul>
                </li>
                <li><p>SIZE</p>
                    <ul class="sub">
                        <li><a href="#">M(+0)</a></li>
                    </ul>
                </li>
            </ul>
            <div class="sum">
                <p></p><input type="text" value="${findItem.price}" id="sum"/></p>
                <div class="pm">
                    <a href="#"><img src="${pageContext.request.contextPath}/resources/statics/img/icon1.png" alt=""></a>
                    <p><input type="number" value=1></p>
                    <a href="#"><img src="${pageContext.request.contextPath}/resources/statics/img/icon2.png" alt=""></a>
                </div>
            </div>
        </div>
    </section>
</main>
</body>
<%@include file="../common/footer.jsp" %>
</html>