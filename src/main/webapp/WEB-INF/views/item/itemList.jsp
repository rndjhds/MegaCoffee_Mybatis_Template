<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../common/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/statics/style/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/statics/style/drink.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/statics/style/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/statics/style/index_uiux.css">
    <title>음료메뉴 | 메가커피</title>
</head>
<body>
<main>
    <div class="topgo">
        <a href="#">
            <span>Top</span>
            <span><img src="${pageContext.request.contextPath}/resources/statics/test_img/toplogo.png" alt=""></span>
        </a>
    </div>
    <section class="drink_top">
        <div class="drink_page">
            <p>DRINK MENU</p>
            <a href="#"><img src="${pageContext.request.contextPath}/resources/statics/test_img/yellow_logo.png" alt=""></a>
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
            <input type="hidden" id="start">
            <input type="hidden" name="parentCategoryId" id="parentCategoryId" value="${parentCategoryId}">
            <input type="hidden" name="deleteYN" id="deleteYN" value="N">
            <fieldset>
                <legend>메뉴찾기양식</legend>
                <div class="search">
                    <p>메뉴검색</p>
                    <div class="search_bar">
                        <input type="text" name="title" id="title" placeholder="검색하여 손 쉽게 찾아보세요.">
                        <button type="button" onclick="reloadPage()"><img
                                src="${pageContext.request.contextPath}/resources/statics/drink_img/icon_search.gif"
                                alt=""></button>
                    </div>
                </div>
                <div class="cheack">
                    <label>전체상품보기
                        <input name="categoryId" type="radio" checked value="">
                    </label>
                    <c:forEach var="categoryList" items="${categoryList}">
                        <label>${categoryList.categoryName}</label>
                        <input type="radio" name="categoryId" id="categoryId" value="${categoryList.categoryId}">
                    </c:forEach>
                </div>
            </fieldset>
        </form>
    </section>
    <section class="drink_list">
    </section>
    <section class="pagenum">

    </section>
</main>
<script src="${pageContext.request.contextPath}/resources/statics/js/drink.js"></script>
<script type="text/javascript">

    $(document).ready(function () {
        searchItem(1);
        createPageCountNum();
    })

    function searchItem(ths) {
        $.ajax({
            url: "${pageContext.request.contextPath}/item/itemList",
            type: "POST",
            contentType: "application/json; charset-utf-8",
            dataType: "json",
            data: JSON.stringify({
                parentCategoryId: $("#parentCategoryId").val(),
                deleteYN: $("#deleteYN").val(),
                categoryId: $("input[name='categoryId']:checked").val(),
                title: $("#title").val(),
                pagination: {
                    start: (ths -1)  * 8,
                    length: 8
                }
            }),
            success: function (data) {
                for (let i = 0; i < data.length; i++) {
                    $(".drink_list").append(
                        "<div class='drink_1'> " +
                        "<div class='drink_poji'>" +
                        " <a href='/item/itemDetail/" + data[i].itemId + "'>" +
                        "<img src='${pageContext.request.contextPath}/resources/statics/img/" + data[i].img + "'>" +
                        "</a>" +
                        " <div class='poji_title'>" +
                        "<p>" + data[i].title + "</p>" +
                        "<a>정보 더 보기</a>" +
                        "</div>" +
                        "</div>" +
                        "</div>");
                }
            },
            error: function () {
                alert("정상적으로 완료하지 못하였습니다.");
            }
        });
    }

    function createPageCountNum() {
        $.ajax({
            url: "${pageContext.request.contextPath}/item/createPageCount",
            type: "POST",
            contentType: "application/json; charset-utf-8",
            dataType: "json",
            data: JSON.stringify({
                parentCategoryId: $("#parentCategoryId").val(),
                deleteYN: $("#deleteYN").val(),
                categoryId: $("input[name='categoryId']:checked").val(),
                title: $("#title").val()
            }),
            success: function (data) {
                for (let i = 1; i <= data; i++) {
                    $(".pagenum").append("<a onclick='movePageNum(this)'>" + i + "</a>");
                }
            },
            error: function () {
                alert("정상적으로 완료하지 못하였습니다.");
            }
        });
    }

    function movePageNum(ths) {
        $(".drink_list").empty();
        let start = $(ths).text();
        searchItem(start);
    }

    function reloadPage() {
        $(".drink_list").empty();
        $(".pagenum").empty();
        searchItem(1);
        createPageCountNum();
    }
</script>
<%@include file="../common/footer.jsp" %>
</body>
</html>