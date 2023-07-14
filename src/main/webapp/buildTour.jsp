<%-- 
    Document   : buildTour
    Created on : Jul 10, 2023, 10:45:14 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Build Tour</title>
        <%@include file="includes/head.jsp" %>

    </head>
    <body>
        <%@include file="includes/topbar.jsp" %>
        <div class="container mt-5">
            <div class="container tm-mt-big tm-mb-big">
                <div class="row">
                    <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                        <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                            <div class="row">
                                <div class="col-12 text-center mb-3" >
                                    <h2 class="tm-block-title d-inline-block ">Build Your Tour</h2>
                                </div>
                            </div>
                            <form action="BookingCustomServlet" method="post">
                                <div class="row tm-edit-product-row">
                                    <div class="col-xl-12 col-lg-12 col-md-12">

                                        <div class="form-group mb-3">
                                            <label
                                                for="nameGroup"
                                                >Tên doanh nghiệp, tổ chức của bạn
                                            </label>
                                            <input type="text" class="form-control validate" name="nameGroup">
                                        </div>

                                        <div class="row">
                                            <div class="form-group mb-3 col-xs-3 col-sm-4">
                                                <label for="name">Tên người đại diện</label>
                                                <input
                                                    id="name"
                                                    name="name"
                                                    type="text"
                                                    class="form-control validate"
                                                    data-large-mode="true"
                                                    />
                                            </div>
                                            <div class="form-group mb-3 col-xs-3 col-sm-4">
                                                <label for="phone">Số điện thoại người đại diện </label>
                                                <input
                                                    id="phone"
                                                    name="phone"
                                                    type="text"
                                                    class="form-control validate"
                                                    data-large-mode="true"
                                                    />
                                            </div>
                                            <div class="form-group mb-3 col-xs-3 col-sm-4">
                                                <label for="email">Email người đại diện </label>
                                                <input
                                                    id="email"
                                                    name="email"
                                                    type="text"
                                                    class="form-control validate"
                                                    data-large-mode="true"
                                                    placeholder="@gmail.com "
                                                    />
                                            </div>

                                        </div>



                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-12">

                                        <div class="form-group mb-3">
                                            <label
                                                for="name"
                                                >Tên Tour
                                            </label>
                                            <select class="custom-select "  name="tourName">
                                                <c:forEach var="p" items="${myTours}" varStatus="status">
                                                    <option value="${p.tourName}"> ${p.tourName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                        <div class="row">
                                            <div class="form-group mb-3 col-xs-12 col-sm-6">
                                                <label for="dateStart">Date Start </label>
                                                <input
                                                    name="dateStart"
                                                    type="date"
                                                    class="form-control validate"
                                                    data-large-mode="true"
                                                    />
                                            </div>
                                            <div class="form-group mb-3 col-xs-12 col-sm-6">
                                                <label  for="dateEnd">Date End</label>
                                                <input
                                                    name="dateEnd"
                                                    type="date"
                                                    class="form-control validate"
                                                    
                                                    />
                                            </div>

                                        </div>



                                    </div>

                                    <div class="col-xl-6 col-lg-6 col-md-12">

                                        <div class="form-group mb-3">
                                            <label
                                                for="price"
                                                >Chi phí dự tính đầu người
                                            </label>
                                            <input
                                                id="price"
                                                name="price"
                                                type="text"
                                                class="form-control validate"
                                                
                                                />
                                        </div>

                                        <div class="row">
                                            <div class="form-group mb-3 col-xs-12 col-sm-6">
                                                <label
                                                    for="name" 
                                                    > Số lượng người lớn
                                                </label>
                                                <input
                                                    id="quantity"
                                                    name="quantityAd"
                                                    type="number"
                                                    class="form-control validate"
                                                    value="1"
                                                    />
                                            </div>
                                            <div class="form-group mb-3 col-xs-12 col-sm-6">
                                                <label
                                                    for="name"
                                                    >Số lượng trẻ em
                                                </label>
                                                <input
                                                    id="quantity"
                                                    name="quantityChildren"
                                                    type="number"
                                                    class="form-control validate"
                                                    value="0"
                                                    />
                                            </div>

                                        </div>



                                    </div>

                                    <div class="col-12">
                                        <label for="note">Ghi chú</label>
                                        <textarea type="text" name="note" class="form-control validate" placeholder="Vui lòng bổ sung thêm về tour( lịch trình, các hoạt động, dịch vụ,...)" ></textarea>
                                    </div>
                                    <div class="col-12 mt-5">
                                        <button type="submit" class="btn btn-primary btn-block text-uppercase">Create Tour Now</button>
                                    </div>
                                </div>  

                            </form>

                        </div>


                    </div>

                </div>
            </div>
        </div>



        <%@include file="includes/footer.jsp" %>

    </body>
    <%@include file="includes/foot.jsp" %>

</html>
