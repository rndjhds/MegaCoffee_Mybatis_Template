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
        <input type="hidden" name="parentCategoryId" id="parentCategoryId" value="${parentCategoryId}"/>
        <div class="left">
            <label for="categoryId"></label>
            <select name="categoryId" id="categoryId">
                <option value="">��ü</option>
                <c:forEach var="category" items="${category}">
                    <option value=${category.categoryId}>${category.categoryName}</option>
                </c:forEach>
            </select>
            <label for="deleteYN"></label>
            <select name="deleteYN" id="deleteYN">
                <option value="">��ü</option>
                <option value="Y">����</option>
                <option value="N">����X</option>
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
            <th>����</th>
            <th>��ǰ��</th>
            <th>��ǰ�̹���</th>
            <th>��ǰ����</th>
            <th>��ǰ����</th>
            <th>��ǰ ī�װ�</th>
            <th>�����</th>
            <th>�����</th>
            <th>������</th>
            <th>������</th>
            <th>��������</th>
            <th>���� ��ư</th>
            <th>�̹��� ����</th>
        </tr>
        </thead>
        <tbody>
        <!-- Data rows will be populated here -->
        </tbody>
        <tfoot>
        <tr>
            <th>����</th>
            <th>��ǰ��</th>
            <th>��ǰ�̹���</th>
            <th>��ǰ����</th>
            <th>��ǰ����</th>
            <th>��ǰ ī�װ�</th>
            <th>�����</th>
            <th>�����</th>
            <th>������</th>
            <th>������</th>
            <th>��������</th>
            <th>���� ��ư</th>
            <th>�̹��� ����</th>
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

        let dataTable = $('#dataTable').DataTable({
            searching: false,
            ordering: false,
            processing: true,
            serverSide: true,
            ajax: {
                url: '/item/findItemByCategoryId',
                type: 'POST',
                data: function (d) {
                    d.parentCategoryId = $("#parentCategoryId").val();
                    d.categoryId = $("select[name='categoryId']").val();
                    d.deleteYN = $("select[name='deleteYN']").val();
                    d.title = $("#title").val();
                    d.startDate = $("#startDate").val();
                    d.endDate = $("#endDate").val();
                },
            },
            columns: [
                {data: "rnum"},
                {data: "title"},
                {
                    data: "", render: function (data, type, row) {
                        return "<img src='${pageContext.request.contextPath}/resources/statics/img/" + row.img + "' style='width:100px'>";
                    }
                },
                {data: "content"},
                {data: "price"},
                {data: "categoryName"},
                {data: "memberId"},
                {data: "regDate"},
                {data: "modifier"},
                {data: "modDate"},
                {data: "deleteYN"},
                {
                    data: "", render: function (data, type, row) {
                        return "<button id='btn_info' type='button' onClick='openItemInfo(" + row.itemId + ")'>���뺯��</button>";
                    }
                },
                {
                    data: "", render: function (data, type, row) {
                        return "<button id='btn_info' type='button' onClick='openInfo(" + row.itemId + ")'>�̹�������</button>";
                    }
                }
            ],

            // �÷����� ���� ����
            columnDefs: [
                {targets: 0, width: 50},
                {targets: 1, width: 120},
                {targets: 2, width: 100},
                {targets: 3, width: 500},
                {targets: 4, width: 80},
                {targets: 5, width: 120},
                {targets: 6, width: 80},
                {targets: 7, width: 100},
                {targets: 8, width: 80},
                {targets: 9, width: 100},
                {targets: 10, width: 80},
                {targets: 11, width: 100},
                {targets: 12, width: 100}
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

    function openInfo() {
        window.open("/item/createItemForm/" + $("#parentCategoryId").val(), "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=300,left=250,width=1200,height=600");
    }

    function openItemInfo(itemId) {
        window.open("/item/updateItem/" + itemId, "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=300,left=250,width=1200,height=600");

    }


</script>
</html>