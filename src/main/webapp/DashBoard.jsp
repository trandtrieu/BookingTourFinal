<%-- 
    Document   : HomeAdmin
    Created on : Jun 16, 2023, 10:26:48 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
        <%@include file="includeManager/headManager.jsp" %>

    </head>
    <body id="reportsPage">
        <div class="" id="home">
            <%@include file="includeManager/navbarManager.jsp" %>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <p class="text-white mt-5 mb-5">Welcome back, <b>Admin</b></p>
                    </div>
                </div>

                <!-- row -->
                <div class="row tm-content-row">
                    <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block">
                            <h2 class="tm-block-title">Latest Hits</h2>
                            <canvas id="lineChart"></canvas>
                        </div>
                    </div>


                    <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block">
                            <h2 class="tm-block-title">Số lượng khách hàng đặt tour theo từng tháng</h2>
                            <canvas id="myChart"></canvas>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block">
                            <h2 class="tm-block-title text-center">Số tiền vé khách hàng đặt theo từng tháng</h2>
                            <canvas id="horizontalBar"></canvas>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block">

                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Người lớn</span>
                                </div> 
                                <span class="form-control">${totalCus}</span>
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Trẻ em</span>
                                </div> 
                                <span class="form-control">${totalChilrens}</span>
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Lượng truy cập</span>
                                </div> 
                                <span class="form-control">${view}</span>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
            <footer class="tm-footer row tm-mt-small">
                <div class="col-12 font-weight-light ">
                    <p class="text-center text-white mb-0 px-4 small">
                        Copyright &copy; <b>2018</b> All rights reserved. 

                        Design: <a rel="nofollow noopener" href="https://templatemo.com" class="tm-footer-link">Template Mo</a>
                    </p>
                </div>
            </footer>
        </div>

        <%@include file="includeManager/footManager.jsp" %>
        <script>
            Chart.defaults.global.defaultFontColor = 'white';
            let ctxLine,
                    ctxBar,
                    ctxPie,
                    optionsLine,
                    optionsBar,
                    optionsPie,
                    configLine,
                    configBar,
                    configPie,
                    lineChart;
            barChart, pieChart;
            // DOM is ready
            $(function () {
            drawLineChart(); // Line Chart
            drawBarChart(); // Bar Chart
            drawPieChart(); // Pie Chart

            $(window).resize(function () {
            updateLineChart();
            updateBarChart();
            });
            });
        </script>
        <script>
            var ctx = document.getElementById("myChart").getContext('2d');
            var myChart = new Chart(ctx, {
            type: 'bar',
                    data: {
                    labels: [
            <c:forEach var="customer" items="${customersByMonth}">
                    "${customer.month}",
            </c:forEach>
                    ],
                            datasets: [{
                            label: '#Số lượng khách hàng',
                                    data: [
            <c:forEach var="customer" items="${customersByMonth}">
                ${customer.totalCustomers},
            </c:forEach>
                                    ],
                                    backgroundColor: [
                                            'rgba(255, 99, 132, 0.2)',
                                            'rgba(54, 162, 235, 0.2)',
                                            'rgba(255, 206, 86, 0.2)',
                                            'rgba(75, 192, 192, 0.2)',
                                            'rgba(153, 102, 255, 0.2)',
                                            'rgba(255, 159, 64, 0.2)'
                                    ],
                                    borderColor: [
                                            'rgba(255,99,132,1)',
                                            'rgba(54, 162, 235, 1)',
                                            'rgba(255, 206, 86, 1)',
                                            'rgba(75, 192, 192, 1)',
                                            'rgba(153, 102, 255, 1)',
                                            'rgba(255, 159, 64, 1)'
                                    ],
                                    borderWidth: 1
                            }]
                    },
                    options: {
                    scales: {
                    yAxes: [{
                    ticks: {
                    beginAtZero: true
                    }
                    }]
                    }
                    }
            });
        </script>
        <script>
//line
            var ctxL = document.getElementById("lineChart").getContext('2d');
            var myLineChart = new Chart(ctxL, {
            type: 'line',
                    data: {
                    labels: ["2023-01", "2023-02", "2023-03", "2023-04", "2023-05", "2023-06", "2023-07", "2023-08", "2023-09", "2023-10", "2023-11", "2023-12"],
                            datasets: [{
                            label: "Miền Trung",
                                    data: [
            <c:forEach var="r" items="${amountsByRegion2}">
                ${r.totalAmount / 1000000},
            </c:forEach>
                                    ],
                                    backgroundColor: [
                                            'rgba(105, 0, 132, .2)',
                                    ],
                                    borderColor: [
                                            'rgba(200, 99, 132, .7)',
                                    ],
                                    borderWidth: 2
                            },
                            {
                            label: "Miền Nam",
                                    data: [
            <c:forEach var="r" items="${amountsByRegion3}">
                ${r.totalAmount / 1000000},
            </c:forEach>
                                    ],
                                    backgroundColor: [
                                            'rgba(0, 137, 132, .2)',
                                    ],
                                    borderColor: [
                                            'rgba(0, 10, 130, .7)',
                                    ],
                                    borderWidth: 2
                            },
                            {
                            label: "Miền Bắc",
                                    data: [
            <c:forEach var="r" items="${amountsByRegion1}">
                ${r.totalAmount / 1000000},
            </c:forEach>
                                    ],
                                    backgroundColor: [
                                            'rgba(255, 99, 71, 0.2)',
                                    ],
                                    borderColor: [
                                            'rgba(255, 99, 71, 0.8)',
                                    ],
                                    borderWidth: 2
                            }
                            ]
                    },
                    options: {
                    responsive: true
                    }
            });
        </script>
        <script>
            new Chart(document.getElementById("horizontalBar"), {
            "type": "horizontalBar",
                    "data": {
                    "labels": [
            <c:forEach var="customer" items="${amountsByMonth}">
                    "${customer.month}",
            </c:forEach>
                    ],
                            "datasets": [{
                            "label": "Số tiền ",
                                    "data": [
            <c:forEach var="customer" items="${amountsByMonth}">
                ${customer.totalAmount / 1000000},
            </c:forEach>
                                    ],
                                    "fill": false,
                                    "backgroundColor": [
                                            "rgba(255, 99, 132, 0.2)", "rgba(255, 159, 64, 0.2)",
                                            "rgba(255, 205, 86, 0.2)", "rgba(75, 192, 192, 0.2)", "rgba(54, 162, 235, 0.2)",
                                            "rgba(153, 102, 255, 0.2)", "rgba(201, 203, 207, 0.2)"
                                    ],
                                    "borderColor": [
                                            "rgb(255, 99, 132)", "rgb(255, 159, 64)", "rgb(255, 205, 86)",
                                            "rgb(75, 192, 192)", "rgb(54, 162, 235)", "rgb(153, 102, 255)", "rgb(201, 203, 207)"
                                    ],
                                    "borderWidth": 1
                            }]
                    },
                    "options": {
                    "scales": {
                    "xAxes": [{
                    "ticks": {
                    "beginAtZero": true
                    }
                    }]
                    }
                    }
            });
        </script>

    </body>

</html>