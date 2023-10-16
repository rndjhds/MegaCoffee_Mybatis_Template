<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../resources/statics/style/food.css">
    <link rel="stylesheet" href="../../resources/statics/style/reset.css">
    <link rel="stylesheet" href="../../resources/statics/style/index.css">
    <link rel="stylesheet" href="../../resources/statics/style/index_uiux.css">
    <title>푸드 | 메가커피</title>
</head>
<body>
<main>
    <div class="topgo">
        <a href="#">
            <span>Top</span>
            <span><img src="../../resources/statics/test_img/toplogo.png" alt=""></span>
        </a>
    </div>
    <section class="food_top">
        <div class="food_page">
            <p>FOOD MENU</p>
            <a href="#"><img src="../../resources/statics/test_img/yellow_logo.png" alt=""></a>
            <p class="food_page_info">
                <em>음료와 잘 어울리는</em><br>
                다양한 디저트
            </p>
            <div class="listbtn">
                <a href="/menu/drinkView">음료</a>
                <a href="/menu/foodView">푸드</a>
                <a href="/menu/productView">상품</a>
            </div>
        </div>
    </section>
    <section class="food_title">
        <p>메가 MGC 커피의 엄선된 메뉴</p>
        <div class="food_title_center">
            <span></span>
            <p>MEGA MENU</p>
            <span></span>
        </div>
        <p>*메뉴 이미지는 연출컷이라 실물과 다를수 있습니다.</p>
    </section>
    <section class="food_search">
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
                    <label for="b">디저트
                        <input id="b" type="checkbox">
                    </label>
                    <label for="h">신상품
                        <input id="h" type="checkbox">
                    </label>
                </div>
            </fieldset>
        </form>
    </section>
    <section class="food_list">
        <div class="food_1">
            <div class="food_poji">
                <a><img src="../../resources/statics/food_img/food_1.jpg" alt=""></a>
                <div class="poji_title">
                    <p>아이스와앙모찌-고흥유자</p>
                    <a>정보 더 보기</a>
                </div>
            </div>
            <div class="food_txt">
                <div class="txt_title">
                    <p>아이스와앙모찌-고흥유자</p>
                    <a href="#"><img src="../../resources/statics/drink_img/icon_x.png" alt=""></a>
                </div>
                <div class="food_info">
                    <p>
                        60g<br>
                        1회 제공량 165.0kcal
                    </p>
                    <p>
                        상큼한 고흥유자 필링에 쫀득한 떡을
                        감싸 만든 시원한 여름 한정
                        아이스와앙모찌
                    </p>
                    <p>
                        알레르기 성분 : 우유, 대두, 밀, 아황산류, 돼지고기
                    </p>
                </div>
                <ul>
                    <li>포화지방 3.1g</li>
                    <li>나트륨 168.0mg</li>
                    <li>카페인 0mm</li>
                    <li>당류 13.0g</li>
                    <li>단백질 2.0g</li>
                </ul>
            </div>
        </div>
        <div class="food_2">
            <div class="food_poji">
                <a><img src="../../resources/statics/food_img/food_2.jpg" alt=""></a>
                <div class="poji_title">
                    <p>아이스와앙모찌-팥빙수</p>
                    <a>정보 더 보기</a>
                </div>
            </div>
            <div class="food_txt">
                <div class="txt_title">
                    <p>아이스와앙모찌-팥빙수</p>
                    <a href="#"><img src="../../resources/statics/drink_img/icon_x.png" alt=""></a>
                </div>
                <div class="food_info">
                    <p>
                        60g<br>
                        1회 제공량 160.0kcal
                    </p>
                    <p>
                        달달한 연유와 빙수크림을 쫀득한
                        떡으로 감싸 만든 시원한 여름 한정
                        아이스와앙모찌
                    </p>
                    <p>
                        알레르기 성분 : 우유, 대두, 밀, 돼지고기
                    </p>
                </div>
                <ul>
                    <li>포화지방 2.5g</li>
                    <li>나트륨 76mg</li>
                    <li>카페인 0mm</li>
                    <li>당류 12.0g</li>
                    <li>단백질 20.g</li>
                </ul>
            </div>
        </div>
        <div class="food_3">
            <div class="food_poji">
                <a><img src="../../resources/statics/food_img/food_3.jpg" alt=""></a>
                <div class="poji_title">
                    <p>오트밀 팬케이크</p>
                    <a>정보 더 보기</a>
                </div>
            </div>
            <div class="food_txt">
                <div class="txt_title">
                    <p>오트밀 팬케이크</p>
                    <a href="#"><img src="../../resources/statics/drink_img/icon_x.png" alt=""></a>
                </div>
                <div class="food_info">
                    <p>
                        60g<br>
                        1회 제공량 160.0kcal
                    </p>
                    <p>
                        달달한 연유와 빙수크림을 쫀득한
                        떡으로 감싸 만든 시원한 여름 한정
                        아이스와앙모찌
                    </p>
                    <p>
                        알레르기 성분 : 우유, 대두, 밀, 돼지고기
                    </p>
                </div>
                <ul>
                    <li>포화지방 2.5g</li>
                    <li>나트륨 76mg</li>
                    <li>카페인 0mm</li>
                    <li>당류 12.0g</li>
                    <li>단백질 20.g</li>
                </ul>
            </div>
        </div>
        <div class="food_4">
            <div class="food_poji">
                <a><img src="../../resources/statics/food_img/food_4.jpg" alt=""></a>
                <div class="poji_title">
                    <p>티라미수 팬케이크</p>
                    <a>정보 더 보기</a>
                </div>
            </div>
            <div class="food_txt">
                <div class="txt_title">
                    <p>티라미수 팬케이크</p>
                    <a href="#"><img src="../../resources/statics/drink_img/icon_x.png" alt=""></a>
                </div>
                <div class="food_info">
                    <p>
                        60g<br>
                        1회 제공량 160.0kcal
                    </p>
                    <p>
                        달달한 연유와 빙수크림을 쫀득한
                        떡으로 감싸 만든 시원한 여름 한정
                        아이스와앙모찌
                    </p>
                    <p>
                        알레르기 성분 : 우유, 대두, 밀, 돼지고기
                    </p>
                </div>
                <ul>
                    <li>포화지방 2.5g</li>
                    <li>나트륨 76mg</li>
                    <li>카페인 0mm</li>
                    <li>당류 12.0g</li>
                    <li>단백질 20.g</li>
                </ul>
            </div>
        </div>
        <div class="food_5">
            <div class="food_poji">
                <a><img src="../../resources/statics/food_img/food_5.png" alt=""></a>
                <div class="poji_title">
                    <p>버터버터소금빵</p>
                    <a>정보 더 보기</a>
                </div>
            </div>
            <div class="food_txt">
                <div class="txt_title">
                    <p>버터버터소금빵</p>
                    <a href="#"><img src="../../resources/statics/drink_img/icon_x.png" alt=""></a>
                </div>
                <div class="food_info">
                    <p>
                        60g<br>
                        1회 제공량 160.0kcal
                    </p>
                    <p>
                        달달한 연유와 빙수크림을 쫀득한
                        떡으로 감싸 만든 시원한 여름 한정
                        아이스와앙모찌
                    </p>
                    <p>
                        알레르기 성분 : 우유, 대두, 밀, 돼지고기
                    </p>
                </div>
                <ul>
                    <li>포화지방 2.5g</li>
                    <li>나트륨 76mg</li>
                    <li>카페인 0mm</li>
                    <li>당류 12.0g</li>
                    <li>단백질 20.g</li>
                </ul>
            </div>
        </div>
        <div class="food_6">
            <div class="food_poji">
                <a><img src="../../resources/statics/food_img/food_6.jpg" alt=""></a>
                <div class="poji_title">
                    <p>크루아상</p>
                    <a>정보 더 보기</a>
                </div>
            </div>
            <div class="food_txt">
                <div class="txt_title">
                    <p>크루아상</p>
                    <a href="#"><img src="../../resources/statics/drink_img/icon_x.png" alt=""></a>
                </div>
                <div class="food_info">
                    <p>
                        60g<br>
                        1회 제공량 160.0kcal
                    </p>
                    <p>
                        달달한 연유와 빙수크림을 쫀득한
                        떡으로 감싸 만든 시원한 여름 한정
                        아이스와앙모찌
                    </p>
                    <p>
                        알레르기 성분 : 우유, 대두, 밀, 돼지고기
                    </p>
                </div>
                <ul>
                    <li>포화지방 2.5g</li>
                    <li>나트륨 76mg</li>
                    <li>카페인 0mm</li>
                    <li>당류 12.0g</li>
                    <li>단백질 20.g</li>
                </ul>
            </div>
        </div>
        <div class="food_7">
            <div class="food_poji">
                <a><img src="../../resources/statics/food_img/food_7.jpg" alt=""></a>
                <div class="poji_title">
                    <p>말차스모어쿠키</p>
                    <a>정보 더 보기</a>
                </div>
            </div>
            <div class="food_txt">
                <div class="txt_title">
                    <p>말차스모어쿠키</p>
                    <a href="#"><img src="../../resources/statics/drink_img/icon_x.png" alt=""></a>
                </div>
                <div class="food_info">
                    <p>
                        60g<br>
                        1회 제공량 160.0kcal
                    </p>
                    <p>
                        달달한 연유와 빙수크림을 쫀득한
                        떡으로 감싸 만든 시원한 여름 한정
                        아이스와앙모찌
                    </p>
                    <p>
                        알레르기 성분 : 우유, 대두, 밀, 돼지고기
                    </p>
                </div>
                <ul>
                    <li>포화지방 2.5g</li>
                    <li>나트륨 76mg</li>
                    <li>카페인 0mm</li>
                    <li>당류 12.0g</li>
                    <li>단백질 20.g</li>
                </ul>
            </div>
        </div>
        <div class="food_8">
            <div class="food_poji">
                <a><img src="../../resources/statics/food_img/food_8.jpg" alt=""></a>
                <div class="poji_title">
                    <p>초코스모어쿠키</p>
                    <a>정보 더 보기</a>
                </div>
            </div>
            <div class="food_txt">
                <div class="txt_title">
                    <p>초코스모어쿠키</p>
                    <a href="#"><img src="../../resources/statics/drink_img/icon_x.png" alt=""></a>
                </div>
                <div class="food_info">
                    <p>
                        60g<br>
                        1회 제공량 160.0kcal
                    </p>
                    <p>
                        달달한 연유와 빙수크림을 쫀득한
                        떡으로 감싸 만든 시원한 여름 한정
                        아이스와앙모찌
                    </p>
                    <p>
                        알레르기 성분 : 우유, 대두, 밀, 돼지고기
                    </p>
                </div>
                <ul>
                    <li>포화지방 2.5g</li>
                    <li>나트륨 76mg</li>
                    <li>카페인 0mm</li>
                    <li>당류 12.0g</li>
                    <li>단백질 20.g</li>
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

<script src="../../resources/statics/js/food.js"></script>
<script src="../../resources/statics/js/index.js"></script>
<%@include file="../common/footer.jsp"%>
</body>
</html>