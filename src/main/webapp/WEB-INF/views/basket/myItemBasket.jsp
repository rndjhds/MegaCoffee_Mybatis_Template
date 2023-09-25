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
</main>
</body>
<script>

    $(document).ready(createBasketForm());

    $("#storeId").change(function () {
        createBasketForm();
    });

    function createBasketForm() {
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
                    for (let i = 0; i < data.length; i++) {
                        $(".contents1").append(
                            '<div class="menu1">' +
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
                            '<a onclick="minus(' + data[i].SHOPPINGITEMID + ', ' + data[i].ORDERPRICE +')">' +
                            '<img src="${pageContext.request.contextPath}/resources/statics/img/icon1.png">' +
                            '</a> ' +
                            '<p id="' + data[i].SHOPPINGITEMID + '_count">' + data[i].ORDERCOUNT + '</p> ' +
                            '<a onclick="add(' + data[i].SHOPPINGITEMID + ',' + data[i].ORDERPRICE +')">' +
                            '<img src="${pageContext.request.contextPath}/resources/statics/img/icon2.png">' +
                            '</a> ' +
                            '</div> ' +
                            '</div> ' +
                            '</div>' +
                            ' </div>')
                    }
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
        let count = $("#" + shoppingItemId + "_count").text();
        count++;
        $("#" + shoppingItemId + "_count").text(count);

        let sum = orderPrice * count;
        $("#" + shoppingItemId + "_sum").text(sum);

    }

    function minus(shoppingItemId, orderPrice) {
        let count = $("#" + shoppingItemId + "_count").text();
        count--;
        if(count < 1) {
            count = 1;
        }
        $("#" + shoppingItemId + "_count").text(count);

        let sum = orderPrice * count;
        console.log(sum);
        console.log(count);
        console.log(orderPrice);
        $("#" + shoppingItemId + "_sum").text(sum);

    }

</script>
<%@include file="../common/footer.jsp" %>

</html>