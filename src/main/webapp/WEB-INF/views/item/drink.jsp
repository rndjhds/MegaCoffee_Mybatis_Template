<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@include file="../common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../resources/statics/style/reset.css">
    <link rel="stylesheet" href="../../resources/statics/style/drink.css">
    <link rel="stylesheet" href="../../resources/statics/style/index.css">
    <link rel="stylesheet" href="../../resources/statics/style/index_uiux.css">
    <title>����޴� | �ް�Ŀ��</title>
</head>
<body>
<main>
    <div class="topgo">
        <a href="#">
            <span>Top</span>
            <span><img src="../../resources/statics/test_img/toplogo.png" alt=""></span>
        </a>
    </div>
    <section class="drink_top">
        <div class="drink_page">
            <p>DRINK MENU</p>
            <a href="#"><img src="../../resources/statics/test_img/yellow_logo.png" alt=""></a>
            <p class="drink_page_info">
                <em>��� �ε巯�� Ŀ�� ���� ���</em><br>
                �ູ�� �����ϴ� �پ��� ����
            </p>
            <div class="listbtn">
                <a href="/menu/drinkView">����</a>
                <a href="/menu/foodView">Ǫ��</a>
                <a href="/menu/productView">��ǰ</a>
            </div>
        </div>
    </section>
    <section class="drink_title">
        <p>�ް� MGC Ŀ���� ������ �޴�</p>
        <div class="drink_title_center">
            <span></span>
            <p>MEGA MENU</p>
            <span></span>
        </div>
        <p>*�޴� �̹����� �������̶� �ǹ��� �ٸ��� �ֽ��ϴ�.</p>
    </section>
    <section class="drink_search">
        <form action="#" method="get">
            <fieldset>
                <legend>�޴�ã����</legend>
                <div class="search">
                    <p>�޴��˻�</p>
                    <div class="search_bar">
                        <input type="search" placeholder="�˻��Ͽ� �� ���� ã�ƺ�����.">
                        <button type="submit"><img src="../../resources/statics/drink_img/icon_search.gif" alt=""></button>
                    </div>
                </div>
                <div class="cheack">
                    <label for="a">��ü��ǰ����
                        <input id="a" type="checkbox">
                    </label>
                    <label for="b">Ŀ��
                        <input id="b" type="checkbox">
                    </label>
                    <label for="c">Ƽ
                        <input id="c" type="checkbox">
                    </label>
                    <label for="d">���̵�&�ֽ�
                        <input id="d" type="checkbox">
                    </label>
                    <label for="e">������&������
                        <input id="e" type="checkbox">
                    </label>
                    <label for="f">��ī����
                        <input id="f" type="checkbox">
                    </label>
                    <label for="g">����
                        <input id="g" type="checkbox">
                    </label>
                    <label for="h">�Ż�ǰ
                        <input id="h" type="checkbox">
                    </label>
                </div>
            </fieldset>
        </form>
    </section>
    <section class="drink_list">
        <div class="drink_1">
            <div class="drink_poji">
                <a><img src="../../resources/statics/drink_img/drink_1.jpg" alt=""></a>
                <div class="poji_title">
                    <p>���� ���ڸ��� ������</p>
                    <a>���� �� ����</a>
                </div>
            </div>
            <div class="drink_txt">
                <div class="txt_title">
                    <p>���� ���ڸ��� ������</p>
                    <a href="#"><img src="../../resources/statics/drink_img/icon_x.png" alt=""></a>
                </div>
                <div class="drink_info">
                    <p>
                        20oz<br>
                        1ȸ ������ 210.1kcal
                    </p>
                    <p>
                        �ް�MGCĿ���� �������� �α� ������
                        �������� ��ŭ�� �������ڿ�
                        �����Ͽ� ���޴��� �ÿ��ϰ� ��� ��
                        �ִ� ���� ���� �޴�
                    </p>
                    <p>
                        �˷����� ���� :
                    </p>
                </div>
                <ul>
                    <li>��ȭ���� 0.1g</li>
                    <li>��Ʈ�� 14.6mg</li>
                    <li>ī���� 0mm</li>
                    <li>��� 40.9g</li>
                    <li>�ܹ��� 0.8g</li>
                </ul>
            </div>
        </div>
        <div class="drink_2">
            <div class="drink_poji">
                <a><img src="../../resources/statics/drink_img/drink_2.jpg" alt=""></a>
                <div class="poji_title">
                    <p>���� �÷���Ʈ ������</p>
                    <a>���� �� ����</a>
                </div>
            </div>
            <div class="drink_txt">
                <div class="txt_title">
                    <p>���� �÷���Ʈ ������</p>
                    <a href="#"><img src="../../resources/statics/drink_img/icon_x.png" alt=""></a>
                </div>
                <div class="drink_info">
                    <p>
                        20oz<br>
                        1ȸ ������ 210.1kcal
                    </p>
                    <p>
                        �ް�MGCĿ���� �������� �α� ������
                        �������� ��ŭ�� �������ڿ�
                        �����Ͽ� ���޴��� �ÿ��ϰ� ��� ��
                        �ִ� ���� ���� �޴�
                    </p>
                    <p>
                        �˷����� ���� :
                    </p>
                </div>
                <ul>
                    <li>��ȭ���� 0.1g</li>
                    <li>��Ʈ�� 14.6mg</li>
                    <li>ī���� 0mm</li>
                    <li>��� 40.9g</li>
                    <li>�ܹ��� 0.8g</li>
                </ul>
            </div>
        </div>
        <div class="drink_3">
            <div class="drink_poji">
                <a><img src="../../resources/statics/drink_img/drink_3.jpg" alt=""></a>
                <div class="poji_title">
                    <p>���� ���� ���̺� ���̵�</p>
                    <a>���� �� ����</a>
                </div>
            </div>
            <div class="drink_txt">
                <div class="txt_title">
                    <p>�������� ���̺� ���̵�</p>
                    <a href="#"><img src="../../resources/statics/drink_img/icon_x.png" alt=""></a>
                </div>
                <div class="drink_info">
                    <p>
                        20oz<br>
                        1ȸ ������ 210.1kcal
                    </p>
                    <p>
                        �ް�MGCĿ���� �������� �α� ������
                        �������� ��ŭ�� �������ڿ�
                        �����Ͽ� ���޴��� �ÿ��ϰ� ��� ��
                        �ִ� ���� ���� �޴�
                    </p>
                    <p>
                        �˷����� ���� :
                    </p>
                </div>
                <ul>
                    <li>��ȭ���� 0.1g</li>
                    <li>��Ʈ�� 14.6mg</li>
                    <li>ī���� 0mm</li>
                    <li>��� 40.9g</li>
                    <li>�ܹ��� 0.8g</li>
                </ul>
            </div>
        </div>
        <div class="drink_4">
            <div class="drink_poji">
                <a><img src="../../resources/statics/drink_img/drink_4.jpg" alt=""></a>
                <div class="poji_title">
                    <p>���� �������� ���̵�</p>
                    <a>���� �� ����</a>
                </div>
            </div>
            <div class="drink_txt">
                <div class="txt_title">
                    <p>���� �������� ���̵�</p>
                    <a href="#"><img src="../../resources/statics/drink_img/icon_x.png" alt=""></a>
                </div>
                <div class="drink_info">
                    <p>
                        20oz<br>
                        1ȸ ������ 210.1kcal
                    </p>
                    <p>
                        �ް�MGCĿ���� �������� �α� ������
                        �������� ��ŭ�� �������ڿ�
                        �����Ͽ� ���޴��� �ÿ��ϰ� ��� ��
                        �ִ� ���� ���� �޴�
                    </p>
                    <p>
                        �˷����� ���� :
                    </p>
                </div>
                <ul>
                    <li>��ȭ���� 0.1g</li>
                    <li>��Ʈ�� 14.6mg</li>
                    <li>ī���� 0mm</li>
                    <li>��� 40.9g</li>
                    <li>�ܹ��� 0.8g</li>
                </ul>
            </div>
        </div>
        <div class="drink_5">
            <div class="drink_poji">
                <a><img src="../../resources/statics/drink_img/drink_5.jpg" alt=""></a>
                <div class="poji_title">
                    <p>��ī���� ����������</p>
                    <a>���� �� ����</a>
                </div>
            </div>
            <div class="drink_txt">
                <div class="txt_title">
                    <p>��ī���� ����������</p>
                    <a href="#"><img src="../../resources/statics/drink_img/icon_x.png" alt=""></a>
                </div>
                <div class="drink_info">
                    <p>
                        20oz<br>
                        1ȸ ������ 210.1kcal
                    </p>
                    <p>
                        �ް�MGCĿ���� �������� �α� ������
                        �������� ��ŭ�� �������ڿ�
                        �����Ͽ� ���޴��� �ÿ��ϰ� ��� ��
                        �ִ� ���� ���� �޴�
                    </p>
                    <p>
                        �˷����� ���� :
                    </p>
                </div>
                <ul>
                    <li>��ȭ���� 0.1g</li>
                    <li>��Ʈ�� 14.6mg</li>
                    <li>ī���� 0mm</li>
                    <li>��� 40.9g</li>
                    <li>�ܹ��� 0.8g</li>
                </ul>
            </div>
        </div>
        <div class="drink_6">
            <div class="drink_poji">
                <a><img src="../../resources/statics/drink_img/drink_6.jpg" alt=""></a>
                <div class="poji_title">
                    <p>���������� �ǿ���</p>
                    <a>���� �� ����</a>
                </div>
            </div>
            <div class="drink_txt">
                <div class="txt_title">
                    <p>���������� �ǿ���</p>
                    <a href="#"><img src="../../resources/statics/drink_img/icon_x.png" alt=""></a>
                </div>
                <div class="drink_info">
                    <p>
                        20oz<br>
                        1ȸ ������ 210.1kcal
                    </p>
                    <p>
                        �ް�MGCĿ���� �������� �α� ������
                        �������� ��ŭ�� �������ڿ�
                        �����Ͽ� ���޴��� �ÿ��ϰ� ��� ��
                        �ִ� ���� ���� �޴�
                    </p>
                    <p>
                        �˷����� ���� :
                    </p>
                </div>
                <ul>
                    <li>��ȭ���� 0.1g</li>
                    <li>��Ʈ�� 14.6mg</li>
                    <li>ī���� 0mm</li>
                    <li>��� 40.9g</li>
                    <li>�ܹ��� 0.8g</li>
                </ul>
            </div>
        </div>
        <div class="drink_7">
            <div class="drink_poji">
                <a><img src="../../resources/statics/drink_img/drink_7.jpg" alt=""></a>
                <div class="poji_title">
                    <p>��ī���� �Ƹ޸�ī��</p>
                    <a>���� �� ����</a>
                </div>
            </div>
            <div class="drink_txt">
                <div class="txt_title">
                    <p>��ī���� �Ƹ޸�ī��</p>
                    <a href="#"><img src="../../resources/statics/drink_img/icon_x.png" alt=""></a>
                </div>
                <div class="drink_info">
                    <p>
                        20oz<br>
                        1ȸ ������ 210.1kcal
                    </p>
                    <p>
                        �ް�MGCĿ���� �������� �α� ������
                        �������� ��ŭ�� �������ڿ�
                        �����Ͽ� ���޴��� �ÿ��ϰ� ��� ��
                        �ִ� ���� ���� �޴�
                    </p>
                    <p>
                        �˷����� ���� :
                    </p>
                </div>
                <ul>
                    <li>��ȭ���� 0.1g</li>
                    <li>��Ʈ�� 14.6mg</li>
                    <li>ī���� 0mm</li>
                    <li>��� 40.9g</li>
                    <li>�ܹ��� 0.8g</li>
                </ul>
            </div>
        </div>
        <div class="drink_8">
            <div class="drink_poji">
                <a><img src="../../resources/statics/drink_img/drink_8.jpg" alt=""></a>
                <div class="poji_title">
                    <p>��ī���� īǪġ��</p>
                    <a>���� �� ����</a>
                </div>
            </div>
            <div class="drink_txt">
                <div class="txt_title">
                    <p>��ī���� īǪġ��</p>
                    <a href="#"><img src="../../resources/statics/drink_img/icon_x.png" alt=""></a>
                </div>
                <div class="drink_info">
                    <p>
                        20oz<br>
                        1ȸ ������ 210.1kcal
                    </p>
                    <p>
                        �ް�MGCĿ���� �������� �α� ������
                        �������� ��ŭ�� �������ڿ�
                        �����Ͽ� ���޴��� �ÿ��ϰ� ��� ��
                        �ִ� ���� ���� �޴�
                    </p>
                    <p>
                        �˷����� ���� :
                    </p>
                </div>
                <ul>
                    <li>��ȭ���� 0.1g</li>
                    <li>��Ʈ�� 14.6mg</li>
                    <li>ī���� 0mm</li>
                    <li>��� 40.9g</li>
                    <li>�ܹ��� 0.8g</li>
                </ul>
            </div>
        </div>
    </section>
    <section class="pagenume">
        <a href="#">ó��</a>
        <a href="#">1</a>
        <a href="#">2</a>
        <a href="#">����</a>
    </section>
</main>
<%@include file="../common/footer.jsp"%>
<script src="../../resources/statics/js/drink.js"></script>
<script src="../../resources/statics/js/index.js"></script>
</body>
</html>