<%-- 
    Document   : MyRegistrations
    Created on : May 23, 2023, 3:22:29 PM
    Author     : quang
--%>

<%@ page import="java.util.List" %>
<%@page import= "model.CourseLesson" %>
<%@page import= "DAO.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%    
Integer courseid = (Integer) request.getAttribute("courseid");

    
    LessonDAO u = new LessonDAO();


    List<CourseLesson>  lesson1 = (List<CourseLesson>) request.getAttribute("lesson");

    // Thực hiện các lệnh khác ở đây nếu lessonList đã được thiết lập

   
%>
<html>
    <head>

        <title>Subjects List</title>
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
 <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <style>
          
            </style>
                    <link rel="stylesheet" type="text/css" href="assets/css/subjectlist.css">

        </head>
        <%if(request.getSession().getAttribute("user")==null)
                   response.sendRedirect("forbiddenAlert.jsp");
        %>
        <c:if test="${sessionScope.roleName.equals('admin') || sessionScope.roleName.equals('expert')}">
            <body>
                <%@include file="header.jsp" %>
                <main class="ttr-wrapper">
                    <div class="container-fluid">
                        <div class="navbar3" style="  background-color: #f9f9f9;
                             border-bottom: 1px solid #e5e5e5;
                             padding-top: 10px;
                             padding-bottom: 10px;
                        }">
                        <div class="container2">
                            <span class="navbar3-brand"><a href="home">Home</a></span>
                            <span class="navbar3-brand-divider ">/</span>
                            <span class="navbar3-brand"><a href="sublist">Subject Management</a></span>
                             <span class="navbar3-brand-divider ">/</span>
                   <span class="navbar3-brand"><a href="sublesson?courseid=<%=courseid%>">Lessons Management</a></span>


                        </div>
                    </div>
                    <div class="row">
                        <!-- Your Profile Views Chart -->
                        <div class="col-lg-12 m-b30">
                            <div class="widget-box">

                                <div class="manage" style="text-align: center;">
                                    <h4>Lesson Management</h4>
<!--                                    <button class="add-subject">Add new Subject</button>-->
                                </div>


                                <div class="search-bar">
                                    <form action = "search" method="post">
                                        <input type="hidden" name ="id" value="<%=courseid%>">

                                        <input type="text" name ="name" placeholder="Subject Name...">
                                        <button type="submit"><i>Search</i></button>
                                    </form>

