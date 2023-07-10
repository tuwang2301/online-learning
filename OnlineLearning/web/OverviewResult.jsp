<%-- 
    Document   : JoinQuiz
    Created on : Jun 1, 2023, 2:42:15 PM
    Author     : quang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*" %>
<%@page import = "DAO.*" %>
<%@page import = "model.*" %>
<%@page import = "java.text.DecimalFormat" %>
<%@page import = "java.sql.Timestamp" %>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Overview Result</title>
        <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/templatemo.css">
        <link rel="stylesheet" href="assets/css/custom.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/JoinQuiz.css">
    </head>
    <%
        
        ResultDAO rD = new ResultDAO();
        Account user = (Account) request.getSession().getAttribute("user");
        if(user == null){
            response.sendRedirect("forbiddenAlert.jsp");
        }
        Quiz currQuiz = (Quiz) request.getAttribute("currQuiz");
//        int newestResult = (int) request.getAttribute("newestResult");
        double score = (double) request.getAttribute("score");
        double passScore = (double) request.getAttribute("passScore");
        String pass = (score >= passScore) ? "Pass" : "Not Pass";
        String check = (pass.equals("Pass")?"text-success":"text-danger");
        
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
                <span class="navbar2-brand"><a href="#">Quiz Result</a></span>
            </div>
        </div>
        <div class="container mt-lg-3 mb-lg-3">
            <div class="row justify-content-center pt-lg-5 pb-lg-5">
                <div id="overview-container" class="col-md-6">
                    <!-- Nội dung của div tại đây -->
                    <div class="card shadow">
                        <div class="card-body row" >
                            <div class="col-md-4 d-flex flex-column">
                                <div class="score review-group mb-4 d-flex align-items-center justify-content-center flex-column">
                                    <h3>SCORE</h3>
                                    <h1 class="h1 <%=check%>"><%=score%></h1>
                                    <h3 class="<%=check%>"><%=pass%></h3>
                                </div>
                                <form id ="review" class="text-center" action="quizreview" method="post">
                                    <input type="text" name="resultId" hidden value="${newestResult}">
                                </form>
                                <button type="submit" class="btn btn-lg btn-success mb-4" form="review">Review Test</button>
                                <button onclick="openMess()" class="btn btn-lg btn-success">Redo Test</button>
                            </div>
                            <div class="col-md-8 d-flex flex-column">
                                <div class="result-info review-group mb-4">
                                    <div class="m-3 border-bottom">
                                        <p>EXAM TAKEN ${endAt}</p>
                                    </div>
                                    <div class="m-3 ms-5">
                                        <ul>
                                            <li class="h3 <%=check%>">Correct: ${correct}/${numberOfQues}</li>
                                            <li class="h3 <%=check%>">Unanswered: ${unanswered}/${numberOfQues}</li>
                                            <li class="h3 <%=check%>">Marked: ${mark}/${numberOfQues}</li>
                                        </ul>
                                        <%if(pass.equals("Pass")){%>
                                        <span class="text-center h3 <%=check%>">Congratulations! You passed the exam, keep going and do not lose the streak!</span>
                                        <%}else{%>
                                        <span class="text-center h3 <%=check%>">What a pity! Your score has to be more than ${passScore}, go review and do it again!</span>
                                        <%}%>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-around">
                                    <div class="time-info review-group me-2 d-flex align-items-center justify-content-center flex-column">
                                        <span>Total time: ${total}</span>
                                    </div>
                                    <div class="time-info review-group ms-2 d-flex align-items-center justify-content-center flex-column">
                                        <span>AVG time per question: ${average}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
                                <input type="hidden" name="quizId" value="${currQuiz.getQuizId()}">
                                <div class="mt-3 d-flex justify-content-end">
                                    <button class="btn btn-success btn-lg" onclick="clearLocalStorage()">Start Test</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <script src="assets/js/quizLesson.js">
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <%@ include file="footer.jsp" %>

    </body>


</html>
