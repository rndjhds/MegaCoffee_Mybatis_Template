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
    <title>Ǫ�� | �ް�Ŀ��</title>
</head>
<body>
<header>
    <input type="hidden" id="memberType" name="memberType" value="${sessionScope.member.memberType}">
    <input type="hidden" id="permitStatus" name="permitStatus" value="${sessionScope.member.permitStatus}">
    <h1><a href="indexte.html"><img src="${pageContext.request.contextPath}/resources/statics/test_img/header_logo.png"
                                    alt=""></a></h1>
    <nav>
        <ul class="main_nav">
            <c:if test="${sessionScope.member.memberType ne 'ADMIN'}">
                <li><a href="#">�ް����丮</a>
                    <ul class="sub_nav">
                        <li><a href="#">�귣��</a></li>
                        <li><a href="#">BI</a></li>
                    </ul>
                </li>
            </c:if>
            <c:if test="${sessionScope.member.memberType eq 'ADMIN'}">
                <li><a href="#">ȸ��</a>
                    <ul class="sub_nav">
                        <li><a href="/member/memberList">ȸ������Ʈ</a></li>
                        <li><a href="/member/accessManager">�������� ����</a></li>
                    </ul>
                </li>
            </c:if>
            <li><a href="#">�޴��Ұ�</a>
                <ul class="sub_nav" id="menu">
                </ul>
            </li>
            <li><a href="#">����</a>
                <c:if test="${sessionScope.member.memberType ne 'ADMIN'}">
                    <ul class="sub_nav">
                        <li><a href="/store/storeLocation">���� ã��</a></li>
                    </ul>
                </c:if>
                <c:if test="${sessionScope.member.memberType eq 'ADMIN'}">
                    <ul class="sub_nav">
                        <li><a href="/store/List">���� ����</a></li>
                    </ul>
                </c:if>
            </li>
            <c:if test="${sessionScope.member.memberType ne 'ADMIN'}">
                <li><a href="#">�Ǹ�</a>
                    <ul class="sub_nav">
                        <li><a href="/basket/myBasketList">��ٱ���</a></li>
                        <li><a href="#">���� ���</a></li>
                    </ul>
                </li>
            </c:if>
            <c:if test="${sessionScope.member.memberType eq 'ADMIN' or 'MANAGER'}">
                <li><a href="#">�Ǹ� ��Ȳ</a>
                    <ul class="sub_nav">
                        <c:if test="${sessionScope.member.memberType eq 'MANAGER'}">
                            <li><a href="/order/orderManagement">���� ��û</a></li>
                        </c:if>
                        <li><a href="/order/orderdItemList">�Ǹ� ���</a></li>
                    </ul>
                </li>
            </c:if>

            <li><a href="#">�ް��ҽ�</a>
                <ul class="sub_nav">
                    <li><a href="#">��������</a></li>
                    <li><a href="#">�̺�Ʈ</a></li>
                    <li><a href="#">FAQ</a></li>
                    <li><a href="#">���� �Ҹ�</a></li>
                </ul>
            </li>
            <c:if test="${sessionScope.member.memberType ne 'ADMIN'}">
                <li><a href="#">ä��</a>
                    <ul class="sub_nav">
                        <li><a href="#">ä��ȳ�</a></li>
                    </ul>
                </li>
            </c:if>
            <c:if test="${sessionScope.member.memberType eq 'ADMIN'}">
                <li><a href="#">ī�װ�</a>
                    <ul class="sub_nav">
                        <li><a href="/category/parentCategory">���� ī�װ�</a></li>
                        <li><a href="/category/childCategory">���� ī�װ�</a></li>
                    </ul>
                </li>
            </c:if>
        </ul>
    </nav>
    <div id="login">
        <c:choose>
            <c:when test="${empty sessionScope}">
                <a href="/member/loginForm">�α���</a>
            </c:when>
            <c:otherwise>
                <a href="/member/info">${sessionScope.member.username}</a>
            </c:otherwise>
        </c:choose>
        <a href="#" id="managerLogin">������ �α���</a>
    </div>
    <div class="bg0"></div>
</header>

<script src="${pageContext.request.contextPath}/resources/statics/js/index.js"></script>
<script>

    $(document).ready(function () {
        $.ajax({
            url: "/category/getHeaderCategory",
            type: "GET",
            dataType: "json",
            success: function (data) {
                if (data.length != 0) {
                    for (let i = 0; i < data.length; i++) {
                        if(${sessionScope.member.memberType ne 'ADMIN'}) {
                            $("#menu").append('<li><a href="/item/ItemList/' + data[i].categoryId + '">' + data[i].categoryName + '</a></li>');
                        } else {
                            $("#menu").append('<li><a href="/item/manageItemList/' + data[i].categoryId + '">' + data[i].categoryName + '</a></li>');
                        }
                    }
                }
            },
            error: function () {
                alert("����");
            }
        })
    });


    $("#managerLogin").click(function () {
        const memberType = $("#memberType").val();
        const permitStatus = $("#permitStatus").val();

        if (memberType == "BUYER" && permitStatus == "WAIT") {
            alert("���翡�� Ȯ�����Դϴ�.");
        } else if (memberType === "MANAGER") {
            alert("ȯ���մϴ�. �����ڴ�");
            return false;
            // ���� ������ ������ �ۼ� �� ������ �������� �̵��� ����
        }
        location.href = "/member/manager";
    })

</script>
</body>
</html>