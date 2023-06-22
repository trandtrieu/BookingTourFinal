<%-- 
    Document   : searchResult
    Created on : May 24, 2023, 11:17:31 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Result </title>
        <%@include file="includes/head.jsp" %>
    </head>
    <style>
        .img-fixed-size {
            width: 100%;
            height: 250px; /* Định rõ chiều cao */
        }
        .link-margin {
            font-size: 1px;
            height: 35px;
        }
    </style>
    <body>
        <%@include file="includes/topbar.jsp" %>
        <div class="container-fluid page-header">
            <div class="container">
                <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 400px">
                    <h3 class="display-4 text-white text-uppercase">Search Result</h3>
                    <div class="d-inline-flex text-white">
                        <p class="m-0 text-uppercase"><a class="text-white" href="HomeController">Home</a></p>
                        <i class="fa fa-angle-double-right pt-1 px-3"></i>
                        <p class="m-0 text-uppercase">Search result</p>

                    </div>
                </div>
            </div>
        </div>
        <%@include file="includes/search.jsp" %>

        <div class="container-fluid py-5">
            <div class="container pt-5 pb-3">
                <div class="text-center mb-3 pb-3">
                    <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Khám phá</h6>
                    <h1>Danh sách tua</h1>
                    <h4 class="text-primary">Có ${listS.size()} kết quả tìm kiếm</h4>

                    <c:if test="${empty listS}">
                        <div class="alert alert-warning d-flex justify-content-center align-items-center" role="alert">
                            <div class="text-center">
                                <h4 class="alert-heading mb-3">Thông báo</h4>
                                <p class="mb-0">Không tìm thấy kết quả phù hợp.</p>
                            </div>
                        </div>
                    </c:if>
                </div>


                <div class="row">


                    <c:forEach var="t" items="${listS}" varStatus="status">
                        <div class="col-lg-4 col-md-6 mb-4" >
                            <div class="package-item bg-white mb-2">
                                <img class="img-fluid img-fixed-size" src="img/${t.imageTour}" alt="">
                                <div class="p-4">
                                    <div class="d-flex justify-content-between mb-3">
                                        <small class="m-0"><i class="fa fa-map-marker-alt text-primary mr-2"></i>${t.placeName}                                            
                                        </small>
                                        <small class="m-0"><i class="fa fa-user text-primary mr-2"></i>1 Person</small>
                                    </div>

                                    <div class="d-flex justify-content-between mb-3">
                                        <small class="m-0"><i class="fa fa-calendar-alt text-primary mr-2"></i>${t.dateStart}</small>
                                        <small class="m-0"><i class="fa fa-calendar-alt text-primary mr-2 "></i>${t.dateEnd}</small>
                                    </div>

                                    <div class="d-flex justify-content-between mb-3">
                                        <small class="m-0"><i class="fa fa-map text-primary mr-2"></i>${t.regionName}</small>
                                        <small class="m-0"><i class="fa fa-map text-primary mr-2"></i>Còn ${t.seat} chỗ</small>

                                    </div>
                                    <div  class= "link-margin text-center">
                                        <a class="h5 text-decoration-none " href="detail?tid=${t.tourId}">${t.tourName}</a>
                                    </div>
                                    <div class="border-top mt-4 pt-4">
                                        <!-- In ra số sao trung bình của tour -->
                                        <h6 class="m-0 text-center">
                                            <c:set var="yellowStars" value="${t.averageStar}" />
                                            <c:set var="grayStars" value="${5 - t.averageStar}" />

                                            <c:forEach begin="1" end="${yellowStars}">
                                                <i class="fas fa-star text-warning"></i>
                                            </c:forEach>

                                            <c:forEach begin="1" end="${grayStars}">
                                                <i class="far fa-star"></i>
                                            </c:forEach>
                                        </h6>

                                    </div>
                                    <div class="border-top mt-4 pt-4">
                                        <div class="d-flex justify-content-between">
                                            <h6 class="m-0"><i class="fa fa-calendar-day text-primary mr-2"></i>${t.numberDay}<small> ngày</small></h6>
                                            <h5 class="m-0"><fmt:formatNumber value="${t.price}" pattern="#,##0" /> VND</h5>


                                        </div>
                                    </div>
                                   

                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="container">
                    <!-- Các mã HTML khác -->
                    <div class="hotline-container">
                        <a href="tel:0789458707" class="hotline-link">Đường dây nóng 0789458707</a>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

</div>
<!-- Destination Start -->

<!-- Packages End -->
<%@include file="includes/footer.jsp" %>

</body>
<script>
    $(document).ready(function () {
        var today = new Date().toISOString().split('T')[0];
        $("#dateStartSearch").attr('min', today);
    });


</script>

<%@include file="includes/foot.jsp" %>

</html>

