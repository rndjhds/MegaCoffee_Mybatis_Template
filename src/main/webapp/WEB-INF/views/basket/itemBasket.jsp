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
    <title>�޴� ��ٱ���</title>
</head>
<body>
<main>
    <section class="deta_top">
        <div class="deta_page">
            <p>Basket</p>
            <p class="deta_page_info">
                �����Ͻ� ��ǰ��
                �Ѵ��� Ȯ���ϼ���.
            </p>
        </div>
    </section>
    <section class="deta_title">
        <p>�ް� MGC�� ���� �޴�</p>
        <div class="deta_title_center">
            <span></span>
            <p>MEGA MENU</p>
            <span></span>
        </div>
        <p>*�޴� �̹����� �������̶� �ǹ��� �ٸ��� �ֽ��ϴ�.</p>
    </section>
    <section class="contents1">
        <div class="menu1">
            <p><img src="${pageContext.request.contextPath}/resources/statics/img/drink_1.jpg" alt=""></p>
            <div class="op">
                <div class="infowrap">
                    <div class="info_title">
                        <h1>���� �ٳ��� ��ġ ������</h1>
                        <a href="#">����</a>
                    </div>
                    <div class="info">
                        <p>��ȸ���� ���</p>
                        <p>ICE</p>
                        <p>M(+0)</p>
                    </div>
                </div>
                <div class="sum">
                    <p>4,500��</p>
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
                        <h1>���� ������ �ݶ� ������</h1>
                        <a href="#">����</a>
                    </div>
                    <div class="info">
                        <p>��ȸ���� ���</p>
                        <p>ICE</p>
                        <p>M(+0)</p>
                    </div>
                </div>
                <div class="sum">
                    <p>4,500��</p>
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