<!--                                    <form action="catogory" method="get" style="width: 500px">
                                        <select class="col-6" name="categoryID" onchange="this.form.submit()">
                                            <option value="" disabled selected hidden>choose category</option>
                                                <option value="">all</option>

                                            <c:forEach var="i" items="${requestScope.lesson}">
                                                <option value="${i.getLessonId()}" ${i.getLessonId() == param.categoryID ? 'selected' : ''}>${i.getLessonTopic()}</option>
                                            </c:forEach>

                                        </select>
                                    </form>-->
                                    <form action="status" method="get" style="width: 500px">
                                         <input type="hidden" name ="name" value="<%=courseid%>">
                                        <select class="col-4" name="sta" onchange="this.form.submit()">
                                            <option value="" disabled selected hidden>Status</option>
                                            <option value="1" >Active</option>
                                            <option value="0" >Deactive</option>
                                        </select>
                                    </form>
                                </div>


                                <div class="widget-inner" id="subjectlist">
                                
                            <% for (CourseLesson lesson : lesson1) { %>
                             <div class="card-courses-list admin-courses">
                                  <% if (lesson.getLessonTypeId() == 1) { %>
                                       <div class="card-courses-media">
    <div style=" width:300px; height:0; padding-bottom:56.25%;">
  <iframe style=" top:0; left:0; width:250px; height:250px;" src="<%= lesson.getVideoLink() %>" frameborder="0" allowfullscreen></iframe>
</div>
</div>
                                        <div class="card-courses-full-dec">
                                            <div class="card-courses-title">
                                                <h4><%= lesson.getLessonName() %></h4>
                                            </div>
                                            <div class="card-courses-list-bx">
                                                <ul class="card-courses-view">
                                                    <li class="card-courses-user">
                                                        <div class="card-courses-user-info">
                                                            <h5><%= lesson.getLessonTopic() %></h5>
                                                        </div>
                                                    </li>
                                                    <li class="card-courses-categories">
                                                        <h5></h5>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="card-courses-list-bx">
                                                <ul class="card-courses-view">
                                                      <% if(lesson.isStatus()==true) {%>
                                                         <a href="status?bid=0&cid=<%= lesson.getLessonId() %>&course=<%= courseid %>" class="btn button-sm green radius-xl border" style="background-color: #C0C0C0;" onclick="return confirm('Are you sure you want to deactive the course?')">active </a>
                                                           <%} else{%>
                                                          <a href="status?bid=1&cid=<%= lesson.getLessonId() %>&course=<%= courseid %>" class="btn button-sm green radius-xl border" style="background-color: #C0C0C0;" onclick="return confirm('Are you sure you want to active the course?')">deactive </a>
    
                                                    <% }%>
                                                </ul>
                                            </div>

                                            <div class="row card-courses-dec">
                                                <div class="col-md-12">
                                                    <h6 class="m-b10">Lesson Description</h6>
                                                    <p><%= lesson.getContent() %></p>
                                                </div>
                                                <div class="col-md-12">
                                                   
                                                    <a href="#" class="btn red outline radius-xl ">Veiw Detail</a>
                                                </div>
                                            </div>

                                        </div>
                                                         <% } %>
                                                         <%  if (lesson.getLessonTypeId() == 2) { %>
                                                <div class="card-courses-media">
   <button class="watch-video-button" onclick="window.location.href = '<%= lesson.getVideoLink() %>'">View the HTML</button>
</div>
                                        <div class="card-courses-full-dec">
                                            <div class="card-courses-title">
                                                <h4><%= lesson.getLessonName() %></h4>
                                            </div>
                                            <div class="card-courses-list-bx">
                                                <ul class="card-courses-view">
                                                    <li class="card-courses-user">
                                                        <div class="card-courses-user-info">
                                                            <h5></h5>
                                                        </div>
                                                    </li>
                                                    <li class="card-courses-categories">
                                                        <h5></h5>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="card-courses-list-bx">
                                                <ul class="card-courses-view">
                                                     <% if(lesson.isStatus()==true) {%>
                                                         <a href="status?bid=0&cid=<%= lesson.getLessonId() %>&courseid=<%= courseid %>" class="btn button-sm green radius-xl border" style="background-color: #C0C0C0;" onclick="return confirm('Are you sure you want to deactive the course?')">active </a>
                                                           <%} else{%>
                                                          <a href="status?bid=1&cid=<%= lesson.getLessonId() %>&courseid=<%= courseid %>" class="btn button-sm green radius-xl border" style="background-color: #C0C0C0;" onclick="return confirm('Are you sure you want to active the course?')">deactive </a>
    
                                                    <% }%>
                                                </ul>
                                            </div>

                                            <div class="row card-courses-dec">
                                                <div class="col-md-12">
                                                    <h6 class="m-b10"></h6>
                                                    <p></p>
                                                </div>
                                                <div class="col-md-12">
                                                   
                                                    <a href="#" class="btn red outline radius-xl " style="background-color:green; color:white;">Veiw Detail</a>
                                                </div>
                                            </div>

                                        </div>
                                            <% } %>
                                    </div>
                            <% } %>     

                                </div>
                            </div>
                        </div>
                        <!-- Your Profile Views Chart END-->
                    </div>
                </div>
                            <div class="page-patri" style="text-align: center;">
                                <c:set var="page" value="${requestScope.page}"/>
                                <div class="pagination" style="display: inline-block;">
                                    <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                        <c:choose>
                                            <c:when test="${i == page}">
                                                <a href="sublesson?page=${i}&courseid=<%= courseid %>" style="color: red;">${i}</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="sublesson?page=${i}&courseid=<%= courseid %>">${i}</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </div>
                            </div>
                    
            </main>

            <%@include file="footer.jsp" %>

        </body>
    </c:if>
</html>
