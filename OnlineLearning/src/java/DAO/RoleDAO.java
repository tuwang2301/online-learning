/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.ArrayList;
import model.Role;

/**
 *
 * @author dell
 */
public class RoleDAO extends MyDAO{
     public Role selectById(Role t) {
        Role ketqua = null;
        xSql = "select * from Role where RoleId = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, t.getRoleID());
            rs = ps.executeQuery();
            /* The cursor on the rs after this statement is in the BOF area, i.e. it is before the first record.
         Thus the first rs.next() statement moves the cursor to the first record
             */

            if (rs.next()) {
                int roleId = rs.getInt("RoleId");
                String roleName = rs.getString("RoleName");
                ketqua = new Role(roleId, roleName);
            } else {
                ketqua = null;
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
        }
        return (ketqua);
    }
     
     public ArrayList<Role> selectAll() {
        ArrayList<Role> role = new ArrayList<>();
        String sql = "select * from role";
        try {
            ps = con.prepareStatement(sql); 
            rs = ps.executeQuery();
            while(rs.next()){
                role.add(new Role(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return role ; 
    }
}
