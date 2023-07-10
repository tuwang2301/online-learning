<%-- 
    Document   : 403PermittedAlert
    Created on : May 22, 2023, 10:05:07 AM
    Author     : quang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>403-Forbidden</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/templatemo.css">
        <link rel="stylesheet" href="assets/css/error.css">

        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">
    </head>
    <body>
        <%@include file="header.jsp" %>
        <main class="m-5">
            <div class="container">
                <div class="row">
                    <div class="text-center">
                        <h1 class="fail">403</h1>
                        <h2 class="fail-message">UH OH! This page is forbidden.</h2>
                        <p >You don't have permission for this site.
                        </p>
                        <button class="fbtn green" onclick="window.location.href = 'home'">HOME</button>
                    </div>
                </div>
            </div>

        </main>
        <%@include file="footer.jsp" %>
    </body>


</html>
