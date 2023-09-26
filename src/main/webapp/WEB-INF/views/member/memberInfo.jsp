<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/statics/style/memberInfo.css">
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.min.js"></script>
    <title>��������</title>
</head>
<body>
<main>
    <section class="user_top">
        <div class="user_page">
            <p>Account Settings</p>
            <p class="user_page_info">
                ���� ������
                ���͵帳�ϴ�.
            </p>
        </div>
    </section>
    <section class="user_title">
        <p>�ް� MGC�� ����</p>
        <div class="user_title_center">
            <span></span>
            <p>MEGA</p>
            <span></span>
        </div>
    </section>
    <section class="user_wrap">
        <div class="user_info">
            <h1>��������</h1>
            <div class="info">
                <label for="btn1">��������
                    <button id="btn1" type="button"><img
                            src="${pageContext.request.contextPath}/resources/statics/img/close.png">
                    </button>
                </label>
                <c:if test="${sessionScope.member.memberType == 'BUYER'}">
                <label for="btn2">�������� ���ο�û
                    <button id="btn2" type="button"><img
                            src="${pageContext.request.contextPath}/resources/statics/img/close.png">
                    </button>
                </label>
                </c:if>
                <label for="btn3">�α׾ƿ�
                    <button id="btn3" type="button"><img
                            src="${pageContext.request.contextPath}/resources/statics/img/close.png">
                    </button>
                </label>
                <label for="btn4">ȸ��Ż��
                    <button id="btn4" type="button"><img
                            src="${pageContext.request.contextPath}/resources/statics/img/close.png">
                    </button>
                </label>
            </div>
        </div>
    </section>
</main>
</body>

<script>

    $("#btn2").click(function () {
        if (confirm(("�������� ������ ��û�Ͻðڽ��ϱ�? ���� �Ϸ��� ������ �α����� �����մϴ�."))) {
            $.ajax({
                url: "/member/requestAccessManager",
                type:"post",
                dataType: "json",
                data: {
                    "memberId": "${sessionScope.member.memberId}"
                }, success: function (data) {
                    if (data > 0) {
                        alert("���ο�û�� �Ϸ� �Ǿ����ϴ�");
                    } else {
                        alert("���� ��û�� �����Ͽ����ϴ�.")
                    }
                }, error: function () {
                    alert("���� ��û ���� ������ �߻��Ͽ����ϴ�.");
                }
            });
        }
    });

    $("#btn3").click(function () {
        location.href = "/member/logout";
    });

    $("#btn4").click(function () {
        location.href = "/member/deleteMember";
    });

</script>

</html>