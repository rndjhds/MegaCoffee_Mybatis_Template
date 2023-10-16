<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
            <label for="deleteYN">삭제 여부</label>
            <select name="deleteYN" id="deleteYN">
                <option value=''>전체</option>
                <option value='Y'>삭제완료</option>
                <option value='N'>삭제완료X</option>
            </select>
            <label for="startDate">Start Date:</label>
            <input type="date" id="startDate" name="startDate" style="border: 1px solid black">
            <label for="endDate">End Date:</label>
            <input type="date" id="endDate" name="endDate" style="border: 1px solid black">
            <label for="categoryName">Category Name:</label>
            <input type="text" id="categoryName" name="categoryName" style="border: 1px solid black">
            <button type="button" id="searchButton" style="border: 1px solid black">Search</button>
        </div>
        <div class="right">
            <button type="button" id="addButton" style="border: 1px solid black" onclick="openInfo('')">New Category</button>
        </div>

    </form>
    <table id="dataTable" class="display">
        <thead>
        <tr>
            <th>순서</th>
            <th>상위 카테고리명</th>
            <th>등록자</th>
            <th>등록일</th>
            <th>수정자</th>
            <th>수정일</th>
            <th>삭제 여부</th>
            <th>수정 버튼</th>
        </tr>
        </thead>
        <tbody>
        <!-- Data rows will be populated here -->
        </tbody>
        <tfoot>
        <tr>
            <th>순서</th>
            <th>상위 카테고리명</th>
            <th>등록자</th>
            <th>등록일</th>
            <th>수정자</th>
            <th>수정일</th>
            <th>삭제 여부</th>
            <th>수정 버튼</th>
        </tr>
        </tfoot>
    </table>
</main>

</body>
<script>

        let maxDate = Date.now();
        let timeOff = new Date().getTimezoneOffset() * 60000;
        let today = new Date(maxDate-timeOff).toISOString().split("T")[0];
        document.getElementById("startDate").setAttribute("max", today);
        document.getElementById("endDate").setAttribute("max", today);

        let dataTable = $('#dataTable').DataTable({
            searching : false,
            ordering: false,
            processing: true,
            serverSide: true,
            ajax:{
                url: '/category/findParentCategoryAll',
                type: 'POST',
                data: function (d) {
                    d.deleteYN = $("select[name='deleteYN']").val();
                    d.categoryName = $("#categoryName").val();
                    d.startDate = $("#startDate").val();
                    d.endDate = $("#endDate").val();
                },
            },
            columns: [
                {data: "rnum"},
                {data: "categoryName"},
                {data: "memberId"},
                {data: "regDate"},
                {data: "modifier"},
                {data: "modDate"},
                {data: "deleteYN"},
                {data: "", render: function (data, type, row){
                        return "<button id='btn_info' type='button' onClick='openInfo("+row.categoryId+")'>상세정보</button>";
                    }
                }
            ],

            // 컬럼들의 넓이 조절
            columnDefs: [
                { targets: 0, width: 50 },
                { targets: 1, width: 150 },
                { targets: 1, width: 80 },
                { targets: 1, width: 100 },
                { targets: 1, width: 80 },
                { targets: 1, width: 100 },
                { targets: 1, width: 50 },
                { targets: 1, width: 100 }
            ]
            /*dom: 'Bfrtip', // Add buttons for copy, csv, excel, pdf, and print
            buttons: [
                'copy', 'csv', 'excel', 'pdf', 'print'
            ]
    */
        });

        $('#searchButton').on('click', function () {
            search(); // Trigger a new DataTables request
        });

        function search() {
            dataTable.draw();
        }

    function openInfo(categoryId) {
        window.open("/category/saveParentCategory?categoryId="+categoryId, "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=300,left=500,width=600,height=600");
    }

</script>
</html>