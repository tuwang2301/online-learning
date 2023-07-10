/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import DAO.CourseDAO;
import DAO.CourseRegisterDAO;
import DAO.DAOBlog;
import DAO.FeedbackDAO;
import DAO.RegisterDAO;
import DAO.SliderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.CourseRegister;
import model.Feedback;

/**
 *
 * @author dell
 */
public class SellerdashboardServlet extends HttpServlet {

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
        DAOBlog blog = new  DAOBlog();
        
        FeedbackDAO feedback = new FeedbackDAO();
        CourseDAO course = new CourseDAO();
        SliderDAO slider = new SliderDAO();
        CourseRegisterDAO register = new CourseRegisterDAO();
        
        int school1 = blog.countBlogByCategory(1);
        int school3 = blog.countBlogByCategory(2);
        int school4 = blog.countBlogByCategory(3);
        int school8 = blog.countBlogByCategory(4);
        
        request.setAttribute("school1", school1);
        request.setAttribute("school3", school3);
        request.setAttribute("school4", school4);
        request.setAttribute("school8", school8);
        
        int countBlog = blog.countBlog();
       request.setAttribute("countBlog", countBlog);

        int avgStar = blog.AverageStar();
        request.setAttribute("avgstar", avgStar);

        int star1 = feedback.countStar(1);
        int star2 = feedback.countStar(2);
        int star3 = feedback.countStar(3);
        int star4 = feedback.countStar(4);
        int star5 = feedback.countStar(5);
        request.setAttribute("star1", star1);
        request.setAttribute("star2", star2);
        request.setAttribute("star3", star3);
        request.setAttribute("star4", star4);
        request.setAttribute("star5", star5);
        
        Feedback f = feedback.getCourseStar();
        request.setAttribute("product5star", f);
        
        int countSlider = slider.countSlider();
        request.setAttribute("slider", countSlider);
        
        List<Feedback> userfeedback = feedback.getUserFeedback();
        request.setAttribute("userfeedback", userfeedback);
        
        List<CourseRegister> courseRegister = register.mostOrderTop3();
        request.setAttribute("listSell", courseRegister);
        
        List<Feedback> pFeedback = feedback.getUserFeedback();
        request.setAttribute("pFeedback", pFeedback);
        
        request.getRequestDispatcher("marketing/sellerdashboard.jsp").forward(request, response);
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
