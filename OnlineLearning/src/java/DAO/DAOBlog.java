/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import com.sun.imageio.plugins.common.BogusColorSpace;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.text.SimpleDateFormat;

import model.Blog;
import java.sql.Date;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import model.Blog_Catergory;

/**
 *
 * @author DAT
 */
public class DAOBlog extends MyDAO {

    public List<Blog_Catergory> getAllCa() {
        List<Blog_Catergory> list = new ArrayList<>();
        xSql = "select * from CatergoryBlog";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int Cid = rs.getInt(1);
                String Cname = rs.getString(2);

                // create object
                Blog_Catergory b = new Blog_Catergory(Cid, Cname);
                list.add(b);
            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {

        }
        return list;
    }

    public List<Blog> getAll() {
        List<Blog> list = new ArrayList<>();
        xSql = "select * from Blog ORDER BY UpdateDate DESC";

        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int Blogid = rs.getInt(1);
                String Image = rs.getString(2),
                        Title = rs.getString(3),
                        Content = rs.getString(4),
                        BriefInfor = rs.getString(5),
                        Author = rs.getString(6);
                Date CreateDate = rs.getDate(7);
                Date UpdateDate = rs.getDate(8);

                int UserID = rs.getInt(9);
                int Cid = rs.getInt(10);

                // create object
                Blog blog = new Blog(Blogid, Image, Title, Content, BriefInfor, Author, CreateDate, UpdateDate, UserID, Cid);
                list.add(blog);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Blog> Search(String txtSearch) {
        List<Blog> list = new ArrayList<>();
        xSql = "select * from Blog where title like ? or  BriefInfor like ?";

        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, "%" + txtSearch + "%");
            ps.setString(2, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                int Blogid = rs.getInt(1);
                String Image = rs.getString(2),
                        Title = rs.getString(3),
                        Content = rs.getString(4),
                        BriefInfor = rs.getString(5),
                        Author = rs.getString(6);
                Date CreateDate = rs.getDate(7);
                Date UpdateDate = rs.getDate(8);

                int UserID = rs.getInt(9);
                int Cid = rs.getInt(10);

                // create object
                Blog blog = new Blog(Blogid, Image, Title, Content, BriefInfor, Author, CreateDate, UpdateDate, UserID, Cid);
                list.add(blog);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Blog> getListByPage(List<Blog> list, int start, int end) {
        ArrayList<Blog> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }
//    public static List<Blog> getListByPage(List<Blog> list, int start, int end) {
//        return list.subList(start, end);
//    }

    public List<Blog> getBlogByID(String cid) {
        List<Blog> list = new ArrayList<>();
        xSql = "select *from  Blog where Cid =?";

        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                int Blogid = rs.getInt(1);
                String Image = rs.getString(2),
                        Title = rs.getString(3),
                        Content = rs.getString(4),
                        BriefInfor = rs.getString(5),
                        Author = rs.getString(6);
                Date CreateDate = rs.getDate(7);
                Date UpdateDate = rs.getDate(8);

                int UserID = rs.getInt(9);
                int Cid = rs.getInt(10);

                // create object
                Blog blog = new Blog(Blogid, Image, Title, Content, BriefInfor, Author, CreateDate, UpdateDate, UserID, Cid);
                list.add(blog);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Blog_Catergory getCaID(String id) {
        xSql = "select * from CatergoryBlog where Cid = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, id);

            rs = ps.executeQuery();
            while (rs.next()) {
                int Cid = rs.getInt(1);
                String Cname = rs.getString(2);

                // create object
                Blog_Catergory b = new Blog_Catergory(Cid, Cname);
                return b;
            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {

        }
        return null;
    }

    public Blog getByID(String id) {
        xSql = "select *from  Blog where Blogid =?";

        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                int Blogid = rs.getInt(1);
                String Image = rs.getString(2),
                        Title = rs.getString(3),
                        Content = rs.getString(4),
                        BriefInfor = rs.getString(5),
                        Author = rs.getString(6);
                Date CreateDate = rs.getDate(7);
                Date UpdateDate = rs.getDate(8);

                int UserID = rs.getInt(9);
                int Cid = rs.getInt(10);

                // create object
                Blog blog = new Blog(Blogid, Image, Title, Content, BriefInfor, Author, CreateDate, UpdateDate, UserID, Cid);
                return blog;
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }

    public Blog getLast() {
        xSql = "SELECT TOP 1 * FROM Blog ORDER BY CreateDate DESC;";

        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int Blogid = rs.getInt(1);
                String Image = rs.getString(2),
                        Title = rs.getString(3),
                        Content = rs.getString(4),
                        BriefInfor = rs.getString(5),
                        Author = rs.getString(6);
                Date CreateDate = rs.getDate(7);
                Date UpdateDate = rs.getDate(8);

                int UserID = rs.getInt(9);
                int Cid = rs.getInt(10);

                // create object
                Blog blog = new Blog(Blogid, Image, Title, Content, BriefInfor, Author, CreateDate, UpdateDate, UserID, Cid);
                return blog;
            }
        } catch (SQLException ex) {
        }
        return null;

    }
    public List<Blog> getFlagBlog() {
        List<Blog> list = new ArrayList<>();
        xSql = "SELECT * FROM Blog WHERE FeatureFlag = 1;";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int Blogid = rs.getInt(1);
                String Image = rs.getString(2),
                Title = rs.getString(3),
                Content = rs.getString(4),
                BriefInfor = rs.getString(5),
                Author = rs.getString(6);
                Date CreateDate = rs.getDate(7);
                Date UpdateDate = rs.getDate(8);
                int UserID = rs.getInt(9);
                int Cid = rs.getInt(10);
                boolean FeatureFlag = rs.getBoolean(11);

                // create object
                Blog blog = new Blog(Blogid, Image, Title, Content, BriefInfor, Author, CreateDate, UpdateDate, UserID, Cid,FeatureFlag);
                list.add(blog);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

    public List<Blog> getByASC() {
        List<Blog> list = new ArrayList<>();
        xSql = "select * from Blog ORDER BY title asc";

        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int Blogid = rs.getInt(1);
                String Image = rs.getString(2),
                        Title = rs.getString(3),
                        Content = rs.getString(4),
                        BriefInfor = rs.getString(5),
                        Author = rs.getString(6);
                Date CreateDate = rs.getDate(7);
                Date UpdateDate = rs.getDate(8);

                int UserID = rs.getInt(9);
                int Cid = rs.getInt(10);

                // create object
                Blog blog = new Blog(Blogid, Image, Title, Content, BriefInfor, Author, CreateDate, UpdateDate, UserID, Cid);
                list.add(blog);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

//    public List<Blog> getSort(String sortOrder) {
//        List<Blog> list = new ArrayList<>();
//        try {
//            // Kết nối với CSDL MySQL
//
//            // Thực hiện truy vấn SQL để lấy danh sách các bài đăng
//            String sql = "SELECT * FROM Blog";
//            if (sortOrder != null && sortOrder.equals("ASC")) {
//                sql += "  ORDER BY CAST(Title AS varchar(255)) ASC";
//            } else if (sortOrder != null && sortOrder.equals("DESC")) {
//                sql += "  ORDER BY CAST(Title AS varchar(255)) DESC";
//            } else if (sortOrder != null && sortOrder.equals("CreateDESC")) {
//                sql += "  ORDER BY CreateDate DESC";
//            } else if (sortOrder != null && sortOrder.equals("CreateASC")) {
//                sql += "  ORDER BY CreateDate ASC";
//            }
//            ps = con.prepareStatement(sql);
//            rs = ps.executeQuery();
//
//            while (rs.next()) {
//                int Blogid = rs.getInt(1);
//                String Image = rs.getString(2),
//                        Title = rs.getString(3),
//                        Content = rs.getString(4),
//                        BriefInfor = rs.getString(5),
//                        Author = rs.getString(6);
//                Date CreateDate = rs.getDate(7);
//                Date UpdateDate = rs.getDate(8);
//
//                int UserID = rs.getInt(9);
//                int Cid = rs.getInt(10);
//
//                // create object
//                Blog blog = new Blog(Blogid, Image, Title, Content, BriefInfor, Author, CreateDate, UpdateDate, UserID, Cid);
//                list.add(blog);
//            }
//
//            // Đóng kết nối và giải phóng tài nguyên
//            rs.close();
//            ps.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
    public List<Blog> getSort(String sortOrder) {
        List<Blog> list = new ArrayList<>();
        try {
            // Kết nối với CSDL MySQL

            // Thực hiện truy vấn SQL để lấy danh sách các bài đăng
            String orderByClause = "";
            if (sortOrder != null) {
                switch (sortOrder) {
                    case "ASC":
                        orderByClause = "ORDER BY CAST(Title AS varchar(255)) ASC";
                        break;
                    case "DESC":
                        orderByClause = "ORDER BY CAST(Title AS varchar(255)) DESC";
                        break;
                    case "CreateDESC":
                        orderByClause = "ORDER BY CreateDate DESC";
                        break;
                    case "CreateASC":
                        orderByClause = "ORDER BY CreateDate ASC";
                        break;
                    default:
                        break;
                }
            }
            String sql = "SELECT * FROM Blog " + orderByClause;
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                int Blogid = rs.getInt(1);
                String Image = rs.getString(2),
                        Title = rs.getString(3),
                        Content = rs.getString(4),
                        BriefInfor = rs.getString(5),
                        Author = rs.getString(6);
                Date CreateDate = rs.getDate(7);
                Date UpdateDate = rs.getDate(8);

                int UserID = rs.getInt(9);
                int Cid = rs.getInt(10);

                // create object
                Blog blog = new Blog(Blogid, Image, Title, Content, BriefInfor, Author, CreateDate, UpdateDate, UserID, Cid);
                list.add(blog);
            }

            // Đóng kết nối và giải phóng tài nguyên
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Blog> getCateName() {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT blog.*, CatergoryBlog.Cname "
                + "FROM blog "
                + "JOIN CatergoryBlog ON blog.cid = CatergoryBlog.cid";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int blogId = rs.getInt("Blogid");
                String image = rs.getString("Image");
                String title = rs.getString("Title");
                String content = rs.getString("Content");
                String briefInfo = rs.getString("BriefInfor");
                String author = rs.getString("Author");
                Date createDate = rs.getDate("CreateDate");
                Date updateDate = rs.getDate("UpdateDate");
                int userId = rs.getInt("UserID");
                int categoryId = rs.getInt("Cid");
                String Cname = rs.getString("Cname"); // Lấy tên danh mục từ bảng CatergoryBlog

                // Tạo đối tượng Blog với các thông tin đã truy vấn được
                Blog blog = new Blog(blogId, image, title, content, briefInfo, author, createDate, updateDate, userId, categoryId);
                blog.setCname(Cname); // Thiết lập tên danh mục cho đối tượng Blog

                // Thêm đối tượng Blog vào danh sách
                list.add(blog);
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int AverageStar() {
        int count = 0;
        try {
            String sql = "select avg(star) as avg_star from feedback";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }

    public int countBlog() {
        int count = 0;
        try {
            String sql = "select count(*) from blog";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }

    public int countBlogByCategory(int catid) {
        int count = 0;
        try {
            String sql = "select count(id) as 'count' from blog \n"
                    + "where catid = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, catid);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }

    public int getCid(String s) {
        int id = 0;
        try {
            String sql = "SELECT Cid FROM CatergoryBlog WHERE Cname = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, s);
            rs = ps.executeQuery();
            if (rs.next()) {
                id = rs.getInt("Cid");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;
    }

    public void EditInfor(int bid, String filename, String title, String briefInfor, String author, String updateDate, String createDate, String cid) {
        int CategoryId = getCid(cid);
        EditImage(filename, bid);
        EditTitle(title, bid);
        EditBriefInfor(briefInfor, bid);
        EditAuthor(author, bid);
        EditCreateDate(createDate, bid);
        EditUpdateDate(updateDate, bid);
        EditCid(CategoryId, bid);
    }

    public void EditCreateDate(String createDate, int bid) {
        try {
            String sql = "UPDATE Blog SET CreateDate = ? WHERE Blogid = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, createDate);
            ps.setInt(2, bid);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                // Cập nhật thành công
                System.out.print("Edit ngày thành công");
            } else {
                // Không có hàng nào được cập nhật
                System.out.print("Edit ngày thất bại");
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ SQLException
            System.out.print("Lỗi SQL: " + e.getMessage());
        }
    }

    public void EditUpdateDate(String updateDate, int bid) {
        try {
            String sql = "UPDATE Blog SET UpdateDate = ? WHERE Blogid = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, updateDate);
            ps.setInt(2, bid);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                // Cập nhật thành công
                System.out.print("Edit ngày thành công");
            } else {
                // Không có hàng nào được cập nhật
                System.out.print("Edit ngày thất bại");
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ SQLException
            System.out.print("Lỗi SQL: " + e.getMessage());
        }
    }

    public void EditImage(String image, int bid) {
        try {
            String sql = "UPDATE Blog SET [Image] = ? WHERE Blogid = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, image);
            ps.setInt(2, bid);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                // Cập nhật thành công
                System.out.print("Edit anh thành công");
            } else {
                // Không có hàng nào được cập nhật
                System.out.print("Edit anh thất bại");
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ SQLException
            System.out.print("Lỗi SQL: " + e.getMessage());
        }
    }

    public void EditTitle(String title, int bid) {
        try {
            String sql = "UPDATE Blog SET Title = ? WHERE Blogid = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, title);
            ps.setInt(2, bid);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                // Cập nhật thành công
                System.out.print("Edit tieu de thành công");
            } else {
                // Không có hàng nào được cập nhật
                System.out.print("Edit tieu de thất bại");
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ SQLException
            System.out.print("Lỗi SQL: " + e.getMessage());
        }
    }

    public void EditBriefInfor(String bf, int bid) {
        try {
            String sql = "UPDATE Blog SET BriefInfor = ? WHERE Blogid = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, bf);
            ps.setInt(2, bid);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                // Cập nhật thành công
                System.out.print("Edit BriefInfo thành công");
            } else {
                // Không có hàng nào được cập nhật
                System.out.print("Edit BriefInfo thất bại");
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ SQLException
            System.out.print("Lỗi SQL: " + e.getMessage());
        }
    }
    
    public void EditAuthor(String author, int bid) {
        try {
            String sql = "UPDATE Blog SET Author = ? WHERE Blogid = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, author);
            ps.setInt(2, bid);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                // Cập nhật thành công
                System.out.print("Edit Author thành công");
            } else {
                // Không có hàng nào được cập nhật
                System.out.print("Edit Author thất bại");
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ SQLException
            System.out.print("Lỗi SQL: " + e.getMessage());
        }
    }

    public void EditCid(int cid , int bid) {
        try {
            String sql = "UPDATE Blog SET Cid = ? WHERE Blogid = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, cid);
            ps.setInt(2, bid);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                // Cập nhật thành công
                System.out.print("Edit Cid thành công");
            } else {
                // Không có hàng nào được cập nhật
                System.out.print("Edit Cid thất bại");
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ SQLException
            System.out.print("Lỗi SQL: " + e.getMessage());
        }
    }
    public void EditFlag(String flag, int BlogId) {
        try {
            String sql = "UPDATE Blog SET FeatureFlag = ? WHERE Blogid = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, flag);
            ps.setInt(2, BlogId);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                // Cập nhật thành công
                System.out.print("Edit Flag thành công");
            } else {
                // Không có hàng nào được cập nhật
                System.out.print("Edit Flag thất bại");
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ SQLException
            System.out.print("Lỗi SQL: " + e.getMessage());
        }
    }
    public static void main(String[] args) {
        DAOBlog dao = new DAOBlog();
//        dao.EditInfor(1, "image/tip.jpg", "Top 10 Tips to Maximize Your Online Learning Experience", "Author A", "2023-01-04", "2023-01-01", "EdTech News", "\"10 Tips for Making the Most of Your Online Learning Experience\" - In this blog post, we share useful tips and tricks for students who are taking online courses,\n"
//                + "		   including how to stay motivated, manage your time effectively, and interact with your professors and classmates.");
//        int cid = dao.getCid("EdTech News");
//        System.out.println(cid);
//        dao.EditImage("image/tip.jpg", 1);
            dao.EditFlag("true", 1);
    }

    

}
