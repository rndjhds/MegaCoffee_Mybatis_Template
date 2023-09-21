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
    <title>��ǰ���</title>
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
                �ް� MGC�� ����<br>
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
                    <label for="categoryId">���� ī�װ�</label>
                    <select id="categoryId" name="categoryId">
                        <option value="">��ü</option>
                        <c:forEach var="parentCategory" items="${parentCategoryId}">
                            <option value=${parentCategory.categoryId}>
                                    ${parentCategory.categoryName}
                            </option>
                        </c:forEach>
                    </select>
                    <label for="title">��ǰ��
                        <input type="text" id="title" name="title" placeholder="��ǰ���� �Է����ּ���.">
                    </label>
                    <label for="uploadImg">��ǰ����
                        <input type="file" id="uploadImg" name="uploadImg">
                    </label>
                    <label for="price">����
                        <input type="number" id="price" name="price" placeholder="������ �Է����ּ���.">
                    </label>
                    <button type="submit" class="btn">����</button>
                </div>
                <div class="right">
                    <label for="content">�ڼ��� ����
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
                    required: "��ǰ ī�װ��� �������ּ���."
                },
                title: {
                    required: "��ǰ���� �Է��ؾ� �մϴ�."
                },
                uploadImg: {
                    required: "��ǰ �̹����� �Է��ؾ� �մϴ�."
                },
                price: {
                    required: "������ �Է��ؾ� �մϴ�."
                },
                content: {
                    required: "��ǰ ������ �Է����ּ���."
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
                            alert("���������� �Ϸ�Ǿ����ϴ�");
                            window.close();
                        } else {
                            alert("���������� �Ϸ���� ���߽��ϴ�.")
                            window.close();
                        }
                    },
                    error: function () {
                        alert("���������� �Ϸ����� ���Ͽ����ϴ�.");
                    }
                });
            }
        });
    });

</script>

</html>