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
    </head>
    <body>
        <%@include file="includeManager/navbarManager.jsp" %>

        <div class="container tm-mt-big tm-mb-big">
            <div class="row">
                <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                    <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                        <div class="row">
                            <div class="col-12">
                                <h2 class="tm-block-title d-inline-block">Create New Tour</h2>
                            </div>
                        </div>
                        <form action="AddTourServlet" method="post">
                            <div class="row tm-edit-product-row">
                                <div class="col-xl-6 col-lg-6 col-md-12">

                                    <div class="form-group mb-3">
                                        <label
                                            for="name"
                                            >Tour Name
                                        </label>
                                        <input
                                            id="name"
                                            name="name"
                                            type="text"
                                            class="form-control validate"
                                            required
                                            />
                                    </div>

                                    <div class="form-group mb-3">
                                        <label
                                            for="price"
                                            >Price
                                        </label>
                                        <input
                                            id="price"
                                            name="price"
                                            type="text"
                                            class="form-control validate"
                                            required
                                            />
                                    </div>
                                    <div class="row">
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label for="dateStart">Date Start </label>
                                            <input
                                                id="minDateStart"
                                                name="dateStart"
                                                type="date"
                                                class="form-control validate"
                                                data-large-mode="true"
                                                />
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <labelfor for="dateEnd">Date End</label>
                                                <input
                                                    id="minDateEnd"
                                                    name="dateEnd"
                                                    type="date"
                                                    class="form-control validate"
                                                    required
                                                    />
                                        </div>

                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            for="details"
                                            >Details</label
                                        >
                                        <textarea
                                            class="form-control validate"
                                            name="details"

                                            type="text"
                                            required
                                            ></textarea>
                                    </div>

                                    <div class="row">
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="status"
                                                >Status
                                            </label>
                                            <input
                                                id="status"
                                                name="status"
                                                type="text"
                                                class="form-control validate"
                                                data-large-mode="true"
                                                value ="0"
                                                />
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="placeId"
                                                >Place ID
                                            </label>

                                            <select class="custom-select " style="height: 47px;" name="placeId">
                                                <c:forEach var="p" items="${myPlaces}" varStatus="status">
                                                    <option value="${p.placeId}">${p.placeId}. ${p.placeName}</option>
                                                </c:forEach>
                                            </select>

                                        </div>
                                        
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="regionId"
                                                >Region ID
                                            </label>
                                           <select class="custom-select " style="height: 47px;" name="regionId">
                                                <c:forEach var="r" items="${myRegions}" varStatus="status">
                                                    <option value="${r.regionId}">${r.regionId}. ${r.regionName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="guideId"
                                                >Guide ID
                                            </label>
                                            <select class="custom-select " style="height: 47px;" name="guideId">
                                                <c:forEach var="g" items="${myGuides}" varStatus="status">
                                                    <option value="${g.guideId}">${g.guideId}. ${g.guideName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group mb-3">
                                    <label for="image">Image</label>
                                    <input id="image" name="image" type="file" class="form-control validate" required />
                                </div>
                                <div class="col-12">
                                    <button type="submit" class="btn btn-primary btn-block text-uppercase">Create Tour Now</button>
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
    <script>
        $(document).ready(function () {
            var today = new Date().toISOString().split('T')[0];
            $("#minDateStart").attr('min', today);
        });
        $(document).ready(function () {
            var today = new Date().toISOString().split('T')[0];
            $("#minDateEnd").attr('min', today);
        });

    </script>
</html>