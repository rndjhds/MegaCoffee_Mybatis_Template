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
    <title>�޴� ��ٱ���</title>
</head>
<body>
<main>
    <input type="hidden" name="memberId" id="memberId" value="${sessionScope.member.memberId}">
    <section class="deta_top">
        <div class="deta_page">
            <p>Basket</p>
            <p class="deta_page_info">
                �����Ͻ� ��ǰ��
                �Ѵ��� Ȯ���ϼ���.
            </p>
        </div>
    </section>
    <section class="deta_title">
        <p>�ް� MGC�� ���� �޴�</p>
        <div class="deta_title_center">
            <span></span>
            <p>MEGA MENU</p>
            <span></span>
        </div>
        <p>*�޴� �̹����� �������̶� �ǹ��� �ٸ��� �ֽ��ϴ�.</p>
    </section>
    <section class="contentstop">
        <p>������</p>
        <select name="storeId" id="storeId">
            <option value=0>��ü</option>
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
            <p>��ǰ�ݾ�</p>
            <p id="amount"></p>
        </div>
        <button type="button" onclick="sendRequestToImPort()">
            �ֹ��ϱ�
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
                            '<a onclick="deleteShoppingItem(' + data[i].SHOPPINGITEMID + ')">����</a>' +
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
                    alert("���� �����Ͽ����ϴ�.");
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
                    alert("�ֹ��� �Ϸ�Ǿ����ϴ�");
                    location.href="/order/orderDetail/"+data.orderId;
                } else {
                    alert("�ֹ� ���� ������ ���� ���� ��ǰ�� ���� �մϴ�.");
                }
            },
            error: function () {
                alert("�ֹ��� �����Ͽ����ϴ�.");
            }
        });
    }

    function sendRequestToImPort() {
        if($("select[name='storeId']").val() == 0) {
            alert("��ǰ�� ������ �������� ����ּ���");
            return false;
        }
        if(orderList.length == 0) {
            alert("�ֹ� ������ ��ǰ�� �����ϴ�.");
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
            merchant_uid: "mega"+new Date().getMilliseconds(), // �������� �����ϴ� �ֹ� ��ȣ
            name : buyName,
            amount : amount,
            buyer_email : "${sessionScope.member.email}",
            buyer_name : '${sessionScope.member.username}'
        }, function(rsp) {
            if ( !rsp.success ) {
                //���� ���� �������� ���𷺼ǵǱ� ���� ������ �� ���
                var msg = '������ ���Ͽ� ������ ���۵��� ���Ͽ����ϴ�.';
                msg += '�������� : ' + rsp.error_msg;

                alert(msg);
            } if(rsp.success) {
                createItemOrder(amount, "${sessionScope.member.memberId}"+new Date().getMilliseconds(), buyName);
            }

        });
    }

</script>
<%@include file="../common/footer.jsp" %>

</html>