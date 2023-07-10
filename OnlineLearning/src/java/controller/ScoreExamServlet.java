package controller;

import DAO.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.*;
import model.*;

public class ScoreExamServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        QuestionDAO qD = new QuestionDAO();
        UserAnswerDAO uAD = new UserAnswerDAO();
        Account user = (Account) request.getSession().getAttribute("user");
        Quiz currQuiz = (Quiz) request.getSession().getAttribute("currQuiz");
        List<Question> quiz = qD.getQuestionsByQuizId(currQuiz.getQuizId());
        List<Answer> answers = (List<Answer>) request.getSession().getAttribute("answers");
        String answer = request.getParameter("answer");
        String isMarked = request.getParameter("isMarked");
        String s = request.getParameter("index");
        String status;
        LocalDateTime endTime = (LocalDateTime) request.getSession().getAttribute("endTime");
        LocalDateTime currentTime = LocalDateTime.now();
        Duration duration = Duration.between(endTime, currentTime);
        long seconds = duration.getSeconds();
        if ((seconds) >= 5) {
            uAD.clearResult();
            request.setAttribute("quizId", currQuiz.getQuizId());
            String alert = "Your result has been expired due to submitting overtime";
            request.setAttribute("alert", alert);
            request.getRequestDispatcher("QuizLesson.jsp").forward(request, response);
        }else{
            if (s != null) {
            int index = Integer.valueOf(s);
            answers.get(index).setUserAnswer(answer);
            answers.get(index).setIsMarked(Boolean.valueOf(isMarked));
            if (uAD.isUnanswered(answer)) {
                status = "unanswered";
            } else {
                status = (uAD.isCorrect(quiz.get(index), answer)) ? "correct" : "incorrect";
            }
            answers.get(index).setStatus(status);
        }
        int correct = uAD.countCorrect(answers);
        String score = correct + "/" + quiz.size();
        int resultId = uAD.getNewestResultId(user.getId(), currQuiz.getQuizId());
        uAD.update(user.getId(), currQuiz.getQuizId());
        for (Answer answer1 : answers) {
            uAD.insert(answer1, resultId);
        }
        request.setAttribute("score", score);
        request.setAttribute("quizId", currQuiz.getQuizId());
        request.getRequestDispatcher("JoinQuiz.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        request.getRequestDispatcher("home").forward(request, response);
    }
}
