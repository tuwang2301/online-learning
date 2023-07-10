package controller;

import DAO.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.*;

public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountDAO userDAO = new AccountDAO();
        // Lấy thông tin đăng nhập từ request
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String currentUrl = request.getParameter("url");
        String referer = request.getHeader("Referer");
        //  String a = referer;
//System.out.println("Current URL4: " + currentUrl);
//System.out.println("Referer: " + referer);

        if (referer != null && !referer.endsWith("login.jsp")) {
            Cookie loginReferer = new Cookie("loginReferer", referer);
            loginReferer.setMaxAge(60 * 60 * 24); // 1 day
            response.addCookie(loginReferer);
        }
        Cookie[] cookies = request.getCookies();
        String loginRefererUrl = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("loginReferer")) {
                    loginRefererUrl = cookie.getValue();
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                    break;
                }
            }
        }
//System.out.println("pass: " + loginRefererUrl);

        // Kiểm tra thông tin đăng nhập
        if (isValidLogin(username, password)) {
            Account x = userDAO.getUser(username, password);
            request.getSession().setAttribute("user", x);
            request.getSession().setAttribute("roleName", userDAO.getRoleName(x.getRoleId()).toLowerCase());
            HttpSession session = request.getSession();
            session.setAttribute("user", x);
            // Đăng nhập thành công, chuyển hướng đến trang chính

//System.out.println("Current URl2moi: " + loginRefererUrl);
            if (loginRefererUrl != null) {
                // Chuyển hướng đến trang được lưu trong trường ẩn currentUrl
                response.sendRedirect(loginRefererUrl);

            } else {
                // Nếu không, chuyển hướng đến trang chính (hoặc trang mặc định của ứng dụng)
                response.sendRedirect("home");
            }
        } else {
            request.setAttribute("alert", "Sorry, we can't find an account with this username. Please try again or create a new account.");
            // Đăng nhập không thành công, chuyển hướng đến trang đăng nhập lại
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    private boolean isValidLogin(String username, String password) {
        // Kiểm tra thông tin đăng nhập trong cơ sở dữ liệu
        AccountDAO userDAO = new AccountDAO();
        Account user = userDAO.getUser(username, password);
        if (user != null && user.getPassWord().equals(password)) {
            return true;
        }
        return false;
    }
}
