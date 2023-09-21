<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/statics/style/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/statics/style/register.css">
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
    <title>ȸ������</title>
</head>
<body>
<main>
    <div>
        <form>
            <fieldset>
                <label for="id">���̵�
                    <input type="text" id="id" name="memberId" placeholder="���̵� �Է����ּ���.">
                </label>
                <label for="password">��й�ȣ
                    <input type="password" id="password" name="password" placeholder="��й�ȣ�� �Է����ּ���.">
                </label>
                <label for="passwordChk">��й�ȣ Ȯ��
                    <input type="password" id="passwordChk" name="passwordChk" placeholder="��й�ȣ �ѹ� �� �Է����ּ���.">
                </label>
                <label for="username">ȸ���̸�
                    <input type="text" id="username" name="username" placeholder="�̸��� �Է����ּ���.">
                </label>
                <label for="email">�̸���
                    <input type="email" id="email" name="email" placeholder="�̸����� �Է����ּ���.">
                </label>
                <button type="submit">ȸ������</button>
            </fieldset>
        </form>
    </div>
</main>

<script>

    $(document).ready(function () {
        $("form").validate({
            rules: {
                memberId: {
                    required: true,
                    remote: {
                        url: "${pageContext.request.contextPath}/member/checkId",
                        type: "POST",
                        data: {
                            memberId: function () {
                                return $("#id").val();
                            }
                        }
                    }
                },
                password: {
                    required: true
                },
                passwordChk: {
                    required: true,
                    equalTo: password
                },
                username: {
                    required: true
                },
                email: {
                    required: true,
                    email: true
                }
            },
            messages: {
                memberId: {
                    required: "���̵� �Է��ؾ� �մϴ�.",
                    remote: "�̹� ȸ�����Ե� ���̵��Դϴ�"
                },
                password: {
                    required: "��й�ȣ�� �Է����ּ���."
                },
                passwordChk: {
                    required: "Ȯ�� ��й�ȣ�� �Է����ּ���.",
                    equalTo: "��й�ȣ�� ��ġ���� �ʽ��ϴ�."
                },
                username: {
                    required: "�̸��� �Է����ּ���"
                },
                email: {
                    required: "�̸����� �Է����ּ���",
                    email: "�̸��� ��Ģ�� ��߳��ϴ�."
                }
            },
            submitHandler: function () {
                $.ajax({
                    url: "${pageContext.request.contextPath}/member/save",
                    contentType: "application/json; charset-utf-8",
                    type: "POST",
                    dataType: "json",
                    data: JSON.stringify({
                        memberId: $("#id").val(),
                        password: $("#password").val(),
                        username: $("#username").val(),
                        email: $("#email").val()
                    }),
                    success: function (data) {
                        if (data > 0) {
                            alert("ȸ������ �Ϸ�");
                            window.close();
                        } else {
                            alert("ȸ�������� �����Ͽ����ϴ�.");
                        }
                    },
                    error: function () {
                        alert("ȸ������ ���� ������ �߻��Ͽ����ϴ�.");
                    }
                })
            }
        })
    });

</script>
</body>
</html>