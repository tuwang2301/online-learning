/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.*;
import java.util.*;
import model.Course;
import java.sql.Date;
import model.Course;
import model.CourseCatergory;

/**
 *
 * @author admin
 */
public class CourseDAO extends MyDAO {

    public List<CourseCatergory> getAllCa() {
        List<CourseCatergory> list = new ArrayList<>();
        xSql = "select * from CourseCatergory";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int Cid = rs.getInt(1);
                String Cname = rs.getString(2);

                // create object
                CourseCatergory b = new CourseCatergory(Cid, Cname);
                list.add(b);
            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {

        }
        return list;
    }

    public List<Course> getCoursesbystatus(String cid) {
        List<Course> t = new ArrayList<>();
        xSql = "select * from Course where status = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, cid);
            rs = ps.executeQuery();

            int xCourseId;
            String xCourseName;
            String xCourseDescription;
            Date xCourseCreateDate;
            int xCoursePrice;
            boolean xstatus;
            String ximage;
            int xCatergoryId;
            int xIdUser;
            Course x;
            while (rs.next()) {
                xCourseId = rs.getInt("CourseId");
                xCourseName = rs.getString("CourseName");
                xCourseDescription = rs.getString("CourseDescription");
                xCourseCreateDate = rs.getDate("CourseCreateDate");
                xCoursePrice = rs.getInt("CoursePrice");
                xstatus = rs.getBoolean("status");
                ximage = rs.getString("image");
                xCatergoryId = rs.getInt("CatergoryId");
                xIdUser = rs.getInt("IdUser");
                x = new Course(xCourseId, xCourseName, xCourseDescription, xCourseCreateDate, xCoursePrice, xstatus, ximage, xCatergoryId, xIdUser);
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public List<Course> getCoursesbyID(String cid) {
        List<Course> t = new ArrayList<>();
        xSql = "select * from Course where CatergoryId = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, cid);
            rs = ps.executeQuery();

            int xCourseId;
            String xCourseName;
            String xCourseDescription;
            Date xCourseCreateDate;
            int xCoursePrice;
            boolean xstatus;
            String ximage;
            int xCatergoryId;
            int xIdUser;
            Course x;
            while (rs.next()) {
                xCourseId = rs.getInt("CourseId");
                xCourseName = rs.getString("CourseName");
                xCourseDescription = rs.getString("CourseDescription");
                xCourseCreateDate = rs.getDate("CourseCreateDate");
                xCoursePrice = rs.getInt("CoursePrice");
                xstatus = rs.getBoolean("status");
                ximage = rs.getString("image");
                xCatergoryId = rs.getInt("CatergoryId");
                xIdUser = rs.getInt("IdUser");
                x = new Course(xCourseId, xCourseName, xCourseDescription, xCourseCreateDate, xCoursePrice, xstatus, ximage, xCatergoryId, xIdUser);
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public List<Course> getCourses() {
        List<Course> t = new ArrayList<>();
        xSql = "select * from Course ";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            int xCourseId;
            String xCourseName;
            String xCourseDescription;
            Date xCourseCreateDate;
            int xCoursePrice;
            boolean xstatus;
            String ximage;
            int xCatergoryId;
            int xIdUser;
            String xfeatureflag;
            Course x;
            while (rs.next()) {
                xCourseId = rs.getInt("CourseId");
                xCourseName = rs.getString("CourseName");
                xCourseDescription = rs.getString("CourseDescription");
                xCourseCreateDate = rs.getDate("CourseCreateDate");
                xCoursePrice = rs.getInt("CoursePrice");
                xstatus = rs.getBoolean("status");
                ximage = rs.getString("image");
                xCatergoryId = rs.getInt("CatergoryId");
                xIdUser = rs.getInt("IdUser");
                xfeatureflag = rs.getString("featureflag");
                x = new Course(xCourseId, xCourseName, xCourseDescription, xCourseCreateDate, xCoursePrice, xstatus, ximage, xCatergoryId, xIdUser, xfeatureflag);
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public Course getByID(String id) {
        xSql = "select *from  Course where CourseId =?";

        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            int xCourseId;
            String xCourseName;
            String xCourseDescription;
            Date xCourseCreateDate;
            int xCoursePrice;
            boolean xstatus;
            String ximage;
            int xCatergoryId;
            int xIdUser;
            Course x;
            while (rs.next()) {
                xCourseId = rs.getInt("CourseId");
                xCourseName = rs.getString("CourseName");
                xCourseDescription = rs.getString("CourseDescription");
                xCourseCreateDate = rs.getDate("CourseCreateDate");
                xCoursePrice = rs.getInt("CoursePrice");
                xstatus = rs.getBoolean("status");
                ximage = rs.getString("image");
                xCatergoryId = rs.getInt("CatergoryId");
                xIdUser = rs.getInt("IdUser");
                x = new Course(xCourseId, xCourseName, xCourseDescription, xCourseCreateDate, xCoursePrice, xstatus, ximage, xCatergoryId, xIdUser);
                return x;
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }

    public List<Course> SearchByName(String str) {
        List<Course> t = new ArrayList<>();
        xSql = "select * from Course where CourseName like ? ";
        int xCourseId;
        String xCourseName;
        String xCourseDescription;
        Date xCourseCreateDate;
        int xCoursePrice;
        boolean xstatus;
        String ximage;
        int xCatergoryId;
        int xIdUser;
        Course x;
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, "%" + str + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                xCourseId = rs.getInt("CourseId");
                xCourseName = rs.getString("CourseName");
                xCourseDescription = rs.getString("CourseDescription");
                xCourseCreateDate = rs.getDate("CourseCreateDate");
                xCoursePrice = rs.getInt("CoursePrice");
                xstatus = rs.getBoolean("status");
                ximage = rs.getString("image");
                xCatergoryId = rs.getInt("CatergoryId");
                xIdUser = rs.getInt("IdUser");
                x = new Course(xCourseId, xCourseName, xCourseDescription, xCourseCreateDate, xCoursePrice, xstatus, ximage, xCatergoryId, xIdUser);
                t.add(x);

            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public void updateStatus(String submit) {

        xSql = "UPDATE course SET status = 1 WHERE CourseId = ?";

        try {

            ps = con.prepareStatement(xSql);
            ps.setString(1, submit);
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public List<Course> SortByDateAsc() {
        List<Course> t = new ArrayList<>();
        xSql = "SELECT * FROM Course ORDER BY CourseCreateDate ASC";
        int xCourseId;
        String xCourseName;
        String xCourseDescription;
        Date xCourseCreateDate;
        int xCoursePrice;
        boolean xstatus;
        String ximage;
        int xCatergoryId;
        int xIdUser;
        Course x;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                xCourseId = rs.getInt("CourseId");
                xCourseName = rs.getString("CourseName");
                xCourseDescription = rs.getString("CourseDescription");
                xCourseCreateDate = rs.getDate("CourseCreateDate");
                xCoursePrice = rs.getInt("CoursePrice");
                xstatus = rs.getBoolean("status");
                ximage = rs.getString("image");
                xCatergoryId = rs.getInt("CatergoryId");
                xIdUser = rs.getInt("IdUser");
                x = new Course(xCourseId, xCourseName, xCourseDescription, xCourseCreateDate, xCoursePrice, xstatus, ximage, xCatergoryId, xIdUser);
                t.add(x);

            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public void updateStatus(String st, String courseId) {

        try {
            String orderByClause = "";

            xSql = "UPDATE course SET status = ? WHERE CourseId = ?";

            ps = con.prepareStatement(xSql);
            ps.setString(1, st);

            ps.setString(2, courseId);

            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } 
    }

    public List<Course> SortByDateDsc() {
        List<Course> t = new ArrayList<>();
        xSql = "SELECT * FROM Course ORDER BY CourseCreateDate DESC";
        int xCourseId;
        String xCourseName;
        String xCourseDescription;
        Date xCourseCreateDate;
        int xCoursePrice;
        boolean xstatus;
        String ximage;
        int xCatergoryId;
        int xIdUser;
        Course x;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                xCourseId = rs.getInt("CourseId");
                xCourseName = rs.getString("CourseName");
                xCourseDescription = rs.getString("CourseDescription");
                xCourseCreateDate = rs.getDate("CourseCreateDate");
                xCoursePrice = rs.getInt("CoursePrice");
                xstatus = rs.getBoolean("status");
                ximage = rs.getString("image");
                xCatergoryId = rs.getInt("CatergoryId");
                xIdUser = rs.getInt("IdUser");
                x = new Course(xCourseId, xCourseName, xCourseDescription, xCourseCreateDate, xCoursePrice, xstatus, ximage, xCatergoryId, xIdUser);
                t.add(x);

            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public List<Course> SortByPriceAsc() {
        List<Course> t = new ArrayList<>();
        xSql = "SELECT * FROM Course ORDER BY CoursePrice ASC";
        int xCourseId;
        String xCourseName;
        String xCourseDescription;
        Date xCourseCreateDate;
        int xCoursePrice;
        boolean xstatus;
        String ximage;
        int xCatergoryId;
        int xIdUser;
        Course x;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                xCourseId = rs.getInt("CourseId");
                xCourseName = rs.getString("CourseName");
                xCourseDescription = rs.getString("CourseDescription");
                xCourseCreateDate = rs.getDate("CourseCreateDate");
                xCoursePrice = rs.getInt("CoursePrice");
                xstatus = rs.getBoolean("status");
                ximage = rs.getString("image");
                xCatergoryId = rs.getInt("CatergoryId");
                xIdUser = rs.getInt("IdUser");
                x = new Course(xCourseId, xCourseName, xCourseDescription, xCourseCreateDate, xCoursePrice, xstatus, ximage, xCatergoryId, xIdUser);
                t.add(x);

            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public List<Course> SortByPriceDsc() {
        List<Course> t = new ArrayList<>();
        xSql = "SELECT * FROM Course ORDER BY CoursePrice DESC";
        int xCourseId;
        String xCourseName;
        String xCourseDescription;
        Date xCourseCreateDate;
        int xCoursePrice;
        boolean xstatus;
        String ximage;
        int xCatergoryId;
        int xIdUser;
        Course x;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                xCourseId = rs.getInt("CourseId");
                xCourseName = rs.getString("CourseName");
                xCourseDescription = rs.getString("CourseDescription");
                xCourseCreateDate = rs.getDate("CourseCreateDate");
                xCoursePrice = rs.getInt("CoursePrice");
                xstatus = rs.getBoolean("status");
                ximage = rs.getString("image");
                xCatergoryId = rs.getInt("CatergoryId");
                xIdUser = rs.getInt("IdUser");
                x = new Course(xCourseId, xCourseName, xCourseDescription, xCourseCreateDate, xCoursePrice, xstatus, ximage, xCatergoryId, xIdUser);
                t.add(x);

            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public List<Course> SortCourse(String xSortColName, String xSortType) {
        List<Course> t = new ArrayList<>();
        xSql = "select * from Course order by " + xSortColName + " " + xSortType;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            int xCourseId;
            String xCourseName;
            String xCourseDescription;
            Date xCourseCreateDate;
            int xCoursePrice;
            boolean xstatus;
            String ximage;
            int xCatergoryId;
            int xIdUser;
            Course x;

            while (rs.next()) {
                xCourseId = rs.getInt("CourseId");
                xCourseName = rs.getString("CourseName");
                xCourseDescription = rs.getString("CourseDescription");
                xCourseCreateDate = rs.getDate("CourseCreateDate");
                xCoursePrice = rs.getInt("CoursePrice");
                xstatus = rs.getBoolean("status");
                ximage = rs.getString("image");
                xCatergoryId = rs.getInt("CatergoryId");
                xIdUser = rs.getInt("IdUser");
                x = new Course(xCourseId, xCourseName, xCourseDescription, xCourseCreateDate, xCoursePrice, xstatus, ximage, xCatergoryId, xIdUser);
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    @Override
    public List<String> getColNames(String tableName) {
        List<String> colNames = new ArrayList<>();
        xSql = "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = ?  AND COLUMN_NAME IN ('CourseId','CourseName','CourseCreateDate','CoursePrice')";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, tableName);
            rs = ps.executeQuery();
            while (rs.next()) {
                colNames.add(rs.getString(1));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (colNames);
    }
    
    public List<Course> getCoursebycategory(int id){
        List<Course> t = new ArrayList<>();
        xSql = "select * from Course where CatergoryId = ? ";
        int xCourseId;
        String xCourseName;
        String xCourseDescription;
        Date xCourseCreateDate;
        int xCoursePrice;
        boolean xstatus;
        String ximage;
        int xCatergoryId;
        int xIdUser;
        Course x;
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1,id);
            rs = ps.executeQuery();
            while (rs.next()) {
                xCourseId = rs.getInt("CourseId");
                xCourseName = rs.getString("CourseName");
                xCourseDescription = rs.getString("CourseDescription");
                xCourseCreateDate = rs.getDate("CourseCreateDate");
                xCoursePrice = rs.getInt("CoursePrice");
                xstatus = rs.getBoolean("status");
                ximage = rs.getString("image");
                xCatergoryId = rs.getInt("CatergoryId");
                xIdUser = rs.getInt("IdUser");
                x = new Course(xCourseId, xCourseName, xCourseDescription, xCourseCreateDate, xCoursePrice, xstatus, ximage, xCatergoryId, xIdUser);
                t.add(x);

            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

//  public static void main(String[] args) {
//        CourseDAO courseDAO = new CourseDAO();
//  int courseId = 1; // id của khóa học cần cập nhật trạng thái
//       
//  boolean isActive = false; // trạng thái mới của khóa học
//
//        return null;
//
//    }
    public List<Course> getListByPage(List<Course> list, int start, int end) {
        ArrayList<Course> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public int countCourse() {
        int count = 0;
        String sql = "select count(*) as 'count' from course";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }

    public String getCategoryName(int CategoryId) {
        String sql = "select CatergoryName from CourseCatergory where CatergoryId = ? ";
        String s = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, CategoryId);
            rs = ps.executeQuery();
            if (rs.next()) {
                s = rs.getString(1);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }

    public String getCatergory(int id) {
        String s = null;
        String sql = "SELECT Course.CatergoryId, CourseCatergory.CatergoryName\n"
                + "FROM Course\n"
                + "JOIN CourseCatergory ON Course.CatergoryId = CourseCatergory.CatergoryId where Course.CatergoryId = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                s = rs.getString("CatergoryName");
            }
        } catch (Exception e) {
        }
        return s;
    }
    public List<Course> getFlagCourse() {
        List<Course> list = new ArrayList<>();
        xSql = "SELECT * FROM Course WHERE featureflag = 1;";
        Course course;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int Courseid = rs.getInt(1);
                String CourseName = rs.getString(2),
                CourseDescription = rs.getString(3);
                Date CourseCreateDate = rs.getDate(4);
                int CoursePrice = rs.getInt(5);
                boolean status = rs.getBoolean(6);
                String image = rs.getString(7);
                int CatergoryId = rs.getInt(8);
                int IdUser = rs.getInt(9);
                String featureflag = rs.getString(10);

                // create object
                course = new Course(Courseid, CourseName, CourseDescription, CourseCreateDate, CoursePrice, status, image, CatergoryId, IdUser, featureflag);
                list.add(course);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

    public void InsertCourse(String name, String description, String date, double price, boolean status, String xAvatar, int catergoryId, int userId, String featureflag) {

    String sql = "INSERT INTO [dbo].[Course] \n"
            + "([CourseName], [CourseDescription], [CourseCreateDate], [CoursePrice], [status], [image], [CatergoryId], [IdUser], [featureflag]) \n"
            + "VALUES(?,?,?,?,?,?,?,?,?)";
    try {
        ps = con.prepareStatement(sql);
        ps.setString(1, name);
        ps.setString(2, description);
        ps.setString(3, date);
        ps.setDouble(4, price);
        ps.setBoolean(5, status);
        ps.setString(6, xAvatar);
        ps.setInt(7, catergoryId);
        ps.setInt(8, userId);
        ps.setString(9, featureflag);

        ps.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }

}

    public static void main(String[] args) {
        CourseDAO u = new CourseDAO();
//        List<Course> list = u.SortByDateDsc();
//        System.out.println(list);
//        u.updateStatus("1", "1");
//        List<CourseCatergory> list = u.getAllCa();
//        for (CourseCatergory courseCatergory : list) {
//            System.out.println(courseCatergory.getCatergoryId());
//        }
        List<Course> getCourses = u.getCoursebycategory(1);
        System.out.println(getCourses);
//        u.InsertCourse("dat", "ok", "2023-06-22", 1200, false, "xAvatar", 1, 1, "1");
        
    }
}
