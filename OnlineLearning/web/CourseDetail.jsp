<%-- 
    Document   : BlogDetail
    Created on : May 17, 2023, 4:32:41 PM
    Author     : DAT
--%>
<%@ page import="java.util.List" %>
<%@page import = "model.Course" %>
<%@page import = "java.util.*" %>

<%@ page import="model.Course" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
    CourseDAO u = new CourseDAO();
  List<Course> lst = (List<Course>)request.getAttribute("lst");
  List<String> cols = u.getColNames("Course");
  
%>   

<html>


    <head>





        <title>Course Detail</title>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <link rel="stylesheet" href="assets/css/templatemo.css">
        <link rel="stylesheet" href="assets/css/custom.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/slidebar.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css">

        <!-- JS của Bootstrap (cần thiết cho các thành phần JavaScript của Bootstrap) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/coursedetail.css">




    </head>


    <body>
        <%@ include file = "header.jsp" %>
        <div class="navbar2">
            <div class="container2">
                <span class="navbar2-brand"><a href="home">Home</a></span>
                <span class="navbar2-brand-divider ">/</span>
                <span class="navbar2-brand"><a href="course">List Course</a></span>
                <span class="navbar2-brand-divider ">/</span>

                <span class="navbar2-brand">Course Detail</span>
            </div>
        </div>
        <div class="container1">
            <div class="sidebar">
                <div class="search-box">
                    <form action="SearchCourseName" method="POST">
                        <input type="text" name="CourseName" placeholder="Enter course name...">
                        <button type="submit">Search</button>
                    </form>
                </div>

                <div class="widget">
                    <h2 class="widget-title">Course List</h2>
                    <form action="course" method="POST">
                        <p>Filter
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

                <div class="widget">
                    <h2 class="widget-title">Rate</h2>
                    <div class="rating">
                        <input type="radio" id="star1" name="rating" value="1">
                        <label for="star1" title="1 star">&#9733;</label>
                        <input type="radio" id="star2" name="rating" value="2">
                        <label for="star2" title="2 stars">&#9733;</label>
                        <input type="radio" id="star3" name="rating" value="3">
                        <label for="star3" title="3 stars">&#9733;</label>
                        <input type="radio" id="star4" name="rating" value="4">
                        <label for="star4" title="4stars">&#9733;</label>
                        <input type="radio" id="star5" name="rating" value="5" checked>
                        <label for="star5" title="5 stars">&#9733;</label>
                    </div>
                </div>
                <div class="widget">
                    <h2 class="widget-title">Comment</h2>
                    <ul style="list-style: none">
                        <li>bổ ích quá</li>
                        <li>rất thú vị cảm ơn tác giả</li>
                        <!--<li><a href="addfeedback.jsp">Feedback</a></li>-->
                    </ul>
                </div>
                <!--                <div class="widget">
                                        <div class="last">
                
                                            <h2 class="widget-title"  >Last Post</h2>
                
                                            <div class="card-body">
                                                <img src="${last.image}" alt="Post thumbnail">
                                                <h2><a style=" text-decoration: none" href="detail?bid=${last.blogid}" title="View Post">${last.title}</a></h2>
                                                <p style="font-size: 10px;">${last.briefInfor}</p>
                                            </div>
                
                
                                        </div>
                                    </div>-->

            </div>
            <div class="post">
                <div class="post-image">
                    <img  src="${CourseDetail.image}" alt="blog">
                </div>

                <h1>${CourseDetail.courseName}</h1>
                <p> <strong>Price:</strong> ${CourseDetail.coursePrice}</p>
                <p>  <strong>Sale:</strong> $${"{:.2f}".format(CourseDetail.coursePrice * 0.95)}</p>

                <p><strong> Detail:</strong></p>
                <p>${CourseDetail.courseDescription}</p>

                <div class="author">
                    <p><strong>Posted on :</strong> ${CourseDetail.courseCreateDate}</p>



                    <c:if test="${not empty sessionScope.message}">

                        <div id="message" class="message" style="">${sessionScope.message}</div>
                        <% session.removeAttribute("message"); %>
                    </c:if>

                </div>
                <c:if test="${sessionScope.user != null}">

                    <button class="open_moda_btn">Register</button>

                    <div class="modal1x1 hide">
                        <div class="modal_content">
                            <div class="modal_header">
                                <h3>Course Register</h3>
                                <i class="fas fa-times"></i>
                            </div>
                            <div class="modal_body">
                                <form action="register"  method="post" onsubmit="return validateForm()">
                                    <input type="hidden" id="user-id" name="user-id" value="${user. getId()}">
                                    <input type="hidden"  name="url" value="<%=request.getRequestURL().toString()%>"  />

                                    <label for="course-name"><strong>Name:</strong></label>
                                    <input type="hidden" id="course-id" name="course-id" value="${CourseDetail.courseId}">
                                    <input type="text" id="course-name" name="course-name" value="${CourseDetail.courseName}" readonly>

                                    <label for="price"><strong>Price:</strong></label>
                                    <input type="number" id="price" name="price" value="${CourseDetail.coursePrice}" readonly>
                                    <label for="sale-price"><strong>Sale Price:</strong></label>
                                    <input type="number" id="sale-price" name="sale-price" value="${"{:.2f}".format(CourseDetail.coursePrice * 0.95)}" readonly>



                                    <label for="package">Package:</label>
                                    <select id="package" name="package">
                                        <option value="">Select a package</option>
                                        <c:forEach items="${price}" var="p">
                                            <option value="${p.duration}:${p.listPrice}:${Integer.parseInt(p.packageId)}:${p.description}">${p.description}</option>
                                        </c:forEach>
                                    </select>

                                    <label for="valid-from">Valid From:</label>
                                    <input type="date" id="valid-from" name="valid-from" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" readonly>
                                    <label for="valid-to">Valid To:</label>
                                    <input type="date" id="valid-to" name="valid-to" readonly>
                                    <label for="total"><strong>Total:</strong></label>
                                    <input type="number" id="total" name="total" readonly>

                                    <div class="modal_footer">
                                        <button type="submit" name="submit" onclick="return confirm('Are you sure you want to join the course?')">Register</button>


                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </c:if>
                <c:if test="${sessionScope.user == null}">

                    <form action="login" method="post">
                        <input type="hidden"  name="url" value="<%=request.getRequestURL().toString()%>"  />


                        <button class="open_moda_nologin"  style=" padding: 0px 20px;
                                margin: 20px 350px;

                                cursor: pointer;">Register</button>
                    </form>



                </c:if>


            </div>


        </div>


        <%@include file="footer.jsp" %>

    </body>
    <script src="assets/js/popupregister.js"></script>



</html>
