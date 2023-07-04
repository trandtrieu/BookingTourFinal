<%-- 
    Document   : sort
    Created on : Jul 3, 2023, 10:52:09 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="dropdown text-right">
    <button class="btn btn-secondary dropdown-toggle " type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        Sắp xếp
    </button>
    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
        <a class="dropdown-item" href="GetTourBySortHighToLow"><i class="fas fa-level-down-alt"></i> Giá từ cao đến thấp</a>

        <a class="dropdown-item" href="GetTourBySortLowToHigh">
            <i class="fas fa-level-up-alt"></i> Giá từ thấp đến cao
        </a>
        <a class="dropdown-item" href="GetTourByDateSoon">         
            <i class="fa-solid fa-arrow-trend-up"></i>      
            Ngày khởi hành gần nhất</a>
        <a class="dropdown-item" href="GetTourByTopRating">                   
            <i class="far fa-star text-warning"></i>
            Đánh giá tốt nhất
        </a>
    </div>

</div>