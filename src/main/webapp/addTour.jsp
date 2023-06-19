<%-- 
    Document   : addTour
    Created on : Jun 10, 2023, 1:17:21 AM
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
        <form action="AddTourServlet" method="post">
            <table>
                <tr>
                    <td>Tour Name</td>
                    <td>
                        <input type="text" name="name" value="trieu">
                    </td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td>
                        <input type="text" name="price">
                    </td>
                </tr>
                <tr>
                    <td>Date Start</td>
                    <td>
                        <!--                        <input type="text" name="dateStart">-->
                        <input type="date" id="minDateStart" name="dateStart">
                    </td>
                </tr>
                <tr>
                    <td>Date End</td>
                    <td>
                        <!--                        <input type="text" name="dateEnd">-->
                        <input type="date" id="minDateEnd" name="dateEnd">
                    </td>
                </tr>
                <tr>
                    <td>Details</td>
                    <td>
                        <input type="text" name="details">
                    </td>
                </tr>
                <tr>
                    <td>Image</td>
                    <td>

                        <input type="file" name="image"> 

                    </td>
                </tr>
                <tr>
                    <td>Status</td>
                    <td>
                        <input type="text" name="status">
                    </td>
                </tr>
                <tr>
                    <td>Place ID</td>
                    <td>
                        <input type="text" name="placeId">
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
                        <input type="text" name="regionId">
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
                        <input type="text" name="guideId">
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
                            Add Tour
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

