
<%@ page import="java.util.List" %>
<%@page import= "model.*" %>
<%@page import= "DAO.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%    
    Account user = (Account) request.getSession().getAttribute("user");
    if(user==null){
        response.sendRedirect("forbiddenAlert.jsp");
    }
    String Courseid = request.getParameter("courseid");
    int course = Integer.parseInt(Courseid);
    LessonDAO u = new LessonDAO();
    List<CourseLesson> lessonList = u.getByCourseId(course);
    int lessonCount = u.CountLesson(course);
    String courseName = u.GetCourseName(course);
    String courseImg = u.getCourseImg(course);
%>
<html>
    <head>
        <title>Lesson view</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/templatemo.css">
        <link rel="stylesheet" href="assets/css/custom.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/LessonView.css">


        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <div class="navbar2">
            <div class="container2">
                <span class="navbar2-brand"><a href="home">Home</a></span>
                <span class="navbar2-brand-divider">/</span>
                <span class="navbar2-brand"><a href="myregistation?user-id=<%=user.getId()%>">My Registrations</a></span>
                <span class="navbar2-brand-divider">/</span>
                <span class="navbar2-brand">Lesson view</span>
            </div>
        </div>

        <!-- <%= Courseid %> -->

        <div class="row">
            <div class="col-sm-2">
                <div class="card bg-light mb-3">
                    <div class="sidebar">
                        <div class="widget">
                            <h4 class="widget-title" style="text-align: center"><%=courseName%> Lesson</h4>
                            <p style="text-align: center"><strong>Number of lesson: <%=lessonCount%></strong></p>
                            <img src="<%=courseImg%>" class="course-img" alt="Course Picture">
                            <ul class="list-group list-group-flush">
                                
                                <% for (CourseLesson lesson : lessonList) { %>
                                <li class="list-group-item">
                                    <% if (lesson.getLessonTypeId() == 1) { %>
                                    <div class="link-placeholder" data-video="<%= lesson.getVideoLink() %>">
                                        <a class="lesson-link">Chapter <%= lesson.getLessonOrder()%>: <%= lesson.getLessonName() %></a>
                                    </div>
                                    <% }  else if (lesson.getLessonTypeId() == 2) { %>
                                    <a class="lesson-link" href="<%= lesson.getVideoLink() %>">Chapter <%= lesson.getLessonOrder()%>: <%= lesson.getLessonName() %></a>
                                    <% }else{ %>
                                    <a class="lesson-link" href="#">Chapter <%= lesson.getLessonOrder()%>: <%= lesson.getLessonName() %></a>
                                    <% } %>
                                </li>
                                <% } %>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-10">
                <div class="row">
                    <table>
                        <% 
                            int i = 1;
                            UserAnswerDAO uAD = new UserAnswerDAO();
                            uAD.clearResult();
                        %>
                        <% for (CourseLesson lesson : lessonList) {
                            int resultId = uAD.getNewestResultId(user.getId(),lesson.getQuizId());
                        %>
                        <tr>
                            <td class="list-group-number"></td>
                            <td class="list-group-item-light">
                                <div class="lesson-card">
                                    <div class="lesson-card-body">
                                        <% if (lesson.getLessonTypeId() == 1) { %>
                                        <div class="video-container">
                                            <div class="video-placeholder" data-video="<%= lesson.getVideoLink() %>">
                                                <h5 class="lesson-title"><%= i %>. <%= lesson.getLessonName() %></h5>
                                                <%= lesson.getContent() %><p>
                                                    <button class="watch-video-button">Watch Video</button>
                                            </div>
                                        </div>
                                        <% } else if (lesson.getLessonTypeId() == 2) { %>
                                        <h5 class="lesson-title"><%= i %>. <%= lesson.getLessonName() %></h5>
                                        <button class="watch-video-button" onclick="window.location.href = '<%= lesson.getVideoLink() %>'">View the HTML</button>
                                        <% } else { %>
                                        <h5 class="lesson-title"><%= i %>. <%= lesson.getLessonName() %></h5>
                                        <a href="quizlesson?resultId=<%=resultId%>&quizId=<%=lesson.getQuizId()%>">
                                            <button class="watch-video-button">Quiz Details</button>
                                        </a>
                                        
                                        <!--<button class="watch-video-button" onclick="window.location.href = '#'">Take the quiz</button>-->
                                        <% } %>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <% i++; %>
                        <% } %>
                    </table>
                </div>
            </div>
        </div>


        <%@include file="footer.jsp" %>  
        <script>
            function clearLocalStorage() {
                localStorage.removeItem("countdownTime");
            }
        </script>
        <script src="assets/js/LessonView.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
