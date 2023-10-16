<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="../resources/statics/style/reset.css">
    <link rel="stylesheet" href="../resources/statics/style/index.css">
    <link rel="stylesheet" href="../resources/statics/style/index_uiux.css">
    <title>메인 | 메가커피</title>
</head>
<body>
<aside>
    <div class="btn">
        <a href="#"></a>
        <a href="#content1"></a>
        <a href="#content2"></a>
        <a href="#content3"></a>
        <a href="#content4"></a>
        <a href="#content5"></a>
    </div>
</aside>
<main>
    <section class="top" id="top">
        <div class="swiper"> <!-- css에서 넓이 높이값을 줘야한다 -->
            <!-- Additional required wrapper -->
            <div class="swiper-wrapper">
                <!-- Slides -->
                <div class="swiper-slide may_slide1"></div>
                <div class="swiper-slide may_slide2"></div>
            </div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        </div>
        <div class="asidebtn">
            <a href="#">
                <span>Top</span>
                <span><img src="../resources/statics/test_img/toplogo.png" alt=""></span>
            </a>
        </div>
    </section>
    <section class="content1" id="content1">
        <div class="bg bg1">
            <div class="title">
                <h1>MEGA <em>MEC</em> STICK</h1>
                <div class="sub_title">
                    <span></span>
                    <p>메가로운 일상의 커피</p>
                    <span></span>
                </div>
                <div class="name">
                    <div class="leftname">
                        <p class="h2">MEGA SIZE</p>
                        <p class="info">
                            하루에 하나로 충분!<br>
                            메가로운 대용량 아메리카노
                        </p>
                    </div>
                    <div class="rigtname">
                        <p class="h2">MEGA SWEET</p>
                        <p class="info">
                            당 걱정없는 당 충전!<br>
                            건강한 단맛, 스테비아 믹스 커피
                        </p>
                    </div>
                </div>
            </div>
            <div class="shaptitle">
                <a href="#">
                    <span>ORIGINAL AMERICANO</span>
                    <span>오리지날 아메리카노</span>
                </a>
                <a href="#">
                    <span>DECAF AMERICANO</span>
                    <span>디카페인 아메리카노</span>
                </a>
                <a href="#">
                    <span>STEVIA MIX COFFEE</span>
                    <span>스테비아 믹스 커피</span>
                </a>
                <a href="#">
                    <span>STEVIA DECAF MIX COFFEE</span>
                    <span>스테비아 디카페인 믹스 커피</span>
                </a>
            </div>
        </div>
    </section>
    <section class="content2" id="content2">
        <div class="bg bg2">
            <div class="txt2">
                <h1>
                    MEGA COFFEE<br>
                    & 2 SHOT
                </h1>
                <p>
                    100% 프리미엄 아라비카 원두를 로스팅하여,<br>
                    깊고 부드러운 커피와 빅 사이즈로 구성된<br>
                    다양한 음료를 합리적인 가격으로 제공합니다.
                </p>
                <div class="btn">
                    <a href="#">브랜드 소개</a>
                    <a href="#">창업문의</a>
                </div>
            </div>
        </div>
    </section>
    <section class="content3" id="content3">
        <div class="bg bg3">
            <div class="txt3">
                <h1>올 여름, 반할 남도</h1>
                <h2>남도의 여름을 담다</h2>
                <p>
                    남도의 햇살, 청량한 바다, 아름다운 풍경이 그려지는 맛 !<br>
                    여름을 머금어 싱그럽게 빛나는 여름 제철 과일 음료를<br>
                    지금 바로 가까운 메가MGC커피에서 만나보세요!
                </p>
                <a href="./menu.html">메뉴 더 보기</a>
            </div>
        </div>
    </section>
    <section class="content4" id="content4">
        <div class="bg bg4">
            <iframe src="https://www.youtube.com/embed/Ppe5NIRco8A" title="메가MGC커피 창업 정보 안내" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
            <div class="txt4">
                <h1>
                    FRANCHISE<br>
                    MEGA MGC<br>
                    COFFEE<br>
                    5,817<em>만원</em>
                </h1>
                <h2>
                    지금, 메가MGC커피에서<br>
                    창업성공 스토리를 경험해보세요.<br>
                </h2>
                <p>
                    합리적인 창업비용과 다양한 경험을 바탕으로,<br>
                    다양한 노하우를 전수하여 창업 성공을 약속드립니다.
                </p>
                <a href="#">
                    창업 문의 바로가기
                </a>
            </div>
        </div>
    </section>
    <section class="content5" id="content5">
        <div class="onepay">
            <a href="#"><img src="../resources/statics/test_img/content5_onepay.jpg" alt=""></a>
            <div class="info1">
                <p>8월 메가 MGC커피X 하나 원큐</p>
                <p>
                    [유의사항] - 본 이벤트에 참여하시면<br>
                    최대 2,000하나머니를 적립 받으실 수 있습니다.<br>
                    2023-08-16
                </p>
            </div>
        </div>
        <div class="kakaopay">
            <a href="#"><img src="../resources/statics/test_img/content5_kakaopay.jpg" alt=""></a>
            <div class="info2">
                <p>카카오페이,  5,000 이상 결제</p>
                <p>2023-08-14</p>
            </div>
        </div>
        <div class="event">
            <a href="#"><img src="../resources/statics/test_img/content5_event.png" alt=""></a>
            <div class="info3">
                <p>여름시즌2 오픈 기념 이벤트</p>
                <p>2023-07-03</p>
            </div>
        </div>
    </section>
</main>
<%@include file="common/footer.jsp"%>
<script> /* swiper-js */
window.alert("현재 이 사이트는 메뉴, 음료, 푸드, 상품, 매장찾기, 고객의 소리까지 구성되어 있습니다. 감사합니다.")
const swiper = new Swiper('.swiper', {
    // Optional parameters
    autoplay:{delay:2000},
    loop: true,
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    },
    speed:700,
})
</script>
<script src="../resources/statics/js/index.js"></script>
</body>
</html>