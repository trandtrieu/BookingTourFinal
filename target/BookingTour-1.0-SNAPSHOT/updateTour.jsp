<%-- 
    Document   : updateTour
    Created on : Jun 12, 2023, 12:11:40 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./css/chooseFile.css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    </head>
    <body>
        <form action="UpdateTour" method="post">
            <table>
                <tr>
                    <td>Tour ID</td>
                    <td>
                        <input value="${tt.tourId}" type="text" name="id" readonly>
                    </td>
                </tr>
                <tr>
                    <td>Tour Name</td>
                    <td>
                        <input value="${tt.tourName}" type="text" name="name" >
                    </td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td>
                        <input value="${tt.price}" type="text" name="price">
                    </td>
                </tr>
                <tr>
                    <td>Date Start</td>
                    <td>
                        <input value="${tt.dateStart}" type="date" id="minDateStart" name="dateStart">
                    </td>
                </tr>
                <tr>
                    <td>Date End</td>
                    <td>
                        <input value="${tt.dateEnd}" type="date" id="minDateEnd" name="dateEnd">
                    </td>
                </tr>
                <tr>
                    <td>Details</td>
                    <td>
                        <input value="${tt.detailTour}" type="text" name="details">
                    </td>
                </tr>
                <tr>
                    <td>Image</td>
                    <td>
<!--                        <input value="${tt.imageTour}" type="file" name="image">-->
                        <input value="${tt.imageTour}" type="text" name="image">
                        
                        
                    </td>
                </tr>
                <tr>
                    <td>Status</td>
                    <td>
                        <input value="${tt.statusTour}" type="text" name="status">
                    </td>
                </tr>
                <tr>
                    <td>Place ID</td>
                    <td>
                        <input value="${tt.placeId}"  type="text" name="placeId">
                    </td>
                </tr>
                <!--                <tr>
                                    <td>Place Name</td>
                                    <td>
                                        <input type="text" name="placeName">
                                    </td>
                                </tr>-->
                <tr>
                    <td>Region Id</td>
                    <td>
                        <input value="${tt.regionId}"  type="text" name="regionId">
                    </td>
                </tr>
                <!--                <tr>
                                    <td>Region Name</td>
                                    <td>
                                        <input type="text" name="regionName">
                                    </td>
                                </tr>-->
                <tr>
                    <td>Guide ID</td>
                    <td>
                        <input value="${tt.guideId}"  type="text" name="guideId">
                    </td>
                </tr>

                <!--                <tr>
                                    <td>Guide Name</td>
                                    <td>
                                        <input type="text" name="guideName">
                                    </td>
                                </tr>-->


                <tr>
                    <td></td>
                    <td>
                        <button type="submit">
                            Update
                        </button>
                    </td>
                </tr>
            </table>

        </form>
    </body>
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

