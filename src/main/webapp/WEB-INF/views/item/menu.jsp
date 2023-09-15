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
    <title>�޴� | �ް�Ŀ��</title>
</head>
<body>
<!-- header -->
<main>
    <section id="content1">
        <div class="mainpage">
            <p>MEGA MENU</p>
            <p class="mainpage_info">
                �ູ�� �����ϴ� <em>�پ��� ����</em><br>
                ����� �� ��︮�� <em>�پ��� ����Ʈ</em>
            </p>
            <div class="listbtn">
                <a href="/item/drinkView">����</a>
                <a href="/item/foodView">Ǫ��</a>
                <a href="/item/productView">��ǰ</a>
            </div>
        </div>
    </section>
    <section id="content2">
        <div class="drink">
            <p>DRINK MENU</p>
            <span></span>
            <p>
                <em>��� �ε巯�� Ŀ�� ���� ���</em><br>
                �ູ�� �����ϴ� �پ��� ����
            </p>
            <a href="/item/drinkView">���� ��������</a>
        </div>
        <span class="bar"></span>
    </section>
    <section id="content3">
        <div class="food">
            <p>FOOD MENU</p>
            <span></span>
            <p>
                <em>����� �� ��︮��</em><br>
                �پ��� ����Ʈ
            </p>
            <a href="/item/foodView">Ǫ�� ��������</a>
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
            <a href="/item/productView">��ǰ ��������</a>
        </div>
        <span class="bar"></span>
    </section>
</main>
<!-- footer -->
<%@include file="../common/footer.jsp"%>
<script src="../../resources/statics/js/index.js"></script>
</body>
</html>