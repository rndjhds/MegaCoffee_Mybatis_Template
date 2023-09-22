<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@include file="../common/header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/statics/style/itemBasket.css">
    <title>메뉴 장바구니</title>
</head>
<body>
<main>
    <section class="deta_top">
        <div class="deta_page">
            <p>Basket</p>
            <p class="deta_page_info">
                선택하신 상품을
                한눈에 확인하세요.
            </p>
        </div>
    </section>
    <section class="deta_title">
        <p>메가 MGC의 선택 메뉴</p>
        <div class="deta_title_center">
            <span></span>
            <p>MEGA MENU</p>
            <span></span>
        </div>
        <p>*메뉴 이미지는 연출컷이라 실물과 다를수 있습니다.</p>
    </section>
    <section class="contents1">
        <div class="menu1">
            <p><img src="${pageContext.request.contextPath}/resources/statics/img/drink_1.jpg" alt=""></p>
            <div class="op">
                <div class="infowrap">
                    <div class="info_title">
                        <h1>민초 바나나 김치 스무디</h1>
                        <a href="#">삭제</a>
                    </div>
                    <div class="info">
                        <p>일회용컵 사용</p>
                        <p>ICE</p>
                        <p>M(+0)</p>
                    </div>
                </div>
                <div class="sum">
                    <p>4,500원</p>
                    <div class="pm">
                        <a href="#"><img src="${pageContext.request.contextPath}/resources/statics/img/icon1.png" alt=""></a>
                        <p>1</p>
                        <a href="#"><img src="${pageContext.request.contextPath}/resources/statics/img/icon2.png" alt=""></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="menu2">
            <p><img src="${pageContext.request.contextPath}/resources/statics/img/drink_2.jpg" alt=""></p>
            <div class="op">
                <div class="infowrap">
                    <div class="info_title">
                        <h1>망고 마라탕 콜라 스무디</h1>
                        <a href="#">삭제</a>
                    </div>
                    <div class="info">
                        <p>일회용컵 사용</p>
                        <p>ICE</p>
                        <p>M(+0)</p>
                    </div>
                </div>
                <div class="sum">
                    <p>4,500원</p>
                    <div class="pm">
                        <a href="#"><img src="${pageContext.request.contextPath}/resources/statics/img/icon1.png" alt=""></a>
                        <p>1</p>
                        <a href="#"><img src="${pageContext.request.contextPath}/resources/statics/img/icon2.png" alt=""></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
</body>
<%@include file="../common/footer.jsp" %>
</html>