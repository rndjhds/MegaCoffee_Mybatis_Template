<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@include file="../common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../resources/statics/style/reset.css">
    <link rel="stylesheet" href="../../resources/statics/style/drink.css">
    <link rel="stylesheet" href="../../resources/statics/style/index.css">
    <link rel="stylesheet" href="../../resources/statics/style/index_uiux.css">
    <title>음료메뉴 | 메가커피</title>
</head>
<body>
<main>
    <div class="topgo">
        <a href="#">
            <span>Top</span>
            <span><img src="../../resources/statics/test_img/toplogo.png" alt=""></span>
        </a>
    </div>
    <section class="drink_top">
        <div class="drink_page">
            <p>DRINK MENU</p>
            <a href="#"><img src="../../resources/statics/test_img/yellow_logo.png" alt=""></a>
            <p class="drink_page_info">
                <em>깊고 부드러운 커피 맛의 비밀</em><br>
                행복을 선사하는 다양한 음료
            </p>
            <div class="listbtn">
                <a href="/menu/drinkView">음료</a>
                <a href="/menu/foodView">푸드</a>
                <a href="/menu/productView">상품</a>
            </div>
        </div>
    </section>
    <section class="drink_title">
        <p>메가 MGC 커피의 엄선된 메뉴</p>
        <div class="drink_title_center">
            <span></span>
            <p>MEGA MENU</p>
            <span></span>
        </div>
        <p>*메뉴 이미지는 연출컷이라 실물과 다를수 있습니다.</p>
    </section>
    <section class="drink_search">
        <form action="#" method="get">
            <fieldset>
                <legend>메뉴찾기양식</legend>
                <div class="search">
                    <p>메뉴검색</p>
                    <div class="search_bar">
                        <input type="search" placeholder="검색하여 손 쉽게 찾아보세요.">
                        <button type="submit"><img src="../../resources/statics/drink_img/icon_search.gif" alt=""></button>
                    </div>
                </div>
                <div class="cheack">
                    <label for="a">전체상품보기
                        <input id="a" type="checkbox">
                    </label>
                    <label for="b">커피
                        <input id="b" type="checkbox">
                    </label>
                    <label for="c">티
                        <input id="c" type="checkbox">
                    </label>
                    <label for="d">에이드&주스
                        <input id="d" type="checkbox">
                    </label>
                    <label for="e">스무디&프라페
                        <input id="e" type="checkbox">
                    </label>
                    <label for="f">디카페인
                        <input id="f" type="checkbox">
                    </label>
                    <label for="g">음료
                        <input id="g" type="checkbox">
                    </label>
                    <label for="h">신상품
                        <input id="h" type="checkbox">
                    </label>
                </div>
            </fieldset>
        </form>
    </section>
    <section class="drink_list">
        <div class="drink_1">
            <div class="drink_poji">
                <a><img src="../../resources/statics/drink_img/drink_1.jpg" alt=""></a>
                <div class="poji_title">
                    <p>고흥 유자망고 스무디</p>
                    <a>정보 더 보기</a>
                </div>
            </div>
            <div class="drink_txt">
                <div class="txt_title">
                    <p>고흥 유자망고 스무디</p>
                    <a href="#"><img src="../../resources/statics/drink_img/icon_x.png" alt=""></a>
                </div>
                <div class="drink_info">
                    <p>
                        20oz<br>
                        1회 제공량 210.1kcal
                    </p>
                    <p>
                        메가MGC커피의 여름시즌 인기 음료인
                        망고스무디를 상큼한 고흥유자와
                        블렌딩하여 새콤달콤 시원하게 즐길 수
                        있는 여름 한정 메뉴
                    </p>
                    <p>
                        알레르기 성분 :
                    </p>
                </div>
                <ul>
                    <li>포화지방 0.1g</li>
                    <li>나트륨 14.6mg</li>
                    <li>카페인 0mm</li>
                    <li>당류 40.9g</li>
                    <li>단백질 0.8g</li>
                </ul>
            </div>
        </div>
        <div class="drink_2">
            <div class="drink_poji">
                <a><img src="../../resources/statics/drink_img/drink_2.jpg" alt=""></a>
                <div class="poji_title">
                    <p>나주 플럼코트 스무디</p>
                    <a>정보 더 보기</a>
                </div>
            </div>
            <div class="drink_txt">
                <div class="txt_title">
                    <p>나주 플럼코트 스무디</p>
                    <a href="#"><img src="../../resources/statics/drink_img/icon_x.png" alt=""></a>
                </div>
                <div class="drink_info">
                    <p>
                        20oz<br>
                        1회 제공량 210.1kcal
                    </p>
                    <p>
                        메가MGC커피의 여름시즌 인기 음료인
                        망고스무디를 상큼한 고흥유자와
                        블렌딩하여 새콤달콤 시원하게 즐길 수
                        있는 여름 한정 메뉴
                    </p>
                    <p>
                        알레르기 성분 :
                    </p>
                </div>
                <ul>
                    <li>포화지방 0.1g</li>
                    <li>나트륨 14.6mg</li>
                    <li>카페인 0mm</li>
                    <li>당류 40.9g</li>
                    <li>단백질 0.8g</li>
                </ul>
            </div>
        </div>
        <div class="drink_3">
            <div class="drink_poji">
                <a><img src="../../resources/statics/drink_img/drink_3.jpg" alt=""></a>
                <div class="poji_title">
                    <p>고흥 유자 하이볼 에이드</p>
                    <a>정보 더 보기</a>
                </div>
            </div>
            <div class="drink_txt">
                <div class="txt_title">
                    <p>고흥유자 하이볼 에이드</p>
                    <a href="#"><img src="../../resources/statics/drink_img/icon_x.png" alt=""></a>
                </div>
                <div class="drink_info">
                    <p>
                        20oz<br>
                        1회 제공량 210.1kcal
                    </p>
                    <p>
                        메가MGC커피의 여름시즌 인기 음료인
                        망고스무디를 상큼한 고흥유자와
                        블렌딩하여 새콤달콤 시원하게 즐길 수
                        있는 여름 한정 메뉴
                    </p>
                    <p>
                        알레르기 성분 :
                    </p>
                </div>
                <ul>
                    <li>포화지방 0.1g</li>
                    <li>나트륨 14.6mg</li>
                    <li>카페인 0mm</li>
                    <li>당류 40.9g</li>
                    <li>단백질 0.8g</li>
                </ul>
            </div>
        </div>
        <div class="drink_4">
            <div class="drink_poji">
                <a><img src="../../resources/statics/drink_img/drink_4.jpg" alt=""></a>
                <div class="poji_title">
                    <p>보성 녹차레몬 에이드</p>
                    <a>정보 더 보기</a>
                </div>
            </div>
            <div class="drink_txt">
                <div class="txt_title">
                    <p>보성 녹차레몬 에이드</p>
                    <a href="#"><img src="../../resources/statics/drink_img/icon_x.png" alt=""></a>
                </div>
                <div class="drink_info">
                    <p>
                        20oz<br>
                        1회 제공량 210.1kcal
                    </p>
                    <p>
                        메가MGC커피의 여름시즌 인기 음료인
                        망고스무디를 상큼한 고흥유자와
                        블렌딩하여 새콤달콤 시원하게 즐길 수
                        있는 여름 한정 메뉴
                    </p>
                    <p>
                        알레르기 성분 :
                    </p>
                </div>
                <ul>
                    <li>포화지방 0.1g</li>
                    <li>나트륨 14.6mg</li>
                    <li>카페인 0mm</li>
                    <li>당류 40.9g</li>
                    <li>단백질 0.8g</li>
                </ul>
            </div>
        </div>
        <div class="drink_5">
            <div class="drink_poji">
                <a><img src="../../resources/statics/drink_img/drink_5.jpg" alt=""></a>
                <div class="poji_title">
                    <p>디카페인 에스프레스</p>
                    <a>정보 더 보기</a>
                </div>
            </div>
            <div class="drink_txt">
                <div class="txt_title">
                    <p>디카페인 에스프레스</p>
                    <a href="#"><img src="../../resources/statics/drink_img/icon_x.png" alt=""></a>
                </div>
                <div class="drink_info">
                    <p>
                        20oz<br>
                        1회 제공량 210.1kcal
                    </p>
                    <p>
                        메가MGC커피의 여름시즌 인기 음료인
                        망고스무디를 상큼한 고흥유자와
                        블렌딩하여 새콤달콤 시원하게 즐길 수
                        있는 여름 한정 메뉴
                    </p>
                    <p>
                        알레르기 성분 :
                    </p>
                </div>
                <ul>
                    <li>포화지방 0.1g</li>
                    <li>나트륨 14.6mg</li>
                    <li>카페인 0mm</li>
                    <li>당류 40.9g</li>
                    <li>단백질 0.8g</li>
                </ul>
            </div>
        </div>
        <div class="drink_6">
            <div class="drink_poji">
                <a><img src="../../resources/statics/drink_img/drink_6.jpg" alt=""></a>
                <div class="poji_title">
                    <p>에스프레스 피에노</p>
                    <a>정보 더 보기</a>
                </div>
            </div>
            <div class="drink_txt">
                <div class="txt_title">
                    <p>에스프레스 피에노</p>
                    <a href="#"><img src="../../resources/statics/drink_img/icon_x.png" alt=""></a>
                </div>
                <div class="drink_info">
                    <p>
                        20oz<br>
                        1회 제공량 210.1kcal
                    </p>
                    <p>
                        메가MGC커피의 여름시즌 인기 음료인
                        망고스무디를 상큼한 고흥유자와
                        블렌딩하여 새콤달콤 시원하게 즐길 수
                        있는 여름 한정 메뉴
                    </p>
                    <p>
                        알레르기 성분 :
                    </p>
                </div>
                <ul>
                    <li>포화지방 0.1g</li>
                    <li>나트륨 14.6mg</li>
                    <li>카페인 0mm</li>
                    <li>당류 40.9g</li>
                    <li>단백질 0.8g</li>
                </ul>
            </div>
        </div>
        <div class="drink_7">
            <div class="drink_poji">
                <a><img src="../../resources/statics/drink_img/drink_7.jpg" alt=""></a>
                <div class="poji_title">
                    <p>디카페인 아메리카노</p>
                    <a>정보 더 보기</a>
                </div>
            </div>
            <div class="drink_txt">
                <div class="txt_title">
                    <p>다카페인 아메리카노</p>
                    <a href="#"><img src="../../resources/statics/drink_img/icon_x.png" alt=""></a>
                </div>
                <div class="drink_info">
                    <p>
                        20oz<br>
                        1회 제공량 210.1kcal
                    </p>
                    <p>
                        메가MGC커피의 여름시즌 인기 음료인
                        망고스무디를 상큼한 고흥유자와
                        블렌딩하여 새콤달콤 시원하게 즐길 수
                        있는 여름 한정 메뉴
                    </p>
                    <p>
                        알레르기 성분 :
                    </p>
                </div>
                <ul>
                    <li>포화지방 0.1g</li>
                    <li>나트륨 14.6mg</li>
                    <li>카페인 0mm</li>
                    <li>당류 40.9g</li>
                    <li>단백질 0.8g</li>
                </ul>
            </div>
        </div>
        <div class="drink_8">
            <div class="drink_poji">
                <a><img src="../../resources/statics/drink_img/drink_8.jpg" alt=""></a>
                <div class="poji_title">
                    <p>디카페인 카푸치노</p>
                    <a>정보 더 보기</a>
                </div>
            </div>
            <div class="drink_txt">
                <div class="txt_title">
                    <p>디카페인 카푸치노</p>
                    <a href="#"><img src="../../resources/statics/drink_img/icon_x.png" alt=""></a>
                </div>
                <div class="drink_info">
                    <p>
                        20oz<br>
                        1회 제공량 210.1kcal
                    </p>
                    <p>
                        메가MGC커피의 여름시즌 인기 음료인
                        망고스무디를 상큼한 고흥유자와
                        블렌딩하여 새콤달콤 시원하게 즐길 수
                        있는 여름 한정 메뉴
                    </p>
                    <p>
                        알레르기 성분 :
                    </p>
                </div>
                <ul>
                    <li>포화지방 0.1g</li>
                    <li>나트륨 14.6mg</li>
                    <li>카페인 0mm</li>
                    <li>당류 40.9g</li>
                    <li>단백질 0.8g</li>
                </ul>
            </div>
        </div>
    </section>
    <section class="pagenume">
        <a href="#">처음</a>
        <a href="#">1</a>
        <a href="#">2</a>
        <a href="#">다음</a>
    </section>
</main>
<%@include file="../common/footer.jsp"%>
<script src="../../resources/statics/js/drink.js"></script>
<script src="../../resources/statics/js/index.js"></script>
</body>
</html>