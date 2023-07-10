/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.AccountDAO;
import Validate.Validate;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.*;

/**
 *
 * @author dell
 */
public class EditServlet extends HttpServlet {

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
        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("user");
            if (account == null) {
                request.getRequestDispatcher("forbiddenAlert.jsp").forward(request, response);
            }
            String userName = request.getParameter("userName");
            String fullName = request.getParameter("fullName");
            String xGender = request.getParameter("gender");
            boolean gender = Boolean.valueOf(xGender);
            String email = request.getParameter("email");
            String phoneNum = request.getParameter("phoneNumber");
            AccountDAO dao = new AccountDAO();

            dao.editUser(userName, fullName, gender, email, phoneNum, account.getUserName());

            Validate va  = new Validate();
            boolean validateEmail = va.validateEmail(email);
            boolean validatePhone = va.checkPhone(phoneNum);
            if (!account.getUserName().equals(userName)) {
                session.removeAttribute("user");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else if (validateEmail == false || validatePhone == false) {
                request.setAttribute("mess", "Invalid email or phone");
                request.getRequestDispatcher("/edit.jsp").forward(request, response);
            } else {
                account.setUserName(userName);
                account.setFullName(fullName);
                account.setGender(gender);
                account.setEmail(email);
                account.setPhoneNum(phoneNum);
                session.setAttribute("user", account);
                request.getRequestDispatcher("/userprofile.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print(e);
            response.getWriter().print(e.getMessage());
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
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("user");
        if (account == null) {
            request.getRequestDispatcher("forbiddenAlert.jsp").forward(request, response);
        }
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
