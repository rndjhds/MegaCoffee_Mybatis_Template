<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@include file="common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../resources/statics/style/reset.css">
    <link rel="stylesheet" href="../resources/statics/style/review.css">
    <link rel="stylesheet" href="../resources/statics/style/index.css">
    <link rel="stylesheet" href="../resources/statics/style/index_uiux.css">
    <title>게시판 | 메가커피</title>
</head>
<body>
<main>
    <section class="rew_title">
        <p>MEGA NOTICE</p>
        <p>review</p>
        <p>
            여러 정보를 제공하며 신뢰가는 커피 브렌드,<br>
            모든 사람들에게 사랑받는 메가MGC커피 입니다.
        </p>
    </section>
    <section class="rew_info">
        <p>
            <a href="indexte.html">홈</a> > <a href="./review.html">메가소식</a> > <a href="./review.html">고객의 소리</a>
        </p>
        <!-- 외부 웹주소(게시판, 지도)를 내부 html로 삽입하는 방법 -->
        <iframe src="http://jline.pe.kr/gnuboard5/bbs/board.php?bo_table=gentle_review" frameborder="0" scrolling="no"></iframe>
    </section>
</main>
<%@include file="common/footer.jsp"%>
<script src="../resources/statics/js/index.js"></script>
</body>
</html>