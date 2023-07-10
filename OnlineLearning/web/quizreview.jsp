<%-- 
    Document   : quizhandle
    Created on : May 17, 2023, 3:13:45 PM
    Author     : quang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import = "java.util.*" %>
<%@page import = "DAO.*" %>
<%@page import = "model.*" %>
<%@page import = "java.text.DecimalFormat" %>


<!DOCTYPE html>
<html>
    <head>  
        <title>Quiz Review</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/logo.png">
        <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/quizreview.css">
        <link rel="stylesheet" href="assets/css/templatemo.css">
        <link rel="stylesheet" href="assets/css/custom.css">
        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">

        <%
            UserAnswerDAO uAD = new UserAnswerDAO();
            QuizDAO qD = new QuizDAO();
            List<Answer> reviewAnswers = (List<Answer>) request.getSession().getAttribute("reviewAnswers");
            int resultId = (int) request.getSession().getAttribute("resultId");
            int quizId = qD.getQuizId(resultId);
            Quiz currQuiz = qD.getQuizz(quizId);
            Answer currentAnswer = (Answer) request.getAttribute("currentAnswer");
            Question currentQues = currentAnswer.getQuestion();
            String answer = currentAnswer.getUserAnswer();
            if(!uAD.isUnanswered(answer)){
                answer = answer.trim();
            }
            String correct = currentQues.getCorrect();
            String check = "incorrect";
            String checkAnswer = "here";
            boolean isCorrect = uAD.isCorrect(currentQues, answer);
            String status = currentAnswer.getStatus();
            double score = ((double)uAD.countCorrect(reviewAnswers)/reviewAnswers.size())*10;
            DecimalFormat df = new DecimalFormat("#.##");
            String scoreString = df.format(score);
            double passScore = 10*((double) currQuiz.getPassRate()/100);
            String pass = (score >= passScore) ? "correct" : "incorrect";
        %>
    </head>

    <!--//////////////////////////////////////EXIT MESSAGE/////////////////////////////////////////////////////////-->
    <div id="exit-message" class="exit">
        <div class="exit-content">
            <div class="container">
                <div class="exit-header mb-3">
                    <div class="title"><h2>Exit Review?</h2></div>
                </div>
                <div class="review-des mb-3">
                    You can press the button [Quit Review] if you really want to end the review.
                </div>

                <div style="display: flex; justify-content: flex-end;">
                    <div class="green-button rounded" onclick="closeExitMessage()">Back</div>
                    <div class="green-button rounded"><a href="LessonView.jsp?courseid=<%=currQuiz.getCourse().getCourseId()%>" style="text-decoration: none; color: black;">Quit Review</a></div>
                </div>
            </div>
        </div>
    </div>

    <!--//////////////////////////////////////Redo MESSAGE/////////////////////////////////////////////////////////-->
    <div id="redo-message" class="exit">
        <div class="exit-content">
            <div class="container">
                <div class="exit-header mb-3">
                    <div class="title"><h2>Redo Exam?</h2></div>
                </div>
                <div class=" mb-3">
                    <div class="title"><b class="text-decoration-underline">Name:</b> <%=currQuiz.getTestName()%></div>
                    <div class="title"><b class="text-decoration-underline">Time:</b> <%=currQuiz.getDuration()%> minutes</div>
                </div>
                <div class="review-des mb-3">
                    After you press [Redo exam] button you can join and redo the quiz
                </div>

                <div style="display: flex; justify-content: flex-end;">
                    <div class="green-button rounded" onclick="closeRedoMessage()">Back</div>
                    <form action="joinquiz" method="post">
                        <input type="hidden" name="quizId" value="<%=quizId%>">
                        <input class="green-button rounded" type="submit" value="Redo Exam">
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--//////////////////////////////////////FULL SCREEN/////////////////////////////////////////////////////////-->
    <body>
        <div class="container">
            <div class="row">
                <div class="quiz-number">
                    <h2 class="<%=pass%>">Score: <%=scoreString%>/10</h2>
                    <h2 class="<%=status%>"><%=status%></h2>
                </div>
            </div>

            <!--//////////////////////////////////////QUIZ HEADER/////////////////////////////////////////////////////////-->
            <div class="row">
                <div class="quiz-header">
                    <div class="quiz-num h2">Q.<%=reviewAnswers.indexOf(currentAnswer)+1%>/<%=reviewAnswers.size()%></div>
                    <div class="quiz-id h2">ID:<%=currentQues.getQuestionId()%></div>
                </div>
            </div>

            <!--//////////////////////////////////////QUIZ CONTENT/////////////////////////////////////////////////////////-->
            <div class="quiz-content">
                <!--//////////////////////////////////////QUIZ QUESTION/////////////////////////////////////////////////////////-->
                <%if(currentAnswer.isIsMarked()){%>
                <div id="markButton" class="quiz-question h2 ">
                    <%=currentQues.getQuestion()%>
                </div>
                <%}else{%>
                <div class="quiz-question h2 ">
                    <%=currentQues.getQuestion()%>
                </div>
                <%}%>
                
                <!--//////////////////////////////////////QUIZ ANSWERS/////////////////////////////////////////////////////////-->
                <div class="quiz-answers">
                    <%  
                        if (currentQues.getQuestionTypeId()==1){
                           if(uAD.isUnanswered(answer)){
                    %>
                    <div class="col-md-6">
                        <div id="<%=check=(currentQues.getAnswers().get(0).startsWith(correct))?"correct":""%>"
                             class="quiz-answer h2">
                            <input disabled name="answer" type="radio" value="<%=currentQues.getAnswers().get(0).charAt(0)%>"> <%=currentQues.getAnswers().get(0)%>                             
                        </div>
                        <div id="<%=check=(currentQues.getAnswers().get(2).startsWith(correct))?"correct":""%>"
                             class="quiz-answer h2">
                            <input disabled name="answer" type="radio" value="<%=currentQues.getAnswers().get(2).charAt(0)%>"> <%=currentQues.getAnswers().get(2)%>                             
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div id="<%=check=(currentQues.getAnswers().get(1).startsWith(correct))?"correct":""%>"
                             class="quiz-answer h2">
                            <input disabled name="answer" type="radio" value="<%=currentQues.getAnswers().get(1).charAt(0)%>"> <%=currentQues.getAnswers().get(1)%>                             
                        </div>
                        <div id="<%=check=(currentQues.getAnswers().get(3).startsWith(correct))?"correct":""%>"
                             class="quiz-answer h2">
                            <input disabled name="answer" type="radio" value="<%=currentQues.getAnswers().get(3).charAt(0)%>"> <%=currentQues.getAnswers().get(3)%>                             
                        </div>
                    </div>
                    <%}else{%>
                    <div class="col-md-6">
                        <!-- Check correct answer -->
                        <div id="<%=check=(currentQues.getAnswers().get(0).startsWith(correct))?"correct":""%>"
                             class="quiz-answer h2 <%=checkAnswer=(currentQues.getAnswers().get(0).startsWith(answer))?"chosen":""%>">
                            <%if(currentQues.getAnswers().get(0).startsWith(answer)){%>
                            <input disabled name="answer" type="radio" value="<%=currentQues.getAnswers().get(0).charAt(0)%>" checked> <%=currentQues.getAnswers().get(0)%>
                            <%}else{%>
                            <input disabled name="answer" type="radio" value="<%=currentQues.getAnswers().get(0).charAt(0)%>"> <%=currentQues.getAnswers().get(0)%>                             
                            <%}%>
                        </div>
                        <div id="<%=check=(currentQues.getAnswers().get(2).startsWith(correct))?"correct":""%>"
                             class="quiz-answer h2 <%=checkAnswer=(currentQues.getAnswers().get(2).startsWith(answer))?"chosen":""%>">
                            <%if(currentQues.getAnswers().get(2).startsWith(answer)){%>
                            <input disabled name="answer" type="radio"
                                   value="<%=currentQues.getAnswers().get(2).charAt(0)%>" checked> <%=currentQues.getAnswers().get(2)%>
                            <%}else{%>
                            <input disabled name="answer" type="radio"
                                   value="<%=currentQues.getAnswers().get(2).charAt(0)%>"> <%=currentQues.getAnswers().get(2)%>                             
                            <%}%>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div id="<%=check=(currentQues.getAnswers().get(1).startsWith(correct))?"correct":""%>"
                             class="quiz-answer h2 <%=checkAnswer=(currentQues.getAnswers().get(1).startsWith(answer))?"chosen":""%>">
                            <%if(currentQues.getAnswers().get(1).startsWith(answer)){%>
                            <input disabled name="answer" type="radio"
                                   value="<%=currentQues.getAnswers().get(1).charAt(0)%>" checked> <%=currentQues.getAnswers().get(1)%>
                            <%}else{%>
                            <input disabled name="answer" type="radio"
                                   value="<%=currentQues.getAnswers().get(1).charAt(0)%>"> <%=currentQues.getAnswers().get(1)%>                             
                            <%}%>
                        </div>
                        <div id="<%=check=(currentQues.getAnswers().get(3).startsWith(correct))?"correct":""%>"
                             class="quiz-answer h2 <%=checkAnswer=(currentQues.getAnswers().get(3).startsWith(answer))?"chosen":""%>">
                            <%if(currentQues.getAnswers().get(3).startsWith(answer)){%>
                            <input disabled name="answer" type="radio"
                                   value="<%=currentQues.getAnswers().get(3).charAt(0)%>" checked> <%=currentQues.getAnswers().get(3)%>
                            <%}else{%>
                            <input disabled name="answer" type="radio"
                                   value="<%=currentQues.getAnswers().get(3).charAt(0)%>"> <%=currentQues.getAnswers().get(3)%>                             
                            <%}%>
                        </div>
                    </div>
                    <%}
/////////////////////////////////Multiple-choice/////////////////////////////////////
                    }else if(currentQues.getQuestionTypeId()==2){
                    if(uAD.isUnanswered(answer)){
                    %>
                    <div class="col-md-6">
                        <div id="<%=check=(correct.contains(currentQues.getAnswers().get(0).charAt(0)+""))?"correct":""%>"
                             class="quiz-answer h2">
                            <input disabled name="m-answer" type="checkbox" value="<%=currentQues.getAnswers().get(0).charAt(0)%>"> <%=currentQues.getAnswers().get(0)%>                             
                        </div>
                        <div id="<%=check=(correct.contains(currentQues.getAnswers().get(2).charAt(0)+""))?"correct":""%>"
                             class="quiz-answer h2">
                            <input disabled name="m-answer" type="checkbox" value="<%=currentQues.getAnswers().get(2).charAt(0)%>"> <%=currentQues.getAnswers().get(2)%>                             
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div id="<%=check=(correct.contains(currentQues.getAnswers().get(1).charAt(0)+""))?"correct":""%>"
                             class="quiz-answer h2">
                            <input disabled name="m-answer" type="checkbox" value="<%=currentQues.getAnswers().get(1).charAt(0)%>"> <%=currentQues.getAnswers().get(1)%>                             
                        </div>
                        <div id="<%=check=(correct.contains(currentQues.getAnswers().get(3).charAt(0)+""))?"correct":""%>" 
                             class="quiz-answer h2">
                            <input disabled name="m-answer" type="checkbox" value="<%=currentQues.getAnswers().get(3).charAt(0)%>"> <%=currentQues.getAnswers().get(3)%>                             
                        </div>
                    </div>
                    <%}else{%> 
                    <div class="col-md-6">
                        <div id="<%=check=(correct.contains(currentQues.getAnswers().get(0).charAt(0)+""))?"correct":""%>" 
                             class="quiz-answer h2 <%=checkAnswer=(answer.contains(currentQues.getAnswers().get(0).charAt(0)+""))?"chosen":""%>">
                            <%if(answer.contains(currentQues.getAnswers().get(0).charAt(0)+"")){%>
                            <input disabled name="m-answer" type="checkbox" value="<%=currentQues.getAnswers().get(0).charAt(0)%>" checked> <%=currentQues.getAnswers().get(0)%>
                            <%}else{%>
                            <input disabled name="m-answer" type="checkbox" value="<%=currentQues.getAnswers().get(0).charAt(0)%>"> <%=currentQues.getAnswers().get(0)%>                             
                            <%}%>
                        </div>
                        <div id="<%=check=(correct.contains(currentQues.getAnswers().get(2).charAt(0)+""))?"correct":""%>" 
                             class="quiz-answer h2 <%=checkAnswer=(answer.contains(currentQues.getAnswers().get(2).charAt(0)+""))?"chosen":""%>">
                            <%if(answer.contains(currentQues.getAnswers().get(2).charAt(0)+"")){%>
                            <input disabled name="m-answer" type="checkbox"
                                   value="<%=currentQues.getAnswers().get(2).charAt(0)%>" checked> <%=currentQues.getAnswers().get(2)%>
                            <%}else{%>
                            <input disabled name="m-answer" type="checkbox"
                                   value="<%=currentQues.getAnswers().get(2).charAt(0)%>"> <%=currentQues.getAnswers().get(2)%>                             
                            <%}%>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div id="<%=check=(correct.contains(currentQues.getAnswers().get(1).charAt(0)+""))?"correct":""%>" 
                             class="quiz-answer h2 <%=checkAnswer=(answer.contains(currentQues.getAnswers().get(1).charAt(0)+""))?"chosen":""%>">
                            <%if(answer.contains(currentQues.getAnswers().get(1).charAt(0)+"")){%>
                            <input disabled name="m-answer" type="checkbox"
                                   value="<%=currentQues.getAnswers().get(1).charAt(0)%>" checked> <%=currentQues.getAnswers().get(1)%>
                            <%}else{%>
                            <input disabled name="m-answer" type="checkbox"
                                   value="<%=currentQues.getAnswers().get(1).charAt(0)%>"> <%=currentQues.getAnswers().get(1)%>                             
                            <%}%>
                        </div>
                        <div id="<%=check=(correct.contains(currentQues.getAnswers().get(3).charAt(0)+""))?"correct":""%>" 
                             class="quiz-answer h2 <%=checkAnswer=(answer.contains(currentQues.getAnswers().get(3).charAt(0)+""))?"chosen":""%>">
                            <%if(answer.contains(currentQues.getAnswers().get(3).charAt(0)+"")){%>
                            <input disabled name="m-answer" type="checkbox"
                                   value="<%=currentQues.getAnswers().get(3).charAt(0)%>" checked> <%=currentQues.getAnswers().get(3)%>
                            <%}else{%>
                            <input disabled name="m-answer" type="checkbox"
                                   value="<%=currentQues.getAnswers().get(3).charAt(0)%>"> <%=currentQues.getAnswers().get(3)%>                             
                            <%}%>
                        </div>
                    </div>
                    <%}}
                    else if(currentQues.getQuestionTypeId()==3){
                    %>
                    <div class="h2 <%=status%>">
                        <h2>Your answer: <input disabled class="quiz-anwser-text" name="answer" type="text" value="<%=answer%>"></h2>
                    </div>
                    <div  class="correct">
                        <h2>Correct answer is: <input disabled class="quiz-anwser-text" name="answer" type="text" value="<%=currentQues.getCorrect()%>"></h2>
                    </div>
                    <%}%>
                </div>
            </div>
            <!--//////////////////////////////////////QUIZ FUNCTION/////////////////////////////////////////////////////////-->
            <div class="quiz-function">
                <div class="green-button rounded" onclick="openPeek()">Explanation</div>
                <%if(currentAnswer.isIsMarked()){%>
                <div id="markButton" class="green-button rounded">Marked</div>
                <%}else{%>
                <div class="green-button rounded">Marked</div>
                <%}%>

            </div>

            <!--//////////////////////////////////////QUIZ FOOTER/////////////////////////////////////////////////////////-->
            <div class="quiz-footer">
                <div class="quiz-review highlight" onclick="openExitMessage()">Exit Review</div>
                <div class="quiz-review highlight" onclick="openRedoMessage()">Redo Exam</div>
                <div class="quiz-review highlight" onclick="openReview()">Review Results</div>
                <div class="quiz-move">
                    <c:if test="${requestScope.index==0}">
                        <div class="quiz-next highlight"
                             onclick="nextAnswer('${requestScope.index+1}')">Next</div>
                    </c:if>
                    <c:if test="${requestScope.index>0 && requestScope.index<reviewAnswers.size()-1}">
                        <div class="quiz-back highlight" onclick="nextAnswer('${requestScope.index-1}')">Back</div>
                        <div class="quiz-next highlight" onclick="nextAnswer('${requestScope.index+1}')">Next</div>

                    </c:if>  
                    <c:if test="${requestScope.index==reviewAnswers.size()-1}">
                        <div class="quiz-back highlight" onclick="nextAnswer('${requestScope.index-1}')">Back</div>
                    </c:if> 
                </div>
            </div>

            <!--//////////////////////////////////////QUIZ PROGRESS REVIEW/////////////////////////////////////////////////////////-->
            <div id="quiz-review" class="review">
                <div class="review-content">
                    <div class="container">
                        <div class="review-header mb-3">
                            <div class="title"><h2 class="mt-1">Review Results</h2></div>
                            <div class="close" onclick="closeReview()"><img src="assets/img/x-mark.png"></div>
                        </div>

                        <div class="review-des mb-3 h2">

                        </div>

                        <div class="review-status mb-4">
                            <div id="" class="green-button rounded" onclick="openAll()">All</div>
                            <div id="unanswered" class="green-button rounded" onclick="openUnanswered()">Unanswered</div>
                            <div id="marked" class="green-button rounded" onclick="openMarked()">Marked</div>
                            <div id="incorrect" class="green-button rounded" onclick="openIncorrect()">Incorrect</div>
                            <div id ="correct" class="green-button rounded" onclick="openCorrect()">Correct</div>
                        </div>

                        <!--//////////////////////////////////////ALL ANSWERS/////////////////////////////////////////////////////////-->
                        <div id="quiz-all" class="quiz-all mb-5">
                            <%for (int i = 0; i < reviewAnswers.size(); i++) {
                            String marked = (reviewAnswers.get(i).isIsMarked()) ? "marked" : "";
                            if(i<9){%>
                            <div id="<%=reviewAnswers.get(i).getStatus()%>"
                                 class="<%=marked%> quiz-square rounded highlight" onclick="nextAnswer('<%=i%>')">0<%=i+1%></div>
                                 <%}else{%>
                            <div id="<%=reviewAnswers.get(i).getStatus()%>"
                                 class="<%=marked%> quiz-square rounded highlight" onclick="nextAnswer('<%=i%>')"><%=i+1%></div>
                            <%}}%>
                        </div>

                        <!--//////////////////////////////////////ALL UNANSWERED/////////////////////////////////////////////////////////-->
                        <div id="quiz-unanswered" class="quiz-all mb-5">
                            <%for (int i = 0; i < reviewAnswers.size(); i++) {
                            String marked = (reviewAnswers.get(i).isIsMarked()) ? "marked" : "";
                            if(reviewAnswers.get(i).getStatus().equals("unanswered")){
                            if(i<9){%>
                            <div id="<%=reviewAnswers.get(i).getStatus()%>"
                                 class="<%=marked%> quiz-square rounded highlight" onclick="nextAnswer('<%=i%>')">0<%=i+1%></div>
                            <%}else{%>
                            <div id="<%=reviewAnswers.get(i).getStatus()%>"
                                 class="<%=marked%> quiz-square rounded highlight" onclick="nextAnswer('<%=i%>')"><%=i+1%></div>
                            <%}}}%>
                        </div>

                        <!--//////////////////////////////////////ALL MARKED/////////////////////////////////////////////////////////-->
                        <div id="quiz-marked" class="quiz-all mb-5">
                            <%for (int i = 0; i < reviewAnswers.size(); i++) {
                            String marked = (reviewAnswers.get(i).isIsMarked()) ? "marked" : "";
                            if(reviewAnswers.get(i).isIsMarked()){
                            if(i<9){%>
                            <div id="<%=reviewAnswers.get(i).getStatus()%>"
                                 class="<%=marked%> quiz-square rounded highlight" onclick="nextAnswer('<%=i%>')">0<%=i+1%></div>
                            <%}else{%>
                            <div id="<%=reviewAnswers.get(i).getStatus()%>"
                                 class="<%=marked%> quiz-square rounded highlight" onclick="nextAnswer('<%=i%>')"><%=i+1%></div>
                            <%}}}%>
                        </div>

                        <!--//////////////////////////////////////ALL INCORRECT/////////////////////////////////////////////////////////-->
                        <div id="quiz-incorrect" class="quiz-all mb-5">
                            <%for (int i = 0; i < reviewAnswers.size(); i++) {
                            String marked = (reviewAnswers.get(i).isIsMarked()) ? "marked" : "";
                            if(reviewAnswers.get(i).getStatus().equals("incorrect")){
                            if(i<9){%>
                            <div id="<%=reviewAnswers.get(i).getStatus()%>"
                                 class="<%=marked%> quiz-square rounded highlight" onclick="nextAnswer('<%=i%>')">0<%=i+1%></div>
                            <%}else{%>
                            <div id="<%=reviewAnswers.get(i).getStatus()%>"
                                 class="<%=marked%> quiz-square rounded highlight" onclick="nextAnswer('<%=i%>')"><%=i+1%></div>
                            <%}}}%>
                        </div>

                        <!--//////////////////////////////////////ALL CORRECT/////////////////////////////////////////////////////////-->
                        <div id="quiz-correct" class="quiz-all mb-5">
                            <%for (int i = 0; i < reviewAnswers.size(); i++) {
                            String marked = (reviewAnswers.get(i).isIsMarked()) ? "marked" : "";
                            if(reviewAnswers.get(i).getStatus().equals("correct")){
                            if(i<9){%>
                            <div id="<%=reviewAnswers.get(i).getStatus()%>"
                                 class="<%=marked%> quiz-square rounded highlight" onclick="nextAnswer('<%=i%>')">0<%=i+1%></div>
                            <%}else{%>
                            <div id="<%=reviewAnswers.get(i).getStatus()%>"
                                 class="<%=marked%> quiz-square rounded highlight" onclick="nextAnswer('<%=i%>')"><%=i+1%></div>
                            <%}}}%>
                        </div>
                    </div>
                </div>
            </div>

            <!--//////////////////////////////////////PEEK CONTENT/////////////////////////////////////////////////////////-->
            <div id="question-peek" class="peek">
                <div class="peek-content">
                    <div class="container">
                        <div class="review-header mb-3">
                            <div class="title"><h2 class="mt-1">Explanation</h2></div>
                            <div class="close" onclick="closePeek()"><img src="assets/img/x-mark.png"></div>
                        </div>

                        <div class="review-des mb-3">
                            <b class="text-decoration-underline">The correct answer:</b> <%=currentQues.getCorrect()%>
                        </div>

                        <div class="review-des mb-3">
                            <b class="text-decoration-underline">Explanation:</b> <%=currentQues.getExplaination()%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="assets/js/quizreview.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    </body>
</html>
