/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import DAO.CourseDAO;
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

/**
 *
 * @author dell
 */
@WebServlet(name="SubjectList", urlPatterns={"/sublist"})
public class SubjectList extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SubjectList</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubjectList at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try ( PrintWriter out = response.getWriter()) {
          String service = request.getParameter("service");
         String bid = request.getParameter("bid");
         String cid = request.getParameter("cid");
         
        CourseDAO u = new CourseDAO();
        List<Course> lst = u.getCourses();
        
          u.updateStatus(bid, cid);
          lst = u.getCourses();
        int page;
        int numberpage = 6;
        int size = lst.size();
        int num = (size % 6 == 0 ? (size / 6) : ((size / 6)) + 1);
        String xpage = request.getParameter("page");
        if (xpage == null || !xpage.matches("[0-9]+")) {
        response.sendRedirect("error.jsp");
        return;
    } else {
        page = Integer.parseInt(xpage);
        if (page <= 0 || page > num) {
            response.sendRedirect("error.jsp");
            return;
        }
    }
        int start, end;
        start = (page - 1) * numberpage;
        end = Math.min(page * numberpage, size);
        List<Course> listP = u.getListByPage(lst, start, end);
        List<CourseCatergory> listCate = u.getAllCa();
        
        
       
        request.setAttribute("page", page);
        request.setAttribute("num", num);
        request.setAttribute("listsub", listP);
        request.setAttribute("listCategory", listCate);
       
        request.getRequestDispatcher("SubjectsList.jsp").forward(request, response);
    } 
    }
    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
