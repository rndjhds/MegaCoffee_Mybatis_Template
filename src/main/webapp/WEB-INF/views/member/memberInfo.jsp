<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <title>계정설정</title>
</head>
<body>
<main>
    <section class="user_top">
        <div class="user_page">
            <p>Account Settings</p>
            <p class="user_page_info">
                계정 설정을
                도와드립니다.
            </p>
        </div>
    </section>
    <section class="user_title">
        <p>메가 MGC의 계정</p>
        <div class="user_title_center">
            <span></span>
            <p>MEGA</p>
            <span></span>
        </div>
    </section>
    <section class="user_wrap">
        <div class="user_info">
            <h1>계정설정</h1>
            <div class="info">
                <label for="btn1">정보수정
                    <button id="btn1" type="button"><img
                            src="${pageContext.request.contextPath}/resources/statics/img/close.png">
                    </button>
                </label>
                <c:if test="${sessionScope.member.memberType == 'BUYER'}">
                <label for="btn2">가맹점주 승인요청
                    <button id="btn2" type="button"><img
                            src="${pageContext.request.contextPath}/resources/statics/img/close.png">
                    </button>
                </label>
                </c:if>
                <label for="btn3">로그아웃
                    <button id="btn3" type="button"><img
                            src="${pageContext.request.contextPath}/resources/statics/img/close.png">
                    </button>
                </label>
                <label for="btn4">회원탈퇴
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
        if (confirm(("가맹점주 승인을 요청하시겠습니까? 승인 완료후 가맹점 로그인이 가능합니다."))) {
            $.ajax({
                url: "/member/requestAccessManager",
                type:"post",
                dataType: "json",
                data: {
                    "memberId": "${sessionScope.member.memberId}"
                }, success: function (data) {
                    if (data > 0) {
                        alert("승인요청이 완료 되었습니다");
                    } else {
                        alert("승인 요청이 실패하였습니다.")
                    }
                }, error: function () {
                    alert("승인 요청 도중 에러가 발생하였습니다.");
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