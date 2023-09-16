<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../common/adminHeader.jsp" %>
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
            <label for="memberType">ȸ�� ����</label>
            <select name="memberType" id="memberType">
                <option value='NONE'>��ü</option>
                <option value="BUYER">������</option>
                <option value="MANAGER">��������</option>
            </select>
            <label for="permitStatus">ȸ�� ���ο���</label>
            <select name="permitStatus" id="permitStatus">
                <option value='NONE'>��ü</option>
                <option value="DENIED">���ΰź�</option>
                <option value="WAIT">���� ���</option>
                <option value="ACCESS">���� �Ϸ�</option>
            </select>
            <label for="deleteYN">���� ����</label>
            <select name="deleteYN" id="deleteYN">
                <option value=''>��ü</option>
                <option value='Y'>����</option>
                <option value='N'>����X</option>
            </select>
            <label for="username">Name:</label>
            <input type="text" id="username" name="username" style="border: 1px solid black">
            <button type="button" id="searchButton" style="border: 1px solid black">Search</button>
        </div>

    </form>
    <table id="dataTable" class="display">
        <thead>
        <tr>
            <th>����</th>
            <th>ȸ�� ID</th>
            <th>�̸�</th>
            <th>�̸���</th>
            <th>ȸ�� Ÿ��</th>
            <th>���� ����</th>
            <th>���� ����</th>
        </tr>
        </thead>
        <tbody>
        <!-- Data rows will be populated here -->
        </tbody>
        <tfoot>
        <tr>
            <th>����</th>
            <th>ȸ�� ID</th>
            <th>�̸�</th>
            <th>�̸���</th>
            <th>ȸ�� Ÿ��</th>
            <th>���� ����</th>
            <th>���� ����</th>
        </tr>
        </tfoot>
    </table>
</main>

</body>
<script>

    $(document).ready(function () {
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
                {data: "deleteYN"}
            ]

            // �÷����� ���� ����
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

</script>
</html>