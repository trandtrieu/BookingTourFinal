<%-- 
    Document   : ManageTour
    Created on : Jun 16, 2023, 10:42:19 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Tour Page</title>
        <%@include file="includeManager/headManager.jsp" %>
    </head>
    <style>.tm-product-table-container {
            max-height: 520px;

        }</style>
    <body id="reportsPage">
        <%@include file="includeManager/navbarManager.jsp" %>
        <div class="container-fluid">
            <div class="row tm-content-row">
                <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-products">
                        <h1 class="tm-block-title">Manager Tour</h1>
                        <div class="tm-product-table-container">
                            <input class="form-control bg-dark" id="myInput" type="text" placeholder="Search..">

                            <table class="table table-hover tm-table-small tm-product-table">
                                <thead>
                                    <tr>

                                        <th scope="col">Tour ID</th>
                                        <th scope="col">Tour Name</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Date Start</th>
                                        <th scope="col">Date End</th>
                                        <!--                                        <th scope="col">Details</th>-->
                                        <th scope="col">Image</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Place Name</th>
                                        <th scope="col">Region Name</th>
                                        <th scope="col">Guide Name</th>
                                        <th scope="col">Action</th>

                                    </tr>
                                </thead>
                                <tbody id="myTours">


                                    <c:forEach var="x" items="${listTour}">
                                        <tr>

                                            <td><a href="HistoryServlet?tid=${x.tourId}">${x.tourId} </a></td>

                                            <td>${x.tourName}</td>
                                            <td><fmt:formatNumber value="${x.price}" pattern="#,##0" /> VND</td>

                                            <td>${x.dateStart}</td>
                                            <td>${x.dateEnd}</td>
<!--                                                <td >${x.detailTour}</td>                                            -->
                                            <td >
                                                ${x.imageTour}
                                            </td>
                                            <td>${x.statusTour}</td>
                                            <td>${x.placeName}</td>
                                            <td>${x.regionName}</td>
                                            <td>${x.guideName}</td>

                                            <td>
                                                <a href="UpdateTour?tid=${x.tourId}" class="edit" data-toggle=""><i class="fa fa-pen" style="color: #ffae00;"></i></a>
                                                <a href="#" onclick="showMess(${x.tourId})" class="delete" data-toggle=""><i class="fa fa-trash" style="color: #ffae00;"></i></a>
                                            </td>
                                        </tr>

                                    </c:forEach>


                                </tbody>
                            </table>


                        </div>
                        <a href="AddManager.jsp" class="btn btn-primary btn-block text-uppercase mb-3">Add new tour</a>

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
        <script>
            $(function () {
                $(".tm-product-name").on("click", function () {
                    window.location.href = "UpdateManager.jsp";
                });
            });
            function  showMess(tourId) {
                var option = confirm('are you sure delete');
                if (option === true) {
                    window.location.href = 'DeleteTour?tid=' + tourId;
                }
            }
        </script>
        <script>
            $(document).ready(function () {
                $("#myInput").on("keyup", function () {
                    var value = $(this).val().toLowerCase();
                    $("#myTours tr").filter(function () {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
            });
        </script>
    </body>
</html>