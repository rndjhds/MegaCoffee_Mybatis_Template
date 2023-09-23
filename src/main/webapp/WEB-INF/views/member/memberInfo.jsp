<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/statics/style/memberInfo.css">
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
                    <button id="btn1" type="button"><img src="${pageContext.request.contextPath}/statics/img/close.png" alt=""></button>
                </label>
                <label for="btn2">이용약관
                    <button id="btn2" type="button"><img src="${pageContext.request.contextPath}/statics/img/close.png" alt=""></button>
                </label>
                <label for="btn3">로그아웃
                    <button id="btn3" type="button"><img src="${pageContext.request.contextPath}/statics/img/close.png" alt=""></button>
                </label>
                <label for="btn4">회원탈퇴
                    <button id="btn4" type="button"><img src="${pageContext.request.contextPath}/statics/img/close.png" alt=""></button>
                </label>
            </div>
        </div>
    </section>
</main>
</body>
</html>