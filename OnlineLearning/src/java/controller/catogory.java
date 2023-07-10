/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.CourseDAO;
import DAO.DAOBlog;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Blog;
import model.Blog_Catergory;
import model.Course;
import model.CourseCatergory;

/**
 *
 * @author DAT
 */
@WebServlet(name = "catogory", urlPatterns = {"/catogory"})
public class catogory extends HttpServlet {

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
        CourseDAO dao1 = new CourseDAO();
        CourseDAO u = new CourseDAO();
        String userRoleId = request.getParameter("user-Roleid");
        String cateID = request.getParameter("cid");
        String cateID2 = request.getParameter("categoryID");
        System.out.println("cate" + cateID2);
        if ("".equals(cateID2)) {
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
            List<CourseCatergory> listCate = u.getAllCa();

            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("listsub", listP);
            request.setAttribute("listCategory", listCate);

            if (userRoleId != null && Integer.parseInt(userRoleId) == 5) {
                request.getRequestDispatcher("MktBlogDetail.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("SubjectsList.jsp").forward(request, response);
            }

        } else if (cateID2 != null) {
            List<Course> list = dao1.getCoursesbyID(cateID2);
            List<CourseCatergory> listCate = u.getAllCa();
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

            List<Course> listP = u.getListByPage(list, start, end);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("listsub", listP);
            request.setAttribute("listCategory", listCate);
            request.getRequestDispatcher("SubjectsList.jsp").forward(request, response);

        }
        if (cateID != null) {
            List<Blog> list = dao.getBlogByID(cateID);
            Blog last = dao.getLast();

            List<Blog_Catergory> list1 = dao.getAllCa();
            request.setAttribute("list1", list1);
            request.setAttribute("last", last);
            request.setAttribute("listP", list);
            request.setAttribute("tag", cateID);
            
            if (userRoleId != null && Integer.parseInt(userRoleId) == 5) {
                request.getRequestDispatcher("MktBlogList.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("ListBlog.jsp").forward(request, response);
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
