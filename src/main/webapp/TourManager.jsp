<%-- 
    Document   : ManageTour
    Created on : Jun 16, 2023, 10:42:19 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="includeManager/headManager.jsp" %>
    </head>
    <body id="reportsPage">
        <%@include file="includeManager/navbarManager.jsp" %>
        <div class="container-fluid mt-5">
            <div class="row tm-content-row">
                <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-products">
                        <h1 class="tm-block-title">Manager Tour</h1>
                        <div class="tm-product-table-container">
                            <table class="table table-hover tm-table-small tm-product-table">
                                <thead>
                                    <tr>

                                        <th scope="col">Tour ID</th>
                                        <th scope="col">Tour Name</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Date Start</th>
                                        <th scope="col">Date End</th>
                                        <th scope="col">Details</th>
                                        <th scope="col">Image</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Place ID</th>
                                        <th scope="col">Place Name</th>
                                        <th scope="col">Region ID</th>
                                        <th scope="col">Region Name</th>
                                        <th scope="col">Guide Id</th>
                                        <th scope="col">Guide Name</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="itemsPerPage" value="12" /> <!-- Số lượng mục hiển thị trên mỗi trang -->
                                    <c:set var="currentPage" value="${param.pageNumber eq null ? 1 : param.pageNumber}" /> <!-- Trang hiện tại, mặc định là trang 1 -->
                                    <c:set var="totalPages" value="${(listTour.size() + itemsPerPage - 1) / itemsPerPage}" /> <!-- Tổng số trang -->

                                    <c:forEach var="x" items="${listTour}" varStatus="status">
                                        <c:if test="${status.index >= (currentPage - 1) * itemsPerPage && status.index < currentPage * itemsPerPage}">
                                            <tr>

<!--                                                <td>${x.tourId}</td>-->
                                                <td><a href="HistoryServlet?tid=${x.tourId}">${x.tourId} </a></td>

                                                <td>${x.tourName}</td>
                                                <td>${x.price}</td>
                                                <td>${x.dateStart}</td>
                                                <td>${x.dateEnd}</td>
                                                <td >${x.detailTour}</td>
                                                <!--                                                <td >
                                                                                                    <img class="rounded-circle w-50" src="img/${x.imageTour}">
                                                
                                                                                                </td>-->
                                                <td >
                                                    ${x.imageTour}

                                                </td>

                                                <td>${x.statusTour}</td>
                                                <td>${x.placeId}</td>
                                                <td>${x.placeName}</td>
                                                <td>${x.regionId}</td>
                                                <td>${x.regionName}</td>
                                                <td>${x.guideId}</td>
                                                <td>${x.guideName}</td>

                                                <td>
                                                    <a href="UpdateTour?tid=${x.tourId}" class="edit" data-toggle=""><i class="fa fa-pen" style="color: #ffae00;"></i></a>
                                                    <a href="#" onclick="showMess(${x.tourId})" class="delete" data-toggle=""><i class="fa fa-trash" style="color: #ffae00;"></i></a>
                                                </td>
                                            </tr>

                                        </c:if>
                                    </c:forEach>


                                </tbody>
                            </table>

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
                        </div>
                        <!-- table container -->
                        <a href="AddManager.jsp" class="btn btn-primary btn-block text-uppercase mb-3">Add new product</a>
<!--                        <button class="btn btn-primary btn-block text-uppercase">
                            Delete selected products
                        </button>-->
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
    </body>
</html>