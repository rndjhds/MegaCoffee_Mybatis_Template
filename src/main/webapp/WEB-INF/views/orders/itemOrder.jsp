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
    <title>�޴���������</title>
</head>
<body>
<main>
    <section class="deta_top">
        <div class="deta_page">
            <p>Menu Details</p>
            <p class="deta_page_info">
                �޴��� �ڼ��� ������ �˷��帳�ϴ�.
            </p>
        </div>
    </section>
    <section class="deta_title">
        <p>�ް� MGC ������ �޴�</p>
        <div class="deta_title_center">
            <span></span>
            <p>MEGA MENU</p>
            <span></span>
        </div>
        <p>*�޴� �̹����� �������̶� �ǹ��� �ٸ��� �ֽ��ϴ�.</p>
    </section>
    <section class="contents1">
        <div class="menuimg">
            <p><img src="${pageContext.request.contextPath}/resources/statics/img/${findItem.img}" alt=""></p>
            <p>${findItem.title}</p>
        </div>
        <div class="op">
            <ul>
                <li><p>�� ����</p>
                    <ul class="sub">
                        <li><a href="#">��ȸ���� ���</a></li>
                        <li><a href="#">�Һ� ���</a></li>
                        <li><a href="#">������(�԰� ���Կ�)</a></li>
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