/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.ArrayList;
import java.util.List;
import model.CourseCatergory;

/**
 *
 * @author dell
 */
public class CourseCatergoryDAO extends MyDAO {

    public ArrayList<CourseCatergory> selectAll() {
        ArrayList<CourseCatergory> t = new ArrayList<>();
        xSql = "select * from CourseCatergory";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int catergoryId = rs.getInt("CatergoryId");
                String catergoryName = rs.getString("CatergoryName");

                CourseCatergory x = new CourseCatergory(catergoryId, catergoryName);
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public static void main(String[] args) {
        CourseCatergoryDAO dao = new CourseCatergoryDAO();
        List<CourseCatergory> list = dao.selectAll();
        for (CourseCatergory courseCatergory : list) {
            System.out.println(courseCatergory);
        }

    }

}
