<%-- 
    Document   : PricePackage
    Created on : Jun 16, 2023, 9:31:36 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Nhập hoặc chỉnh sửa thông tin kích thước chủ đề</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/templatemo.css">
        <link rel="stylesheet" href="assets/css/custom.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/css/detective.css">
        <link rel="stylesheet" href="assets/css/slidebar.css">
        <link rel="stylesheet" href="assets/css/hot.css">
        <link rel="stylesheet" href="assets/css/coursecontent.css">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">


    </head>
    <%@include file="header.jsp" %>
    <body>
        <div class="container1">
            <h1>Price package</h1>

            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required><br><br>

            <label for="accessDuration">Access duration (in months):</label>
            <input type="number" id="accessDuration" name="accessDuration" required><br><br>

            <label for="status">Status:</label>
            <input type="text" id="status" name="status" class="readonly" readonly><br><br>

            <label for="listPrice">List price:</label>
            <input type="text" id="listPrice" name="listPrice" required><br><br>

            <label for="sellingPrice">Sale price:</label>
            <input type="text" id="sellingPrice" name="sellingPrice" required><br><br>

            <label for="description">Sescription:</label><br>
            <textarea id="description" name="description" rows="4" cols="50" required></textarea><br><br>

            <!-- Chỉ hiển thị cho người quản trị -->
            <label for="adminInfo">Expert infor</label>
            <input type="text" id="adminInfo" name="adminInfo" class="readonly" readonly><br><br>

            <input type="submit" value="Save">
            <a href="ExpertDashboard.jsp"><button>Back</button></a>
        </div>
    </body>
    <%@include file="footer.jsp" %>
</html>

