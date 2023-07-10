package controller;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import DAO.*;
import java.time.LocalDateTime;
import model.*;
import java.util.*;

public class JoinQuizServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        QuestionDAO qD = new QuestionDAO();
        UserAnswerDAO uAD = new UserAnswerDAO();
        List<Answer> answers = (List<Answer>) request.getSession().getAttribute("answers");
        Quiz currQuiz = (Quiz) request.getSession().getAttribute("currQuiz");
        List<Question> quiz = qD.getQuestionsByQuizId(currQuiz.getQuizId());
        String answer = request.getParameter("answer");
        String isMarked = request.getParameter("isMarked");
        String s1 = request.getParameter("index1");
        String s2 = request.getParameter("index2");
        String status;
        if (s1 != null) {
            int index1 = Integer.valueOf(s1);
            answers.get(index1).setUserAnswer(answer);
            answers.get(index1).setIsMarked(Boolean.valueOf(isMarked));
            if (uAD.isUnanswered(answer)) {
                status = "unanswered";
            } else {
                status = (uAD.isCorrect(quiz.get(index1), answer)) ? "correct" : "incorrect";
            }
            answers.get(index1).setStatus(status);
        }
        if (s2 != null) {
            int index2 = Integer.valueOf(s2);
            Question currentQues = quiz.get(index2);
            request.setAttribute("index1", index2);
            request.setAttribute("index2", index2);
            request.setAttribute("currentQues", currentQues);
            request.setAttribute("quiz", quiz);
            request.getRequestDispatcher("quizhandle.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Account user = (Account) request.getSession().getAttribute("user");
        if (user == null) {
            request.getRequestDispatcher("forbiddenAlert.jsp").forward(request, response);
        }
        QuestionDAO qD = new QuestionDAO();
        UserAnswerDAO uAD = new UserAnswerDAO();
        QuizDAO quizD = new QuizDAO();
        int quizId = Integer.valueOf(request.getParameter("quizId"));
        Quiz currQuiz = quizD.getQuizz(quizId);
        uAD.clearResult();
        uAD.insertResult(user.getId(), quizId);
        int index1 = 0;
        int index2 = 0;
        List<Question> quiz = qD.getQuestionsByQuizId(quizId);
        List<Answer> answers = uAD.createAnswerList(quizId, user);
        Question currentQues = quiz.get(index1);
        LocalDateTime currentTime = LocalDateTime.now();
        LocalDateTime endTime = currentTime.plusMinutes(currQuiz.getDuration());
        request.getSession().setAttribute("endTime", endTime);
        request.setAttribute("index1", index1);
        request.setAttribute("index2", index2);
        request.getSession().setAttribute("answers", answers);
        request.getSession().setAttribute("currQuiz", currQuiz);
        request.setAttribute("currentQues", currentQues);
        request.setAttribute("quiz", quiz);
        request.setAttribute("exit", "false");
        request.getRequestDispatcher("quizhandle.jsp").forward(request, response);
    }
}
