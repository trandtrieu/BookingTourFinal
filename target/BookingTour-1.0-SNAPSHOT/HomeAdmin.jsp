<%-- 
    Document   : HomeAdmin
    Created on : Jun 16, 2023, 10:26:48 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="includeManager/headManager.jsp" %>

    </head>
    <body id="reportsPage">
        <div class="" id="home">
            <%@include file="includeManager/navbarManager.jsp" %>

            <div class="container-fluid">
                <div class="col-12 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
                        <h2 class="tm-block-title">Orders List</h2>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Mã đặt vé</th>
                                    <th scope="col">Ngày</th>
                                    <th scope="col">Tên khách hàng</th>
                                    <th scope="col">Tên tour</th>
                                    <th scope="col">Số điện thoại</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Số lượng người lớn, trẻ em</th>
                                    <th scope="col">Mã tour</th>
                                    <th scope="col">Thành tiền</th>
                                    <th scope="col">Ghi chú</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listH}" var="c">
                                    <tr>     
                                        <td>${c.tourId}</td>
                                        <td>${c.date}</td>
                                        <td>${c.name}</td>
                                        <td>${c.tourName}</td>
                                        <td>${c.phone}</td>
                                        <td>${c.email}</td>
                                        <td>${c.quantityAd} - ${c.quantityChildren}</td>
                                        <td>${c.tourId}</td>
                                        <td><c:out value="${String.format('%.0f', c.totalAmount)} VND" /></td>
                                        <td>${c.note}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
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
</div>

<%@include file="includeManager/footManager.jsp" %>

</body>

</html>