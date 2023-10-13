<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/statics/style/deleteMember.css">
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.min.js"></script>
    <title>탈퇴</title>
</head>
<body>
<main>
    <section class="deta_top">
        <div class="deta_page">
            <p>Withdrawal</p>
            <p class="deta_page_info">
                탈퇴 양식
            </p>
        </div>
    </section>
    <section class="deta_title">
        <p>메가 MGC의 안내</p>
        <div class="deta_title_center">
            <span></span>
            <p>MEGA</p>
            <span></span>
        </div>
    </section>
    <section class="info">
        <div class="info_top">
            <h1>정말로 탈퇴하시겠습니까?</h1>
            <p>
                <span></span>한 번 삭제된 정보는 복구가 불가능합니다.<br>
                <span></span>선불카드 잔액이 남아있는 경우 탈퇴가 불가능합니다.<br>
                잔액 소진 후 탈퇴를 진행해 주세요.<br>
                <span></span>구독권 이영 중일 경우 탈퇴가 불가능합니다.<br>
                구독 해지 이후 탈퇴를 진행해 주세요.<br>
                <span></span>카카오 계정 연결 해지를 위해 카카오톡 로그인이 필요할 수 있습니다.<br>
                <span></span>재가입은 탈퇴일로부터 30일 후 가능합니다.<br>
            </p>
        </div>
        <form action="#" method="get">
            <fieldset>
                <label for="check">
                    <input id="check" type="checkbox">주의사항을 숙지하였습니다.
                </label>
                <button class="btn1" type="button" onclick="deleteMember()">탈퇴합니다.</button>
                <button class="btn2" type="button">나중에 탈퇴할게요.</button>
            </fieldset>
        </form>
    </section>
</main>

<script>

function deleteMember() {
    const checkbox = document.getElementById('check');
    const is_checked = checkbox.checked;
    if( is_checked == false) {
        alert("주의사항을 숙지해주세요");
        return false;
    }

    $.ajax({
        url:"/member/deleteMember",
        type: "patch",
        dataType: "json",
        data: {"memberId": "${sessionScope.member.memberId}"},
        success: function (data) {
            if(data == true) {
                alert("회원 탈퇴가 되었습니다.");
                location.href = "/";
            }
        }
    });
}

</script>

</body>
</html>
