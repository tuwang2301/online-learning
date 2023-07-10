/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.AccountDAO;
import DAO.DAOBlog;
import DAO.LessonDAO;
import DAO.RegisterDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Account;
import model.Blog;
import model.Blog_Catergory;
import model.CourseLesson;
import model.Register;

/**
 *
 * @author DAT
 */
@WebServlet(name = "SearchBlog", urlPatterns = {"/search"})
public class SearchBlog extends HttpServlet {

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
        DAOBlog dao = new DAOBlog();
        RegisterDAO daoa = new RegisterDAO();
        AccountDAO dao1 = new AccountDAO();

        String txtSearch = request.getParameter("txt");
        String txtSearch1 = request.getParameter("txtt");
        String name = request.getParameter("name");
        String dateFilter = request.getParameter("dateFilter");
//int courseId =Integer.parseInt( request.getParameter("courseid"));
//int userId = Integer.parseInt(request.getParameter("userid"));
//if(dateFilter != null){

//              List<Register> listS = daoa.getSort(dateFilter);
        request.setAttribute("listRe", txtSearch);
        if (txtSearch != null) {
            List<Blog> list = dao.Search(txtSearch);
            List<Blog_Catergory> list1 = dao.getAllCa();
            Blog last = dao.getLast();
            request.setAttribute("list1", list1);
            request.setAttribute("last", last);
            request.setAttribute("listP", list);

            String userRoleId = request.getParameter("user-Roleid");
            if (userRoleId != null && Integer.parseInt(userRoleId) == 5) {
                request.getRequestDispatcher("MktBlogList.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("ListBlog.jsp").forward(request, response);
            }

        } else if (name != null) {
            int courseid = Integer.parseInt(request.getParameter("id"));
            LessonDAO u = new LessonDAO();
            List<CourseLesson> lst = u.search(name, courseid);
            request.setAttribute("lesson", lst);
            request.setAttribute("courseid", courseid);

            request.getRequestDispatcher("SubjectLesson.jsp").forward(request, response);

        }
        else {
            int id = Integer.parseInt(request.getParameter("userid"));
            List<Register> listS = daoa.Search(txtSearch1, id);
            request.setAttribute("listRe", listS);
            List<Account> cc = dao1.getAccount(id);
            if (!listS.isEmpty()) {
                request.setAttribute("listcc", cc);
            }

            request.getRequestDispatcher("MyRegistrations.jsp").forward(request, response);

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
