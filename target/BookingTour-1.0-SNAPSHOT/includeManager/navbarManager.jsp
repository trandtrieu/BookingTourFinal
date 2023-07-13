<%-- 
    Document   : navbarManager
    Created on : Jun 16, 2023, 10:46:01 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav class="navbar navbar-expand-xl">
    <div class="container h-100">
        <a class="navbar-brand" href="HomeController">
            <h1 class="tm-site-title mb-0">Tour Booking Admin</h1>
        </a>
        <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse"
                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <i class="fas fa-bars tm-nav-icon"></i>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mx-auto h-100">
                <li class="nav-item">
                    <a class="nav-link " href="HomeController">
                        <i class="fas fa-angle-down"></i> Website
                        <span class="sr-only">(current)</span>
                    </a>
                </li>   
                <c:if test="${sessionScope.acc.getRole() == 1 || sessionScope.acc.getRole() == 3}">
                    <li class="nav-item">
                        <a class="nav-link " href="TourChart">
                            <i class="fas fa-tachometer-alt"></i> Dashboard
                            <span class="sr-only">(current)</span>
                        </a>

                    </li>
                </c:if>

                <li class="nav-item">
                    <a class="nav-link " href="ManagerTour">
                        <i class="fas fa-shopping-cart"></i> Tours
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="ListUser">
                        <i class="far fa-user"></i> Accounts
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="RequestListManage">
                        <i class="far fa-user"></i> Requests
                    </a>
                </li>

            </ul>
            <ul class="navbar-nav">

                <li class="nav-item">
                    <c:if test="${sessionScope.acc  == null}"> 
                        <a class="nav-link d-block" href="LoginServlet">

                            <b>Login</b>
                        </a>
                    </c:if>
                    <c:if test="${sessionScope.acc  != null}"> 
                        <a class="nav-link d-block" href="LogoutServlet">
                            <c:if test="${acc.role == 1}">
                               Hello Admin,
                            </c:if>
                            <c:if test="${acc.role == 3}">
                              Hello Owner,
                            </c:if>
                            <b>Logout</b>
                        </a>
                    </c:if>
                </li>
            </ul>
        </div>
    </div>
</nav>
