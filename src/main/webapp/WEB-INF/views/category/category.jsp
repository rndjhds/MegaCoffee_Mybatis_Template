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
            <select name="parentId" id="parentId">
                <option value=0>ÀüÃ¼</option>
                <c:forEach var="category" items="${category}">
                    <option value=${category.categoryId}>${category.categoryName}</option>
                </c:forEach>
            </select>
            <label for="startDate">Start Date:</label>
            <input type="date" id="startDate" name="startDate" style="border: 1px solid black">
            <label for="endDate">End Date:</label>
            <input type="date" id="endDate" name="endDate" style="border: 1px solid black">
        </div>
        <div class="right">
            <label for="category_name">Category Name:</label>
            <input type="text" id="category_name" name="category_name" style="border: 1px solid black">
            <button type="button" id="searchButton" style="border: 1px solid black">Search</button>
        </div>

    </form>
    <table id="dataTable" class="display">
        <thead>
        <tr>
            <th>PARENTNAME</th>
            <th>CATEGORYID</th>
            <th>CATEGORYNAME</th>
        </tr>
        </thead>
        <tbody>
        <!-- Data rows will be populated here -->
        </tbody>
    </table>
</main>
<script>
    $(document).ready(function () {
        console.log("DataTables initialization script is running.");
        const dataTable = $('#dataTable').DataTable({
            searching: false,
            processing: true,
            serverSide: true,
            ajax: {
                url: '/category/findCategory', // Replace with your server endpoint
                type: 'POST',
                data: function (d) {
                    d.parentId = $("select[name='parentId']").val();
                    d.categoryName = $("#category_name").val();
                },
                dataSrc: ''
            },
            columns: [
                {data: "parentName"},
                {data: "categoryId"},
                {data: "categoryName"}
            ],
            dom: 'Bfrtip', // Add buttons for copy, csv, excel, pdf, and print
            buttons: [
                'copy', 'csv', 'excel', 'pdf', 'print'
            ]
        });

        // Add an event listener to the Search button
        $('#searchButton').on('click', function () {
            dataTable.draw(); // Trigger a new DataTables request
        });
    });
</script>
</body>
</html>