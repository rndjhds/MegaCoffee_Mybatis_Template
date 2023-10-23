<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
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
                <input type="hidden" id="buyName" name="buyName" value="${findItem.title}">
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
                        <c:if test="${findItem.optionYN == 'Y'}">
                            <li><p>컵 선택</p>
                                <ul class="sub">
                                    <li><label for="cup">일회용컵 사용
                                        <input type="radio" name="orderCup" id="cup" value="일회용 컵" checked>
                                    </label></li>
                                    <li><label for="cup2">텀블러 사용
                                        <input type="radio" name="orderCup" id="cup2" value="텀블러">
                                    </label></li>
                                    <li><label for="cup3">매장컵(먹고 갈게요)
                                        <input type="radio" name="orderCup" id="cup3" value="매장컵">
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
                                        <input type="radio" name="orderSize" id="sz" value="SMALL" checked>
                                    </label></li>
                                    <li><label for="sz2">M
                                        <input type="radio" name="orderSize" id="sz2" value="MEDIUM">
                                    </label></li>
                                    <li>
                                        <label for="sz3">L
                                            <input type="radio" name="orderSize" id="sz3" value="LARGE">
                                        </label>
                                    </li>
                                </ul>
                            </li>
                        </c:if>
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
            <button type="button" id="orders" onclick="sendRequestToImPort()">바로 주문</button>
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
        if (count < 1) {
            count = 1;
        }
        $("#count").text(count);

        $("#totalPrice").text($("#price").val() * count);
    });

    function createBasket() {
        if ($("select[name='storeId']").val() == 0) {
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
                orderCup: $("input[name='orderCup']:checked").val(),
                orderOption: $("input[name='orderOption']:checked").val(),
                orderSize: $("input[name='orderSize']:checked").val(),
                basketDTO: {
                    storeId: $("select[name='storeId']").val()
                }
            }),
            success: function (data) {
                if (data == true) {
                    if (confirm("장바구니로 이동하시겠습니까?")) {
                        location.href = "/basket/myBasketList"
                    } else {
                        return false;
                    }
                }
            },
            error: function () {

            }
        });
    }


    function createItemOrder(amount, merchant_uid, name) {
        let orderList = new Array();
        orderList.push({
            itemId: $("#itemId").val(),
            orderCount: $("#count").text(),
            orderPrice: $("#price").val(),
            orderCup: $("input[name='orderCup']:checked").val(),
            orderOption: $("input[name='orderOption']:checked").val(),
            orderSize: $("input[name='orderSize']:checked").val()
        });

        $.ajax({
            url: "/order/creatOrderItem",
            type: "POST",
            dataType: "json",
            contentType: "application/json; charset-utf-8",
            data: JSON.stringify({
                "list": orderList,
                "memberId": "${sessionScope.member.memberId}",
                "storeId": $("select[name='storeId']").val(),
                "amount": amount,
                "merchantUid": merchant_uid,
                "orderProductName": name
            }),
            success: function (data) {
                if (data.resultType == true) {
                    alert("결제 성공");
                    location.href = "/order/orderDetail/" + data.orderId;
                } else {
                    alert("주문 도중 결제가 되지 않은 상품이 존재 합니다.");
                }
            },
            error: function () {
                alert("주문이 실패하였습니다.");
            }
        });
    }

    function sendRequestToImPort() {
        if (${empty sessionScope}) {
            alert("로그인 후 이용 가능합니다.");
            location.href = "/member/loginForm";
            return false;
        }

        if ($("select[name='storeId']").val() == 0) {
            alert("상품을 구매할 가맹점을 골라주세요");
            return false;
        }

        let amount = $("#totalPrice").text();
        let buyName = $("#buyName").val();

        const IMP = window.IMP;
        IMP.init('imp52714112');
        IMP.request_pay({
            pg: 'kakaopay',
            pay_method: 'card',
            merchant_uid: "mega" + new Date().getMilliseconds(), // 상점에서 관리하는 주문 번호
            name: buyName,
            amount: amount,
            buyer_email: "${sessionScope.member.email}",
            buyer_name: '${sessionScope.member.username}'
        }, function (rsp) {
            if (!rsp.success) {
                //결제 시작 페이지로 리디렉션되기 전에 오류가 난 경우
                var msg = '오류로 인하여 결제가 시작되지 못하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;

                alert(msg);
                alert(rsp);
            }
            if (rsp.success) {
                createItemOrder(amount, "mega" + new Date().getMilliseconds(), buyName);
            }

        });
    }


</script>

</body>
</html>