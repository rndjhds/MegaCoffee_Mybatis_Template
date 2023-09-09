<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@include file="../common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../resources/statics/style/food.css">
    <link rel="stylesheet" href="../../resources/statics/style/reset.css">
    <link rel="stylesheet" href="../../resources/statics/style/index.css">
    <link rel="stylesheet" href="../../resources/statics/style/index_uiux.css">
    <title>Ǫ�� | �ް�Ŀ��</title>
</head>
<body>
<main>
    <div class="topgo">
        <a href="#">
            <span>Top</span>
            <span><img src="../../resources/statics/test_img/toplogo.png" alt=""></span>
        </a>
    </div>
    <section class="food_top">
        <div class="food_page">
            <p>FOOD MENU</p>
            <a href="#"><img src="../../resources/statics/test_img/yellow_logo.png" alt=""></a>
            <p class="food_page_info">
                <em>����� �� ��︮��</em><br>
                �پ��� ����Ʈ
            </p>
            <div class="listbtn">
                <a href="/menu/drinkView">����</a>
                <a href="/menu/foodView">Ǫ��</a>
                <a href="/menu/productView">��ǰ</a>
            </div>
        </div>
    </section>
    <section class="food_title">
        <p>�ް� MGC Ŀ���� ������ �޴�</p>
        <div class="food_title_center">
            <span></span>
            <p>MEGA MENU</p>
            <span></span>
        </div>
        <p>*�޴� �̹����� �������̶� �ǹ��� �ٸ��� �ֽ��ϴ�.</p>
    </section>
    <section class="food_search">
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
                    <label for="b">����Ʈ
                        <input id="b" type="checkbox">
                    </label>
                    <label for="h">�Ż�ǰ
                        <input id="h" type="checkbox">
                    </label>
                </div>
            </fieldset>
        </form>
    </section>
    <section class="food_list">
        <div class="food_1">
            <div class="food_poji">
                <a><img src="../../resources/statics/food_img/food_1.jpg" alt=""></a>
                <div class="poji_title">
                    <p>���̽��;Ӹ���-��������</p>
                    <a>���� �� ����</a>
                </div>
            </div>
            <div class="food_txt">
                <div class="txt_title">
                    <p>���̽��;Ӹ���-��������</p>
                    <a href="#"><img src="../../resources/statics/drink_img/icon_x.png" alt=""></a>
                </div>
                <div class="food_info">
                    <p>
                        60g<br>
                        1ȸ ������ 165.0kcal
                    </p>
                    <p>
                        ��ŭ�� �������� �ʸ��� �˵��� ����
                        ���� ���� �ÿ��� ���� ����
                        ���̽��;Ӹ���
                    </p>
                    <p>
                        �˷����� ���� : ����, ���, ��, ��Ȳ���, �������
                    </p>
                </div>
                <ul>
                    <li>��ȭ���� 3.1g</li>
                    <li>��Ʈ�� 168.0mg</li>
                    <li>ī���� 0mm</li>
                    <li>��� 13.0g</li>
                    <li>�ܹ��� 2.0g</li>
                </ul>
            </div>
        </div>
        <div class="food_2">
            <div class="food_poji">
                <a><img src="../../resources/statics/food_img/food_2.jpg" alt=""></a>
                <div class="poji_title">
                    <p>���̽��;Ӹ���-�Ϻ���</p>
                    <a>���� �� ����</a>
                </div>
            </div>
            <div class="food_txt">
                <div class="txt_title">
                    <p>���̽��;Ӹ���-�Ϻ���</p>
                    <a href="#"><img src="../../resources/statics/drink_img/icon_x.png" alt=""></a>
                </div>
                <div class="food_info">
                    <p>
                        60g<br>
                        1ȸ ������ 160.0kcal
                    </p>
                    <p>
                        �޴��� ������ ����ũ���� �˵���
                        ������ ���� ���� �ÿ��� ���� ����
                        ���̽��;Ӹ���
                    </p>
                    <p>
                        �˷����� ���� : ����, ���, ��, �������
                    </p>
                </div>
                <ul>
                    <li>��ȭ���� 2.5g</li>
                    <li>��Ʈ�� 76mg</li>
                    <li>ī���� 0mm</li>
                    <li>��� 12.0g</li>
                    <li>�ܹ��� 20.g</li>
                </ul>
            </div>
        </div>
        <div class="food_3">
            <div class="food_poji">
                <a><img src="../../resources/statics/food_img/food_3.jpg" alt=""></a>
                <div class="poji_title">
                    <p>��Ʈ�� ������ũ</p>
                    <a>���� �� ����</a>
                </div>
            </div>
            <div class="food_txt">
                <div class="txt_title">
                    <p>��Ʈ�� ������ũ</p>
                    <a href="#"><img src="../../resources/statics/drink_img/icon_x.png" alt=""></a>
                </div>
                <div class="food_info">
                    <p>
                        60g<br>
                        1ȸ ������ 160.0kcal
                    </p>
                    <p>
                        �޴��� ������ ����ũ���� �˵���
                        ������ ���� ���� �ÿ��� ���� ����
                        ���̽��;Ӹ���
                    </p>
                    <p>
                        �˷����� ���� : ����, ���, ��, �������
                    </p>
                </div>
                <ul>
                    <li>��ȭ���� 2.5g</li>
                    <li>��Ʈ�� 76mg</li>
                    <li>ī���� 0mm</li>
                    <li>��� 12.0g</li>
                    <li>�ܹ��� 20.g</li>
                </ul>
            </div>
        </div>
        <div class="food_4">
            <div class="food_poji">
                <a><img src="../../resources/statics/food_img/food_4.jpg" alt=""></a>
                <div class="poji_title">
                    <p>Ƽ��̼� ������ũ</p>
                    <a>���� �� ����</a>
                </div>
            </div>
            <div class="food_txt">
                <div class="txt_title">
                    <p>Ƽ��̼� ������ũ</p>
                    <a href="#"><img src="../../resources/statics/drink_img/icon_x.png" alt=""></a>
                </div>
                <div class="food_info">
                    <p>
                        60g<br>
                        1ȸ ������ 160.0kcal
                    </p>
                    <p>
                        �޴��� ������ ����ũ���� �˵���
                        ������ ���� ���� �ÿ��� ���� ����
                        ���̽��;Ӹ���
                    </p>
                    <p>
                        �˷����� ���� : ����, ���, ��, �������
                    </p>
                </div>
                <ul>
                    <li>��ȭ���� 2.5g</li>
                    <li>��Ʈ�� 76mg</li>
                    <li>ī���� 0mm</li>
                    <li>��� 12.0g</li>
                    <li>�ܹ��� 20.g</li>
                </ul>
            </div>
        </div>
        <div class="food_5">
            <div class="food_poji">
                <a><img src="../../resources/statics/food_img/food_5.png" alt=""></a>
                <div class="poji_title">
                    <p>���͹��ͼұݻ�</p>
                    <a>���� �� ����</a>
                </div>
            </div>
            <div class="food_txt">
                <div class="txt_title">
                    <p>���͹��ͼұݻ�</p>
                    <a href="#"><img src="../../resources/statics/drink_img/icon_x.png" alt=""></a>
                </div>
                <div class="food_info">
                    <p>
                        60g<br>
                        1ȸ ������ 160.0kcal
                    </p>
                    <p>
                        �޴��� ������ ����ũ���� �˵���
                        ������ ���� ���� �ÿ��� ���� ����
                        ���̽��;Ӹ���
                    </p>
                    <p>
                        �˷����� ���� : ����, ���, ��, �������
                    </p>
                </div>
                <ul>
                    <li>��ȭ���� 2.5g</li>
                    <li>��Ʈ�� 76mg</li>
                    <li>ī���� 0mm</li>
                    <li>��� 12.0g</li>
                    <li>�ܹ��� 20.g</li>
                </ul>
            </div>
        </div>
        <div class="food_6">
            <div class="food_poji">
                <a><img src="../../resources/statics/food_img/food_6.jpg" alt=""></a>
                <div class="poji_title">
                    <p>ũ��ƻ�</p>
                    <a>���� �� ����</a>
                </div>
            </div>
            <div class="food_txt">
                <div class="txt_title">
                    <p>ũ��ƻ�</p>
                    <a href="#"><img src="../../resources/statics/drink_img/icon_x.png" alt=""></a>
                </div>
                <div class="food_info">
                    <p>
                        60g<br>
                        1ȸ ������ 160.0kcal
                    </p>
                    <p>
                        �޴��� ������ ����ũ���� �˵���
                        ������ ���� ���� �ÿ��� ���� ����
                        ���̽��;Ӹ���
                    </p>
                    <p>
                        �˷����� ���� : ����, ���, ��, �������
                    </p>
                </div>
                <ul>
                    <li>��ȭ���� 2.5g</li>
                    <li>��Ʈ�� 76mg</li>
                    <li>ī���� 0mm</li>
                    <li>��� 12.0g</li>
                    <li>�ܹ��� 20.g</li>
                </ul>
            </div>
        </div>
        <div class="food_7">
            <div class="food_poji">
                <a><img src="../../resources/statics/food_img/food_7.jpg" alt=""></a>
                <div class="poji_title">
                    <p>�����������Ű</p>
                    <a>���� �� ����</a>
                </div>
            </div>
            <div class="food_txt">
                <div class="txt_title">
                    <p>�����������Ű</p>
                    <a href="#"><img src="../../resources/statics/drink_img/icon_x.png" alt=""></a>
                </div>
                <div class="food_info">
                    <p>
                        60g<br>
                        1ȸ ������ 160.0kcal
                    </p>
                    <p>
                        �޴��� ������ ����ũ���� �˵���
                        ������ ���� ���� �ÿ��� ���� ����
                        ���̽��;Ӹ���
                    </p>
                    <p>
                        �˷����� ���� : ����, ���, ��, �������
                    </p>
                </div>
                <ul>
                    <li>��ȭ���� 2.5g</li>
                    <li>��Ʈ�� 76mg</li>
                    <li>ī���� 0mm</li>
                    <li>��� 12.0g</li>
                    <li>�ܹ��� 20.g</li>
                </ul>
            </div>
        </div>
        <div class="food_8">
            <div class="food_poji">
                <a><img src="../../resources/statics/food_img/food_8.jpg" alt=""></a>
                <div class="poji_title">
                    <p>���ڽ������Ű</p>
                    <a>���� �� ����</a>
                </div>
            </div>
            <div class="food_txt">
                <div class="txt_title">
                    <p>���ڽ������Ű</p>
                    <a href="#"><img src="../../resources/statics/drink_img/icon_x.png" alt=""></a>
                </div>
                <div class="food_info">
                    <p>
                        60g<br>
                        1ȸ ������ 160.0kcal
                    </p>
                    <p>
                        �޴��� ������ ����ũ���� �˵���
                        ������ ���� ���� �ÿ��� ���� ����
                        ���̽��;Ӹ���
                    </p>
                    <p>
                        �˷����� ���� : ����, ���, ��, �������
                    </p>
                </div>
                <ul>
                    <li>��ȭ���� 2.5g</li>
                    <li>��Ʈ�� 76mg</li>
                    <li>ī���� 0mm</li>
                    <li>��� 12.0g</li>
                    <li>�ܹ��� 20.g</li>
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

<script src="../../resources/statics/js/food.js"></script>
<script src="../../resources/statics/js/index.js"></script>
<%@include file="../common/footer.jsp"%>
</body>
</html>