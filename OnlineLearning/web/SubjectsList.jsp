<%-- 
    Document   : MyRegistrations
    Created on : May 23, 2023, 3:22:29 PM
    Author     : quang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.util.List" %>
<%@page import = "model.Course" %>
<%@page import = "java.util.*" %>
<%@page import = "DAO.*" %>
<%@page import = "model.*" %>
<!DOCTYPE html>
<% 
    CourseDAO u = new CourseDAO();
    LessonDAO l = new LessonDAO();
  List<Course> lst = (List<Course>)request.getAttribute("listsub");
  List<String> cols = u.getColNames("Course");
  
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



                        </div>
                    </div>
                    <div class="row">
                        <!-- Your Profile Views Chart -->
                        <div class="col-lg-12 m-b30">
                            <div class="widget-box">

                                <div class="search-bar">
                                    <h4>Subject Management</h4>
                                    <a href="addsubject" class="btn btn-success" data-toggle="modal"> <span>Add New Subject</span></a>
                                </div>


                                <div class="search-bar">
                                    <form action = "SearchCourseName" method="post">
                                <input type="text" name ="name" placeholder="Subject Name...">
                                <button type="submit"><i>Search</i></button>
                            </form>
                                   
                                    <form action="catogory" method="get" style="width: 500px">
                                        <select class="col-6" name="categoryID" onchange="this.form.submit()">
                                            <option value="" disabled selected hidden>choose category</option>
                                                <option value="">all</option>

                                            <c:forEach var="i" items="${requestScope.listCategory}">
                                                <option value="${i.getCatergoryId()}" ${i.getCatergoryId() == param.categoryID ? 'selected' : ''}>${i.getCatergoryName()}</option>
                                            </c:forEach>

                                        </select>
                                    </form>
                                    <form action="status" method="get" style="width: 500px">
                                        <select class="col-4" name="st" onchange="this.form.submit()">
                                            <option value="" disabled selected hidden>Status</option>
                                            <option value="1" >Active</option>
                                            <option value="0" >Deactive</option>
                                        </select>
                                    </form>
                                </div>


                                <div class="widget-inner" id="subjectlist">
                                    <% for(Course x: lst) { %>
                                    <div class="card-courses-list admin-courses">
                                        <div class="card-courses-media">
                                            <img src="<%= x.getImage() %>" alt=""/>
                                        </div>
                                        <div class="card-courses-full-dec">
                                            <div class="card-courses-title">
                                                <h4><%= x.getCourseName() %></h4>
                                            </div>
                                            <div class="card-courses-list-bx">
                                                <ul class="card-courses-view">
                                                    <li class="card-courses-user">
                                                        <div class="card-courses-user-info">
                                                            <h5><%=u.getCatergory( x.getCatergoryId())%></h5>
                                                        </div>
                                                    </li>
                                                    <li class="card-courses-categories">
                                                        <h5></h5>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="card-courses-list-bx">
                                                <ul class="card-courses-view">
                                                   
                                                        <% if(x.isStatus()==true) {%>
                                                         <a href="sublist?bid=0&cid=<%=x.getCourseId()%>" class="btn button-sm green radius-xl border" style="background-color: #C0C0C0;" onclick="return confirm('Are you sure you want to deactive the course?')">active </a>
                                                        <%} else{%>
                                                          <a href="sublist?bid=1&cid=<%=x.getCourseId()%>" class="btn button-sm green radius-xl border" style="background-color: #C0C0C0;" onclick="return confirm('Are you sure you want to active the course?')">deactive </a>
    
                                                        <% }%>
                                                   
                                                </ul>
                                            </div>

                                            <div class="row card-courses-dec">
                                                <div class="col-md-12">
                                                    <h6 class="m-b10">Course Description</h6>
                                                    <p><%= x.getCourseDescription()%></p>
                                                </div>
                                                <div class="col-md-12" >
                                                    <a href="sublesson?courseid=<%=x.getCourseId()%>" class="btn green radius-xl outline"style="background-color:green; color:white;"><%=l.CountLesson( x.getCourseId())%> lesson</a>
                                                    <a href="#" class="btn red outline radius-xl "style="background-color:green; color:white;">Veiw Detail</a>
                                                </div>
                                            </div>

                                        </div>
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
<c:if test="${not empty page and page != '' and page != null and page.toString().matches('^[0-9]+$') and page > 0 and page <= requestScope.num}">
    <div class="pagination" style="display: inline-block;">
        <c:forEach begin="${1}" end="${requestScope.num}" var="i">
            <c:choose>
                <c:when test="${i == page}">
                    <a href="sublist?page=${i}" style="color: red;">${i}</a>
                </c:when>
                <c:otherwise>
                    <a href="sublist?page=${i}">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </div>
</c:if>
<c:if test="${empty page or page == '' or page == null or not page.toString().matches('^[0-9]+$') or page <= 0 or page > requestScope.num}">
    <% response.sendRedirect("forbiddenAlert.jsp"); %>
</c:if>

    </div>
</div> 
            </main>

            <%@include file="footer.jsp" %>
 <script src="assets/js/LessonView.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        </body>
    </c:if>
</html>
