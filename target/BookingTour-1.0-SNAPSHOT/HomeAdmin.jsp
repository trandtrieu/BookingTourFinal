<%--
    Document   : HomeAdmin
    Created on : Jun 16, 2023, 10:26:48 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tour Booking </title>
        <%@include file="includeManager/headManager.jsp" %>

    </head>
    <style>

    </style>
    <body id="reportsPage">
        <div class="" id="home">
            <%@include file="includeManager/navbarManager.jsp" %>
            <h1 class=" text-center text-white">Orders List</h1>
            <div class="container-fluid ">
                <div class="col-xl-12 tm-block-col ">
                    <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block tm-block-products">

                            <h3 class="tm-block-title">${detail.tourName} </h3>
                            <h3 class="tm-block-title"> Mã tour: ${detail.tourId}</h3>
                            <h3 class="tm-block-title"></h3>
                            <h3 class="tm-block-title">Trạng thái:
                                <c:if test="${detail.statusTour == true}">
                                    Đã khởi hành
                                </c:if>
                                <c:if test="${detail.statusTour == false}">
                                    Chưa khởi hành
                                </c:if>
                            </h3>
                            <h3 class="tm-block-title">Ngày khởi hành: ${detail.dateStart}</h3>


                            <div class="tm-product-table-container ">
                                <input class="form-control bg-dark" id="myInput" type="text" placeholder="Search..">

                                <table class="table table-">

                                    <thead>
                                        <tr>
                                            <th scope="col">Mã đặt vé</th>
                                            <th scope="col">Ngày đặt tour</th>
                                            <th scope="col">Tên khách hàng</th>
                                            <th scope="col">Số điện thoại</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">Số lượng người lớn, trẻ em</th>
                                            <th scope="col">Thành tiền</th>
                                            <th scope="col">Ghi chú</th>
                                            <th scope="col">Action</th>

                                        </tr>

                                    </thead>
                                    <tbody id="myOrders">

                                        <c:forEach items="${listH}" var="c">
                                            <tr>
                                                <td>${c.orderId}</td>
                                                <td>${c.date}</td>
                                                <td>${c.name}</td>
                                                <td>${c.phone}</td>
                                                <td>${c.email}</td>
                                                <td>${c.quantityAd} - ${c.quantityChildren}</td>
                                                <td><fmt:formatNumber value="${c.totalAmount}" pattern="#,##0" /> VND </td>
                                                <td>${c.note}</td>
                                                <td>
                                                    <a href="DeleteOrder?oid=${c.orderId}" class="delete" data-toggle="" onclick="return confirm('Bạn có chắc chắn muốn xóa?')">
                                                        <i class="fa fa-trash" style="color: #ffae00;"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>


                                    </tbody>
                                </table>





                                <c:if test="${empty listH}">
                                    <div class="alert alert-warning d-flex justify-content-center align-items-center" role="alert">
                                        <div class="text-center">
                                            <p class="mb-0">Danh sách đặt vé hiện đang trống</p>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>





                <footer class="tm-footer row tm-mt-small">
                    <div class="col-12 font-weight-light">
                        <p class="text-center text-white mb-0 px-4 small">
                            Copyright &copy; <b>2018</b> All rights reserved.

                            Design: <a rel="nofollow noopener" href="https://templatemo.com" class="tm-footer-link">Template Mo</a>
                        </p>
                    </div>
                </footer>

                <%@include file="includeManager/footManager.jsp" %>

                </body>
                <script>
                    $(document).ready(function () {
                        $("#myInput").on("keyup", function () {
                            var value = $(this).val().toLowerCase();
                            $("#myOrders").filter(function () {
                                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                            });
                        });
                    });
                </script>

                </html>