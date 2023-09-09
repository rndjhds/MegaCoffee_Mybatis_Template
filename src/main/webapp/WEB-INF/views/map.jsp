<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="common/header.jsp" %>
<html lang="ko">
<head>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../resources/statics/style/map.css">
    <link rel="stylesheet" href="../resources/statics/style/reset.css">
    <link rel="stylesheet" href="../resources/statics/style/index.css">
    <title>매장 | 메가커피</title>

</head>
<body>
<?php include("./header.php") ?>
<main>
    <section class="map_title">
        <p>MEGA STORE</p>
        <p>STORE</p>
        <p>
            언제 어디서나, 부담스럽지 않은 가격과 대용량으로<br>
            모든 사람들에게 사랑받는 메가MGC커피 입니다
        </p>
    </section>
    <section class="map_rap">
        <p>
            <a href="indexte.html">홈</a> > <a href="./map.html">매장</a> > <a href="./map.html">매장찾기</a>
        </p>
        <div class="map"> <!-- 구글 지도삽입 -->
            <iframe
                    src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d6331.306301786165!2d126.7214458998617!3d37.4925105931414!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1z66mU6rCA7Luk7ZS8!5e0!3m2!1sko!2skr!4v1693035604704!5m2!1sko!2skr"
                    width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade">
            </iframe>
            <p>구굴지도 : <a href="https://www.google.co.kr/maps/?hl=ko" target="_blank">https://www.google.co.kr/maps/?hl=ko</a>
            </p>
        </div>
    </section>
</main>
<%@include file="common/footer.jsp" %>

<script src="../resources/statics/js/index.js"></script>
</body>
</html>