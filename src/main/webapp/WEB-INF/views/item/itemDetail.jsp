<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@include file="../common/header.jsp" %>
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
                <p><img src="${pageContext.request.contextPath}/resources/statics/img/${findItem.img}"></p>
                <p>${findItem.title}</p>
            </div>
            <form action="#" method="get" class="op">
                <input type="hidden" id="price" name="price" value="${findItem.price}">
                <input type="hidden" id="itemId" name="itemId" value="${findItem.itemId}">
                <fieldset>
                    <ul>
                        <li><p>�� ����</p>
                            <ul class="sub">
                                <li><label for="cup">��ȸ���� ���
                                    <input type="radio" name="orderCup" id="cup" value="disposable" checked>
                                </label></li>
                                <li><label for="cup2">�Һ��� ���
                                    <input type="radio" name="orderCup" id="cup2" value="tumbler">
                                </label></li>
                                <li><label for="cup3">������(�԰� ���Կ�)
                                    <input type="radio" name="orderCup" id="cup3" value="shopCup">
                                </label></li>
                            </ul>
                        </li>
                        <li><p>OPTION</p>
                            <ul class="sub">
                                <li><label for="op1">ICE
                                    <input type="radio" name="orderOption" id="op1" value="ice" checked>
                                </label></li>
                                <li><label for="op2">HOT
                                    <input type="radio" name="orderOption" id="op2" value="hot">
                                </label></li>
                            </ul>
                        </li>
                        <li><p>SIZE</p>
                            <ul class="sub">
                                <li><label for="sz">S
                                    <input type="radio" name="orderSize" id="sz" value="small" checked>
                                </label></li>
                                <li><label for="sz2">M
                                    <input type="radio" name="orderSize" id="sz2" value="medium">
                                </label></li>
                                <li>
                                    <label for="sz3">L
                                        <input type="radio" name="orderSize" id="sz3" value="large">
                                    </label></li>
                            </ul>
                        </li>
                    </ul>
                    <div class="sum">
                        <p id="totalPrice">${findItem.price}</p>
                        <div class="pm">
                            <a id="minus"><img src="${pageContext.request.contextPath}/resources/statics/img/icon1.png"></a>
                            <p id="count">1</p>
                            <a id="add"><img
                                    src="${pageContext.request.contextPath}/resources/statics/img/icon2.png"></a>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
        <div class="btm">
            <button type="button" id="basket" onclick="createBasket()">��ٱ��� ���</button>
            <button type="button" id="orders">�ٷ� �ֹ�</button>
        </div>
    </section>
</main>
<script>

    $('fieldset > ul > li:nth-child(1) .sub li label').on('click', function () {
        $('.contents1 .op fieldset > ul > li:nth-child(1) .sub li label').removeClass()
        $(this).addClass('btnevent')
    });
    $('fieldset > ul > li:nth-child(2) .sub li label').on('click', function () {
        $('.contents1 .op fieldset > ul > li:nth-child(2) .sub li label').removeClass()
        $(this).addClass('btnevent')
    });
    $('fieldset > ul > li:nth-child(3) .sub li label').on('click', function () {
        $('.contents1 .op fieldset > ul > li:nth-child(3) .sub li label').removeClass()
        $(this).addClass('btnevent')
    });

    $("#add").click(function () {
        let count = $("#count").text();
        count++;
        $("#count").text(count);

        $("#totalPrice").text($("#price").val() * count);
    });

    $("#minus").click(function () {
        let count = $("#count").text();
        count--;
        $("#count").text(count);

        $("#totalPrice").text($("#price").val() * count);
    });

    function createBasket() {
        $.ajax({
            url: "/basket/createBasket",
            contentType: "application/json; charset-utf-8",
            type: "POST",
            dataType: "json",
            data: JSON.stringify({
                itemId: $("#itemId").val(),
                orderCount: $("#count").text(),
                orderPrice: $("#totalPrice").text(),
                orderCup: $("input[name='orderCup']:checked").val(),
                orderOption: $("input[name='orderOption']:checked").val(),
                orderSize: $("input[name='orderSize']:checked").val()
            }),
            success: function (data) {

            },
            error: function () {

            }
        });
    }


</script>

</body>
</html>