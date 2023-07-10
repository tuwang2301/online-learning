<%-- 
    Document   : quizhandle
    Created on : May 17, 2023, 3:13:45 PM
    Author     : quang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import = "java.util.*" %>
<%@page import = "java.time.LocalDateTime" %>
<%@page import = "DAO.*" %>
<%@page import = "model.*" %>


<!DOCTYPE html>
<html>
    <head>  
        <title>QuizHandle</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/logo.png">
        <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/quizhandle.css">
        <link rel="stylesheet" href="assets/css/templatemo.css">
        <link rel="stylesheet" href="assets/css/custom.css">
        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">

        <%
            UserAnswerDAO uAD = new UserAnswerDAO();
            List<Question> quiz = (List<Question>) request.getAttribute("quiz");
            Question currentQues = (Question) request.getAttribute("currentQues");
            Quiz currQuiz = (Quiz) request.getSession().getAttribute("currQuiz");
            List<Answer> answers = (List<Answer>) request.getSession().getAttribute("answers");
            int index1 = (int) request.getAttribute("index1");
            int index2 = (int) request.getAttribute("index2");
            String exit = (String) request.getAttribute("exit");
            int count = uAD.countAnswered(answers);
           LocalDateTime endTime = (LocalDateTime) request.getSession().getAttribute("endTime");
        %>
    </head>

    <!--//////////////////////////////////////EXIT MESSAGE/////////////////////////////////////////////////////////-->
    <%if(exit != null && exit.equals("true")){%>
    <div id="exit-message" class="exit">
        <div class="exit-content">
            <div class="container">
                <div class="exit-header mb-3">
                    <%if(count==0){%>
                    <div class="title">Exit Exam?</div>
                    <%}else{%>
                    <div class="title">Score Exam?</div>
                    <%}%>
                </div>
                <%if(count>0){%>
                <div class="exit-des mb-3">
                    <%=count%> of <%=quiz.size()%> Questions Answered
                </div>
                <%}%>
                <%if(count==0){%>
                <div class="review-des mb-3">
                    You have not answered any questions. By clicking on the [Exit Exam]
                    button below, you will complete your current exam and be returned to the dashboard.
                </div>
                <%}else{%>
                <div class="review-des mb-3">
                    By clicking on the [Score Exam] button below, you will
                    complete your complete your current exam and receive your score. 
                    You will not be able to change any answers after this point.
                </div>
                <%}%>
                <div style="display: flex; justify-content: flex-end;">
                    <div class="green-button rounded" onclick="closeExitMessage()">Back</div>
                    <%if(count==0){%>
                    <div class="green-button rounded" onclick="exitExam(<%=currQuiz.getCourse().getCourseId()%>)">Exit Exam</div>
                    <%}else{%>
                    <div class="green-button rounded" onclick="scoreExam('${requestScope.index1}')">Score Exam Now</div>
                    <%}%>
                </div>
            </div>
        </div>
    </div>
    <%}%>

    <!--//////////////////////////////////////FULL SCREEN/////////////////////////////////////////////////////////-->
    <body>
        <div class="container">
            <div class="row">
                <div class="quiz-number">
                    <div class="quiz-total h2">
                        <%=quiz.indexOf(currentQues)+1%>/<%=quiz.size()%>
                    </div>
                    <div id="duration" style="display: none;"><%=currQuiz.getDuration()%></div>
                    <div>End time: <%=endTime%></div>
                    <div class="h2" id ="countdown"></div>
                </div>
            </div>

            <!--//////////////////////////////////////QUIZ HEADER/////////////////////////////////////////////////////////-->
            <div class="row">
                <div class="quiz-header">
                    <div class="quiz-num h2">Q.<%=quiz.indexOf(currentQues)+1%></div>
                    <div class="quiz-id h2">ID:<%=currentQues.getQuestionId()%></div>
                </div>
            </div>

            <!--//////////////////////////////////////QUIZ CONTENT/////////////////////////////////////////////////////////-->
            <div class="quiz-content">
                <!--//////////////////////////////////////QUIZ QUESTION/////////////////////////////////////////////////////////-->
                <div class="quiz-question h2 ">
                    <%=currentQues.getQuestion()%>
                </div>
                <!--//////////////////////////////////////QUIZ ANSWERS/////////////////////////////////////////////////////////-->
                <div class="quiz-answers">
                    <%  String answer = answers.get(index2).getUserAnswer();
                        if (currentQues.getQuestionTypeId()==1){
                           if(uAD.isUnanswered(answer)){
                    %>
                    <div class="col-md-6">
                        <div class="quiz-answer h2">
                            <input name="answer" type="radio" value="<%=currentQues.getAnswers().get(0).charAt(0)%>"> <%=currentQues.getAnswers().get(0)%>                             
                        </div>
                        <div class="quiz-answer h2">
                            <input name="answer" type="radio" value="<%=currentQues.getAnswers().get(2).charAt(0)%>"> <%=currentQues.getAnswers().get(2)%>                             
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="quiz-answer h2">
                            <input name="answer" type="radio" value="<%=currentQues.getAnswers().get(1).charAt(0)%>"> <%=currentQues.getAnswers().get(1)%>                             
                        </div>
                        <div class="quiz-answer h2">
                            <input name="answer" type="radio" value="<%=currentQues.getAnswers().get(3).charAt(0)%>"> <%=currentQues.getAnswers().get(3)%>                             
                        </div>
                    </div>
                    <%}else{%>
                    <div class="col-md-6">
                        <div class="quiz-answer h2">
                            <%if(currentQues.getAnswers().get(0).startsWith(answer)){%>
                            <input name="answer" type="radio" value="<%=currentQues.getAnswers().get(0).charAt(0)%>" checked> <%=currentQues.getAnswers().get(0)%>
                            <%}else{%>
                            <input name="answer" type="radio" value="<%=currentQues.getAnswers().get(0).charAt(0)%>"> <%=currentQues.getAnswers().get(0)%>                             
                            <%}%>
                        </div>
                        <div class="quiz-answer h2">
                            <%if(currentQues.getAnswers().get(2).startsWith(answer)){%>
                            <input name="answer" type="radio"
                                   value="<%=currentQues.getAnswers().get(2).charAt(0)%>" checked> <%=currentQues.getAnswers().get(2)%>
                            <%}else{%>
                            <input name="answer" type="radio"
                                   value="<%=currentQues.getAnswers().get(2).charAt(0)%>"> <%=currentQues.getAnswers().get(2)%>                             
                            <%}%>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="quiz-answer h2">
                            <%if(currentQues.getAnswers().get(1).startsWith(answer)){%>
                            <input name="answer" type="radio"
                                   value="<%=currentQues.getAnswers().get(1).charAt(0)%>" checked> <%=currentQues.getAnswers().get(1)%>
                            <%}else{%>
                            <input name="answer" type="radio"
                                   value="<%=currentQues.getAnswers().get(1).charAt(0)%>"> <%=currentQues.getAnswers().get(1)%>                             
                            <%}%>
                        </div>
                        <div class="quiz-answer h2">
                            <%if(currentQues.getAnswers().get(3).startsWith(answer)){%>
                            <input name="answer" type="radio"
                                   value="<%=currentQues.getAnswers().get(3).charAt(0)%>" checked> <%=currentQues.getAnswers().get(3)%>
                            <%}else{%>
                            <input name="answer" type="radio"
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
                        <div class="quiz-answer h2">
                            <input name="m-answer" type="checkbox" value="<%=currentQues.getAnswers().get(0).charAt(0)%>"> <%=currentQues.getAnswers().get(0)%>                             
                        </div>
                        <div class="quiz-answer h2">
                            <input name="m-answer" type="checkbox" value="<%=currentQues.getAnswers().get(2).charAt(0)%>"> <%=currentQues.getAnswers().get(2)%>                             
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="quiz-answer h2">
                            <input name="m-answer" type="checkbox" value="<%=currentQues.getAnswers().get(1).charAt(0)%>"> <%=currentQues.getAnswers().get(1)%>                             
                        </div>
                        <div class="quiz-answer h2">
                            <input name="m-answer" type="checkbox" value="<%=currentQues.getAnswers().get(3).charAt(0)%>"> <%=currentQues.getAnswers().get(3)%>                             
                        </div>
                    </div>
                    <%}else{%>
                    <div class="col-md-6">
                        <div class="quiz-answer h2">
                            <%if(answer.contains(currentQues.getAnswers().get(0).charAt(0)+"")){%>
                            <input name="m-answer" type="checkbox" value="<%=currentQues.getAnswers().get(0).charAt(0)%>" checked> <%=currentQues.getAnswers().get(0)%>
                            <%}else{%>
                            <input name="m-answer" type="checkbox" value="<%=currentQues.getAnswers().get(0).charAt(0)%>"> <%=currentQues.getAnswers().get(0)%>                             
                            <%}%>
                        </div>
                        <div class="quiz-answer h2">
                            <%if(answer.contains(currentQues.getAnswers().get(2).charAt(0)+"")){%>
                            <input name="m-answer" type="checkbox"
                                   value="<%=currentQues.getAnswers().get(2).charAt(0)%>" checked> <%=currentQues.getAnswers().get(2)%>
                            <%}else{%>
                            <input name="m-answer" type="checkbox"
                                   value="<%=currentQues.getAnswers().get(2).charAt(0)%>"> <%=currentQues.getAnswers().get(2)%>                             
                            <%}%>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="quiz-answer h2">
                            <%if(answer.contains(currentQues.getAnswers().get(1).charAt(0)+"")){%>
                            <input name="m-answer" type="checkbox"
                                   value="<%=currentQues.getAnswers().get(1).charAt(0)%>" checked> <%=currentQues.getAnswers().get(1)%>
                            <%}else{%>
                            <input name="m-answer" type="checkbox"
                                   value="<%=currentQues.getAnswers().get(1).charAt(0)%>"> <%=currentQues.getAnswers().get(1)%>                             
                            <%}%>
                        </div>
                        <div class="quiz-answer h2">
                            <%if(answer.contains(currentQues.getAnswers().get(3).charAt(0)+"")){%>
                            <input name="m-answer" type="checkbox"
                                   value="<%=currentQues.getAnswers().get(3).charAt(0)%>" checked> <%=currentQues.getAnswers().get(3)%>
                            <%}else{%>
                            <input name="m-answer" type="checkbox"
                                   value="<%=currentQues.getAnswers().get(3).charAt(0)%>"> <%=currentQues.getAnswers().get(3)%>                             
                            <%}%>
                        </div>
                    </div>
                    <%}}
                    else if(currentQues.getQuestionTypeId()==3){
                    if(uAD.isUnanswered(answer)){%>
                    <div class="h2">
                        Enter your answer here <input class="quiz-anwser-text" name="answer" type="text" placeholder="Enter your answer here">
                    </div>
                    <%}else{%>
                    <div class="h2">
                        Enter your answer here <input class="quiz-anwser-text" name="answer" type="text" value="<%=answer%>">
                    </div>
                    <%}}%>
                </div>
            </div>

            <!--//////////////////////////////////////QUIZ FUNCTION/////////////////////////////////////////////////////////-->
            <div class="quiz-function">
                <div class="green-button rounded" onclick="openPeek()">Peek</div>
                <%if(answers.get(index2).isIsMarked()){%>
                <input type="hidden" id="isMarkedInput" name="isMarked" value="true">
                <%}else{%>
                <input type="hidden" id="isMarkedInput" name="isMarked" value="false">
                <%}%>
                <div id="markButton" class="green-button rounded" onclick="toggleIsMarked()">Mark</div>
            </div>

            <!--//////////////////////////////////////QUIZ FOOTER/////////////////////////////////////////////////////////-->
            <div class="quiz-footer">
                <div class="quiz-review highlight" onclick="openExitMessage('${requestScope.index1}')">Exit Exam</div>
                <div class="quiz-review highlight" onclick="openReview()">Review progress</div>
                <div class="quiz-move">
                    <c:if test="${requestScope.index1==0}">
                        <div class="quiz-next highlight"
                             onclick="submitAnswer('${requestScope.index1}', '${requestScope.index2+1}', '<%=currentQues.getQuestionTypeId()%>')">Next</div>
                    </c:if>
                    <c:if test="${requestScope.index1>0 && requestScope.index1<quiz.size()-1}">
                        <div class="quiz-back highlight" onclick="submitAnswer('${requestScope.index1}', '${requestScope.index2-1}', '<%=currentQues.getQuestionTypeId()%>')">Back</div>
                        <div class="quiz-next highlight" onclick="submitAnswer('${requestScope.index1}', '${requestScope.index2+1}', '<%=currentQues.getQuestionTypeId()%>')">Next</div>

                    </c:if>  
                    <c:if test="${requestScope.index1==requestScope.quiz.size()-1}">
                        <div class="quiz-back highlight" onclick="submitAnswer('${requestScope.index1}', '${requestScope.index2-1}', '<%=currentQues.getQuestionTypeId()%>')">Back</div>
                        <div class="quiz-next highlight" onclick="openExitMessage('${requestScope.index1}', '<%=currentQues.getQuestionTypeId()%>')">Score Exam</div>
                    </c:if> 
                </div>
            </div>

            <!--//////////////////////////////////////QUIZ PROGRESS REVIEW/////////////////////////////////////////////////////////-->
            <div id="quiz-review" class="review">
                <div class="review-content">
                    <div class="container">
                        <div class="review-header mb-3">
                            <div class="title"><h1 class="mt-1">Review Progress</h1></div>
                            <div class="close" onclick="closeReview()"><img src="assets/img/x-mark.png"></div>
                        </div>

                        <div class="review-des mb-3 h2">
                            Review before scoring exam
                        </div>

                        <div class="review-status mb-4">
                            <div class="green-button rounded" onclick="openUnanswered()">Unanswered</div>
                            <div class="green-button rounded" onclick="openMarked()">Marked</div>
                            <div class="green-button rounded" onclick="openAnswered()">Answered</div>
                            <div class="green-button rounded" onclick="openAll()">ALL QUESTIONS</div>
                        </div>

                        <!--//////////////////////////////////////ALL QUESTIONS/////////////////////////////////////////////////////////-->
                        <div id="quiz-all" class="quiz-all mb-5">
                            <%for (int i = 0; i < answers.size(); i++) {
                            String marked = (answers.get(i).isIsMarked()) ? "marked" : "";
                    if(i<9){%>
                            <div id="<%=answers.get(i).getStatus()%>"
                                 class="<%=marked%> quiz-square rounded highlight"
                                 onclick="submitAnswer('${requestScope.index1}', '<%=i%>', '<%=currentQues.getQuestionTypeId()%>')">0<%=i+1%></div>
                            <%}else{%>
                            <div id="<%=answers.get(i).getStatus()%>" 
                                 class="quiz-square rounded highlight"
                                 onclick="submitAnswer('${requestScope.index1}', '<%=i%>', '<%=currentQues.getQuestionTypeId()%>')"><%=i+1%></div>
                            <%}}%>
                        </div>

                        <!--//////////////////////////////////////ALL ANSWERED QUESTIONS/////////////////////////////////////////////////////////-->
                        <div id="quiz-unanswered" class="quiz-all mb-5">
                            <%for (int i = 0; i < answers.size(); i++) {
                            String marked = (answers.get(i).isIsMarked()) ? "marked" : "";
                                if(uAD.isUnanswered(answers.get(i).getUserAnswer())){
                                if(i<9){%>
                            <div id="<%=answers.get(i).getStatus()%>"
                                 class="<%=marked%> quiz-square rounded highlight" 
                                 onclick="submitAnswer('${requestScope.index1}', '<%=i%>', '<%=currentQues.getQuestionTypeId()%>')">0<%=i+1%></div>
                            <%}else{%>
                            <div id="<%=answers.get(i).getStatus()%>" 
                                 class="<%=marked%> quiz-square rounded highlight" 
                                 onclick="submitAnswer('${requestScope.index1}', '<%=i%>', '<%=currentQues.getQuestionTypeId()%>')"><%=i+1%></div>
                            <%}}}%>
                        </div>

                        <!--//////////////////////////////////////ALL MARKED QUESTIONS/////////////////////////////////////////////////////////-->
                        <div id="quiz-marked" class="quiz-all mb-5">
                            <%for (int i = 0; i < answers.size(); i++) {
                            String marked = (answers.get(i).isIsMarked()) ? "marked" : "";
                                if(answers.get(i).isIsMarked()){
                                if(i<9){%>
                            <div id="<%=answers.get(i).getStatus()%>" 
                                 class="<%=marked%> quiz-square rounded highlight" 
                                 onclick="submitAnswer('${requestScope.index1}', '<%=i%>'), '<%=currentQues.getQuestionTypeId()%>')">0<%=i+1%></div>
                            <%}else{%>
                            <div id="<%=answers.get(i).getStatus()%>" 
                                 class="<%=marked%> quiz-square rounded highlight" 
                                 onclick="submitAnswer('${requestScope.index1}', '<%=i%>'), '<%=currentQues.getQuestionTypeId()%>')"><%=i+1%></div>
                            <%}}}%>
                        </div>

                        <!--//////////////////////////////////////ALL UNANSWERED QUESTIONS/////////////////////////////////////////////////////////-->
                        <div id="quiz-answered" class="quiz-all mb-5">
                            <%for (int i = 0; i < answers.size(); i++) {
                            String marked = (answers.get(i).isIsMarked()) ? "marked" : "";
                                if(!answers.get(i).getStatus().equals("unanswered")){
                                if(i<9){%>
                            <div id="<%=answers.get(i).getStatus()%>" 
                                 class="<%=marked%> quiz-square rounded highlight" 
                                 onclick="submitAnswer('${requestScope.index1}', '<%=i%>', '<%=currentQues.getQuestionTypeId()%>')">0<%=i+1%></div>
                            <%}else{%>
                            <div id="<%=answers.get(i).getStatus()%>" 
                                 class="<%=marked%> quiz-square rounded highlight" 
                                 onclick="submitAnswer('${requestScope.index1}', '<%=i%>', '<%=currentQues.getQuestionTypeId()%>')"><%=i+1%></div>
                            <%}}}%>
                        </div>

                        <!--//////////////////////////////////////SCORE EXAM/////////////////////////////////////////////////////////-->
                        <div style="display: flex; justify-content: flex-end;">
                            <div class="green-button rounded" onclick="openExitMessage('${requestScope.index1}')">Score Exam Now</div>
                        </div>
                    </div>
                </div>
            </div>

            <!--//////////////////////////////////////PEEK CONTENT/////////////////////////////////////////////////////////-->
            <div id="question-peek" class="peek">
                <div class="peek-content">
                    <div class="container">
                        <div class="review-header mb-3">
                            <div class="title"><h1 class="mt-1">Peek at Answer</h1></div>
                            <div class="close" onclick="closePeek()"><img src="assets/img/x-mark.png"></div>
                        </div>

                        <div class="review-des mb-3">
                            The correct answer: <%=currentQues.getCorrect()%>
                        </div>

                        <div class="review-des mb-3">
                            Explanation: <%=currentQues.getExplaination()%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="assets/js/quizhandle.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    </body>
</html>
