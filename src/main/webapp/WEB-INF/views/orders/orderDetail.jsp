<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/statics/style/orderDetail.css">
    <title>상세주문내역</title>
</head>
<body>
<main>
    <aside>
        <a href="#">열기</a>
    </aside>
    <section class="deta_top">
        <div class="deta_page">
            <p>FUCKING</p>
            <p class="deta_page_info">
                상세 주문내역
            </p>
        </div>
    </section>
    <section class="deta_title">
        <p>메가 MGC의 주문내역</p>
        <div class="deta_title_center">
            <span></span>
            <p>MEGA</p>
            <span></span>
        </div>
    </section>
    <section class="start">
        <div class="title">
            <h1>${storeName}</h1>
            <p>${orderDate} (주문번호 : ${orderId})</p>
            <div class="btn">
                <a href="#">X 닫기</a>
            </div>
        </div>
        <c:forEach items="${orders}" var="orders">
            <div class="info">
                <p>
                    <img src="${pageContext.request.contextPath}/resources/statics/img/${orders.IMG}">
                </p>
                <div class="list">
                    <p><em>${orders.TITLE}</em></p>
                    <c:if test="${orders.OPTION == 'Y'}">
                        <span>${orders.ORDERCUP}</span>
                        <span>${orders.OPTION}</span>
                        <span>${orders.SIZE}</span>
                    </c:if>
                    <p><em>${orders.ORDERPRICE}</em> (수량 : ${orders.ORDERCOUNT}개)</p>
                </div>
            </div>
        </c:forEach>
        <ul>
            <li>
                <p>결제수단</p>
                <p>카카오 페이</p>
            </li>
            <li>
                <p>상품금액</p>
                <p><em>${amount}</em></p>
            </li>
            <li>
                <p>결제금액</p>
                <p><em>${amount}</em></p>
            </li>
        </ul>
        <p class="reds">
            제조 완료된 음료와 푸드는 매장에서 1시간 동안 보관 후
            폐기되며 재제공 및 환불은 불가피합니다.
        </p>
    </section>
</main>
<script>
    let on = document.querySelector('aside')
    let btn = document.querySelector('.btn')
    let popup = document.querySelector('.start')
    on.addEventListener('click', function (e) {
        e.preventDefault()
        popup.style.display = 'block'
    })
    btn.addEventListener('click', function (e) {
        e.preventDefault()
        popup.style.display = 'none'
    })
</script>
</body>
</html>


