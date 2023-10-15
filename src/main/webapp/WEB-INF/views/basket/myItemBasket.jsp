<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@include file="../common/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/statics/style/itemBasket.css">
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
    <title>메뉴 장바구니</title>
</head>
<body>
<main>
    <input type="hidden" name="memberId" id="memberId" value="${sessionScope.member.memberId}">
    <section class="deta_top">
        <div class="deta_page">
            <p>Basket</p>
            <p class="deta_page_info">
                선택하신 상품을
                한눈에 확인하세요.
            </p>
        </div>
    </section>
    <section class="deta_title">
        <p>메가 MGC의 선택 메뉴</p>
        <div class="deta_title_center">
            <span></span>
            <p>MEGA MENU</p>
            <span></span>
        </div>
        <p>*메뉴 이미지는 연출컷이라 실물과 다를수 있습니다.</p>
    </section>
    <section class="contentstop">
        <p>가맹점</p>
        <select name="storeId" id="storeId">
            <option value=0>전체</option>
            <c:forEach items="${stores}" var="stores">
                <option value=${stores.storeId}>${stores.storeName}</option>
            </c:forEach>
        </select>
    </section>
    <section class="contents1">

    </section>
    <section class="contents2">
        <p><img src="./img/header_logo.png" alt=""></p>
        <div class="txt">
            <p>상품금액</p>
            <p id="amount"></p>
        </div>
        <button type="button" onclick="sendRequestToImPort()">
            주문하기
        </button>
    </section>

</main>
</body>
<script>

    $(document).ready(function () {
        createBasketForm();
    });

    $("#storeId").change(function () {
        createBasketForm();
    });

    let orderList = "";
    let orderItemName = "";
    let shoppingBasketId;
    function createBasketForm() {
        orderList = new Array();
        orderItemName = new Array();
        $(".contents1").empty();
        $.ajax({
                url: "/basket/myBasketByStoreId",
                type: "post",
                contentType: "application/json; charset-utf-8",
                dataType: "json",
                data: JSON.stringify({
                    storeId: $("select[name='storeId']").val(),
                    memberId: $("#memberId").val()
                }),
                success: function (data) {
                    let amount = 0;
                    for (let i = 0; i < data.length; i++) {
                        $(".contents1").append(
                            '<div class="menu1">' +
                            '<input type="hidden" name="shoppingBasketId" id="shoppingBasketId" value='+data[0].SHOPPINGBASKETID+'>' +
                            '<p>' +
                            '<img src="${pageContext.request.contextPath}/resources/statics/img/' + data[i].IMG + '" style="width:300px;">' +
                            '</p> ' +
                            '<div class="op">' +
                            '<div class="infowrap">' +
                            '<div class="info_title">' +
                            '<h1>' + data[i].TITLE + '</h1> ' +
                            '<a onclick="deleteShoppingItem(' + data[i].SHOPPINGITEMID + ')">삭제</a>' +
                            '</div>' +
                            '<div class="info"> ' +
                            '<p>' + data[i].ORDERCUP + '</p> ' +
                            '<p>' + data[i].ORDEROPTION + '</p> ' +
                            '<p>' + data[i].ORDERSIZE + '</p> ' +
                            '</div> ' +
                            '</div> ' +
                            '<div class="sum"> ' +
                            '<p id="' + data[i].SHOPPINGITEMID + '_sum">' + (data[i].ORDERPRICE * data[i].ORDERCOUNT) + '</p> ' +
                            '<div class="pm"> ' +
                            '<a onclick="minus(' + data[i].SHOPPINGITEMID + ', ' + data[i].ORDERPRICE + ')">' +
                            '<img src="${pageContext.request.contextPath}/resources/statics/img/icon1.png">' +
                            '</a> ' +
                            '<p id="' + data[i].SHOPPINGITEMID + '_count">' + data[i].ORDERCOUNT + '</p> ' +
                            '<a onclick="add(' + data[i].SHOPPINGITEMID + ',' + data[i].ORDERPRICE + ')">' +
                            '<img src="${pageContext.request.contextPath}/resources/statics/img/icon2.png">' +
                            '</a> ' +
                            '</div> ' +
                            '</div> ' +
                            '</div>' +
                            ' </div>')

                        amount += parseInt($("#" + data[i].SHOPPINGITEMID + "_sum").text());

                        orderList.push({
                            itemId: data[i].ITEMID,
                            orderCount: data[i].ORDERCOUNT,
                            orderPrice: data[i].ORDERPRICE,
                            orderCup: data[i].ORDERCUP,
                            orderOption: data[i].ORDEROPTION,
                            orderSize: data[i].ORDERSIZE
                        });

                        orderItemName.push({
                            title: data[i].TITLE
                        });

                        shoppingBasketId = $("#shoppingBasketId").val();
                    }
                    $("#amount").text(amount);
                },
                error: function () {
                }
            }
        );
    };

    function deleteShoppingItem(shoppingItemId) {
        $.ajax({
            url: "/basket/deleteShoppingItem/" + shoppingItemId,
            type: "delete",
            contentType: "application/json; charset-utf-8",
            dataType: "json",
            success: function (data) {
                if (data == true) {
                    createBasketForm();
                } else {
                    alert("삭제 실패하였습니다.");
                }
            }
        });
    }


    function add(shoppingItemId, orderPrice) {

        amount = parseInt($("#amount").text());
        amount += parseInt(orderPrice);
        $("#amount").text(amount);

        let count = $("#" + shoppingItemId + "_count").text();
        count++;
        $("#" + shoppingItemId + "_count").text(count);

        let sum = orderPrice * count;
        $("#" + shoppingItemId + "_sum").text(sum);

    }

    function minus(shoppingItemId, orderPrice) {
        let count = $("#" + shoppingItemId + "_count").text();
        count--;
        if (count < 1) {
            count = 1;
        } else {
            amount = parseInt($("#amount").text());
            amount -= parseInt(orderPrice);
            $("#amount").text(amount);
        }

        $("#" + shoppingItemId + "_count").text(count);

        let sum = orderPrice * count;
        $("#" + shoppingItemId + "_sum").text(sum);
    }

    function createItemOrder(amount, merchant_uid, name) {
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
                "merchantUid" : merchant_uid,
                "orderProductName" : name,
                "shoppingBasketId": shoppingBasketId
            }),
            success: function (data) {
                if(data.resultType == true) {
                    alert("주문이 완료되었습니다");
                    location.href="/order/orderDetail/"+data.orderId;
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
        if($("select[name='storeId']").val() == 0) {
            alert("상품을 구매할 가맹점을 골라주세요");
            return false;
        }
        if(orderList.length == 0) {
            alert("주문 가능한 상품이 없습니다.");
            return false;
        }

        let amount = $("#amount").text();
        let buyName ="";
        for (let i =0; i < orderItemName.length; i++) {
            buyName += orderItemName.pop().title + " ";
        }

        const IMP = window.IMP;
        IMP.init('imp52714112');
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid: "mega"+new Date().getMilliseconds(), // 상점에서 관리하는 주문 번호
            name : buyName,
            amount : amount,
            buyer_email : "${sessionScope.member.email}",
            buyer_name : '${sessionScope.member.username}'
        }, function(rsp) {
            if ( !rsp.success ) {
                //결제 시작 페이지로 리디렉션되기 전에 오류가 난 경우
                var msg = '오류로 인하여 결제가 시작되지 못하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;

                alert(msg);
            } if(rsp.success) {
                createItemOrder(amount, "${sessionScope.member.memberId}"+new Date().getMilliseconds(), buyName);
            }

        });
    }

</script>
<%@include file="../common/footer.jsp" %>

</html>