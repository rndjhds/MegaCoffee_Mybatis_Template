<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>DataTables Example</title>
    <link rel="stylesheet" type="text/css"
          href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css"
          href="https://cdn.datatables.net/buttons/2.4.1/css/buttons.dataTables.min.css ">
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.4.1/js/dataTables.buttons.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.print.min.js"></script>
    <style>
        #searchForm {
            display: flex;
            justify-content: space-between;
            padding-bottom: 20px;
        }

        select, #searchButton {
            font-size: 1.08em;
        }

    </style>
</head>
<body>
<main style="padding-top: 150px">
    <form id="searchForm">
        <div class="left">
            <label for="storeId"></label>
            <select name="storeId" id="storeId">
                <option value="">전체</option>
                <c:forEach var="stores" items="${stores}">
                    <option value=${stores.storeId}>${stores.storeName}</option>
                </c:forEach>
            </select>
            <label for="parentCategoryId"></label>
            <select name="parentCategoryId" id="parentCategoryId">
                <option value="">전체</option>
                <c:forEach var="categories" items="${parentCategories}">
                    <option value=${categories.categoryId}>${categories.categoryName}</option>
                </c:forEach>
            </select>
            <label for="childCategoryId"></label>
            <select name="childCategoryId" id="childCategoryId">
            </select>
            <label for="startDate">Start Date:</label>
            <input type="date" id="startDate" name="startDate" style="border: 1px solid black">
            <label for="endDate">End Date:</label>
            <input type="date" id="endDate" name="endDate" style="border: 1px solid black">
            <label for="title">Item Name:</label>
            <input type="text" id="title" name="title" style="border: 1px solid black">
            <button type="button" id="searchButton" style="border: 1px solid black">Search</button>
        </div>
        <div class="right">
            <button type="button" id="addButton" style="border: 1px solid black" onclick="openInfo()">New Category
            </button>
        </div>

    </form>
    <table id="dataTable" class="display">
        <thead>
        <tr>
            <th>순서</th>
            <th>상위 카테고리</th>
            <th>하위 카테고리</th>
            <th>상품명</th>
            <th>ICE/HOT</th>
            <th>컵</th>
            <th>상품 사이즈</th>
            <th>주문 수량</th>
            <th>주문자</th>
            <th>주문한 가맹점</th>
            <th>가맹점주</th>
            <th>주문 날짜</th>
        </tr>
        </thead>
        <tbody>
        <!-- Data rows will be populated here -->
        </tbody>
        <tfoot>
        <tr>
            <th>순서</th>
            <th>상위 카테고리</th>
            <th>하위 카테고리</th>
            <th>상품명</th>
            <th>ICE/HOT</th>
            <th>컵</th>
            <th>상품 사이즈</th>
            <th>주문 수량</th>
            <th>주문자</th>
            <th>주문한 가맹점</th>
            <th>가맹점주</th>
            <th>주문 날짜</th>
        </tr>
        </tfoot>
    </table>
</main>

</body>
<script>

    $(document).ready(function () {
        let maxDate = Date.now();
        let timeOff = new Date().getTimezoneOffset() * 60000;
        let today = new Date(maxDate - timeOff).toISOString().split("T")[0];
        document.getElementById("startDate").setAttribute("max", today);
        document.getElementById("endDate").setAttribute("max", today);
        $("#childCategoryId").append("<option value=''>전체</option>");

        let dataTable = $('#dataTable').DataTable({
            searching: false,
            ordering: false,
            processing: true,
            serverSide: true,
            ajax: {
                url: '/order/findOrderedItemList',
                type: 'POST',
                data: function (d) {
                    d.parentCategoryId = $("select[name='parentCategoryId']").val();
                    d.storeId = $("select[name='storeId']").val();
                    d.childCategoryId = $("select[name='childCategoryId']").val();
                    d.title = $("#title").val();
                    d.startDate = $("#startDate").val();
                    d.endDate = $("#endDate").val();
                },
            },
            columns: [
                {data: "RNUM"},
                {data: "PARENTNAME"},
                {data: "CHILDNAME"},
                {data: "TITLE"},
                {data: "ORDEROPTION"},
                {data: "ORDERCUP"},
                {data: "ORDERSIZE"},
                {data: "ORDERCOUNT"},
                {data: "BUYER"},
                {data: "STORENAME"},
                {data: "MANAGER"},
                {data: "ORDERDATE"},
            ],

            // 컬럼들의 넓이 조절
            columnDefs: [
                {targets: 0, width: 50},
                {targets: 1, width: 120},
                {targets: 2, width: 100},
                {targets: 3, width: 300},
                {targets: 4, width: 80},
                {targets: 5, width: 120},
                {targets: 6, width: 120},
                {targets: 7, width: 120},
                {targets: 8, width: 100},
                {targets: 9, width: 80},
                {targets: 10, width: 100},
                {targets: 11, width: 80}
            ],
            dom: 'Bfrtip', // Add buttons for copy, csv, excel, pdf, and print
            buttons: [
                'copy', 'csv', 'excel', 'pdf', 'print'
            ]

        });

        $('#searchButton').on('click', function () {
            dataTable.draw(); // Trigger a new DataTables request
        });

        $("#parentCategoryId").change(function (){
            $("#childCategoryId").empty();
            $("#childCategoryId").append("<option value=''>전체</option>");
            let parentCategoryId = $("select[name='parentCategoryId']").val()
            if(parentCategoryId != '') {
                $.ajax({
                    url: "/category/findChildCategoryByParentId/" + parentCategoryId,
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset-utf-8",
                    success: function (data) {
                        if (data != 0) {
                            for (let i = 0; i < data.length; i++) {
                                $("#childCategoryId").append("<option value='" + data[i].categoryId + "'>" + data[i].categoryName + "</option>");
                            }
                        }
                    },
                    error: function () {

                    }
                });
            }
        })
    });



</script>
</html>