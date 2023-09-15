<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../resources/statics/style/saveMenu.css">
    <link rel="stylesheet" href="../../resources/statics/style/reset.css">
    <title>상품등록</title>
</head>
<body>
<main>
    <section class="content1">
        <div>
            <p>
                Product registration
            </p>
            <p>
                FOR THE SELLER
            </p>
        </div>
    </section>
    <section class="content2">
        <div>
            <span></span>
            <p>
                메가 MGC의 시작<br>
                <em>PRODUCT</em>
            </p>
            <span></span>
        </div>
    </section>
    <section class="content3">
        <div class="left">
            <form action="#" method="get">
                <fieldset>
                    <label for="title">제목
                        <input type="text" id="title" placeholder="제목을 입력해주세요.">
                    </label>
                    <label for="imgs">제품사진
                        <input type="file" id="imgs">
                    </label>
                    <label for="num">가격
                        <input type="number" id="num" placeholder="가격을 입력해주세요.">
                    </label>
                </fieldset>
            </form>
        </div>
        <div class="right">
            <form action="#" method="get">
                <fieldset>
                    <label for="txt">자세한 설명
                        <textarea name="txt" id="txt" cols="30" rows="10"></textarea>
                    </label>
                </fieldset>
            </form>
        </div>
    </section>
</main>
</body>
</html>