package controller;

import DAO.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.*;
import model.*;

public class ExitExamServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        QuestionDAO qD = new QuestionDAO();
        UserAnswerDAO uAD = new UserAnswerDAO();
        Quiz currQuiz = (Quiz) request.getSession().getAttribute("currQuiz");
        List<Question> quiz = qD.getQuestionsByQuizId(currQuiz.getQuizId());
        List<Answer> answers = (List<Answer>) request.getSession().getAttribute("answers");
        String answer = request.getParameter("answer");
        String isMarked = request.getParameter("isMarked");
        String s = request.getParameter("index");
        int index = -1;
        String status;
        if (s != null) {
            index = Integer.valueOf(s);
            answers.get(index).setUserAnswer(answer);
            answers.get(index).setIsMarked(Boolean.valueOf(isMarked));
            if (uAD.isUnanswered(answer)) {
                status = "unanswered";
            } else {
                status = (uAD.isCorrect(quiz.get(index), answer)) ? "correct" : "incorrect";
            }
            answers.get(index).setStatus(status);
        }
        String exit = "true";
        Question currentQues = quiz.get(index);
        request.setAttribute("exit", exit);
        request.setAttribute("index1", index);
        request.setAttribute("index2", index);
        request.setAttribute("currentQues", currentQues);
        request.setAttribute("quiz", quiz);
        request.getRequestDispatcher("quizhandle.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

    }
}
