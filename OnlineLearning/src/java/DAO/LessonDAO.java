/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import model.CourseLesson;
import java.sql.*;
import java.util.*;

/**
 *
 * @author admin
 */
public class LessonDAO extends MyDAO {

    public List<CourseLesson> getByCourseId(int CourseId) {
        xSql = "select * from  Lesson where CourseId = ' " + CourseId + "'";
        List<CourseLesson> t = new ArrayList<>();
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            int xCourseId = CourseId;
            int xLessonId;
            String xLessonName;
            String xLessonTopic;
            int xLessonOrder;
            int xLessonTypeId;
            String xVideoLink;
            String xContent;
            boolean xstatus;
            int xQuizId;
            CourseLesson x;
            while (rs.next()) {
                xCourseId = rs.getInt("CourseId");
                xLessonId = rs.getInt("LessonId");
                xLessonName = rs.getString("LessonName");
                xLessonTopic = rs.getString("LessonTopic");
                xLessonOrder = rs.getInt("LessonOrder");
                xLessonTypeId = rs.getInt("LessonTypeId");
                xVideoLink = rs.getString("VideoLink");
                xContent = rs.getString("Content");
                xstatus = rs.getBoolean("status");
                xQuizId = rs.getInt("QuizId");
                x = new CourseLesson(xLessonId, xCourseId, xLessonName, xLessonTopic, xLessonOrder, xLessonTypeId, xVideoLink, xContent, xstatus, xQuizId);

                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return t;

    }

    public int CountLesson(int CourseId) {
        xSql = "SELECT COUNT(LessonId) FROM Lesson where CourseId = ?";
        int count = 0;
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, CourseId);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public String GetCourseName(int id) {
        switch (id) {
            case 1:
                return "Math";
            case 2:
                return "Chemistry";
            case 3:
                return "Physics";
            case 4:
                return "Music";
            case 5:
                return "Biology";
            case 6:
                return "Literature";
            case 7:
                return "English";
            case 8:
                return "Science";
            case 9:
                return "Geography";
            case 10:
                return "History";
        }
        return null;
    }

    public String getCourseImg(int id) {
        xSql = "select image from  Course where CourseId = ?";
        String s = null;
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
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

    public static void main(String[] args) {
        LessonDAO u = new LessonDAO();
        //  List<CourseLesson> name = u.getLessonbystatus( "1","0");
        //System.out.println(name);
    }

    public void updateStatus(String st, String Id) {

        try {
            String orderByClause = "";

            xSql = "UPDATE Lesson SET status = ? WHERE LessonId = ?";

            ps = con.prepareStatement(xSql);
            ps.setString(1, st);

            ps.setString(2, Id);

            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public List<CourseLesson> getLessonbystatus(int Course, String st) {
        xSql = "select * from Lesson where status = ? and CourseId = ?";
        List<CourseLesson> t = new ArrayList<>();
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, st);
            ps.setInt(2, Course);
            rs = ps.executeQuery();

            int xCourseId;
            int xLessonId;
            String xLessonName;
            String xLessonTopic;
            int xLessonOrder;
            int xLessonTypeId;
            String xVideoLink;
            String xContent;
            boolean xstatus;
            int xQuizId;
            CourseLesson x;
            while (rs.next()) {
                xCourseId = rs.getInt("CourseId");
                xLessonId = rs.getInt("LessonId");
                xLessonName = rs.getString("LessonName");
                xLessonTopic = rs.getString("LessonTopic");
                xLessonOrder = rs.getInt("LessonOrder");
                xLessonTypeId = rs.getInt("LessonTypeId");
                xVideoLink = rs.getString("VideoLink");
                xContent = rs.getString("Content");
                xstatus = rs.getBoolean("status");
                xQuizId = rs.getInt("QuizId");
                x = new CourseLesson(xLessonId, xCourseId, xLessonName, xLessonTopic, xLessonOrder, xLessonTypeId, xVideoLink, xContent, xstatus, xQuizId);

                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return t;

    }

    public List<CourseLesson> search(String txt, int id) {
        xSql = "select * from Lesson  where LessonName like ? and CourseId =?";
        List<CourseLesson> t = new ArrayList<>();
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, "%" + txt + "%");
            ps.setInt(2, id);
            rs = ps.executeQuery();

            int xCourseId;
            int xLessonId;
            String xLessonName;
            String xLessonTopic;
            int xLessonOrder;
            int xLessonTypeId;
            String xVideoLink;
            String xContent;
            boolean xstatus;
            int xQuizId;
            CourseLesson x;
            while (rs.next()) {
                xCourseId = rs.getInt("CourseId");
                xLessonId = rs.getInt("LessonId");
                xLessonName = rs.getString("LessonName");
                xLessonTopic = rs.getString("LessonTopic");
                xLessonOrder = rs.getInt("LessonOrder");
                xLessonTypeId = rs.getInt("LessonTypeId");
                xVideoLink = rs.getString("VideoLink");
                xContent = rs.getString("Content");
                xstatus = rs.getBoolean("status");
                xQuizId = rs.getInt("QuizId");
                x = new CourseLesson(xLessonId, xCourseId, xLessonName, xLessonTopic, xLessonOrder, xLessonTypeId, xVideoLink, xContent, xstatus, xQuizId);

                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return t;

    }

    public List<CourseLesson> getListByPage(List<CourseLesson> list, int start, int end) {
        ArrayList<CourseLesson> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

}
