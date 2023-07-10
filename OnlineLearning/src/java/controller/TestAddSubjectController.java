/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.CourseCatergoryDAO;
import DAO.CourseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.CourseCatergory;

/**
 *
 * @author dell
 */
@WebServlet(name = "TestAddSubjectController", urlPatterns = {"/addsubjecttest"})
public class TestAddSubjectController extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TestAddSubjectController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TestAddSubjectController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        CourseCatergoryDAO catergory_dao = new CourseCatergoryDAO();
        List<CourseCatergory> listCatergory = catergory_dao.selectAll();
        PrintWriter out = response.getWriter();
        for (CourseCatergory courseCatergory : listCatergory) {
            out.println(courseCatergory);
        }

        HttpSession session = request.getSession();

        
//
//        request.setAttribute("listCatergory", listCatergory);
//        request.getRequestDispatcher("AddNewSubject.jsp").forward(request, response);
       
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String date = request.getParameter("date");
//        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
        double price = Double.parseDouble(request.getParameter("price"));
//        int status = Integer.parseInt(request.getParameter("status"));       
        boolean status = Integer.parseInt(request.getParameter("status")) != 0;
        System.out.println(date);
        String img = request.getParameter("img");
        Part filePart = request.getPart("img");
                String imageFileName = filePart.getSubmittedFileName();
                InputStream is = filePart.getInputStream();
                byte[] data = new byte[is.available()];
                is.read(data);               
                
        int catergoryId = Integer.parseInt(request.getParameter("categoryID"));
//        Account a = (Account) session.getAttribute("user");       
//        int userId = a.getId();

//        CourseDAO DAO = new CourseDAO();
//        DAO.InsertCourse(name, description, date, price, true , img, catergoryId, userId);
        
//        request.getRequestDispatcher("AddNewSubject.jsp").forward(request, response);
        
        out.println(name);
        out.println(description);
        out.println(date);
        out.println(price);
        out.println(status);
        out.println(img);
        out.println(catergoryId);
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
