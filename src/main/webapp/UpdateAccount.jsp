<%-- 
    Document   : UpdateManager
    Created on : Jun 16, 2023, 11:05:58 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Account</title>

        <%@include file="includeManager/headManager.jsp" %>
    </head>
    <body>
        <%@include file="includeManager/navbarManager.jsp" %>
        <div class="container tm-mt-big tm-mb-big">
            <div class="row">
                <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                    <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                        <div class="row">
                            <div class="col-12">
                                <h2 class="tm-block-title d-inline-block">Edit Tour</h2>
                            </div>
                        </div>
                        <form action="UpdateAccountServlet" method="post" class="tm-edit-product-form">
                            <div class="row tm-edit-product-row">
                                <div class="col-xl-6 col-lg-6 col-md-12">

                                    <div class="form-group mb-3">
                                        <label for="id">ID 
                                        </label>
                                        <input value="${a.id}" id="id" name="id" type="text" class="form-control validate bg-secondary" />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="username">User Name
                                        </label>
                                        <input value="${a.username}" id="username" name="username" type="text" class="form-control validate" />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="password">Password
                                        </label>
                                        <input value="${a.password}" id="password" name="password" type="text" class="form-control validate" />
                                    </div>
                                   
                                    <div class="row">
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label for="email">Email
                                            </label>
                                            <input value="${a.email}" id="email" name="email" type="text" class="form-control validate" />
                                        </div>
                                        
                                        <div class="form-group mb-3 col-xs-12 col-sm-6" id="place">
                                            <label for="phone">Phone
                                            </label>
                                            <input value="${a.phone}" id="phone" name="phone" type="text" class="form-control validate" />
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-6" id="region">
                                            <label for="role">Role
                                            </label>
<!--                                            <input value="${a.role}" id="role" name="role" type="text" class="form-control validate" />-->
                                            <input id="role" name="role" type="radio" class="form-control validate" data-large-mode="true" value ="0" ${a.role == 0?"checked":""}>Customer
                                            <input id="role" name="role" type="radio" class="form-control validate" data-large-mode="true" value ="1" ${a.role == 1?"checked":""}>Admin
                                            <input id="role" name="role" type="radio" class="form-control validate" data-large-mode="true" value ="2" ${a.role == 2?"checked":""}>Guide
                                            <input id="role" name="role" type="radio" class="form-control validate" data-large-mode="true" value ="3" ${a.role == 3?"checked":""}>Owner
                                        </div>
                                        
                                    </div>

                                </div>
                                <div class="form-group mb-3">
                                    <label for="avatar">Avatar</label>
                                    <input value="${a.avatar}" type="text" name="avatar" class="form-control validate"/>
                                </div>
                                <div class="col-12">
                                    <button type="submit" class="btn btn-primary btn-block text-uppercase">Update Now</button>
                                </div>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="includeManager/footerManager.jsp" %>
    </body>
    <%@include file="includeManager/footManager.jsp" %>
    
</html>