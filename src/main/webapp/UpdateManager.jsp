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
        <title>JSP Page</title>

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
                        <form action="UpdateTour" method="post" class="tm-edit-product-form">
                            <div class="row tm-edit-product-row">
                                <div class="col-xl-6 col-lg-6 col-md-12">

                                    <div class="form-group mb-3">
                                        <label for="id">Tour ID
                                        </label>
                                        <input value="${tt.tourId}" id="id" name="id" type="text" class="form-control validate bg-secondary" />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="name">Tour Name
                                        </label>
                                        <input value="${tt.tourName}" id="name" name="name" type="text" class="form-control validate" />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="price">Price
                                        </label>
                                        <input value="${tt.price}" id="price" name="price" type="text" class="form-control validate" />
                                    </div>
                                    <div class="row">
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label for="dateStart">Date Start
                                            </label>
                                            <input value="${tt.dateStart}" id="minDateStart" name="dateStart" type="date" class="form-control validate" />
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label for="dateEnd">Date End
                                            </label>
                                            <input value="${tt.dateEnd}" id="minDateEnd" name="dateEnd" type="date" class="form-control validate" />
                                        </div>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="details">Details</label>
<!--                                        <input value="${tt.detailTour}" id="details" name="details" type="text" class="form-control validate" />-->
                                        <textarea id="details" name="details" type="text" class="form-control validate" rows="5" cols="10">${tt.detailTour}</textarea>
                                    </div>
                                    <div class="row">
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label for="status">Status
                                            </label>
                                            <input value="${tt.statusTour}" id="status" name="status" type="text" class="form-control validate" />
                                        </div>
                                        
                                        <div class="form-group mb-3 col-xs-12 col-sm-6" id="place">
                                            <label for="placeId">Place ID
                                            </label>
                                            <input value="${tt.placeId}" id="placeId" name="placeId" type="text" class="form-control validate" />
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-6" id="region">
                                            <label for="regionId">Region ID
                                            </label>
                                            <input value="${tt.regionId}" id="regionId" name="regionId" type="text" class="form-control validate" />
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-6" id="guide">
                                            <label for="guideId">Guide ID
                                            </label>
                                            <input value="${tt.guideId}" id="guideId" name="guideId" type="text" class="form-control validate" />
                                        </div>
                                    </div>

                                </div>
                                <div class="form-group mb-3">
                                    <label for="image">Image</label>
                                    <input value="${tt.imageTour}" type="text" name="image" class="form-control validate"/>
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