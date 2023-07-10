/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.ArrayList;
import model.Course;
import model.CourseRegister;
import model.Register;

/**
 *
 * @author dell
 */
public class CourseRegisterDAO extends MyDAO{
    
    public ArrayList<CourseRegister> mostOrderTop3() {
        ArrayList<CourseRegister> cr = new ArrayList<>();
        String sql = "select top 3 c.CourseId ,c.CourseName ,p.Price, Sum(registerId) as 'count' from courseregister o \n"
                + "join Course c \n"
                + "on c.CourseId = o.CourseId \n"
                + "join registration cr \n"
                + "on  cr.ID = o.CourseId\n"
                + "group by c.CourseId ,c.CourseName ,p.Price\n"
                + "order by count desc";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Course c = new Course(rs.getInt(1), rs.getString(2),rs.getInt(3));
                Register r = new Register(rs.getInt(4));
                cr.add(new CourseRegister(c, r));
            }

        } catch (Exception e) {
        }
        return cr;
    }
    
    public CourseRegister mostOrder() {
        String sql = "select top 1 c.CourseId ,c.CourseName ,p.Price, Sum(registerId) as 'count' from courseregister o \n"
                + "join Course c \n"
                + "on c.CourseId = o.CourseId \n"
                + "join registration cr \n"
                + "on  cr.ID = o.CourseId\n"
                + "group by c.CourseId ,c.CourseName ,p.Price\n"
                + "order by count desc";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                Course c = new Course(rs.getInt(1), rs.getString(2));
                Register r = new Register(rs.getInt(3));
                return new CourseRegister(c, r);
            }

        } catch (Exception e) {
        }
        return null;
    }
}
