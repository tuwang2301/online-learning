/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Timestamp;
import java.util.*;
import model.*;

/**
 *
 * @author ADMIN
 */
public class AccountDAO extends MyDAO {

    public List<Account> getUsers() {
        List<Account> t = new ArrayList<>();
        xSql = "select * from Account";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            Account x;
            while (rs.next()) {
                x = new Account(rs.getInt("Id"), rs.getString("Username"), rs.getString("Password"),
                        rs.getString("FullName"), rs.getBoolean("Gender"), rs.getString("Address"),
                        rs.getString("Email"), rs.getString("PhoneNum"), rs.getInt("RoleID"));
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public List<Account> getAccount(int id) {
        List<Account> t = new ArrayList<>();
        xSql = "select * from Account where Id =?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            Account x;
            while (rs.next()) {
                x = new Account(rs.getInt("Id"), rs.getString("Username"), rs.getString("Password"),
                        rs.getString("FullName"), rs.getBoolean("Gender"), rs.getString("Address"),
                        rs.getString("Email"), rs.getString("PhoneNum"), rs.getInt("RoleID"));
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public Account getUser(String username, String password) {
        xSql = "select * from Account where Username = ? and Password = ?";

        int roleId, id;
        String fullName, address, email, phoneNum;
        boolean gender;
        Account x = null;
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            /* The cursor on the rs after this statement is in the BOF area, i.e. it is before the first record.
         Thus the first rs.next() statement moves the cursor to the first record
             */

            if (rs.next()) {
                id = rs.getInt("Id");
                fullName = rs.getString("FullName");
                gender = rs.getBoolean("Gender");
                address = rs.getString("Address");
                email = rs.getString("Email");
                phoneNum = rs.getString("PhoneNum");
                roleId = rs.getInt("RoleID");
                x = new Account(id, username, password, fullName, gender, address, email, phoneNum, roleId);
            } else {
                x = null;
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
        }
        return (x);
    }

    public Account getUserById(int userId) {
        xSql = "select * from Account where Id = ?";

        int roleId, id;
        String userName, password, fullName, address, email, phoneNum;
        boolean gender;
        Account x = null;
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            /* The cursor on the rs after this statement is in the BOF area, i.e. it is before the first record.
         Thus the first rs.next() statement moves the cursor to the first record
             */

            if (rs.next()) {
                userName = rs.getString("Username");
                password = rs.getString("Password");
                fullName = rs.getString("FullName");
                gender = rs.getBoolean("Gender");
                address = rs.getString("Address");
                email = rs.getString("Email");
                phoneNum = rs.getString("PhoneNum");
                roleId = rs.getInt("RoleID");
                x = new Account(userId, userName, password, fullName, gender, address, email, phoneNum, roleId);
            } else {
                x = null;
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
        }
        return (x);
    }

    public Account getUserByUserName(String userName) {
        xSql = "select * from Account where Username = ?";

        int roleId, id;
        String password, fullName, address, email, phoneNum;
        boolean gender;
        Account x = null;
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, userName);
            rs = ps.executeQuery();
            /* The cursor on the rs after this statement is in the BOF area, i.e. it is before the first record.
         Thus the first rs.next() statement moves the cursor to the first record
             */

            if (rs.next()) {
                id = rs.getInt("Id");
                password = rs.getString("Password");
                fullName = rs.getString("FullName");
                gender = rs.getBoolean("Gender");
                address = rs.getString("Address");
                email = rs.getString("Email");
                phoneNum = rs.getString("PhoneNum");
                roleId = rs.getInt("RoleID");
                x = new Account(id, userName, password, fullName, gender, address, email, phoneNum, roleId);
            } else {
                x = null;
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
        }
        return (x);
    }
    
    public String getRoleName(int roleId) {
        xSql = "select * from Role where RoleID = ?";

        String roleName = "Guest";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, roleId);
            rs = ps.executeQuery();
            /* The cursor on the rs after this statement is in the BOF area, i.e. it is before the first record.
         Thus the first rs.next() statement moves the cursor to the first record
             */

            if (rs.next()) {
                roleName = rs.getString("RoleName");
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
        }
        return (roleName);
    }

    public void insert(Account x) {
        xSql = "insert into Account ([Username]\n"
                + "           ,[Password]\n"
                + "           ,[FullName]\n"
                + "           ,[Gender]\n"
                + "           ,[Address]\n"
                + "           ,[Email]\n"
                + "           ,[PhoneNum]\n"
                + "           ,[RoleID]\n"
                + "           ,[CreateDate]\n"
                + "           ,[StatusId]) values (?,?,?,?,?,?,?,?,GETDATE(),?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, x.getUserName());
            ps.setString(2, x.getPassWord());
            ps.setString(3, x.getFullName());
            ps.setBoolean(4, x.getGender());
            ps.setString(5, x.getAddress());
            ps.setString(6, x.getEmail());
            ps.setString(7, x.getPhoneNum());
            ps.setInt(8, x.getRoleId());
            ps.setInt(9, x.getStatusId());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Account getUserByEmail(String email) {
        Account ketqua = null;
        String username;
        String password;
        String fullName, address, phoneNum;
        boolean gender;
        int roleId, id;
        xSql = "select * from Account where email = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            /* The cursor on the rs after this statement is in the BOF area, i.e. it is before the first record.
         Thus the first rs.next() statement moves the cursor to the first record
             */

            if (rs.next()) {
                id = rs.getInt("Id");
                username = rs.getString("username");
                password = rs.getString("password");
                fullName = rs.getString("FullName");
                gender = rs.getBoolean("Gender");
                address = rs.getString("Address");
                email = rs.getString("Email");
                phoneNum = rs.getString("PhoneNum");
                roleId = rs.getInt("RoleID");
                ketqua = new Account(id, username, password, fullName, gender, address, email, phoneNum, roleId);
            } else {
                ketqua = null;
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
        }
        return (ketqua);
    }
    
    public Account getUserByPhone(String phone) {
        Account ketqua = null;
        String username;
        String password;
        String fullName, address, email;
        boolean gender;
        int roleId, id;
        xSql = "select * from Account where PhoneNum = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, phone);
            rs = ps.executeQuery();
            /* The cursor on the rs after this statement is in the BOF area, i.e. it is before the first record.
         Thus the first rs.next() statement moves the cursor to the first record
             */

            if (rs.next()) {
                id = rs.getInt("Id");
                username = rs.getString("username");
                password = rs.getString("password");
                fullName = rs.getString("FullName");
                gender = rs.getBoolean("Gender");
                address = rs.getString("Address");
                email = rs.getString("Email");
                roleId = rs.getInt("RoleID");
                ketqua = new Account(id, username, password, fullName, gender, address, email, phone, roleId);
            } else {
                ketqua = null;
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
        }
        return (ketqua);
    }

    public void updatePassword(String userName, String newPassword) {
        String query = "update Account set password=? where username=?";
        try {
            ps = con.prepareStatement(query);
            ps.setString(1, newPassword);
            ps.setString(2, userName);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void editUser(String new_userName, String fullName, boolean gender, String email, String phoneNum, String userName) {
        xSql = "update Account\n"
                + "set Username = ?,\n"
                + "FullName = ?,\n"
                + "gender = ?,\n"
                + "Email = ?,\n"
                + "PhoneNum = ?\n"
                //+ "statusId = ?\n"
                + "where UserName = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, new_userName);
            ps.setString(2, fullName);
            if (gender) {
                ps.setInt(3, 1);
            } else {
                ps.setInt(3, 0);

            }
            ps.setString(4, email);
            ps.setString(5, phoneNum);
            //ps.setInt(6, status.getId());
            ps.setString(6, userName);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int countGender(int gender) {
        int count = 0;
        try {
            String sql = "select count(*) as 'count' from account where gender = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, gender);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }

    public int countUser(int statusId) {
        int count = 0;
        try {
            String sql = "select count(*) as 'count' from account where statusid = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, statusId);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }

    public int countAccount() {
        int count = 0;
        String sql = "select count(*) as 'count' from account";
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

    public int countPrice() {
        int count = 0;
        String sql = "SELECT SUM(Cost) FROM Registration;";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1); // Truyền số thứ tự của cột
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            // Xử lý ngoại lệ
        }
        return count;
    }

    public ArrayList<Account> selectAll() {
        ArrayList<Account> a = new ArrayList<>();
        xSql = "select * from Account";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int Id = rs.getInt("Id");
                String Username = rs.getString("Username");
                String Password = rs.getString("Password");
                String FullName = rs.getString("FullName");
                Boolean Gender = rs.getBoolean("gender");
                String Address = rs.getString("Address");
                String Email = rs.getString("Email");
                String PhoneNum = rs.getString("PhoneNum");
                int RoleID = rs.getInt("RoleID");
                Timestamp CreateDate = rs.getTimestamp("CreateDate");
                int statusId = rs.getInt("statusId");

                RoleDAO dao = new RoleDAO();
                Role role1 = dao.selectById(new Role(RoleID, null));

                int userStatus_id = rs.getInt("statusId");

                UserStatusDAO userDao = new UserStatusDAO();
                UserStatus userstatus = userDao.selectById(new UserStatus(userStatus_id, null));

                Account x = new Account(Id, Username, Password, FullName, Gender, Address, Email, PhoneNum, RoleID, CreateDate, statusId);
                a.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (a);
    }

    public List<Account> getListByPage(List<Account> list,
            int start, int end) {
        ArrayList<Account> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public String getUserStatus(int StatusId) {
        String s = null;
        if (StatusId == 1) {
            s = "Active";
        } else {
            s = "Inactive";
        }
        return s;

    }

    public String getUsername(int userid) {
        String s = null;
        String sql = "SELECT Registration.userid, Account.FullName\n"
                + "FROM Registration\n"
                + "JOIN Account ON Registration.userid = Account.Id where userid =? ;";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userid);
            rs = ps.executeQuery();
            while (rs.next()) {
                s = rs.getString("FullName");
            }
        } catch (Exception e) {
        }
        return s;
    }

    public String getUserEmail(int userid) {
        String s = null;
        String sql = "SELECT Registration.userid, Account.Email \n"
                + "FROM Registration\n"
                + "JOIN Account ON Registration.userid = Account.Id where userid =?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userid);
            rs = ps.executeQuery();
            while (rs.next()) {
                s = rs.getString("Email");
            }
        } catch (Exception e) {
        }
        return s;
    }
    
    

    public static void main(String[] args) {
        AccountDAO aD = new AccountDAO();
        int i = aD.countPrice();
        Account a = aD.getUserByPhone("0965037791");
        System.out.println(a.toString());
        //      List<Account> list = aD.getUsername("1");
        //  System.out.println(list);
//        Account a = aD.getUser("marketer", "marketer");
//        System.out.println(!aD.getRoleName(a.getRoleId()).toLowerCase().equals("marketer"));
//        System.out.println(aD.getRoleName(a.getRoleId()));
//        System.out.println(a.getFullName());
//        List<Account> accs = aD.getUsers();
//        for (Account acc : accs) {
//            System.out.println(acc.getUserName() + ", " + acc.getPassWord());

        //}
//        Account b = aD.getUserByEmail("sangpthe170366@fpt.edu.vn");
//        
////        List<Account> l = aD.getListByPage(ac, 0, 0);
////        for (Account account : l) {
////            System.out.println(account);
////        }
//    ArrayList<Account> ac = aD.selectAll();
//        System.out.println(ac);
//        System.out.println(aD.countGender(0));
//         System.out.println(aD.countGender(1));
    }
}
