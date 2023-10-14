<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>DataTables Example</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.4.1/css/buttons.dataTables.min.css ">
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
            <label for="memberType">회원 유형</label>
            <select name="memberType" id="memberType">
                <option value='NONE'>전체</option>
                <option value="BUYER">구매자</option>
                <option value="MANAGER">가맹점주</option>
            </select>
            <label for="permitStatus">회원 승인여부</label>
            <select name="permitStatus" id="permitStatus">
                <option value='NONE'>전체</option>
                <option value="DENIED">승인거부</option>
                <option value="WAIT">승인 대기</option>
                <option value="ACCESS">승인 완료</option>
            </select>
            <label for="deleteYN">삭제 여부</label>
            <select name="deleteYN" id="deleteYN">
                <option value=''>전체</option>
                <option value='Y'>삭제</option>
                <option value='N'>삭제X</option>
            </select>
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
            <th>가입 유형</th>
            <th>삭제 여부</th>
            <th>회원정보 수정</th>
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
            <th>가입 유형</th>
            <th>삭제 여부</th>
            <th>회원정보 수정</th>
        </tr>
        </tfoot>
    </table>
</main>

</body>
<script>

        let dataTable = $('#dataTable').DataTable({
            searching : false,
            ordering: false,
            processing: true,
            serverSide: true,
            ajax:{
                url: '/member/findAllMember',
                type: 'POST',
                data: function (d) {
                    d.memberType = $("select[name='memberType']").val();
                    d.permitStatus = $("select[name='permitStatus']").val();
                    d.deleteYN = $("select[name='deleteYN']").val();
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
                {data: "provider"},
                {data: "deleteYN"},
                {data: "",
                    render: function(data,type,row){
                        return "<button id='btn_info' type='button' class='btn' onClick='openInfo(\"" + row.memberId + "\")'>회원정보 수정</button>";
                    }
                }
            ],

            // 컬럼들의 넓이 조절
            columnDefs: [
                { targets: 0, width: 50 },
                { targets: 1, width: 80 },
                { targets: 2, width: 80 },
                { targets: 3, width: 100 },
                { targets: 4, width: 100 },
                { targets: 5, width: 100 },
                { targets: 6, width: 100 },
                { targets: 7, width: 80 },
                { targets: 8, width: 100 }
            ]
            /*dom: 'Bfrtip', // Add buttons for copy, csv, excel, pdf, and print
            buttons: [
                'copy', 'csv', 'excel', 'pdf', 'print'
            ]*/
        });

        function search() {
            dataTable.draw();
        }

        $('#searchButton').on('click', function () {
            search(); // Trigger a new DataTables request
        });

    function openInfo(memberId) {
        window.open("/member/updateMember?member_id="+memberId, "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=300,left=500,width=600,height=600");
    }

</script>
</html>