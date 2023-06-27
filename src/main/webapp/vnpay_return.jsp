<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="vnpay.Config"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="include/headTag.jsp"></jsp:include>
            <title>VNPAY RESPONSE</title>
            <!-- Bootstrap core CSS -->
            <link href="./css/bootstrap.min.css" rel="stylesheet"/>
            <!-- Custom styles for this template -->
            <link href="./css/jumbotron-narrow.css" rel="stylesheet"> 
        </head>
        <body>
            <div class="container-xxl bg-white p-0">
                <div class="container-xxl py-1 bg-dark hero-header mb-3">
                    <div class="container text-center my-3 pt-3 pb-2">
                        <h1 class="display-3 text-white mb-3 animated slideInDown">BOOKING PAYMENT</h1>
                    </div>
                </div>
            </div>
        <%
            //check is paymetn or not
            //Begin process return from VNPAY
            Map fields = new HashMap();
            for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
                String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
                String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    fields.put(fieldName, fieldValue);
                }
            }

            String vnp_SecureHash = request.getParameter("vnp_SecureHash");
            if (fields.containsKey("vnp_SecureHashType")) {
                fields.remove("vnp_SecureHashType");
            }
            if (fields.containsKey("vnp_SecureHash")) {
                fields.remove("vnp_SecureHash");
            }
            String signValue = Config.hashAllFields(fields);
        %>
        <!--Begin display -->
        <div class="container container-xl">
            <div class="header clearfix">
                <h3 class="text-muted text-center">VNPAY RESPONSE</h3>
            </div>
            <table class="table-responsive" style="margin: 0 auto">
               
                <tr class="form-group">
                    <td >Merchant Transaction Code:</td>
                    <td><%=request.getParameter("vnp_TxnRef")%></td>
                </tr>    
                <tr class="form-group">
                    <td >Amount:</td>
                    <td><%=request.getParameter("vnp_Amount")%></td>
                </tr>  
                <tr class="form-group">
                    <td >Order info:</td>
                    <td><%=request.getParameter("vnp_OrderInfo")%></td>
                </tr> 
                <tr class="form-group">
                    <td >VNPAY Response Code:</td>
                    <td ><%=request.getParameter("vnp_ResponseCode")%></td>
                </tr> 
                <tr class="form-group">
                    <td >VNPAY Transaction Code:</td>
                    <td><%=request.getParameter("vnp_TransactionNo")%></td>
                </tr> 
                <tr class="form-group">
                    <td >Bank Code:</td>
                    <td><%=request.getParameter("vnp_BankCode")%></td>
                </tr> 
                <tr class="form-group">
                    <td >Pay Date:</td>
                    <td><%=request.getParameter("vnp_PayDate")%></td>
                </tr> 
                
            </table>
            <p>
                &nbsp;
            </p>
            <footer class="footer text-center">
                <p>&copy; VNPAY 2020</p>
            </footer>
        </div>
        <jsp:include page="include/footer.jsp"></jsp:include>
        <jsp:include page="include/javascriptLibrary.jsp"></jsp:include>
    </body>
</html>
