/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.*;
import model.*;
import DAO.*;
import java.sql.Timestamp;
import java.time.Duration;
import java.time.LocalDateTime;

public class QuizDAO extends MyDAO {

    public String getExamLevel(int levelId) {
        xSql = "select * from ExamLevel where ExamLevelId = ?";
        String level = "";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, levelId);
            rs = ps.executeQuery();
            while (rs.next()) {
                level = rs.getString("Level");
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (level);
    }

    public String getQuizType(int typeId) {
        xSql = "select * from QuizType where QuizTypeId = ?";
        String quizType = "";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, typeId);
            rs = ps.executeQuery();
            while (rs.next()) {
                quizType = rs.getString("QuizTypeName");
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (quizType);
    }

    public Quiz getQuizz(int QuizId) {
        Quiz x = new Quiz();
        xSql = "select * from Quiz where QuizId = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, QuizId);
            rs = ps.executeQuery();
            CourseDAO cD = new CourseDAO();
            QuizDAO qD = new QuizDAO();
            while (rs.next()) {
//                int quizId, String testName, Course course, String examLevel, int duration, int passRate, String quizType, int numberOfQues, String examDes
                x = new Quiz(rs.getInt("QuizId"), rs.getString("TestName"), cD.getByID(rs.getInt("CourseId") + ""),
                        qD.getExamLevel(rs.getInt("ExamLevelId")), rs.getInt("Duration"), rs.getInt("PassRate"),
                        qD.getQuizType(rs.getInt("QuizTypeId")), rs.getInt("NumberOfQuestions"), rs.getString("ExamDescription"));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (x);
    }

    public List<Quiz> getQuizzes() {
        List<Quiz> t = new ArrayList<>();
        xSql = "select * from Quiz";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            Quiz x;
            CourseDAO cD = new CourseDAO();
            QuizDAO qD = new QuizDAO();
            while (rs.next()) {
//                int quizId, String testName, Course course, String examLevel, int duration, int passRate, String quizType, int numberOfQues, String examDes
                x = new Quiz(rs.getInt("QuizId"), rs.getString("TestName"), cD.getByID(rs.getInt("CourseId") + ""),
                        qD.getExamLevel(rs.getInt("ExamLevelId")), rs.getInt("Duration"), rs.getInt("PassRate"),
                        qD.getQuizType(rs.getInt("QuizTypeId")), rs.getInt("NumberOfQuestions"), rs.getString("ExamDescription"));
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public int getQuizId(int resultId) {
        int quizId = -1;
        xSql = "select * from Result where ResultId = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, resultId);
            rs = ps.executeQuery();
            while (rs.next()) {
                quizId = rs.getInt("QuizId");
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return quizId;
    }

    public static void main(String[] args) {
        QuizDAO qD = new QuizDAO();
        System.out.println(qD.getQuizType(2));
        List<Quiz> quizzes = qD.getQuizzes();
        for (Quiz quizze : quizzes) {
            System.out.println(quizze.getCourse().getCourseName());
        }
        LocalDateTime currentTime = LocalDateTime.now();
        LocalDateTime endTime = currentTime.minusSeconds(3);

        Duration duration = Duration.between(endTime, currentTime);
        long seconds = duration.getSeconds();

        if ((seconds) >= 3) {
            System.out.println("Thời gian hiện tại: " + currentTime);
            System.out.println("Thời gian kết thúc: " + endTime);
            System.out.println("Số giây còn lại: " + seconds);
        }
    }
}
