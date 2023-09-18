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
    <script src="../webjars/jquery/3.5.1/jquery.min.js"></script>
    <title>Ǫ�� | �ް�Ŀ��</title>
</head>
<body>
<header>
    <input type="hidden" id="memberType" name="memberType" value="${sessionScope.member.memberType}">
    <input type="hidden" id="permitStatus" name="permitStatus" value="${sessionScope.member.permitStatus}">
    <h1><a href="indexte.html"><img src="../../resources/statics/test_img/header_logo.png" alt=""></a></h1>
    <nav>
        <ul class="main_nav">
            <li><a href="#">ȸ��</a>
                <ul class="sub_nav">
                    <li><a href="/member/memberList">ȸ������Ʈ</a></li>
                    <li><a href="/member/accessManager">�������� ����</a></li>
                </ul>
            </li>
            <li><a href="/menu/menuView">�޴�</a>
                <ul class="sub_nav" id="menu">
                    <%--<li><a href="/menu/drinkView">�޴� ����</a></li>
                    <li><a href="/menu/drinkView">����</a></li>
                    <li><a href="/menu/foodView">Ǫ��</a></li>
                    <li><a href="/menu/productView">��ǰ</a></li>--%>
                </ul>
            </li>
            <li><a href="./map.html">����</a>
                <ul class="sub_nav">
                    <li><a href="/store/List">���� ����</a></li>
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
            <li><a href="#">ī�װ�</a>
                <ul class="sub_nav">
                    <li><a href="/category/parentCategory">���� ī�װ�</a></li>
                    <li><a href="/category/childCategory">���� ī�װ�</a></li>
                </ul>
            </li>
        </ul>
    </nav>
    <div id="login">
        <a href="/member/logout">${sessionScope.member.memberId}</a>
    </div>
    <div class="bg0"></div>
</header>

<script src="../../resources/statics/js/index.js"></script>
<script>

    $.ajax({
        url: "${pageContext.request.contextPath}/category/getHeaderCategory",
        type: "POST",
        dataType: "json",
        success: function (data) {
            for (let i = 0; i < data.length; i++) {
                $("#menu").append('<li><a href="/menu/drinkView/' + data[i].categoryId + '">' + data[i].categoryName + '</a></li>');
            }
        },
        error: function () {
            alert("����");
        }
    });

</script>
</body>
</html>