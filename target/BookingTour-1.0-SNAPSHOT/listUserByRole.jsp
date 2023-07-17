<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>List User</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            <%@include file="includeManager/styleUser.css" %>

        </style>
        <%@include file="includeManager/headManager.jsp" %>


    </head>
    <body>
        <%@include file="includeManager/navbarManager.jsp" %>

        <div class="container-fluid">
            <div class="row">
                <div  class="col-md-2 pt-4">


                    <ul class="list-group">
                        <a href="ListUser">
                            <li class=" d-flex justify-content-between align-items-center dropdown-item">
                                Tất cả
                            </li>
                        </a>
                        <c:forEach var="r" items="${roles}" varStatus="status">

                            <a href="ListUserByRole?role=${r.role}">
                                <li class=" d-flex justify-content-between align-items-center dropdown-item">
                                    ${r.roleName}
                                </li>
                            </a>
                        </c:forEach>

                    </ul>
                </div>



                <div  class="col-md-9">

                    <div class="table-responsive">
                        <!--                        <div class="row mb-3">
                                                    <div class="col-sm-6">
                                                        <h2>List <b>User</b></h2>
                                                    </div>
                                                    <div class="col-sm-6 ">
                                                        <a href="AddAccount.jsp" class="btn btn-success" data-toggle=""><i class="material-icons">&#xE147;</i> <span>Add New Employee</span></a>

                                                    </div>


                                                </div>-->
                        <input class="form-control bg-dark" id="myInput" type="text" placeholder="Search..">

                        <table class="table  table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">Avatar</th>

                                    <th scope="col">ID</th>
                                    <th scope="col">User Name</th>
                                    <!--                                    <th scope="col">Password </th>-->
                                    <th scope="col">Email </th>
                                    <th scope="col">Phone</th>
                                    <th scope="col">Role</th>
                                    <th scope="col">Button</th>
                                </tr>
                            </thead>
                            <tbody id="myTable">


                                <c:forEach var="a" items="${roleId}" varStatus="status">
                                    <tr>
                                        <td><img class="rounded-circle" src="img/${a.avatar}" width="100" height="100" alt="alt" /></td>

                                        <td>${a.id}</td>
                                        <td>${a.username}</td>
                                        <!--                                        <td>
                                        ${a.password}
                                    </td>-->
                                        <td>${a.email}</td>
                                        <td>${a.phone}</td>
                                        <td>
                                            <c:if test="${a.role == 1}">
                                                Admin
                                            </c:if>
                                            <c:if test="${a.role == 0}">
                                                Customer
                                            </c:if>
                                            <c:if test="${a.role == 2}">
                                                Tour guide
                                            </c:if>
                                            <c:if test="${a.role == 3}">
                                                Owner
                                            </c:if>
                                        </td>
                                        <td>

                                            <a href="UpdateAccountServlet?aid=${a.id}" class="edit" data-toggle=""><i class="fa fa-pencil" style="color: #ffae00;"></i></a>
                                                <c:choose>
                                                    <c:when test="${a.role == 1 || a.role == 3 }">
                                                    <!-- Ẩn thẻ <a> khi role = 1 -->
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="#" onclick="showMess(${a.id})" class="delete" data-toggle=""><i class="fa fa-trash" style="color: #ffae00;"></i></a>

                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <!-- Hiển thị phân trang -->
                    </div>
                </div>

            </div>
        </div>

    </body>
    <%@include file="includeManager/footerManager.jsp" %>
    <%@include file="includeManager/footManager.jsp" %>

    <script>
        function  showMess(id) {
            var option = confirm('are you sure delete');
            if (option === true) {
                window.location.href = 'DeleteAccount?aid=' + id;
            }
        }
    </script>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script>
        var currentPage = ${currentPage}; // Trang hiện tại
        var filteredData = null; // Dữ liệu sau khi lọc
    </script>
    <script>
        $(document).ready(function () {
            $("#myInput").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#myTable tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>
</html>