<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@include file="../common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../resources/statics/style/menu.css">
    <link rel="stylesheet" href="../../resources/statics/style/reset.css">
    <link rel="stylesheet" href="../../resources/statics/style/index.css">
    <link rel="stylesheet" href="../../resources/statics/style/index_uiux.css">
    <title>메뉴 | 메가커피</title>
</head>
<body>
<!-- header -->
<main>
    <section id="content1">
        <div class="mainpage">
            <p>MEGA MENU</p>
            <p class="mainpage_info">
                행복을 선사하는 <em>다양한 음료</em><br>
                음료와 잘 어울리는 <em>다양한 디저트</em>
            </p>
            <div class="listbtn">
                <a href="/item/drinkView">음료</a>
                <a href="/item/foodView">푸드</a>
                <a href="/item/productView">상품</a>
            </div>
        </div>
    </section>
    <section id="content2">
        <div class="drink">
            <p>DRINK MENU</p>
            <span></span>
            <p>
                <em>깊고 부드러운 커피 맛의 비밀</em><br>
                행복을 선사하는 다양한 음료
            </p>
            <a href="/item/drinkView">음료 보러가기</a>
        </div>
        <span class="bar"></span>
    </section>
    <section id="content3">
        <div class="food">
            <p>FOOD MENU</p>
            <span></span>
            <p>
                <em>음료와 잘 어울리는</em><br>
                다양한 디저트
            </p>
            <a href="/item/foodView">푸드 보러가기</a>
        </div>
        <span class="bar"></span>
    </section>
    <section id="content4">
        <div class="product">
            <p>PRODUCT MENU</p>
            <span></span>
            <p>
                <em>MEGA</em><br>
                DAILY GOODS
            </p>
            <a href="/item/productView">상품 보러가기</a>
        </div>
        <span class="bar"></span>
    </section>
</main>
<!-- footer -->
<%@include file="../common/footer.jsp"%>
<script src="../../resources/statics/js/index.js"></script>
</body>
</html>