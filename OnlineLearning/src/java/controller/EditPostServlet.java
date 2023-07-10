package controller;

import DAO.DAOBlog;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import model.Blog;
import model.Blog_Catergory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author admin
 */
@MultipartConfig(maxFileSize = 1048576, maxRequestSize = 2097152)
public class EditPostServlet extends HttpServlet {

    /**
     * URL pattern : /editpost
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        DAOBlog dao = new DAOBlog();
        String anh = request.getParameter("anh");
        String flag = request.getParameter("flag");
        String filename;
        try{
        //Upload photo
        Part part = request.getPart("image");
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
            filename = anh;
            
        }
        String bid = request.getParameter("bid");
        int BlogId = Integer.parseInt(bid);
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String updatedate = request.getParameter("update-date");
        String createdate = request.getParameter("create-date");
        String category = request.getParameter("category");
        String blogdetail = request.getParameter("blog-detail");
//        out.println(title);
//        out.println(author);
//        out.println(updatedate);
//        out.println(createdate);
//        out.println(category);
//        out.println(blogdetail);
//        out.print(filename);
        dao.EditInfor(BlogId,filename,title,blogdetail,author,updatedate,createdate,category);
        dao.EditFlag(flag,BlogId);
        List<Blog_Catergory> list1 = dao.getAllCa();
        Blog last = dao.getLast();
        Blog b = dao.getByID(bid);
        Blog_Catergory c = dao.getCaID(bid);
        request.setAttribute("bid", bid);
        request.setAttribute("list1", list1);
        request.setAttribute("last", last);
        request.setAttribute("Cateid", c);
        request.setAttribute("detail", b);
        request.getRequestDispatcher("MktBlogDetail.jsp").forward(request, response);
    }
}
