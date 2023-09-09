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
    <title>���� | �ް�Ŀ��</title>

</head>
<body>
<?php include("./header.php") ?>
<main>
    <section class="map_title">
        <p>MEGA STORE</p>
        <p>STORE</p>
        <p>
            ���� ��𼭳�, �δ㽺���� ���� ���ݰ� ��뷮����<br>
            ��� ����鿡�� ����޴� �ް�MGCĿ�� �Դϴ�
        </p>
    </section>
    <section class="map_rap">
        <p>
            <a href="indexte.html">Ȩ</a> > <a href="./map.html">����</a> > <a href="./map.html">����ã��</a>
        </p>
        <div class="map"> <!-- ���� �������� -->
            <iframe
                    src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d6331.306301786165!2d126.7214458998617!3d37.4925105931414!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1z66mU6rCA7Luk7ZS8!5e0!3m2!1sko!2skr!4v1693035604704!5m2!1sko!2skr"
                    width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade">
            </iframe>
            <p>�������� : <a href="https://www.google.co.kr/maps/?hl=ko" target="_blank">https://www.google.co.kr/maps/?hl=ko</a>
            </p>
        </div>
    </section>
</main>
<%@include file="common/footer.jsp" %>

<script src="../resources/statics/js/index.js"></script>
</body>
</html>