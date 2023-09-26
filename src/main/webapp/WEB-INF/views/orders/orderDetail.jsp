<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
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
            <h1>부천역점</h1>
            <p>2023년 09월 25일 (주문번호 : 0753)</p>
            <div class="btn">
                <a href="#">X 닫기</a>
            </div>
        </div>
        <div class="info">
            <p>
                <img src="./img/drink_1.jpg" alt="커피 이미지">
            </p>
            <div class="list">
                <p><em>아메리카노</em></p>
                <span>일회용컵 사용</span>
                <span>ICE</span>
                <span>M</span>
                <p><em>1,600원</em> (수량 : 1개)</p>
            </div>
        </div>
        <ul>
            <li>
                <p>결제수단</p>
                <p>신용카드</p>
            </li>
            <li>
                <p>상품금액</p>
                <p><em>1,600원</em></p>
            </li>
            <li>
                <p>결제금액</p>
                <p><em>1,600원</em></p>
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
    on.addEventListener('click',function(e){
        e.preventDefault()
        popup.style.display = 'block'
    })
    btn.addEventListener('click',function(e){
        e.preventDefault()
        popup.style.display = 'none'
    })
</script>
</body>
</html>


