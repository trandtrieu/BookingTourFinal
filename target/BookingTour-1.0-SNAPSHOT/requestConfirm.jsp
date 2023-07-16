<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Response</title>
        <%@include file="includeManager/headManager.jsp" %>
        <style>
            body, html {
                height: 100%;
            }

            .container {
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100%;
            }

            .tm-content-row {
                width: 100%;
            }

            .tm-block-products {
                max-width: 600px;
                margin: 0 auto;
            }

            h1 {
                font-size: 36px;
                text-transform: uppercase;
                font-weight: bold;
                letter-spacing: 2px;
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body id="reportsPage">
        <%@include file="includeManager/navbarManager.jsp" %>
        <div class="container">
            <div class="row tm-content-row">
                <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-products">
                        <h1 class="text-center">Form Accept request</h1>
                        <form action="ConfirmRequestServlet?rid=${detail.requestId}" method="post">
                            <div class="row tm-edit-product-row">
                                <div class="col-xl-12 col-lg-12 col-md-12">
                                    <div class="form-group">
                                        <label for="title">Title</label>
                                        <input id="title" name="title" type="text" class="form-control validate" required />
                                    </div>
                                    <div class="form-group">
                                        <label for="content">Content</label>
                                        <textarea class="form-control validate" name="content" type="text" required></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="price">To</label>
                                        <input id="price" name="email" type="text" class="form-control validate" value="${detail.email}" />
                                    </div>

                                    <div class="form-group mt-5">
                                        <button type="submit" class="btn btn-primary btn-block text-uppercase">Send Email</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <footer class="tm-footer row tm-mt-small">
            <div class="col-12 font-weight-light">
                <p class="text-center text-white mb-0 px-4 small">
                    Copyright &copy;
                    <b>2018</b>
                    All rights reserved.
                    Design: <a rel="nofollow noopener" href="https://templatemo.com" class="tm-footer-link">Template Mo</a>
                </p>
            </div>
        </footer>

        <%@include file="includeManager/footManager.jsp" %>
    </body>
</html>
