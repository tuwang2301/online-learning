
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
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Course;
import model.CourseCatergory;

/**
 *
 * @author dell
 */
@WebServlet(name = "AddSubject", urlPatterns = {"/addsubject"})
@MultipartConfig(maxFileSize = 1048576, maxRequestSize = 2097152)
public class AddSubject extends HttpServlet {

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
        CourseDAO dao = new CourseDAO();
        List<Course> coursestatus = dao.getCourses();
        
        CourseCatergoryDAO catergory_dao = new CourseCatergoryDAO();
        List<CourseCatergory> listCatergory = catergory_dao.selectAll();
        System.out.println("vai ca lon "+coursestatus);
        
        request.setAttribute("coursestatus", coursestatus);
        request.setAttribute("listCatergory", listCatergory);
        request.getRequestDispatcher("AddNewSubject.jsp").forward(request, response);
        
        processRequest(request, response);
        HttpSession session = request.getSession();

//        String name = request.getParameter("name");
//        String description = request.getParameter("description");
//
//        String dateString = request.getParameter("date");
//        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//
//        Calendar calendar = Calendar.getInstance();
//        Date date = calendar.getTime();
//        try {
//            calendar.setTime(dateFormat.parse(dateString));
//
//            // Lấy ngày, tháng và năm từ Calendar
//            int year = calendar.get(Calendar.YEAR);
//            int month = calendar.get(Calendar.MONTH) + 1;
//            int day = calendar.get(Calendar.DAY_OF_MONTH);
//
//            System.out.println("Ngày: " + day);
//            System.out.println("Tháng: " + month);
//            System.out.println("Năm: " + year);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
////        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
//        double price = Double.parseDouble(request.getParameter("price"));
////        int status = Integer.parseInt(request.getParameter("status")); 
//
//        boolean status = Integer.parseInt(request.getParameter("status")) != 0;
//
//        String img = request.getParameter("img");
//        Part filePart = request.getPart("img");
//        String imageFileName = filePart.getSubmittedFileName();
//        InputStream is = filePart.getInputStream();
//        byte[] data = new byte[is.available()];
//        is.read(data);
//
//        int catergoryId = Integer.parseInt(request.getParameter("categoryID"));
//        Account a = (Account) session.getAttribute("user");
//        int userId = a.getId();
//
//        boolean featureflag = Integer.parseInt(request.getParameter("featureflag")) != 0;
//
//        CourseDAO DAO = new CourseDAO();
////        DAO.InsertCourse(name, description, (java.sql.Date) currentDate, price, true, img, catergoryId, userId, true);
//        DAO.InsertCourse(name, description, (java.sql.Date) date, price, status, img, catergoryId, userId, status);
//
//        request.getRequestDispatcher("AddNewSubject.jsp").forward(request, response);
//        PrintWriter out = response.getWriter();
//        out.println(name);
//        out.println(description);
//        out.println(date);
//        out.println(price);
//        out.println(status);
//        out.println(img);
//        out.println(catergoryId);
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

        HttpSession session = request.getSession();

        String name = request.getParameter("content");
        String description = request.getParameter("Description");

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        LocalDateTime curDate = java.time.LocalDateTime.now();
        String date = curDate.toString();
        Calendar calendar = Calendar.getInstance();

//        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
        double price = Double.parseDouble(request.getParameter("price"));
//        int status = Integer.parseInt(request.getParameter("status")); 

        boolean status = Integer.parseInt(request.getParameter("status")) != 0;

//        String img = request.getParameter("img");
//        Part filePart = request.getPart("img");
//        String imageFileName = filePart.getSubmittedFileName();
//        InputStream is = filePart.getInputStream();
//        byte[] data = new byte[is.available()];
//        is.read(data);
//        Part file = request.getPart("avatar");
//        String xAvatar = file.getSubmittedFileName();
//        String uploadPath = "C:\\Users\\dell\\Documents\\NetBeansProjects\\tuanVM\\summer2023-swp391.se1714-g3\\OnlineLearning\\web\\image" ;
//        //String uploadPath = request.getServletContext().getRealPath("/") + "assets/img/" + xAvatar;
//        
//        try {
//            FileOutputStream fos = new FileOutputStream(uploadPath);
//            InputStream is = file.getInputStream();
//            byte[] data = new byte[is.available()];
//            is.read(data);
//            fos.write(data);
//            fos.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
    String filename = null;
        try{
        //Upload photo
        Part part = request.getPart("avatar");
        String realPath = "C:\\Users\\quang\\Documents\\FPT\\Summer2023\\SWP391\\Project\\summer2023-swp391.se1714-g3\\OnlineLearning\\web\\image";
//        String realPath = request.getServletContext().getRealPath("/image/");
        String submittedFileName = part.getSubmittedFileName();
        filename = Paths.get(submittedFileName).getFileName().toString();
        if (!Files.exists(Paths.get(realPath))) {
            Files.createDirectory(Paths.get(realPath));
        }
        part.write(realPath + "/" + filename);
        filename = "image/" + filename;
//        out.println(filename);
        }catch(Exception e){
            
            
        }
        int catergoryId = Integer.parseInt(request.getParameter("cat"));
        Account a = (Account) session.getAttribute("user");
        int userId = a.getId();

        String featureflag = request.getParameter("featureflag") ;

        CourseDAO DAO = new CourseDAO();
//        DAO.InsertCourse(name, description, (java.sql.Date) currentDate, price, true, img, catergoryId, userId, true);
        DAO.InsertCourse(name, description, date, price, status, filename, catergoryId, userId, featureflag);

        request.getRequestDispatcher("AddNewSubject.jsp").forward(request, response);

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
