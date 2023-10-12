<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>DataTables Example</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
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
            <label for="username">Name:</label>
            <input type="text" id="username" name="username" style="border: 1px solid black">
            <button type="button" id="searchButton" style="border: 1px solid black">Search</button>
        </div>

    </form>
    <table id="dataTable" class="display">
        <thead>
        <tr>
            <th>순서</th>
            <th>회원 ID</th>
            <th>이름</th>
            <th>이메일</th>
            <th>회원 타입</th>
            <th>승인 여부</th>
            <th>삭제 여부</th>
            <th>가맹점주 승인</th>
        </tr>
        </thead>
        <tbody>
        <!-- Data rows will be populated here -->
        </tbody>
        <tfoot>
        <tr>
            <th>순서</th>
            <th>회원 ID</th>
            <th>이름</th>
            <th>이메일</th>
            <th>회원 타입</th>
            <th>승인 여부</th>
            <th>삭제 여부</th>
            <th>가맹점주 승인</th>
        </tr>
        </tfoot>
    </table>
</main>

</body>
<script>

    $(document).ready(function () {
        let dataTable = $('#dataTable').DataTable({
            searching: false,
            ordering: false,
            processing: true,
            serverSide: true,
            ajax: {
                url: '/member/findPermitStatusWaitMember',
                type: 'POST',
                data: function (d) {
                    d.username = $("#username").val();
                },
            },
            columns: [
                {data: "rnum"},
                {data: "memberId"},
                {data: "username"},
                {data: "email"},
                {data: "memberType"},
                {data: "permitStatus"},
                {data: "deleteYN"},
                {data: "",
                    render: function(data,type,row){
                        return "<button id='btn_info' type='button' class='btn' onClick='openInfo(\"" + row.memberId + "\")'>가맹점주 승인</button>";
                    }
                }
            ]

            // 컬럼들의 넓이 조절
            /*columnDefs: [
                { targets: 0, width: 100 },
                { targets: 1, width: 150 },
                { targets: 1, width: 180 },
                { targets: 1, width: 100 }
            ]*/
            /*dom: 'Bfrtip', // Add buttons for copy, csv, excel, pdf, and print
            buttons: [
                'copy', 'csv', 'excel', 'pdf', 'print'
            ]*/
        });

        $('#searchButton').on('click', function () {
            dataTable.draw(); // Trigger a new DataTables request
        });
    });

    function openInfo(memberId) {
        $.ajax({
            url: "${pageContext.request.contextPath}/member/updatePermitStatusFromWait",
            type: "POST",
            dataType: "json",
            data: {
                "memberId": memberId
            },
            success: function (data) {
                if (data > 0) {
                    alert("가맹점주 승인 완료");
                    window.close();
                } else {
                    alert("가맹점주 승인 실패하였습니다.");
                }
            },
            error: function () {
                alert("가맹점주 승인 도중 오류가 발생하였습니다.");
            }
        });
    }

</script>
</html>