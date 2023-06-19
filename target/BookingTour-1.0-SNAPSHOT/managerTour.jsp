<%-- 
    Document   : managerTour
    Created on : Jun 9, 2023, 11:16:42 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            body {
                color: #566787;
                background: #f5f5f5;
                font-family: 'Varela Round', sans-serif;
                font-size: 13px;
            }
            .table-responsive {
                margin: 30px 0;
            }
            .table-wrapper {
                background: #fff;
                padding: 20px 25px;
                border-radius: 3px;
                min-width: 1000px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {
                padding-bottom: 15px;
                background: #435d7d;
                color: #fff;
                padding: 16px 30px;
                min-width: 100%;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .table-title .btn-group {
                float: right;
            }
            .table-title .btn {
                color: #fff;
                float: right;
                font-size: 13px;
                border: none;
                min-width: 50px;
                border-radius: 2px;
                border: none;
                outline: none !important;
                margin-left: 10px;
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            .table-title .btn span {
                float: left;
                margin-top: 2px;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }
            table.table tr th:first-child {
                width: 60px;
            }
            table.table tr th:last-child {
                width: 100px;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }
            table.table td:last-child i {
                opacity: 0.9;
                font-size: 22px;
                margin: 0 5px;
            }
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
                outline: none !important;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.edit {
                color: #FFC107;
            }
            table.table td a.delete {
                color: #F44336;
            }
            table.table td i {
                font-size: 19px;
            }
            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
            }
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 13px;
                min-width: 30px;
                min-height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
            }
            .pagination li a:hover {
                color: #666;
            }
            .pagination li.active a, .pagination li.active a.page-link {
                background: #03A9F4;
            }
            .pagination li.active a:hover {
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                float: left;
                margin-top: 10px;
                font-size: 13px;
            }
            /* Custom checkbox */
            .custom-checkbox {
                position: relative;
            }
            .custom-checkbox input[type="checkbox"] {
                opacity: 0;
                position: absolute;
                margin: 5px 0 0 3px;
                z-index: 9;
            }
            .custom-checkbox label:before{
                width: 18px;
                height: 18px;
            }
            .custom-checkbox label:before {
                content: '';
                margin-right: 10px;
                display: inline-block;
                vertical-align: text-top;
                background: white;
                border: 1px solid #bbb;
                border-radius: 2px;
                box-sizing: border-box;
                z-index: 2;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                content: '';
                position: absolute;
                left: 6px;
                top: 3px;
                width: 6px;
                height: 11px;
                border: solid #000;
                border-width: 0 3px 3px 0;
                transform: inherit;
                z-index: 3;
                transform: rotateZ(45deg);
            }
            .custom-checkbox input[type="checkbox"]:checked + label:before {
                border-color: #03A9F4;
                background: #03A9F4;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                border-color: #fff;
            }
            .custom-checkbox input[type="checkbox"]:disabled + label:before {
                color: #b8b8b8;
                cursor: auto;
                box-shadow: none;
                background: #ddd;
            }
            /* Modal styles */
            .modal .modal-dialog {
                max-width: 400px;
            }
            .modal .modal-header, .modal .modal-body, .modal .modal-footer {
                padding: 20px 30px;
            }
            .modal .modal-content {
                border-radius: 3px;
                font-size: 14px;
            }
            .modal .modal-footer {
                background: #ecf0f1;
                border-radius: 0 0 3px 3px;
            }
            .modal .modal-title {
                display: inline-block;
            }
            .modal .form-control {
                border-radius: 2px;
                box-shadow: none;
                border-color: #dddddd;
            }
            .modal textarea.form-control {
                resize: vertical;
            }
            .modal .btn {
                border-radius: 2px;
                min-width: 100px;
            }
            .modal form label {
                font-weight: normal;
            }
        </style>
        <script>
            $(document).ready(function () {
                // Activate tooltip
                $('[data-toggle="tooltip"]').tooltip();

                // Select/Deselect checkboxes
                var checkbox = $('table tbody input[type="checkbox"]');
                $("#selectAll").click(function () {
                    if (this.checked) {
                        checkbox.each(function () {
                            this.checked = true;
                        });
                    } else {
                        checkbox.each(function () {
                            this.checked = false;
                        });
                    }
                });
                checkbox.click(function () {
                    if (!this.checked) {
                        $("#selectAll").prop("checked", false);
                    }
                });
            });
        </script>
    </head>
    <body>
        <div class="container-fluid">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Manage <b>Employees</b></h2>
                            </div>
                            <div class="col-sm-6">
                                <a href="addTour.jsp" class="btn btn-success" data-toggle=""><i class="material-icons">&#xE147;</i> <span>Create New Tour</span></a>

                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>
                                    <span class="custom-checkbox">
                                        <input type="checkbox" id="selectAll">
                                        <label for="selectAll"></label>
                                    </span>
                                </th>
                                <th>Tour ID</th>
                                <th>Tour Name</th>
                                <th>Price</th>
                                <th>Date Start</th>
                                <th>Date End</th>
                                <th>Details</th>
                                <th>Image</th>
                                <th>Status</th>
                                <th>Place ID</th>
                                <th>Place Name</th>
                                <th>Region ID</th>
                                <th>Region Name</th>
                                <th>Guide Id</th>
                                <th>Guide Name</th>


                            </tr>
                        </thead>
                        <tbody>

                            <c:set var="itemsPerPage" value="6" /> <!-- Số lượng mục hiển thị trên mỗi trang -->
                            <c:set var="currentPage" value="${param.pageNumber eq null ? 1 : param.pageNumber}" /> <!-- Trang hiện tại, mặc định là trang 1 -->
                            <c:set var="totalPages" value="${(listTour.size() + itemsPerPage - 1) / itemsPerPage}" /> <!-- Tổng số trang -->

                            <c:forEach var="x" items="${listTour}" varStatus="status">
                                <c:if test="${status.index >= (currentPage - 1) * itemsPerPage && status.index < currentPage * itemsPerPage}">
                                    <tr>
                                        <td>
                                            <span class="custom-checkbox">
                                                <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                                <label for="checkbox1"></label>
                                            </span>
                                        </td>
                                        <td>${x.tourId}</td>
                                        <td>${x.tourName}</td>
                                        <td>${x.price}</td>
                                        <td>${x.dateStart}</td>
                                        <td>${x.dateEnd}</td>
                                        <td>${x.detailTour}</td>
                                        <td>
                                            <img class="rounded-circle w-50" src="img/${x.imageTour}">

                                        </td>
                                        <td>${x.statusTour}</td>
                                        <td>${x.placeId}</td>
                                        <td>${x.placeName}</td>
                                        <td>${x.regionId}</td>
                                        <td>${x.regionName}</td>
                                        <td>${x.guideId}</td>
                                        <td>${x.guideName}</td>

                                        <td>
                                            <a href="UpdateTour?tid=${x.tourId}" class="edit" data-toggle=""><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                            <a href="#" onclick="showMess(${x.tourId})" class="delete" data-toggle=""><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                        </td>
                                    </tr>

                                </c:if>
                            </c:forEach>

                            <!-- Hiển thị phân trang -->
                            <c:if test="${listTour.size() > itemsPerPage}">
                            <ul class="pagination justify-content-center mt-4">
                                <li class="page-item${currentPage eq 1 ? ' disabled' : ''}">
                                    <a class="page-link" href="?pageNumber=${currentPage - 1}">&laquo; Previous</a>
                                </li>
                                <c:forEach var="page" begin="1" end="${totalPages}">
                                    <c:url var="pageURL" value="?pageNumber=${page}" />
                                    <li class="page-item${page eq currentPage ? ' active' : ''}">
                                        <a class="page-link" href="${pageURL}">${page}</a>
                                    </li>
                                </c:forEach>
                                <li class="page-item${currentPage eq totalPages ? ' disabled' : ''}">
                                    <a class="page-link" href="?pageNumber=${currentPage + 1}">Next &raquo;</a>
                                </li>
                            </ul>
                        </c:if>    




                        </tbody>
                    </table>
                </div>

            </div>
        </div>        


    </body>
    <script>
        function  showMess(tourId) {
            var option = confirm('are you sure delete');
            if (option === true) {
                window.location.href = 'DeleteTour?tid=' + tourId;
            }
        }
    </script>
</html>
