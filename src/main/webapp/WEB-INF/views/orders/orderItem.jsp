<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@include file="../common/header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/statics/style/orderItem.css">
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.min.js"></script>
    <title>�޴���������</title>
</head>
<body>
<main>
    <section class="deta_top">
        <div class="deta_page">
            <p>Menu Details</p>
            <p class="deta_page_info">
                �޴��� �ڼ��� ������ �˷��帳�ϴ�.
            </p>
        </div>
    </section>
    <section class="deta_title">
        <p>�ް� MGC ������ �޴�</p>
        <div class="deta_title_center">
            <span></span>
            <p>MEGA MENU</p>
            <span></span>
        </div>
        <p>*�޴� �̹����� �������̶� �ǹ��� �ٸ��� �ֽ��ϴ�.</p>
    </section>
    <section class="contents1">
        <div class="top">
            <div class="menuimg">
                <p><img src="${pageContext.request.contextPath}/resources/statics/img/drink_1.jpg" alt=""></p>
                <p>���� �Ѷ�� ���� ������</p>
            </div>
            <form action="#" method="get" class="op">
                <fieldset>
                    <ul>
                        <li><p>�� ����</p>
                            <ul class="sub">
                                <li><label for="cup1" >��ȸ���� ���
                                    <input type="radio" name="ck1" id="cup1">
                                </label></li>
                                <li><label for="cup2">�Һ� ���
                                    <input type="radio" name="ck1" id="cup2">
                                </label></li>
                                <li><label for="cup3">������(�԰� ���Կ�)
                                    <input type="radio" name="ck1" id="cup3">
                                </label></li>
                            </ul>
                        </li>
                        <li><p>OPTION</p>
                            <ul class="sub">
                                <li><label for="op1">ICE
                                    <input type="radio" name="ck2" id="op1">
                                </label></li>
                                <li><label for="op2">HOT
                                    <input type="radio" name="ck2" id="op2">
                                </label></li>
                            </ul>
                        </li>
                        <li><p>SIZE</p>
                            <ul class="sub">
                                <li><label for="sz">M(+0)
                                    <input type="radio" name="ck3" id="sz">
                                </label></li>
                            </ul>
                        </li>
                    </ul>
                    <div class="sum">
                        <p>4,500��</p>
                        <div class="pm">
                            <a href="#"><img src="${pageContext.request.contextPath}/resources/statics/img/icon1.png" alt=""></a>
                            <p>1</p>
                            <a href="#"><img src="${pageContext.request.contextPath}/resources/statics/img/icon2.png" alt=""></a>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
        <div class="btm">
            <button type="button">��ٱ��� ���</button>
            <button type="button">�ٷ� �ֹ�</button>
        </div>
    </section>
</main>
<script>

    $('fieldset > ul > li:nth-child(1) .sub li label').on('click',function(){
        $('.contents1 .op fieldset > ul > li:nth-child(1) .sub li label').removeClass()
        $(this).addClass('btnevent')
    })
    $('fieldset > ul > li:nth-child(2) .sub li label').on('click',function(){
        $('.contents1 .op fieldset > ul > li:nth-child(2) .sub li label').removeClass()
        $(this).addClass('btnevent')
    })
    $('fieldset > ul > li:nth-child(3) .sub li label').on('click',function(){
        $('.contents1 .op fieldset > ul > li:nth-child(3) .sub li label').removeClass()
        $(this).addClass('btnevent')
    })

</script>

</body>
</html>