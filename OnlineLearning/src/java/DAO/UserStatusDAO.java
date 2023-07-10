/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.ArrayList;
import model.UserStatus;

/**
 *
 * @author dell
 */
public class UserStatusDAO extends MyDAO{
    public UserStatus selectById(UserStatus a) {
        UserStatus ketqua = null;
        xSql = "select * from UserStatus where ID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, a.getId());
            rs = ps.executeQuery();
            /* The cursor on the rs after this statement is in the BOF area, i.e. it is before the first record.
         Thus the first rs.next() statement moves the cursor to the first record
             */

            if (rs.next()) {
                int id = rs.getInt("ID");
                String statusName = rs.getString("StatusName");
                ketqua = new UserStatus(id, statusName);
            } else {
                ketqua = null;
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
        }
        return (ketqua);
    }
    
    public ArrayList<UserStatus> selectAll() {
        ArrayList<UserStatus> us = new ArrayList<>();
        String sql = "select * from userstatus";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                us.add(new UserStatus(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return us ; 
    }
}
