<%-- 
    Document   : MyRegistrations
    Created on : May 23, 2023, 3:22:29 PM
    Author     : quang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="model.*"%> 
<%@page import="DAO.*"%> 
<!DOCTYPE html>
<html>
    <head>

        <title>Registrations List</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/templatemo.css">
        <link rel="stylesheet" href="assets/css/custom.css">


        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">

    </head>
    <%if(request.getSession().getAttribute("user")==null)
               response.sendRedirect("forbiddenAlert.jsp");
    %>
    <c:if test="${sessionScope.roleName.equals('seller')}">
        <body>
            <%@include file="header.jsp" %>
            <h1>Welcome to Registrations List</h1>
            <%@include file="footer.jsp" %>

        </body>
    </c:if>
   
</html>
