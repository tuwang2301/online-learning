/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import model.Blog;
import model.Course;
import model.Price;

/**
 *
 * @author DAT
 */
public class PriceDAO extends MyDAO{
     public List<Price> getAll() {
        List<Price> list = new ArrayList<>();
        xSql = "select * from PricePackage ";

        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int PricePackage = rs.getInt(1);
                String PackageName = rs.getString(2);
                   int     Duration = rs.getInt(3);
                    boolean    Status = rs.getBoolean(4);
                    double    ListPrice = rs.getDouble(5);
                        double SalePrice = rs.getDouble(6);
               String Description = rs.getString(7);

                // create object
               Price price = new Price(PricePackage, PackageName, Duration, Status, ListPrice, SalePrice, Description);
                list.add(price);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
       public static void main(String[] args) {
        PriceDAO u = new PriceDAO();
        List<Price> list = u.getAll();
        System.out.println(list);

    }
}
