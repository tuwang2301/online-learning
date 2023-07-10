package controller;

import DAO.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.*;
import model.*;

public class QuizReviewServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        List<Answer> reviewAnswers = (List<Answer>) request.getSession().getAttribute("reviewAnswers");
        String s = request.getParameter("index");
        int index = Integer.valueOf(s);
        Answer currentAnswer = reviewAnswers.get(index);
        request.setAttribute("index", index);
        request.getSession().setAttribute("reviewAnswers", reviewAnswers);
        request.setAttribute("currentAnswer", currentAnswer);
        request.getRequestDispatcher("quizreview.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        UserAnswerDAO uAD = new UserAnswerDAO();
        int resultId = Integer.valueOf(request.getParameter("resultId"));
        Account user = (Account) request.getSession().getAttribute("user");
        List<Answer> reviewAnswers = uAD.getAnswersByResultId(resultId);
        if (user == null || user.getId() != reviewAnswers.get(0).getUser().getId()) {
            request.getRequestDispatcher("forbiddenAlert.jsp").forward(request, response);
        }
        int index = 0;
        Answer currentAnswer = reviewAnswers.get(index);
        request.setAttribute("index", index);
        request.getSession().setAttribute("reviewAnswers", reviewAnswers);
        request.getSession().setAttribute("resultId", resultId);
        request.setAttribute("currentAnswer", currentAnswer);
        request.getRequestDispatcher("quizreview.jsp").forward(request, response);
    }
}
