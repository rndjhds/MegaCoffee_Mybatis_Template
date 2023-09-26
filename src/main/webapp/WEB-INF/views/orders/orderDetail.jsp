<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/statics/style/orderDetail.css">
    <title>���ֹ�����</title>
</head>
<body>
<main>
    <aside>
        <a href="#">����</a>
    </aside>
    <section class="deta_top">
        <div class="deta_page">
            <p>FUCKING</p>
            <p class="deta_page_info">
                �� �ֹ�����
            </p>
        </div>
    </section>
    <section class="deta_title">
        <p>�ް� MGC�� �ֹ�����</p>
        <div class="deta_title_center">
            <span></span>
            <p>MEGA</p>
            <span></span>
        </div>
    </section>
    <section class="start">
        <div class="title">
            <h1>��õ����</h1>
            <p>2023�� 09�� 25�� (�ֹ���ȣ : 0753)</p>
            <div class="btn">
                <a href="#">X �ݱ�</a>
            </div>
        </div>
        <div class="info">
            <p>
                <img src="./img/drink_1.jpg" alt="Ŀ�� �̹���">
            </p>
            <div class="list">
                <p><em>�Ƹ޸�ī��</em></p>
                <span>��ȸ���� ���</span>
                <span>ICE</span>
                <span>M</span>
                <p><em>1,600��</em> (���� : 1��)</p>
            </div>
        </div>
        <ul>
            <li>
                <p>��������</p>
                <p>�ſ�ī��</p>
            </li>
            <li>
                <p>��ǰ�ݾ�</p>
                <p><em>1,600��</em></p>
            </li>
            <li>
                <p>�����ݾ�</p>
                <p><em>1,600��</em></p>
            </li>
        </ul>
        <p class="reds">
            ���� �Ϸ�� ����� Ǫ��� ���忡�� 1�ð� ���� ���� ��
            ���Ǹ� ������ �� ȯ���� �Ұ����մϴ�.
        </p>
    </section>
</main>
<script>
    let on = document.querySelector('aside')
    let btn = document.querySelector('.btn')
    let popup = document.querySelector('.start')
    on.addEventListener('click',function(e){
        e.preventDefault()
        popup.style.display = 'block'
    })
    btn.addEventListener('click',function(e){
        e.preventDefault()
        popup.style.display = 'none'
    })
</script>
</body>
</html>


