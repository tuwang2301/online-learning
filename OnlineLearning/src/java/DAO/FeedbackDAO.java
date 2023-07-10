/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Course;
import model.Feedback;

/**
 *
 * @author dell
 */
public class FeedbackDAO extends MyDAO{
    
    public void addFeedback(Feedback feedback, Course c, Account a) {
        String sql = "insert into Feedback values (?,?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, a.getId());
            ps.setInt(2, c.getCourseId());
            ps.setInt(3, feedback.getStar());
            ps.setString(4, feedback.getFeedbackDetail());
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
   public int countStar(int star) {
        int count = 0;
        String sql = "select count(*) as count_star from feedback where star = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, star);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    } 
   
   public Feedback getCourseStar() {
        try {
            String sql = "select top 1 p.productName , count(star) as max_star from feedback f \n"
                    + "join product p \n"
                    + "on f.productID = p.productID\n"
                    + "where star = 5 \n"
                    + "group by p.productName\n"
                    + "order by max_star desc";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                Course c = new Course(rs.getString(1));
                return new Feedback(c, rs.getInt(2));
            }
        } catch (Exception e) {
        }
        return null;
    }
   
    public List<Feedback> getUserFeedback() {
        List<Feedback> list = new ArrayList<>();
        try {
            String sql = "select top 3 userName , count(star) as count_star  from feedback f \n"
                    + "join users u \n"
                    + "on f.userID = u.userID\n"
                    + "group by userName\n"
                    + "order by count_star desc";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account a = new Account(rs.getString(1));
                list.add(new Feedback(a, rs.getInt(2)));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    
}
