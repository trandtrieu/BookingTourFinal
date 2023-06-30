<%-- 
    Document   : AddManager
    Created on : Jun 16, 2023, 10:50:00 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Manager</title>
        <%@include file="includeManager/headManager.jsp" %>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <%@include file="includeManager/navbarManager.jsp" %>

        <div class="container tm-mt-big tm-mb-big">
            <div class="row">
                <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                    <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                        <div class="row">
                            <div class="col-12">
                                <h2 class="tm-block-title d-inline-block">Create New Account</h2>
                            </div>
                        </div>
                        <form action="AddAccountServlet" method="post">
                            <div class="row tm-edit-product-row">
                                <div class="col-xl-6 col-lg-6 col-md-12">
                                    <div class="form-group mb-3">
                                        <label for="username">User Name</label>
                                        <input id="username" name="username" type="text" class="form-control validate" required/>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="password">Password</label>
                                        <input id="password" name="password" type="text" class="form-control validate" required/>
                                    </div>
                                    <div class="row">
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label for="email">Email</label>
                                            <input id="email" name="email" type="text" class="form-control validate" data-large-mode="true"/>
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label for="phone">Phone</label>
                                            <input id="phone" name="phone" type="text" class="form-control validate" required/>
                                        </div>
                                    </div>
                                    <div class="form-check">
                                        <label class="form-check-label" for="radio1">
                                            <input type="radio" class="form-check-input" id="radio1" name="role" value="0" checked/>Customer
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <label class="form-check-label" for="radio2">
                                            <input type="radio" class="form-check-input" id="radio2" name="role" value="1"/>Admin
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <label class="form-check-label" for="radio3">
                                            <input type="radio" class="form-check-input" id="radio3" name="role" value="2"/>Guide
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <label class="form-check-label">
                                            <input type="radio" class="form-check-input" name="role" value="3" disabled/>Owner
                                        </label>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-12">
                                    <div class="form-group mb-3">
                                        <label for="avatar">Avatar</label>
                                        <input id="avatar" name="avatar" type="file" class="form-control validate" required/>
                                    </div>
                                </div>
                                <div class="col-12 mt-5">
                                    <button type="submit" class="btn btn-primary btn-block text-uppercase">Create Account Now</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="includeManager/footerManager.jsp" %>

</body>
<%@include file="includeManager/footManager.jsp" %>

</html>