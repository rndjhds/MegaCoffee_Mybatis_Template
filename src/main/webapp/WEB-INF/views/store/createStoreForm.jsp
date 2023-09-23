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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function openDaumPostcode() {
            new daum.Postcode({
                oncomplete: function (data) {
                    document.getElementById('zipcode').value = data.zonecode;
                    document.getElementById('address').value = data.address;
                }
            }).open();
        }
    </script>

    <title>하위 카테고리등록</title>
</head>
<body>
<main>
    <section class="content1">
        <div>
            <p>
                STORE REGISTRATION
            </p>
            <p>
                FOR THE MANAGER
            </p>
        </div>
    </section>
    <section class="content2">
        <div>
            <span></span>
            <p>
                메가 MGC의 시작<br>
                <em>STORE</em>
            </p>
            <span></span>
        </div>
    </section>
    <section class="content3">
        <div class="left">
            <form>
                <input type="hidden" id="storeId" name="storeId" value=${store.storeId}>
                <input type="hidden" id="register" name="register" readonly value="${sessionScope.member.memberId}">
                <input type="hidden" id="deleteChk" value="${store.deleteYN}">
                <fieldset>
                    <label for="storeName">매장명
                        <input type="text" id="storeName" name="storeName" value="${store.storeName}">
                    </label>
                    <label for="memberId" style="display: flex;align-items: center;flex-flow: column;">가맹점주
                        <select style="margin-top: 10px;width: 150px;" id="memberId" name="memberId">
                            <option value="">전체</option>
                            <c:forEach var="manager" items="${managers}">
                                <option value=${manager.memberId}
                                                <c:if test ="${store.memberId eq manager.memberId}">selected="selected"</c:if>>
                                        ${manager.username}
                                </option>
                            </c:forEach>
                        </select>
                    </label>
                    <label for="zipcode">우편번호
                        <input type="text" id="zipcode" name="zipcode" value="${store.zipcode}" readonly
                               onclick="openDaumPostcode()">
                    </label>
                    <label for="address">주소
                        <input type="text" id="address" name="address" value="${store.address}" readonly>
                    </label>
                    <label for="addressDetail">상세주소
                        <input type="text" id="addressDetail" name="addressDetail" value="${store.addressDetail}">
                    </label>
                    <c:if test="${store.storeId != null}">
                    <label for="deleteYN"  style="display: flex;align-items: center;flex-flow: column;">삭제 여부
                        <select id="deleteYN" name="deleteYN" style="margin-top: 10px;width: 150px;">
                            <option value="N">삭제X</option>
                            <option value="Y">삭제</option>
                        </select>
                    </label>
                    </c:if>
                    <c:if test="${not empty store}">
                        <button type="submit" class="btn">수정</button>
                    </c:if>
                    <c:if test="${empty store}">
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
                storeName: {
                    required: true
                },
                memberId: {
                    required: true
                },
                zipcode: {
                    required: true
                },
                address: {
                    required: true
                },
                addressDetail: {
                    required: true
                },
                deleteYN: {
                    required: true
                }
            },
            messages: {
                storeName: {
                    required: "매장명을 입력해주세요"
                },
                memberId: {
                    required: "가맹점주를 선택해주세요"
                },
                zipcode: {
                    required: "우편번호를 입력해주세요"
                },
                address: {
                    required: "주소를 입력해주세요"
                },
                addressDetail: {
                    required: "상세주소를 입력해주세요"
                }
            },
            submitHandler: function () {
                $.ajax({
                    url: "${pageContext.request.contextPath}/store/savestore",
                    contentType: "application/json; charset-utf-8",
                    type: "POST",
                    dataType: "json",
                    data: JSON.stringify({
                        storeId: $("#storeId").val(),
                        register: $("#register").val(),
                        storeName: $("#storeName").val(),
                        zipcode: $("#zipcode").val(),
                        address: $("#address").val(),
                        addressDetail: $("#addressDetail").val(),
                        memberId: $("select[name='memberId']").val(),
                        deleteYN: $("select[name='deleteYN']").val()
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