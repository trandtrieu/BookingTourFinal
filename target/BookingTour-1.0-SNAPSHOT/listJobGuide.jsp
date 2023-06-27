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

                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th scope="col">tourId</th>
                                <th scope="col">tourName</th>
                                <th scope="col">dateStart</th>
                                <th scope="col">dateEnd </th>
                                <th scope="col">Number day</th>
                                
                            </tr>
                        </thead>
                        <tbody>

                            <c:forEach items="${job}" var="a">
                                <tr>
                                    <td>${a.tourId}</td>
                                    <td>
                                        <a href="detail?tid=${a.tourId}">  ${a.tourName}</a>
                                    </td>

                                    <td>${a.dateStart}</td>
                                    <td>${a.dateEnd}</td>
                                    <td>${a.numberDay}</td>
                                    
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>        
        </div>
        <%@include file="includes/footer.jsp" %>

    </body>
    <%@include file="includes/foot.jsp" %>

</html>