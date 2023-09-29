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
    <title>매장 | 메가커피</title>

</head>
<body>
<main>
    <section class="map_title">
        <p>MEGA STORE</p>
        <p>STORE</p>
        <p>
            언제 어디서나, 부담스럽지 않은 가격과 대용량으로<br>
            모든 사람들에게 사랑받는 메가MGC커피 입니다
        </p>
    </section>
    <section class="map_rap">
        <p>
            <a href="indexte.html">홈</a> > <a href="./map.html">매장</a> > <a href="./map.html">매장찾기</a>
        </p>
    </section>
    <div class="map" id="map" style="width: 1200px; height: 900px"></div>
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=aa4ba74b15bd21d301f10aa5b737ceb1&libraries=services,clusterer,drawing"></script>
    <script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

        // 지도를 생성합니다
        var map = new kakao.maps.Map(mapContainer, mapOption);

        var bounds = new kakao.maps.LatLngBounds(); //추가한 코드

        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();
        $.ajax({
            url: "/store/getStoreLocation",
            type: "get",
            dataType: "json",
            success: function (data) {
                data.forEach(function (store){

                    // 주소로 좌표를 검색합니다
                    geocoder.addressSearch(store.address, function (result, status) {

                        // 정상적으로 검색이 완료됐으면
                        if (status === kakao.maps.services.Status.OK) {

                            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                            // 결과값으로 받은 위치를 마커로 표시합니다
                            var marker = new kakao.maps.Marker({
                                map: map,
                                position: coords
                            });
                            marker.setMap(map); //추가한 코드

                            // LatLngBounds 객체에 좌표를 추가합니다
                            bounds.extend(coords); //추가한 코드, 현재 코드에서 좌표정보는 point[i]가 아닌 coords이다.

                            // 인포윈도우로 장소에 대한 설명을 표시합니다
                            var infowindow = new kakao.maps.InfoWindow({
                                content: '<div style="width:150px;text-align:center;padding:6px 0;">'+store.storeName+'</div>'
                            });
                            infowindow.open(map, marker);

                            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                            //map.setCenter(coords);
                            setBounds(); //추가한 코드
                        }
                    });
                });
            },
            error: function (data) {
            }
        });

        function setBounds() { //추가한 함수
            // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
            // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
            map.setBounds(bounds);
        }
    </script>
</main>
<%@include file="../common/footer.jsp" %>
</body>
</html>