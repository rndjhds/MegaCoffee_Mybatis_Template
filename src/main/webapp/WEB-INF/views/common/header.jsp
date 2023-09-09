<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../resources/statics/style/reset.css">
    <link rel="stylesheet" href="../../resources/statics/style/index.css">
    <title>Ǫ�� | �ް�Ŀ��</title>
</head>
<body>
<header>
    <h1><a href="indexte.html"><img src="../../resources/statics/test_img/header_logo.png" alt=""></a></h1>
    <nav>
        <ul class="main_nav">
            <li><a href="#">�ް����丮</a>
                <ul class="sub_nav">
                    <li><a href="#">�귣��</a></li>
                    <li><a href="#">BI</a></li>
                    <li><a href="./map.html">���ô±�</a></li>
                </ul>
            </li>
            <li><a href="/menu/menuView">�޴��Ұ�</a>
                <ul class="sub_nav">
                    <li><a href="/menu/drinkView">����</a></li>
                    <li><a href="/menu/foodView">Ǫ��</a></li>
                    <li><a href="/menu/productView">��ǰ</a></li>
                </ul>
            </li>
            <li><a href="./map.html">����</a>
                <ul class="sub_nav">
                    <li><a href="./map.html">���� ã��</a></li>
                </ul>
            </li>
            <li><a href="#">â���ȳ�</a>
                <ul class="sub_nav">
                    <li><a href="#">�������</a></li>
                    <li><a href="#">���׸���</a></li>
                    <li><a href="#">â������</a></li>
                </ul>
            </li>
            <li><a href="#">�ް��ҽ�</a>
                <ul class="sub_nav">
                    <li><a href="#">��������</a></li>
                    <li><a href="#">�̺�Ʈ</a></li>
                    <li><a href="#">FAQ</a></li>
                    <li><a href="./review.html">���� �Ҹ�</a></li>
                </ul>
            </li>
            <li><a href="#">ä��</a>
                <ul class="sub_nav">
                    <li><a href="#">ä��ȳ�</a></li>
                </ul>
            </li>
        </ul>
    </nav>
    <div id="login">
        <c:choose>
            <c:when test="${empty sessionScope}">
                <a href="/member/login">�α���</a>
            </c:when>
            <c:otherwise>
                <a href="/member/logout">${sessionScope.member.memberId}</a>
            </c:otherwise>
        </c:choose>
        <a href="#">������ �α���</a>
    </div>
    <div class="bg0"></div>
</header>

<script src="../../resources/statics/js/index.js"></script>
</body>
</html>