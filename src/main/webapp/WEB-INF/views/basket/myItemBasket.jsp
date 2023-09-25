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
</main>
</body>
<script>

    $(document).ready(createBasketForm());

    $("#storeId").change(function () {
        $(".contents1").empty();
        createBasketForm();
    });

    function createBasketForm() {
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
                            '<a onclick="delete(' + data[i].SHOPPINGITEMID + ')">삭제</a>' +
                            '</div>' +
                            '<div class="info"> ' +
                            '<p>' + data[i].ORDERCUP + '</p> ' +
                            '<p>' + data[i].ORDEROPTION + '</p> ' +
                            '<p>' + data[i].ORDERSIZE + '</p> ' +
                            '</div> ' +
                            '</div> ' +
                            '<div class="sum"> ' +
                            '<p>' + (data[i].ORDERPRICE * data[i].ORDERCOUNT) + '</p> ' +
                            '<div class="pm"> ' +
                            '<a onclick="add(' + data[i].SHOPPINGITEMID + ', ' + data[i].ORDEPRICE + ',' + data[i].ORDERCOUNT + ')">' +
                            '<img src="${pageContext.request.contextPath}/resources/statics/img/icon1.png">' +
                            '</a> ' +
                            '<p>' + data[i].ORDERCOUNT + '</p> ' +
                            '<a onclick="minus(' + data[i].SHOPPINGITEMID + ',' + data[i].ORDERPRICE + ',' + data[i].ORDERCOUNT + ')">' +
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

</script>
<%@include file="../common/footer.jsp" %>

</html>