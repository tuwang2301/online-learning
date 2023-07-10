package controller;

import DAO.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.*;

public class ChangePasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Lấy thông tin từ request
        String currentPassword = request.getParameter("current-password");
        String newPassword = request.getParameter("new-password");
        String confirmPassword = request.getParameter("confirm-password");
        Account user = (Account) request.getSession().getAttribute("user");
        if(!user.getPassWord().equals(currentPassword)){
            // Gán thông báo lỗi vào attribute errorMessage
            request.setAttribute("errorMessage", "Wrong current password");
            // Forward request và response tới changepassword.jsp
            request.getRequestDispatcher("changepassword.jsp").forward(request, response);
            return;
        }
        
        // Kiểm tra mật khẩu mới và mật khẩu xác nhận
        if (!newPassword.equals(confirmPassword)) {
            // Gán thông báo lỗi vào attribute errorMessage
            request.setAttribute("errorMessage", "Passwords do not match!");
            // Forward request và response tới changepassword.jsp
            request.getRequestDispatcher("changepassword.jsp").forward(request, response);
            return;
        }

        AccountDAO aD = new AccountDAO();
        aD.updatePassword(user.getUserName(), newPassword);
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}
