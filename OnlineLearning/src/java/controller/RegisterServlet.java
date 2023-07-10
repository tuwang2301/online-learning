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
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.List;
import model.Account;
import model.Register;

/**
 *
 * @author DAT
 */
@WebServlet(name = "Register", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

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
          String submit = request.getParameter("submit");
          String Coursename = request.getParameter("course-name");
            int courseID = Integer.parseInt(request.getParameter("course-id"));
    double price = Double.parseDouble(request.getParameter("price"));
    int userid = Integer.parseInt(request.getParameter("user-id"));
    List<Register> re = dao.getCourse(userid);
    List<Register> list = dao.getRegister(userid);
    List<Account> cc = dao1.getAccount(userid);
    double salePrice = Double.parseDouble(request.getParameter("sale-price"));
    double packagePrice = Double.parseDouble(request.getParameter("package").split(":")[1]);
    int pakageID = Integer.parseInt(request.getParameter("package").split(":")[2]);
    String pakageName = request.getParameter("package").split(":")[3];
    String validFrom = request.getParameter("valid-from");
    String validTo =request.getParameter("valid-to");
    double total = Double.parseDouble(request.getParameter("total"));
          String currentUrl = request.getParameter("url");
      String referer = request.getHeader("Referer");
request.setAttribute("listRe", list);
request.setAttribute("Acc", cc);
request.setAttribute("Coursename", Coursename);
request.setAttribute("pakageName", pakageName);

    boolean hasCourseId = false;
for (Register r : re) {
    if (r.getCourseId() == courseID) {
        hasCourseId = true;
        break;
    }
}

if (hasCourseId) {
    // In ra thông báo đã đăng ký rồi
    String message = "Bạn đã đăng ký khóa học";
    request.getSession().setAttribute("message", message);
    response.sendRedirect(referer);
                System.out.println("link"+message);

} else {
    // Thêm mới đối tượng vào database
    Register reg = new Register(userid, validFrom, pakageID, total, validFrom, validTo, true, courseID);

                    dao.Register(reg);
              String message = "Bạn  đăng ký khóa học thành công";
    request.getSession().setAttribute("message", message);      
          response.sendRedirect("course");
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
