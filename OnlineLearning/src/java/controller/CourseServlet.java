
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.CourseDAO;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.*;
import java.util.*;

public class CourseServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String service = request.getParameter("service");
        
        CourseDAO u = new CourseDAO();
        List<Course> lst = u.getCourses();
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
        

        request.getRequestDispatcher("CourseList.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pr = response.getWriter();

        String xColName, xSortType;
        xColName = request.getParameter("colName").trim();
        xSortType = request.getParameter("sortType");

        CourseDAO u = new CourseDAO();
        List<Course> lst = u.SortCourse(xColName, xSortType);
        
        request.setAttribute("lst", lst);
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
        

        request.getRequestDispatcher("CourseList.jsp").forward(request, response);

    }

}
