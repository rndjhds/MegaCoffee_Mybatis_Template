<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/statics/style/saveMenu.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/statics/style/reset.css">
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
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
        <form id="form">
            <fieldset>
                <div class="left">
                    <input type="hidden" value="${sessionScope.member.memberId}" name="memberId" id="memberId"/>
                    <label for="categoryId">상위 카테고리</label>
                    <select id="categoryId" name="categoryId">
                        <option value="">전체</option>
                        <c:forEach var="parentCategory" items="${parentCategoryId}">
                            <option value=${parentCategory.categoryId}>
                                    ${parentCategory.categoryName}
                            </option>
                        </c:forEach>
                    </select>
                    <label for="title">상품명
                        <input type="text" id="title" name="title" placeholder="상품명을 입력해주세요.">
                    </label>
                    <label for="uploadImg">상품사진
                        <input type="file" id="uploadImg" name="uploadImg">
                    </label>
                    <label for="price">가격
                        <input type="number" id="price" name="price" placeholder="가격을 입력해주세요.">
                    </label>
                    <button type="submit" class="btn">저장</button>
                </div>
                <div class="right">
                    <label for="content">자세한 설명
                        <textarea name="content" id="content" cols="30" rows="10"></textarea>
                    </label>
                </div>
            </fieldset>
        </form>
    </section>
</main>
</body>

<script>

    $(document).ready(function () {
        $("form").validate({
            rules: {
                categoryId: {
                    required: true
                },
                title: {
                    required: true
                },
                uploadImg: {
                    required: true
                },
                price: {
                    required: true
                },
                content: {
                    required: true
                }
            },
            messages: {
                categoryId: {
                    required: "상품 카테고리를 선택해주세요."
                },
                title: {
                    required: "상품명을 입력해야 합니다."
                },
                uploadImg: {
                    required: "상품 이미지를 입력해야 합니다."
                },
                price: {
                    required: "가격을 입력해야 합니다."
                },
                content: {
                    required: "상품 설명을 입력해주세요."
                }
            },
            submitHandler: function () {
                let form = document.getElementById("form");
                let formData = new FormData(form);
                $.ajax({
                    url: "${pageContext.request.contextPath}/item/saveItem",
                    contentType: false,
                    type: "POST",
                    dataType: "json",
                    processData: false,
                    enctype:"multipart/form-data",
                    data: formData,
                    success: function (data) {
                        if(data != 0) {
                            alert("정상적으로 완료되었습니다");
                            window.close();
                        } else {
                            alert("정상적으로 완료되지 못했습니다.")
                            window.close();
                        }
                    },
                    error: function () {
                        alert("정상적으로 완료하지 못하였습니다.");
                    }
                });
            }
        });
    });

</script>

</html>