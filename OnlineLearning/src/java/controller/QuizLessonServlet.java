package controller;

import DAO.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.*;
import model.*;

public class QuizLessonServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        QuizDAO qD = new QuizDAO();
        UserAnswerDAO uAD = new UserAnswerDAO();
        ResultDAO rD = new ResultDAO();
        Account user = (Account) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect("forbiddenAlert.jsp");
        }
        int resultId = Integer.valueOf(request.getParameter("resultId"));
        int quizId = Integer.valueOf(request.getParameter("quizId"));
        Quiz currQuiz = qD.getQuizz(quizId);
        if (resultId == 0) {
            request.setAttribute("currQuiz", currQuiz);
            request.getRequestDispatcher("QuizLesson.jsp").forward(request, response);
        } else {
            int newestResult = uAD.getNewestResultId(user.getId(), quizId);
            List<Answer> reviewAnswers = uAD.getAnswersByResultId(newestResult);
            Result result = rD.getResultByResultId(newestResult);
            Timestamp startFrom = result.getStartFrom();
            Timestamp endAt = result.getEndAt();
            long differenceInMillis = endAt.getTime() - startFrom.getTime();
            long differenceInSeconds = differenceInMillis / (1000);
            String total = (differenceInSeconds / 60) + "p" + (differenceInSeconds % 60) + "s";
            int correct = uAD.countCorrect(reviewAnswers);
            int answered = uAD.countAnswered(reviewAnswers);
            int numberOfQues = currQuiz.getNumberOfQues();
            long avarageTime = differenceInSeconds / numberOfQues;
            String average = (avarageTime / 60) + "p" + (avarageTime % 60) + "s";
            int unanswered = reviewAnswers.size() - answered;
            int mark = uAD.countMark(reviewAnswers);
            double score = ((double) uAD.countCorrect(reviewAnswers) / reviewAnswers.size()) * 10;
            DecimalFormat df = new DecimalFormat("#.##");
            String scoreString = df.format(score);
            double passScore = 10 * ((double) currQuiz.getPassRate() / 100);
            request.setAttribute("currQuiz", currQuiz);
            request.setAttribute("score", score);
            request.setAttribute("passScore", passScore);
            request.setAttribute("average", average);
            request.setAttribute("total", total);
            request.setAttribute("mark", mark);
            request.setAttribute("numberOfQues", numberOfQues);
            request.setAttribute("correct", correct);
            request.setAttribute("unanswered", unanswered);
            request.setAttribute("endAt", endAt);
            request.setAttribute("newestResult", newestResult);
            
            request.getRequestDispatcher("OverviewResult.jsp").forward(request, response);
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
