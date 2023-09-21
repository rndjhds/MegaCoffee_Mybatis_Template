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
    <title>회원가입</title>
</head>
<body>
<main>
    <div>
        <form>
            <fieldset>
                <label for="id">아이디
                    <input type="text" id="id" name="memberId" placeholder="아이디를 입력해주세요.">
                </label>
                <label for="password">비밀번호
                    <input type="password" id="password" name="password" placeholder="비밀번호를 입력해주세요.">
                </label>
                <label for="passwordChk">비밀번호 확인
                    <input type="password" id="passwordChk" name="passwordChk" placeholder="비밀번호 한번 더 입력해주세요.">
                </label>
                <label for="username">회원이름
                    <input type="text" id="username" name="username" placeholder="이름을 입력해주세요.">
                </label>
                <label for="email">이메일
                    <input type="email" id="email" name="email" placeholder="이메일을 입력해주세요.">
                </label>
                <button type="submit">회원가입</button>
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
                    required: "아이디를 입력해야 합니다.",
                    remote: "이미 회원가입된 아이디입니다"
                },
                password: {
                    required: "비밀번호를 입력해주세요."
                },
                passwordChk: {
                    required: "확인 비밀번호를 입력해주세요.",
                    equalTo: "비밀번호가 일치하지 않습니다."
                },
                username: {
                    required: "이름을 입력해주세요"
                },
                email: {
                    required: "이메일을 입력해주세요",
                    email: "이메일 규칙에 어긋납니다."
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
                            alert("회원가입 완료");
                            window.close();
                        } else {
                            alert("회원가입을 실패하였습니다.");
                        }
                    },
                    error: function () {
                        alert("회원가입 도중 오류가 발생하였습니다.");
                    }
                })
            }
        })
    });

</script>
</body>
</html>