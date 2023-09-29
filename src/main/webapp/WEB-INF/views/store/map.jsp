<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@include file="../common/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/statics/style/map.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/statics/style/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/statics/style/index.css">
    <title>���� | �ް�Ŀ��</title>

</head>
<body>
<main>
    <section class="map_title">
        <p>MEGA STORE</p>
        <p>STORE</p>
        <p>
            ���� ��𼭳�, �δ㽺���� ���� ���ݰ� ��뷮����<br>
            ��� ����鿡�� ����޴� �ް�MGCĿ�� �Դϴ�
        </p>
    </section>
    <section class="map_rap">
        <p>
            <a href="indexte.html">Ȩ</a> > <a href="./map.html">����</a> > <a href="./map.html">����ã��</a>
        </p>
    </section>
    <div class="map" id="map" style="width: 1200px; height: 900px"></div>
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=aa4ba74b15bd21d301f10aa5b737ceb1&libraries=services,clusterer,drawing"></script>
    <script>
        var mapContainer = document.getElementById('map'), // ������ ǥ���� div
            mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
                level: 3 // ������ Ȯ�� ����
            };

        // ������ �����մϴ�
        var map = new kakao.maps.Map(mapContainer, mapOption);

        var bounds = new kakao.maps.LatLngBounds(); //�߰��� �ڵ�

        // �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
        var geocoder = new kakao.maps.services.Geocoder();
        $.ajax({
            url: "/store/getStoreLocation",
            type: "get",
            dataType: "json",
            success: function (data) {
                data.forEach(function (store){

                    // �ּҷ� ��ǥ�� �˻��մϴ�
                    geocoder.addressSearch(store.address, function (result, status) {

                        // ���������� �˻��� �Ϸ������
                        if (status === kakao.maps.services.Status.OK) {

                            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                            // ��������� ���� ��ġ�� ��Ŀ�� ǥ���մϴ�
                            var marker = new kakao.maps.Marker({
                                map: map,
                                position: coords
                            });
                            marker.setMap(map); //�߰��� �ڵ�

                            // LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
                            bounds.extend(coords); //�߰��� �ڵ�, ���� �ڵ忡�� ��ǥ������ point[i]�� �ƴ� coords�̴�.

                            // ����������� ��ҿ� ���� ������ ǥ���մϴ�
                            var infowindow = new kakao.maps.InfoWindow({
                                content: '<div style="width:150px;text-align:center;padding:6px 0;">'+store.storeName+'</div>'
                            });
                            infowindow.open(map, marker);

                            // ������ �߽��� ��������� ���� ��ġ�� �̵���ŵ�ϴ�
                            //map.setCenter(coords);
                            setBounds(); //�߰��� �ڵ�
                        }
                    });
                });
            },
            error: function (data) {
            }
        });

        function setBounds() { //�߰��� �Լ�
            // LatLngBounds ��ü�� �߰��� ��ǥ���� �������� ������ ������ �缳���մϴ�
            // �̶� ������ �߽���ǥ�� ������ ����� �� �ֽ��ϴ�
            map.setBounds(bounds);
        }
    </script>
</main>
<%@include file="../common/footer.jsp" %>
</body>
</html>