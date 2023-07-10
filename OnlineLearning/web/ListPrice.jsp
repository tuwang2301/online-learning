<%-- 
    Document   : Newsubject
    Created on : Jun 16, 2023, 8:47:59 PM
    Author     : dell
--%>
<%@page import="java.util.List" %>
<%@page import = "model.*" %>
<%@page import = "java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    CourseDAO u = new CourseDAO();
    List<Course> lst = u.getCourses();
    int countCourse = u.countCourse();
    PriceDAO p = new PriceDAO();
    List<Price> lstp = p.getAll();
%>

<html>
    <head>
        <title>Subject</title>
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    </head>


    <body>

        <%@include file="header.jsp" %>
        <div class="code-section">
            <section class="cart_area">
                <div class="container">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-5">
                                <h2>Manage Price</h2>
                            </div>
                            <div class="col-sm-5">
                                <a href="PricePackage.jsp" class="btn btn-success" data-toggle="modal"> <span>Price package</span></a>
                                <a href="ExpertDashboard.jsp" class="btn btn-danger" data-toggle="modal"> <span>Back</span></a>
                            </div>
                        </div>
                    </div>
                    <div class="cart_inner">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">PackageName</th>
                                        <th scope="col">Duration</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">ListPrice</th>
                                        <th scope="col">SalePrice</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <tr>
                                        <td>
                                            <% for(Price x: lstp) { %>
                                            <p><%= x.getPackageId() %></p>                                       
                                            <% } %>
                                        </td>
                                        <td>
                                            <% for(Price x: lstp) { %>
                                            <p><%= x.getPackageName() %></p>                                       
                                            <% } %>
                                        </td>
                                        <td>
                                            <% for(Price x: lstp) { %>
                                            <p><%= x.getDuration() %></p>                                       
                                            <% } %>
                                        </td>
                                        <td>
                                            <% for(Price x: lstp) { %>
                                            <p><%= x.isStatus() %></p>                                       
                                            <% } %>
                                        </td> 
                                        <td>
                                            <% for(Price x: lstp) { %>
                                            <p><%= x.getListPrice() %></p>                                       
                                            <% } %>
                                        </td> 
                                        <td>
                                            <% for(Price x: lstp) { %>
                                            <p><%= x.getListPrice() * 0.95 %></p>                                       
                                            <% } %>

                                        </td>

                                        <td>
                                            <% for(Price x: lstp) { %>
                                            <p><a href="#" data-toggle="modal" >Edit</a>
                                                <a class="text-danger" data-toggle="modal" data-target="#delete-address-modal" href="deleteslider?id=${s.sliderID}" onclick="return confirm('Are you sure you want to delete Course?');" ><i class="icofont-ui-delete"></i> Delete</a>
                                            <p>
                                                <% } %>
                                        </td>

                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </section>
        </div>                               
    </body>
    <%@include file="footer.jsp" %>
</html>

