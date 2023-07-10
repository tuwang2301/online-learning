<%-- 
    Document   : QuizLesson
    Created on : Jul 8, 2023, 8:30:14 PM
    Author     : quang
--%>

<%@ page import="java.util.List" %>
<%@page import= "model.*" %>
<%@page import= "DAO.*" %>
<%@page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz Lesson</title>
        <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/templatemo.css">
        <link rel="stylesheet" href="assets/css/custom.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/QuizLesson.css">
    </head>
    <%
        Account user = (Account) request.getSession().getAttribute("user");
        if(user == null){
            response.sendRedirect("forbiddenAlert.jsp");
        }
        Quiz currQuiz = (Quiz) request.getAttribute("currQuiz");
        double passScore = 10*((double) currQuiz.getPassRate()/100);
    %>
    <body>
        <%@ include file="header.jsp" %>
        <div class="navbar2">
            <div class="container2">
                <span class="navbar2-brand"><a href="home">Home</a></span>
                <span class="navbar2-brand-divider">/</span>
                <span class="navbar2-brand"><a href="myregistation?user-id=<%=user.getId()%>">Course Detail</a></span>
                <span class="navbar2-brand-divider">/</span>
                <span class="navbar2-brand"><a href="LessonView.jsp?courseid=<%=currQuiz.getCourse().getCourseId()%>">Lesson View</a></span>
                <span class="navbar2-brand-divider">/</span>
                <span class="navbar2-brand"><a href="#">Quiz Lesson</a></span>
            </div>
        </div>
        <div>
            <div class="container mt-lg-3 mb-lg-3">
                <div class="row justify-content-center pt-lg-5 pb-lg-5">
                    <div id="overview-container" class="col-md-6">
                        <!-- Nội dung của div tại đây -->
                        <div class="card shadow">
                            <div class="card-body" >
                                <h1 class="test-name text-success mb-3 h1">Test name: <%=currQuiz.getTestName()%></h1>
                                <div class="row" >
                                    <div>
                                        <h2 class="text-danger">${alert}</h2>
                                        <div class="mb-3">
                                            Exam level: <b class="text-success"><%=currQuiz.getExamLevel()%></b>
                                            | Number of Questions: <b class="text-success"><%=currQuiz.getNumberOfQues()%></b>
                                            | Duration: <b class="text-success"><%=currQuiz.getDuration()%> min</b>
                                            | Pass score: <b class="text-success">>= <%=passScore%></b>
                                        </div>
                                        Description: 
                                        <div class="mt-3 mb-3 card" style="background-color: #eee;">
                                            <div class="card-body">
                                                <h4><%=currQuiz.getExamDes()%></h4>
                                            </div>
                                        </div>
                                        <div class="mt-5 d-flex justify-content-center">
                                            <button class="btn btn-success btn-lg" onclick="openMess()">Take quiz</button>
                                        </div>
                                        <div id="alert-mess" class="mess">
                                            <div class="mess-content">
                                                <div class="container">
                                                    <div class="mess-header mb-3">
                                                        <div class="title"><h1 class="mt-1">Start the test</h1></div>
                                                        <div class="close" onclick="closeMess()"><img src="assets/img/x-mark.png"></div>
                                                    </div>

                                                    <div class="review-des mb-3">
                                                        Press [Start Test] button to start the test 
                                                    </div>
                                                    <div>
                                                        <form action="joinquiz" method="post">
                                                            <input type="hidden" name="quizId" value="<%=currQuiz.getQuizId()%>">
                                                            <div class="mt-3 d-flex justify-content-end">
                                                                <button class="btn btn-success btn-lg" onclick="clearLocalStorage()">Start Test</button>
                                                            </div>
                                                        </form>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="assets/js/quizLesson.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <%@ include file="footer.jsp" %>
    </body>
</html>
