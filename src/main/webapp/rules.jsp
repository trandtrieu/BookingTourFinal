<%--
    Document   : rules
    Created on : Jul 16, 2023, 6:53:23 PM
    Author     : linh2
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="includes/head.jsp" %>
    </head>
    <style>
        .container_rule{
            width: 65%;
            margin: auto;
            background: #FFF;
            padding-top: 60px;
            padding-left: 40px;
            padding-right: 40px;
        }
        .title{
            text-align: center;
        }
        .btn{
            background-color: green;
            margin: 20px 0px;

        }
        .btn a{
            text-decoration: none;
            color: #FFF;
        }
    </style>

    <body>
        <%@include file="includes/topbar.jsp" %>

        <div class="container_rule">
            <h1 class="title">ĐIỀU KHOẢN ĐỔI TOUR & HỦY TOUR</h1>
            <h4 class="text-rule-title">I.1 Trường hợp ExploreNow hủy Tour</h4>
            <p class="text-rule">Nếu ExploreNow không thực hiện được chuyến du lịch, ExploreNow phải báo ngay cho khách hàng biết. Và thanh toán lại cho khách hàng
                toàn bộ số tiền mà khách hàng đã đóng trong vòng
                3 ngày kể từ lúc việc thông báo hủy chuyến đi du lịch bằng tiền mặt hoặc chuyển khoản.</p>
            <h4 class="text-rule-title">I.2 Trường hợp khách hàng hủy Tour</h4>
            <p class="text-rule"> •  Huỷ trước 30 – 45 ngày : 10% tổng giá thành tour.</p>
            <p class="text-rule"> • Huỷ trước 20 – 30 ngày : 20% tổng giá thành tour.</p>
            <p class="text-rule"> • Huỷ trước 25 ngày : 25% tổng giá thành tour, Huỷ trước 15 ngày : 30% tổng giá thành tour.</p>
            <p class="text-rule"> • Huỷ trước 07 ngày : 40% tổng giá thành tour, Huỷ trước 03 – 06 ngày : 75% tổng giá thành tour.</p>
            <h4>II Trường hợp khách hàng đổi Tour</h4>
            <h7>Nếu khách hàng muốn đổi Tour bên công ty ExploreNow chấp nhận đổi tour nhưng chỉ 1 lần duy nhất .
                Và khách hàng sẽ mất thêm 10% phí . Nếu có nhu cầu đổi Tour quý khách vui lòng liên hệ vào số điện này <span class="text-danger">0789458707</span>
                hoặc email <span class="text-danger">trieudz02@gmail.com</span> để được hỗ trợ .</h7><br>


            <button class="btn"><a href="HomeController">Trở về</a></button>


        </div>

        <div class="container">
            <div class="hotline-container">
                <a href="tel:0789458707" class="hotline-link">Đường dây nóng 0789458707</a>
            </div>
        </div>
        <%@include file="includes/footer.jsp" %>
    </body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

    <%@include file="includes/foot.jsp" %>
</html>
