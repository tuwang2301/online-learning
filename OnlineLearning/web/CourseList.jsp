<%-- 
    Document   : CourseList
    Created on : May 21, 2023, 10:06:15 PM
    Author     : admin
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.util.List" %>
<%@page import = "model.Course" %>
<%@page import = "java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    CourseDAO u = new CourseDAO();
  List<Course> lst = (List<Course>)request.getAttribute("lst");
  List<String> cols = u.getColNames("Course");
  List<Course> FlagCourse = u.getFlagCourse();
  
%>    
<html>
    <head>
        <title>List Course</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
        <!--        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">-->

        <link rel="stylesheet" href="assets/css/templatemo.css">
        <link rel="stylesheet" href="assets/css/custom.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/slidebar.css">
        <link rel="stylesheet" href="assets/css/CList.css">

        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">


        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">


    </head>


    <body>
        <%@ include file="header.jsp" %>


        <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active d-flex justify-content-center align-items-center" style="margin-top: 40px; margin-bottom: 30px">
                    <a href="coursedetail?courseid=7">
                        <img src="assets/img/Eng.png" class="d-block w-60" alt="">
                    </a>
                    <div class="carousel-caption d-none d-md-block">
                    </div>
                </div>
                <div class="carousel-item d-flex justify-content-center align-items-center" style="margin-top: 40px; margin-bottom: 30px">
                    <a href="coursedetail?courseid=6">
                        <img src="assets/img/Van.jpg" class="d-block w-60" alt="">
                    </a>
                    <div class="carousel-caption d-none d-md-block">
                    </div>
                </div>
                <div class="carousel-item d-flex justify-content-center align-items-center" style="margin-top: 40px; margin-bottom: 30px" >
                    <a href="coursedetail?courseid=2">
                        <img src="assets/img/hoahoc.jpg" class="d-block w-60" alt="">
                    </a>
                    <div class="carousel-caption d-none d-md-block">
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
                <span class="carousel-control-prev-icon custom-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
                <span class="carousel-control-next-icon custom-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

        <div class="navbar2">
            <div class="container2">
                <span class="navbar2-brand"><a href="home">Home</a></span>
                <span class="navbar2-brand-divider ">/</span>
                <span class="navbar2-brand"><a href="course">List Course</a></span>



            </div>
        </div>

        <div class="container3">
            <div class="row">
                <div class="col-sm-3">
                    <div class="card bg-light mb-3">
                        <div class="sidebar">
                            <div class="search-box">
                                <form action="SearchCourseName" method="POST">
                                    <input type="text" name="CourseName" placeholder="Enter course name...">
                                    <button type="submit">Search</button>
                                </form>
                            </div>
                            <div class="widget">
                                <h2 class="widget-title">Course List</h2>
                                <strong>Category</strong>
                                <p>
                                <a class="category-select" href="SortCourseCategory?id=1" style="text-decoration: none">Natural subjects</a><p>
                                <a class="category-select" href="SortCourseCategory?id=2" style="text-decoration: none">Social subjects</a><p>
                                <a class="category-select" href="SortCourseCategory?id=3" style="text-decoration: none">Special subjects</a><p>
                                <a class="category-select" href="SortCourseCategory?id=4" style="text-decoration: none">Other</a>
                                <form action="course" method="POST">
                                    <strong>Filter</strong><p>
                                    <div class="dropdown dropdown-dark">
                                        <select name="colName" class="dropdown-select" id="colNameSelect">
                                            <% for(String x: cols) { %>
                                            <option value="<%= x %>"> <%= x %> </option>
                                            <% } %>
                                        </select>
                                    </div>
                                    <div class="dropdown dropdown-dark">
                                        <select name="sortType" class="dropdown-select" id="sortTypeSelect">
                                            <option value="ASC">Ascendingly</option>
                                            <option value="DESC">Descendingly</option>
                                        </select>
                                    </div>
                                    <p><input class="sort-button" type="submit" value="Sort" onclick="saveDropdownValues()">
                                </form>  
                            </div>

                        </div>
                    </div>
                    <div class="card bg-light mb-3">
                        <div class="sidebar">
                            <div class="widget">
                                <h2 class="widget-title">Feature Course</h2>
                                <% for(Course x: FlagCourse ) { %>
                                <div class="card-body">
                                    <img src="<%= x.getImage() %>" alt="Course Image">
                                    <h2><a class="course-name" style=" text-decoration: none" href="coursedetail?courseid=<%=x.getCourseId()%>" title="View Course"><%=x.getCourseName()%></a></h2>
                                    <h4>Price:<%=x.getCoursePrice()%>$ </h4>
                                </div>
                                <% } %>

                            </div>
                        </div>
                    </div>
                </div>
                <c:if test="${not empty sessionScope.message}">

                    <div id="message1" class="message1" style="">${sessionScope.message}</div>
                    <% session.removeAttribute("message"); %>
                </c:if>
                <div class="col-sm-9">
                    <div class="row">
                        <% for(Course x: lst) { %>
                        <div class="col-12 col-md-6 col-lg-4">
                            <div class="posts">
                                <div class="post">
                                    <a href="#">
                                        <img src="<%= x.getImage() %>" alt="Course Image">
                                        <a class="course-name" href="coursedetail?courseid=<%= x.getCourseId() %>" title="View Course"><%= x.getCourseName() %></a>
                                        <p class="course-createdate"><%= x.getCourseCreateDate() %></p>
                                        <p class = "course-price">Price: <%= x.getCoursePrice() + "$"%></p>
                                        <p class = "course-price">Sale Price: <%= x.getCoursePrice()*0.95 + "$"%></p>
                                        <p class="course-description"><%= x.getCourseDescription() %></p>
                                        <a class="course-register" href="coursedetail?courseid=<%= x.getCourseId() %>" title="Register">Register</a>
                                </div>
                            </div>
                        </div>
                        <% } %>
                    </div>
                </div>

            </div>
            <!--            <div class="page-patri"style="text-align: center;" >
            <c:set var="page" value="${requestScope.page}"/>
            <div class="pagination" style="display: inline-block; ">
            <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                <a  href="course?page=${i}">${i}</a>
            </c:forEach>
        </div>
    </div>-->
            <div class="page-patri"style="text-align: center;" >
                <c:set var="page" value="${requestScope.page}"/>
                <div class="pagination" style="display: inline-block; ">
                    <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                        <a  href="course?page=${i}">${i}</a>
                    </c:forEach>
                </div>
            </div>   


        </div>
        <!--        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>-->

        <%@ include file="footer.jsp" %>
        <script src="assets/js/CourseList.js"></script>    
    </body>

    <script src="assets/js/myregis.js"></script>

</html>
