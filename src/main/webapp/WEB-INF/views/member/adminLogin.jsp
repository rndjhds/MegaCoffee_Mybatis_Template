<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="../common/header.jsp" %>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>LOGIN</title>
    <link rel="stylesheet" href="../../resources/statics/style/reset.css">
    <link rel="stylesheet" href="../../resources/statics/style/login.css">
    <!--swiper slide-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <script src="../webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
</head>
<body>
<!-- header -->
<main>
    <h1>�α���</h1>
    <div class="rap">
        <div class="title">
            <a href="#" class="active">�α���</a>
        </div>
        <div class="info">
            <form class="info_1 info_tab">
                <fieldset>
                    <legend class="skip">�α��ξ��</legend>
                    <label for="id">���̵�
                        <input type="text" id="id" name="memberId" placeholder="���̵� �Է����ּ���" autofocus>
                    </label>
                    <label for="pw">��й�ȣ
                        <input type="password" id="pw" name="password" placeholder="��й�ȣ�� �����ּ���.">
                    </label>
                    <div class="look">
                        <div class="look_a">
                            <a href="#">���̵� ã��</a>
                            <a href="#">��й�ȣ ã��</a>
                        </div>
                    </div>
                    <button type="submit" class="login_nomal">�α���</button>
                </fieldset>
            </form>
        </div>
    </div>
</main>
<!-- footer -->
<script type="text/javascript">

    $(document).ready(function () {
        $("form").validate({
            rules: {
                memberId: {
                    required: true
                },
                password: {
                    required: true
                }
            },
            messages: {
                memberId: {
                    required: "���̵� �Է��ؾ� �մϴ�."
                },
                password: {
                    required: "��й�ȣ�� �Է����ּ���."
                }
            },
            submitHandler: function () {
                $.ajax({
                    url: "${pageContext.request.contextPath}/member/login",
                    contentType: "application/json; charset-utf-8",
                    type: "POST",
                    dataType: "json",
                    data: JSON.stringify({
                        memberId: $("#id").val(),
                        password: $("#pw").val()
                    }),
                    success: function (data) {
                        if (data == true) {
                            alert("���������� �α����� �Ǿ����ϴ�.");
                            location.href="/menu/drinkView"
                        } else {
                            alert("���̵� �Ǵ� ��й�ȣ�� Ȯ�����ּ���");
                        }
                    },
                    error: function () {
                        alert("�α��� ���� ������ �߻��Ͽ����ϴ�.");
                    }
                })
            }
        })
    });
</script>
<%@include file="../common/footer.jsp" %>
</body>
</html>