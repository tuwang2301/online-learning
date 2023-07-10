/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Blog;
import model.Price;
import model.Register;

/**
 *
 * @author DAT
 */
public class RegisterDAO extends MyDAO {

    private List<Register> list;

    public void clearData() {
        list.clear();
    }

    public List<Register> getSort(String sortOrder, int id) {
        List<Register> list = new ArrayList<>();
        try {
            // Kết nối với CSDL MySQL

            // Thực hiện truy vấn SQL để lấy danh sách các bài đăng
            String orderByClause = "";
            if (sortOrder != null) {
                switch (sortOrder) {
                    case "1":
                        orderByClause = "SELECT * FROM registration WHERE RegTime >= DATEADD(wk, DATEDIFF(wk, 0, GETDATE())-1, 0) AND RegTime < DATEADD(wk, DATEDIFF(wk, 0, GETDATE()), 0)";
                        break;
                    case "2":
                        orderByClause = "SELECT *  FROM registration WHERE RegTime >= DATEADD(month, DATEDIFF(month, 0, GETDATE())-1, 0) AND RegTime < DATEADD(month, DATEDIFF(month, 0, GETDATE()), 0)";
                        break;
                    case "3":
                        orderByClause = "SELECT * FROM registration WHERE RegTime >= DATEADD(month, DATEDIFF(month, 0, GETDATE())-3, 0) AND RegTime < DATEADD(month, DATEDIFF(month, 0, GETDATE()), 0)";
                        break;
                    case "4":
                        orderByClause = " SELECT * FROM registration WHERE RegTime >= DATEADD(month, DATEDIFF(month, 0, GETDATE())-6, 0) AND RegTime < DATEADD(month, DATEDIFF(month, 0, GETDATE()), 0)";
                        break;
                    case "0":
                        orderByClause = "SELECT * FROM Registration";
                        break;
                    default:
                        break;
                }
            }
            String sql = orderByClause + "And UserId =?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                int UserID = rs.getInt("UserId");
                String RegTime = rs.getString("RegTime");
                int PackageId = rs.getInt("PackageId");
                double Cost = rs.getDouble("Cost");
                String ValidFrom = rs.getString("ValidFrom");
                String ValidTo = rs.getString("ValidTo");
                boolean status = rs.getBoolean("status");
                int CourseId = rs.getInt("CourseId");

                // create object
                Register reg = new Register(UserID, RegTime, PackageId, Cost, ValidFrom, ValidTo, status, CourseId);

                list.add(reg);

            }

            // Đóng kết nối và giải phóng tài nguyên
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Register> Search(String txtSearch, int id) {
        List<Register> list = new ArrayList<>();
        xSql = "SELECT * FROM Registration WHERE  CourseId IN (SELECT CourseId FROM Course Where CourseName LIKE ? )And UserId = ?";

        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, "%" + txtSearch + "%");
            ps.setInt(2, id);

            rs = ps.executeQuery();
            while (rs.next()) {
                int UserID = rs.getInt("UserId");
                String RegTime = rs.getString("RegTime");
                int PackageId = rs.getInt("PackageId");
                double Cost = rs.getDouble("Cost");
                String ValidFrom = rs.getString("ValidFrom");
                String ValidTo = rs.getString("ValidTo");
                boolean status = rs.getBoolean("status");
                int CourseId = rs.getInt("CourseId");

                Register reg = new Register(UserID, RegTime, PackageId, Cost, ValidFrom, ValidTo, status, CourseId);

                list.add(reg);

            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Register> getCourse(int id) {
        List<Register> list = new ArrayList<>();
        xSql = "select CourseId from Registration where UserId = ? ";

        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                int CourseId = rs.getInt(1);
//                String RegTime = rs.getString(2);
//                   int     PackageId = rs.getInt(3);
//                    double    Cost = rs.getDouble(4);
//                    String    ValidFrom = rs.getString(5);
//                    String    ValidTo = rs.getString(6);
//               boolean status = rs.getBoolean(7);

                // create object
                //  Register reg = new Register(UserId, RegTime, PackageId, Cost, ValidFrom, ValidTo, status, UserId);
                Register reg = new Register(CourseId);
                list.add(reg);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public int deleteRegister(int courseid, int userid) {
        int n = 0;
        xSql = "  DELETE FROM [Registration] WHERE [CourseId] = ? and [UserId] =? ;";

        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, courseid);
            ps.setInt(2, userid);
            n = ps.executeUpdate();

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return n;

    }

    public List<Register> getRegister(int id) {
        List<Register> list = new ArrayList<>();
        xSql = "select * from Registration where UserId = ? ";

        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                int UserID = rs.getInt("UserId");
                String RegTime = rs.getString("RegTime");
                int PackageId = rs.getInt("PackageId");
                double Cost = rs.getDouble("Cost");
                String ValidFrom = rs.getString("ValidFrom");
                String ValidTo = rs.getString("ValidTo");
                boolean status = rs.getBoolean("status");
                int CourseId = rs.getInt("CourseId");

                Register reg = new Register(UserID, RegTime, PackageId, Cost, ValidFrom, ValidTo, status, CourseId);

                list.add(reg);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public int Register(Register reg) {
        int n = 0;
        LocalDateTime curDate = java.time.LocalDateTime.now();
        String date = curDate.toString();
        xSql = "INSERT INTO [dbo].[Registration]\n"
                + "         \n"
                + "           ([UserId]\n"
                + "		   ,[RegTime]\n"
                + "		   ,[PackageId]\n"
                + "           ,[Cost]\n"
                + "           ,[ValidFrom]\n"
                + "           ,[ValidTo]\n"
                + "           ,[status]\n"
                + "           ,[CourseId]) "
                + "     VALUES (?,?,?,?,?,?,?,?)";
        try {
            String m = "1";
            ps = con.prepareStatement(xSql);
            ps.setInt(1, reg.getUserId());
            ps.setString(2, date);
            ps.setInt(3, reg.getPackageId());
            ps.setDouble(4, reg.getCost());
            ps.setString(5, date);
            ps.setString(6, reg.getValidTo());
            ps.setString(7, m);
            ps.setInt(8, reg.getCourseId());
            n = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return n;
    }

    public int countRegisterByCourse(int CourseId) {
        String sql = "select COUNT (*) from registration where CourseId = ?";
        int s = 0;
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, CourseId);
            rs = ps.executeQuery();
            if (rs.next()) {
                s = rs.getInt(1);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }

    public int countTime(Date date) {
        String sql = "SELECT COUNT(*) AS total FROM Registration WHERE DAY(RegTime) = ? And MONTH(RegTime) = ? And YEAR(RegTime) = ?";
        System.out.println(date.getDay());
        System.out.println(date.getMonth());
        System.out.println(date.getYear());
        System.out.println(date);
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, date.getDay());
            ps.setInt(2, date.getMonth());
            ps.setInt(3, date.getYear());
//            ps.setString(2, toDate);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt("total");
            }
        } catch (Exception e) {

        }
        return 0;
    }

//    public ArrayList<Integer> getOrderDataInPeriod(String startDate, String enddate) {
//        ArrayList<Integer> orderDatas = new ArrayList<>();
//        try {
//            String sql = "WITH DateRange(DateData) AS \n"
//                    + "(\n"
//                    + "    SELECT cast(? as date) as [Date]\n"
//                    + "    UNION ALL\n"
//                    + "    SELECT DATEADD(d,1,DateData)\n"
//                    + "    FROM DateRange \n"
//                    + "    WHERE DateData < cast(? as date)\n"
//                    + ")\n"
//                    + "SELECT dr.DateData as dateInPeriod,\n"
//                    + "COUNT(case when r.[status] is null then null else 1 end) as totalRegistration, \n"
//                    + "COUNT(case r.[status] when 'true' then 1 else null end) as successRegistration\n"
//                    + "FROM DateRange dr left join Registration r on cast(r.registrationTime as date) = dr.DateData\n"
//                    + "group by dr.DateData\n"
//                    + "OPTION (MAXRECURSION 0)";
//            PreparedStatement stm = connection.prepareStatement(sql);
//            stm.setString(1, startDate);
//            stm.setString(2, enddate);
//            ResultSet rs = stm.executeQuery();
//            while (rs.next()) {
//                OrderData orderData = new OrderData();
//                orderData.setDate(sdf.format(rs.getDate("dateInPeriod")));
//                orderData.setAll(rs.getInt("totalRegistration"));
//                orderData.setSuccess(rs.getInt("successRegistration"));
//                orderDatas.add(orderData);
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(RegistrationDBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return orderDatas;
//    }
    public int countRegister() {
        String sql = "select COUNT (*) from registration ";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return 0;
    }

    public List<Register> countUserRegister() {
        List<Register> list = new ArrayList<>();
        String sql = "select top 3 username , count(totalprice) as 'counts' from account u\n"
                + "join orders o \n"
                + "on u.userID = o.userID\n"
                + "group by username\n"
                + "order by counts desc";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account a = new Account(rs.getString(1));
                list.add(new Register(a, rs.getInt(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Register> countCustomerCourse() {
        List<Register> list = new ArrayList<>();
        xSql = "SELECT TOP 3 * FROM Registration ORDER BY RegTime DESC ";

        try {
            ps = con.prepareStatement(xSql);

            rs = ps.executeQuery();
            while (rs.next()) {
                int UserID = rs.getInt("UserId");
                String RegTime = rs.getString("RegTime");
                int PackageId = rs.getInt("PackageId");
                double Cost = rs.getDouble("Cost");
                String ValidFrom = rs.getString("ValidFrom");
                String ValidTo = rs.getString("ValidTo");
                boolean status = rs.getBoolean("status");
                int CourseId = rs.getInt("CourseId");

                Register reg = new Register(UserID, RegTime, PackageId, Cost, ValidFrom, ValidTo, status, CourseId);

                list.add(reg);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
        RegisterDAO r = new RegisterDAO();
//        List<Register> lst = r.countTime();

//        // tạo đối tượng Account và đối tượng Register
//        int n;
//        n = dao.Register(new Register(1, "2023-06-04 10:30:00", 2, 600, "2023-06-04 10:30:00", "2023-07-04 10:30:00", true,  6));
//        System.out.println(n);
//    //  List<Register> c = dao.getSort("1",4);
//    //    dao.deleteRegister(2, 4);
// System.out.println(c);
    
    }
}
