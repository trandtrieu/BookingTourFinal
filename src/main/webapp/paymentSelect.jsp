<%-- 
    Document   : paymentSelect
    Created on : Jun 15, 2023, 11:40:27 AM
    Author     : DELL
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
    <%@include file="includes/head.jsp" %>
    <link href="/BookingTour/assets/bootstrap.min.css" rel="stylesheet"/>
    <!-- Custom styles for this template -->
    <link href="/BookingTour/assets/jumbotron-narrow.css" rel="stylesheet">      

    <script src="/BookingTour/assets/jquery-1.11.3.min.js"></script>
</head>

<body>
    <%@include file="includes/topbar.jsp" %>


    <div class="container mt-5 mb-5">
        <c:set var="orderModel" value="${requestScope.orderModel}"/>
        <form  action="/BookingTour/vnpayajax" id="frmCreateOrder" class="form_order" method="post">
            <div class="card " style="width: 80% ;margin-left: 100px">
                <div class="card-body" style="margin-left: 100px">
                    <h5 class="card-title text-center" style="font-size: 35px">Chi tiết đặt tour</h5><br>
                    <div class="card-body" style="margin-left: 90px">
                        <p class="card-title "><i class="fas fa-user"></i> Người đặt Tour: ${orderModel.getName()}</p><br>
                        <p class="card-title "><i class="fas fa-mobile-alt"></i> Số điện thoại: ${orderModel.getPhone()}</p><br>
                        <p class="card-title "><i class="far fa-envelope"></i> Email: ${orderModel.getEmail()}</p><br>
                        <p class="card-title "><i class="fas fa-map-marker-alt"></i> Địa Chỉ: ${orderModel.getAddress()}</p><br>
                        <p class="card-title "><i class="fas fa-user-friends"></i> Số lượng người lớn: ${orderModel.getQuantityAd()}</p><br>
                        <p class="card-title "><i class="fas fa-baby"></i> Số lượng trẻ em: ${orderModel.getQuantityChildren()}</p><br>
<!--                        <p class="card-title "> Thành Tiền: ${orderModel.getTotalAmount()}</p>-->
                        <h5 class="card-title m-0">Thành Tiền: <fmt:formatNumber value="${orderModel.getTotalAmount()}" pattern="#,##0" /> VND</h5>

<!--                        <h5 class="m-0"><fmt:formatNumber value="${t.price}" pattern="#,##0" /> VND</h5>-->

                    </div>
                    <div class="mt-5 text-center">
                        <input type="hidden"data-val="true" data-val-number="The field Amount must be a number." data-val-required="The Amount field is required." id="amount" name="amount" value="${orderModel.getTotalAmount()}">
                        <input type="hidden" id="bankCode" name="bankCode" value="">
                        <input type="hidden" id="language" name="language" value="vn">
                        <button class="btn btn-primary" type="submit" href>Thanh toán</button></div>
                </div>
            </div>

        </form>

    </div>

    <!-- Footer-->
    <%@include file="includes/footer.jsp" %>

    <!-- Bootstrap core JS-->
    <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
    <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
    <script type="text/javascript">
        $("#frmCreateOrder").submit(function () {
            var postData = $("#frmCreateOrder").serialize();
            var submitUrl = $("#frmCreateOrder").attr("action");
            $.ajax({
                type: "POST",
                url: submitUrl,
                data: postData,
                dataType: 'JSON',
                success: function (x) {
                    if (x.code === '00') {
                        if (window.vnpay) {
                            vnpay.open({width: 768, height: 600, url: x.data});
                        } else {
                            location.href = x.data;
                        }
                        return false;
                    } else {
                        alert(x.Message);
                    }
                }
            });
            return false;
        });
    </script>       
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
<%@include file="includes/foot.jsp" %>

</html>