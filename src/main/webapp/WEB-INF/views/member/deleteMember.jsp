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
    <title>Ż��</title>
</head>
<body>
<main>
    <section class="deta_top">
        <div class="deta_page">
            <p>Withdrawal</p>
            <p class="deta_page_info">
                Ż�� ���
            </p>
        </div>
    </section>
    <section class="deta_title">
        <p>�ް� MGC�� �ȳ�</p>
        <div class="deta_title_center">
            <span></span>
            <p>MEGA</p>
            <span></span>
        </div>
    </section>
    <section class="info">
        <div class="info_top">
            <h1>������ Ż���Ͻðڽ��ϱ�?</h1>
            <p>
                <span></span>�� �� ������ ������ ������ �Ұ����մϴ�.<br>
                <span></span>����ī�� �ܾ��� �����ִ� ��� Ż�� �Ұ����մϴ�.<br>
                �ܾ� ���� �� Ż�� ������ �ּ���.<br>
                <span></span>������ �̿� ���� ��� Ż�� �Ұ����մϴ�.<br>
                ���� ���� ���� Ż�� ������ �ּ���.<br>
                <span></span>īī�� ���� ���� ������ ���� īī���� �α����� �ʿ��� �� �ֽ��ϴ�.<br>
                <span></span>�簡���� Ż���Ϸκ��� 30�� �� �����մϴ�.<br>
            </p>
        </div>
        <form action="#" method="get">
            <fieldset>
                <label for="check">
                    <input id="check" type="checkbox">���ǻ����� �����Ͽ����ϴ�.
                </label>
                <button class="btn1" type="button" onclick="deleteMember()">Ż���մϴ�.</button>
                <button class="btn2" type="button">���߿� Ż���ҰԿ�.</button>
            </fieldset>
        </form>
    </section>
</main>

<script>

function deleteMember() {
    const checkbox = document.getElementById('check');
    const is_checked = checkbox.checked;
    if( is_checked == false) {
        alert("���ǻ����� �������ּ���");
        return false;
    }

    $.ajax({
        url:"/member/deleteMember",
        type: "patch",
        dataType: "json",
        data: {"memberId": "${sessionScope.member.memberId}"},
        success: function (data) {
            if(data == true) {
                alert("ȸ�� Ż�� �Ǿ����ϴ�.");
                location.href = "/";
            }
        }
    });
}

</script>

</body>
</html>
