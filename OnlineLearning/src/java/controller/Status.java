/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.CourseDAO;
import DAO.LessonDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Course;
import model.CourseCatergory;
import model.CourseLesson;

/**
 *
 * @author DAT
 */
@WebServlet(name = "Status", urlPatterns = {"/status"})
public class Status extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            CourseDAO dao1 = new CourseDAO();
            String cateID = request.getParameter("st");
            String cateIDa = request.getParameter("sta");
            String bid = request.getParameter("bid");

            String cid = request.getParameter("cid");
            if (cid != null) {
                int course = Integer.parseInt(request.getParameter("course"));

                LessonDAO u = new LessonDAO();
                List<CourseLesson> lst = u.getByCourseId(course);
                System.out.println("bid" + course);
                u.updateStatus(bid, cid);
                lst = u.getByCourseId(course);
                request.setAttribute("lesson", lst);
                request.setAttribute("courseid", course);
                request.getRequestDispatcher("SubjectLesson.jsp").forward(request, response);

            } else if (cateIDa != null) {
                int name = Integer.parseInt(request.getParameter("name"));

                LessonDAO u = new LessonDAO();
                List<CourseLesson> lessonList = u.getLessonbystatus(name, cateIDa);
                System.out.println("aaa" + lessonList);
                request.setAttribute("lesson", lessonList);
                request.setAttribute("courseid", name);
                request.getRequestDispatcher("SubjectLesson.jsp").forward(request, response);

            } else {

                List<Course> list = dao1.getCoursesbystatus(cateID);
                List<CourseCatergory> listCate = dao1.getAllCa();
                int page;
                int numberpage = 6;
                int size = list.size();
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

                List<Course> listP = dao1.getListByPage(list, start, end);
                request.setAttribute("page", page);
                request.setAttribute("num", num);
                request.setAttribute("listsub", listP);
                request.setAttribute("listCategory", listCate);
                request.getRequestDispatcher("SubjectsList.jsp").forward(request, response);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
