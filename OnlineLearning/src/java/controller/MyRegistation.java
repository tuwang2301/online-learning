/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.AccountDAO;
import DAO.RegisterDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Account;
import model.Register;

/**
 *
 * @author DAT
 */
@WebServlet(name = "MyRegistation", urlPatterns = {"/myregistation"})
public class MyRegistation extends HttpServlet {

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
             RegisterDAO dao = new RegisterDAO();
          AccountDAO  dao1 = new AccountDAO();
              int userid = Integer.parseInt(request.getParameter("user-id"));
             // int dateFilter = Integer.parseInt(request.getParameter("dateFilter"));
             String dateFilter = request.getParameter("dateFilter");
             String url = request.getParameter("url");
//int courseId =Integer.parseInt( request.getParameter("courseid"));
//int userId = Integer.parseInt(request.getParameter("userid"));
          

int n;
//n = dao.deleteRegister(courseId, userid);
      List<Register> list = dao.getRegister(userid);
    List<Account> cc = dao1.getAccount(userid);
                 

    request.setAttribute("listRe", list);
//    if(dateFilter != null){
//        List<Register> listS = dao.getSort(dateFilter);
//   request.setAttribute("listRe", listS);
//   request.setAttribute("listcc", cc);

//      request.getRequestDispatcher("MyRegistrations.jsp").forward(request, response);
//
//    }
//   
if(!list.isEmpty()){
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
