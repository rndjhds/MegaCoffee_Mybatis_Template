<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../resources/statics/style/reset.css">
    <link rel="stylesheet" href="../../resources/statics/style/register.css">
    <script src="../webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
    <title>ȸ������</title>
</head>
<body>
<main>
    <div>
        <form>
            <input type="hidden" name="memberTypeChk" id="memberTypeChk" value="${member.memberType}">
            <input type="hidden" name="permitStatusChk" id="permitStatusChk" value="${member.permitStatus}">
            <input type="hidden" name="deleteChk" id="deleteChk" value="${member.deleteYN}">
            <fieldset>
                <label for="memberId">���̵�
                    <input type="text" id="memberId" name="memberId" readonly value="${member.memberId}">
                </label>
                <label for="username">ȸ���̸�
                    <input type="text" id="username" name="username" value="${member.username}">
                </label>
                <label for="email">�̸���
                    <input type="email" id="email" name="email" value="${member.email}">
                </label>
                <label for="memberType">ȸ�� Ÿ��</label>
                <select name="memberType" id="memberType">
                    <c:forEach var="memberType" items="${memberType}">
                        <option value="${memberType}">${memberType}</option>
                    </c:forEach>
                </select>
                <label for="permitStatus">���� ����</label>
                <select name="permitStatus" id="permitStatus">
                    <c:forEach var="permitStatus" items="${permitStatus}">
                        <option value="${permitStatus}">${permitStatus}</option>
                    </c:forEach>
                </select>
                <label for="deleteYN">���� ����</label>
                <select name="deleteYN" id="deleteYN">
                    <option value="Y">����</option>
                    <option value="N">����X</option>
                </select>
                <button type="submit">ȸ������</button>
            </fieldset>
        </form>
    </div>
</main>

<script>

    $(document).ready(function () {
        let deleteChk = $("#deleteChk").val();
        $("#deleteYN").val(deleteChk).prop("selected", true);

        let permitStatusChk = $("#permitStatusChk").val();
        $("#permitStatus").val(permitStatusChk).prop("selected", true);

        let memberTypeChk = $("#memberTypeChk").val();
        $("#memberType").val(memberTypeChk).prop("selected", true);


        $("form").validate({
            rules: {
                username: {
                    required: true
                },
                email: {
                    required: true,
                    email: true
                },
                memberType: {
                    required: true
                },
                permitStatus: {
                    required: true
                },
                deleteYN: {
                    required: true
                }
            },
            messages: {
                username: {
                    required: "ȸ������ �Է��ؾ� �մϴ�."
                },
                email: {
                    required: "�̸����� �Է����ּ���.",
                    email: "�̸��� ��Ģ�� ��߳��ϴ�."
                },
                memberType: {
                    required: "��������� Ŭ�����ּ���"
                },
                permitStatus: {
                    required: "�������¸� Ŭ�����ּ���"
                },
                deleteYN: {
                    required: "�������θ� Ŭ�����ּ���"
                }
            },
            submitHandler: function () {
                $.ajax({
                    url: "${pageContext.request.contextPath}/member/updateMember",
                    contentType: "application/json; charset-utf-8",
                    type: "POST",
                    dataType: "json",
                    data: JSON.stringify({
                        memberId: $("#memberId").val(),
                        username: $("#username").val(),
                        email: $("#email").val(),
                        memberType: $("select[name='memberType']").val(),
                        permitStatus: $("select[name='permitStatus']").val(),
                        deleteYN: $("select[name='deleteYN']").val()
                    }),
                    success: function (data) {
                        if (data > 0) {
                            alert("ȸ������ �����Ϸ�");
                            window.close();
                        } else {
                            alert("ȸ������ ������ �����Ͽ����ϴ�.");
                        }
                    },
                    error: function () {
                        alert("ȸ������ ���� ���� ������ �߻��Ͽ����ϴ�.");
                    }
                })
            }
        })
    });

</script>
</body>
</html>