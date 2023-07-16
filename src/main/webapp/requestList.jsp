<%--
    Document   : requestList
    Created on : Jul 12, 2023, 10:58:53 PM
    Author     : DELL
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
        <div class="container-fluid">
            <div class="row tm-content-row">
                <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-products">
                        <h1 class="tm-block-title">Manager Tour</h1>
                        <div class="tm-product-table-container">
                            <input class="form-control bg-dark" id="myInput" type="text" placeholder="Search..">

                            <table class="table table-hover tm-table-small tm-product-table">
                                <thead class="">
                                    <tr>

                                        <th scope="col">Request ID</th>
                                        <th scope="col">Customer</th>
                                        <th scope="col">Status</th>
                                        <th scope="col" class="text-center">Action</th>

                                    </tr>
                                </thead>
                                <tbody id="myTours" class="r">
                                    <c:forEach var="x" items="${requestList}">
                                        <tr>
                                            <td>${x.requestId}</td>
                                            <td>
                                                <c:set var="formattedName" value="${fn:toLowerCase(x.name)}" />
                                                <c:forEach var="word" items="${fn:split(formattedName, ' ')}">
                                                    <c:set var="firstLetter" value="${fn:substring(word, 0, 1)}" />
                                                    <c:set var="remainingLetters" value="${fn:substring(word, 1, fn:length(word))}" />
                                                    <c:set var="capitalizedWord" value="${fn:toUpperCase(firstLetter)}${remainingLetters}" />
                                                    ${capitalizedWord}
                                                </c:forEach>
                                            </td>


                                            <td>
                                                <c:if test="${x.status}">
                                                    Confirm
                                                </c:if>
                                                <c:if test="${!x.status}">
                                                    Not Confirm
                                                </c:if>
                                            </td>

<!--                                            <td><fmt:formatNumber value="${x.price}" pattern="#,##0" /> VND</td>-->

                                            <td class="text-center">
                                                <div class="button-group"  >
                                                    <a href="ConfirmRequestServlet?rid=${x.requestId}" class="btn " >
                                                        <i class="fas fa-check"></i>
                                                    </a>
                                                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#exampleModal-${x.requestId}">
                                                        <i class="fas fa-info-circle"></i>
                                                    </button>

                                                    <a href="DenyRequestServlet?rid=${x.requestId}" class="btn">
                                                        <i class="fas fa-times"></i>
                                                    </a>
                                                </div>
                                            </td>






                                    <div class="modal fade" id="exampleModal-${x.requestId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h2 class="modal-title" id="modalTitle-${x.requestId}">Request Details</h2>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="tour-details">
                                                        <p><strong>Request ID:</strong> ${x.requestId}</p>
                                                        <p><strong>Tour Name:</strong> ${x.tourName}</p>
                                                        <p><strong>The cost per person</strong> for <fmt:formatNumber value="${x.price}" pattern="#,##0" /> VND</p>
                                                        <p><strong>Adults:</strong> ${x.quantityAd}</p>
                                                        <p><strong>Children:</strong> ${x.quantityChild}</p>
                                                        <p><strong>Departure Date:</strong> ${x.dateStart}</p>
                                                        <p><strong>End Date:</strong> ${x.dateEnd}</p>
                                                    </div>
                                                    <div class="contact-details">
                                                        <h4>Contact Details</h4>
                                                        <p><strong>Name:</strong> <c:set var="formattedName" value="${fn:toLowerCase(x.name)}" />
                                                            <c:forEach var="word" items="${fn:split(formattedName, ' ')}">
                                                                <c:set var="firstLetter" value="${fn:substring(word, 0, 1)}" />
                                                                <c:set var="remainingLetters" value="${fn:substring(word, 1, fn:length(word))}" />
                                                                <c:set var="capitalizedWord" value="${fn:toUpperCase(firstLetter)}${remainingLetters}" />
                                                                ${capitalizedWord}
                                                            </c:forEach></p>

                                                        <p><strong>Phone:</strong> ${x.phone}</p>
                                                        <p><strong>Email:</strong> ${x.email}</p>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                                                    <button type="button" class="btn btn-primary" onclick="window.location.href = 'AddTourByRequest?rid=${x.requestId}'">Create Tour</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>



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

    </body>
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
</html>
