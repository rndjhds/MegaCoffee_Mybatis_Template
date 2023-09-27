<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@include file="../common/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/statics/style/itemDetail.css">
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.min.js"></script>
    <title>메뉴상세페이지</title>
</head>
<body>
<main>
    <section class="deta_top">
        <div class="deta_page">
            <p>Menu Details</p>
            <p class="deta_page_info">
                메뉴의 자세한 정보를 알려드립니다.
            </p>
        </div>
    </section>
    <section class="deta_title">
        <p>메가 MGC 투명한 메뉴</p>
        <div class="deta_title_center">
            <span></span>
            <p>MEGA MENU</p>
            <span></span>
        </div>
        <p>*메뉴 이미지는 연출컷이라 실물과 다를수 있습니다.</p>
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
                    <div class="mainmenu">
                        <p>가맹점</p>
                        <select name="storeId" id="storeId">
                            <option value=0>전체</option>
                            <c:forEach var="stores" items="${stores}">
                                <option value=${stores.storeId}>${stores.storeName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <ul>
                        <li><p>컵 선택</p>
                            <ul class="sub">
                                <li><label for="cup">일회용컵 사용
                                    <input type="radio" name="orderCup" id="cup" value="disposable" checked>
                                </label></li>
                                <li><label for="cup2">텀블러 사용
                                    <input type="radio" name="orderCup" id="cup2" value="tumbler">
                                </label></li>
                                <li><label for="cup3">매장컵(먹고 갈게요)
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
            <button type="button" id="basket" onclick="createBasket()">장바구니 담기</button>
            <button type="button" id="orders" onclick="createItemOrder()">바로 주문</button>
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
        if(count < 1) {
            count = 1;
        }
        $("#count").text(count);

        $("#totalPrice").text($("#price").val() * count);
    });

    function createBasket() {
        if($("select[name='storeId']").val() == 0) {
            alert("상품을 구매할 가맹점을 골라주세요");
            return false;
        }
        $.ajax({
            url: "/basket/createBasket",
            contentType: "application/json; charset-utf-8",
            type: "POST",
            dataType: "json",
            data: JSON.stringify({
                itemId: $("#itemId").val(),
                orderCount: $("#count").text(),
                orderPrice: $("#price").val(),
                /*orderCup: $("input[name='orderCup']:checked").val(),    상품별로 필요한 상품이 있고 필요하지 않은 상품이 있음
                orderOption: $("input[name='orderOption']:checked").val(),
                orderSize: $("input[name='orderSize']:checked").val(),*/
                basketDTO: {
                    storeId : $("select[name='storeId']").val()
                }
            }),
            success: function (data) {
                if(data == true) {
                    location.href="/basket/myBasketList"
                } else {

                }
            },
            error: function () {

            }
        });
    }

    function createItemOrder() {
        let orderList = new Array();
        orderList.push({
            itemId: $("#itemId").val(),
            orderCount: $("#count").text(),
            orderPrice: $("#price").val(),
            orderCup: $("input[name='orderCup']:checked").val(),
            orderOption: $("input[name='orderOption']:checked").val(),
            orderSize: $("input[name='orderSize']:checked").val()
        });

        if($("select[name='storeId']").val() == 0) {
            alert("상품을 구매할 가맹점을 골라주세요");
            return false;
        }
        $.ajax({
            url: "/order/creatOrderItem",
            type: "POST",
            dataType: "json",
            contentType: "application/json; charset-utf-8",
            data: JSON.stringify({
                "list": orderList,
                "memberId": "${sessionScope.member.memberId}",
                "storeId": $("select[name='storeId']").val()
            }),
            success: function (data) {
                if(data == true) {
                    alert("주문이 완료되었습니다");
                } else {
                    alert("주문 도중 결제가 되지 않은 상품이 존재 합니다.");
                }
            },
            error: function () {
                alert("주문이 실패하였습니다.");
            }
        });
    }


</script>

</body>
</html>