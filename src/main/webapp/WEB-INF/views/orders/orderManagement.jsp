<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../common/adminHeader.jsp" %>
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
                <c:forEach var="stores" items="${stores}">
                    <option value=${stores.storeId}>${stores.storeName}</option>
                </c:forEach>
            </select>
            <button type="button" id="searchButton" style="border: 1px solid black">Search</button>
        </div>
    </form>
    <table id="dataTable" class="display">
        <thead>
        <tr>
            <th>����</th>
            <th>��ǰ��</th>
            <th>ICE/HOT</th>
            <th>��</th>
            <th>��ǰ ������</th>
            <th>�ֹ���</th>
            <th>�� ���� �ݾ�</th>
            <th>�غ� �Ϸ�</th>
        </tr>
        </thead>
        <tbody>
        <!-- Data rows will be populated here -->
        </tbody>
        <tfoot>
        <tr>
            <th>����</th>
            <th>��ǰ��</th>
            <th>ICE/HOT</th>
            <th>��</th>
            <th>��ǰ ������</th>
            <th>�ֹ���</th>
            <th>�� ���� �ݾ�</th>
            <th>�غ� �Ϸ�</th>
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
                url: '/order/findOrderItemByStoreId',
                type: 'POST',
                data: function (d) {
                    d.storeId = $("select[name='storeId']").val();
                },
            },
            columns: [
                {data: "RNUM"},
                {data: "TITLE"},
                {data: "ORDEROPTION"},
                {data: "ORDERCUP"},
                {data: "ORDERSIZE"},
                {data: "BUYER"},
                {data: "AMOUNT"},
                {
                    data: "", render: function (data, type, row) {
                        return "<button id='btn_info' type='button' onClick='openItemInfo(" + row.ORDERID + ")'>�غ� �Ϸ�</button>";
                    }
                }
            ],

            // �÷����� ���� ����
            columnDefs: [
                {targets: 0, width: 50},
                {targets: 1, width: 200},
                {targets: 2, width: 100},
                {targets: 3, width: 120},
                {targets: 4, width: 80},
                {targets: 5, width: 120},
                {targets: 6, width: 120},
                {targets: 7, width: 100}
            ]
            /*dom: 'Bfrtip', // Add buttons for copy, csv, excel, pdf, and print
            buttons: [
                'copy', 'csv', 'excel', 'pdf', 'print'
            ]
    */
        });

        $('#searchButton').on('click', function () {
            dataTable.draw(); // Trigger a new DataTables request
        });
    });

    function openItemInfo(orderId) {
        $.ajax({
            url:"/order/updateOrderStatusToCOMPITEM/"+orderId,
            type:"POST",
            contentType: "application/json; charset-utf-8",
            dataType:"json",
            success: function (data) {
                alert("��ǰ �غ� �Ϸ�� ����");
            },
            error: function (){

            }
        })

    }

</script>
</html>