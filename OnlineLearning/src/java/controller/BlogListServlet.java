/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.DAOBlog;

import model.Blog;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import model.Blog_Catergory;

/**
 *
 * @author DAT
 */
@WebServlet(name = "BlogListServlet", urlPatterns = {"/BlogListServlet"})
public class BlogListServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOBlog dao = new DAOBlog();
        PrintWriter out = response.getWriter();
        List<Blog> list = dao.getAll();
        Blog last = dao.getLast();
        List<Blog> FlagBlog = dao.getFlagBlog();
        List<Blog_Catergory> list1 = dao.getAllCa();
        String sortOrder = request.getParameter("sortOrder"); // Lấy tham số sortOrder từ request
        List<Blog> listS = dao.getSort(sortOrder);
//                Gọi phương thức getAll() với sortOrder tương ứng
//               phan trang
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
        List<Blog> listP = dao.getListByPage(list, start, end);
        List<Blog> listPS = dao.getListByPage(listS, start, end);
        request.setAttribute("listP", listP);
        request.setAttribute("listP", listPS);
        request.setAttribute("list1", list1);
        request.setAttribute("last", last);
        request.setAttribute("num", num);
        request.setAttribute("page", page);
        request.setAttribute("FlagBlog", FlagBlog);
        String userRoleId = request.getParameter("user-Roleid");
        if (userRoleId != null && Integer.parseInt(userRoleId) == 5) {
            request.getRequestDispatcher("MktBlogList.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("ListBlog.jsp").forward(request, response);
        }

    }
}
