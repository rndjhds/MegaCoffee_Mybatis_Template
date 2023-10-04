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
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
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
                <input type="hidden" id="buyName" name="buyName" value="${findItem.title}">
                <fieldset>
                    <div class="mainmenu">
                        <p>������</p>
                        <select name="storeId" id="storeId">
                            <option value=0>��ü</option>
                            <c:forEach var="stores" items="${stores}">
                                <option value=${stores.storeId}>${stores.storeName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <ul>
                        <c:if test="${findItem.optionYN == 'Y'}">
                        <li><p>�� ����</p>
                            <ul class="sub">
                                <li><label for="cup">��ȸ���� ���
                                    <input type="radio" name="orderCup" id="cup" value="disposable" checked>
                                </label></li>
                                <li><label for="cup2">�Һ� ���
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
            <button type="button" id="basket" onclick="createBasket()">��ٱ��� ���</button>
            <button type="button" id="orders" onclick="sendRequestToImPort()">�ٷ� �ֹ�</button>
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
            alert("��ǰ�� ������ �������� ����ּ���");
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
                "merchantUid" : merchant_uid,
                "orderProductName" : name
            }),
            success: function (data) {
                if(data.resultType == true) {
                    alert("���� ����");
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

        let amount = $("#totalPrice").text();
        let buyName = $("#buyName").val();

        const IMP = window.IMP;
        IMP.init('imp52714112');
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid: "${sessionScope.member.memberId}"+new Date().getMilliseconds(), // �������� �����ϴ� �ֹ� ��ȣ
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

</body>
</html>