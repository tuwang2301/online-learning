package controller;

import DAO.AccountDAO;
import Validate.Validate;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Account;

public class SignupServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin từ biểu mẫu đăng ký
        Validate validate = new Validate();
        AccountDAO aD = new AccountDAO();
        String fullName = request.getParameter("fullname");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNum");
        String gender = request.getParameter("gender");
        request.setAttribute("fullName", fullName);
        request.setAttribute("userName", username);
        request.setAttribute("email", email);
        request.setAttribute("phoneNumber", phoneNumber);
        
        
        //boolean xgender = Boolean.getBoolean(gender);
        String alertName = "", alertUserName = "", alertPassword = "", alertEmail = "", alertPhone = "";
        if (!validate.validateName(fullName)) {
            alertName = "Invalid name! Please enter your real full name";
            request.setAttribute("alertName", alertName);
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        if (aD.getUserByUserName(username) != null) {
            alertUserName = "Username already exist!";
            request.setAttribute("alertUserName", alertUserName);
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        // Kiểm tra tính hợp lệ của dữ liệu (ví dụ: kiểm tra mật khẩu và xác nhận mật khẩu khớp nhau)
        if (!password.equals(confirmPassword)) {
            alertPassword = "Passwords do not match!";
            request.setAttribute("alertPassword", alertPassword);
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        if (!validate.validateEmail(email)) {
            alertEmail = "Email is invalid!";
            request.setAttribute("alertEmail", alertEmail);
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }else if(aD.getUserByEmail(email)!=null){
            alertEmail = "Email already exist! Try <a class=\"text-danger\" href=\"resetpassword.jsp\">Forgot Password</a>";
            request.setAttribute("alertEmail", alertEmail);
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        if (!validate.checkPhone(phoneNumber)) {
            alertPhone = "Phone number is invalid! Phone has to start with 0..";
            request.setAttribute("alertPhone", alertPhone);
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }else if(aD.getUserByPhone(phoneNumber)!=null){
            alertPhone = "Phone already exist! Try <a class=\"text-danger\" href=\"resetpassword.jsp\">Forgot Password</a>";
            request.setAttribute("alertPhone", alertPhone);
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        AccountDAO accountDAO = new AccountDAO();
        Account account = new Account(username, password, fullName, Boolean.valueOf(gender), "VN", email, phoneNumber, 1);

        accountDAO.insert(account);

        // Chuyển hướng đến trang login.jsp với thông báo thành công
        String successMessage = "Sign up successful! You can now login.";
        request.setAttribute("successMessage", successMessage);
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}
