<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>List Job</title>
        <%@include file="includes/head.jsp" %>

    </head>
    <body>
        <%@include file="includes/topbar.jsp" %>
        <div class="container-fluid page-header">
            <div class="container">
                <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 400px">
                    <h3 class="display-4 text-white text-uppercase">Blog</h3>
                    <div class="d-inline-flex text-white">
                        <p class="m-0 text-uppercase"><a class="text-white" href="">Home</a></p>
                        <i class="fa fa-angle-double-right pt-1 px-3"></i>
                        <p class="m-0 text-uppercase">Blog</p>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="includes/search.jsp" %>

        <div class="container-xl">
    <div class="table-responsive">
        <div class="table-wrapper">
            <h3>Danh sách tour</h3>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th scope="col">Tour ID</th>
                        <th scope="col">Tour Name</th>
                        <th scope="col">Date Start</th>
                        <th scope="col">Date End</th>
                        <th scope="col">Number of Days</th>
                        <th scope="col">List of Customer Members</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${job}" var="a">
                        <tr>
                            <td>${a.tourId}</td>
                            <td>
                                <a href="detail?tid=${a.tourId}">${a.tourName}</a>
                            </td>
                            <td>${a.dateStart}</td>
                            <td>${a.dateEnd}</td>
                            <td>${a.numberDay}</td>
                            <td>
                                <a href="ListJobGuide?tid=${a.tourId}">
                                    <button type="button" class="btn btn-primary " >Chi tiết</button>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <h3>Thông tin đặt vé</h3>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Mã đặt vé</th>
                        <th scope="col">Tên khách hàng</th>
                        <th scope="col">Số điện thoại</th>
                        <th scope="col">Email</th>
                        <th scope="col">Số lượng người lớn, trẻ em</th>
                        <th scope="col">Ghi chú</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listH}" var="c">
                        <tr>
                            <td>${c.tourId}</td>
                            <td>${c.name}</td>
                            <td>${c.phone}</td>
                            <td>${c.email}</td>
                            <td>${c.quantityAd} - ${c.quantityChildren}</td>
                            <td>${c.note}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table> 

            <c:if test="${empty listH}">
                <div class="alert alert-warning d-flex justify-content-center align-items-center" role="alert">
                    <div class="text-center">
                        <h4 class="alert-heading mb-3">Thông báo</h4>
                        <p class="mb-0">Hiện tại chưa có khách hàng đăng ký tour.</p>
                    </div>
                </div>
            </c:if>
        </div>
    </div>        
</div>


        <%@include file="includes/footer.jsp" %>

    </body>
    <%@include file="includes/foot.jsp" %>

</html>