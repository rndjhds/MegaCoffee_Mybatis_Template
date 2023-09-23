<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/statics/style/saveCategory.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/statics/style/reset.css">
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
    <title>하위 카테고리등록</title>
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
                <em>CATEGORY</em>
            </p>
            <span></span>
        </div>
    </section>
    <section class="content3">
        <div class="left">
            <form>
                <input type="hidden" id="deleteChk" value="${category.deleteYN}">
                <input type="hidden" id="categoryId" name="categoryId" value=${category.categoryId}>
                <input type="hidden" id="memberId" name="memberId" readonly value="${sessionScope.member.memberId}">
                <fieldset>
                    <label for="categoryName">상위 카테고리
                        <input type="text" id="categoryName" name="categoryName" value="${category.categoryName}">
                    </label>
                    <c:if test="${category.categoryId != null}">
                        <label style="display: flex;align-items: center;flex-flow: column;">삭제 여부
                            <select id="deleteYN" name="deleteYN" style="margin-top: 10px;width: 150px;">
                                <option value="N">삭제X</option>
                                <option value="Y">삭제</option>
                            </select>
                        </label>
                    </c:if>
                    <c:if test="${not empty category}">
                        <button type="submit" class="btn">수정</button>
                    </c:if>
                    <c:if test="${empty category}">
                        <button type="submit" class="btn">저장</button>
                    </c:if>
                </fieldset>
            </form>
        </div>
    </section>
</main>
</body>

<script>

    $(document).ready(function () {
        let deleteChk = $("#deleteChk").val();
        if (deleteChk != null && deleteChk != "") {
            $("#deleteYN").val(deleteChk).prop("selected", true);
        }

        $("form").validate({
            rules: {
                categoryName: {
                    required: true
                },
                deleteYN: {
                    required: true
                }
            },
            messages: {
                categoryName: {
                    required: "카테고리를 입력해야 합니다."
                },
                deleteYN: {
                    required: "삭제여부를 선택해야 합니다."
                }
            },
            submitHandler: function () {
                $.ajax({
                    url: "${pageContext.request.contextPath}/category/saveCategory",
                    contentType: "application/json; charset-utf-8",
                    type: "POST",
                    dataType: "json",
                    data: JSON.stringify({
                        categoryId: $("#categoryId").val(),
                        deleteYN: $("select[name='deleteYN']").val(),
                        memberId: $("#memberId").val(),
                        categoryName: $("#categoryName").val()
                    }),
                    success: function (data) {
                        alert("정상적으로 완료되었습니다");
                        window.close();
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