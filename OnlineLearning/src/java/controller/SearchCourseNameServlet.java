package controller;

import DAO.CourseDAO;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.List;
import model.*;

public class SearchCourseNameServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String xCourseName = request.getParameter("CourseName");
        String xCourseName2 = request.getParameter("name");
        System.out.println("ssss" + xCourseName2);
        if (xCourseName2 != null) {
            CourseDAO u = new CourseDAO();
            List<Course> lst = u.SearchByName(xCourseName2);
            request.setAttribute("listsub", lst);
            request.getRequestDispatcher("SubjectsList.jsp").forward(request, response);
        } else {
            CourseDAO u = new CourseDAO();
            List<Course> lst = u.SearchByName(xCourseName);
            int page;
            int numberpage = 6;
            int size = lst.size();
            int num = (size % 6 == 0 ? (size / 6) : ((size / 6)) + 1);
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            start = (page - 1) * numberpage;
            end = Math.min(page * numberpage, size);
            List<Course> listP = u.getListByPage(lst, start, end);

            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("lst", listP);
//            request.setAttribute("lst", lst);
            request.getRequestDispatcher("CourseList.jsp").forward(request, response);
        }
    }

}
