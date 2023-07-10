/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import model.Result;

/**
 *
 * @author quang
 */
public class ResultDAO extends MyDAO {

    public Result getResultByResultId(int resultId) {
        Result x = new Result();
        xSql = "select * from Result where ResultId = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, resultId);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = new Result(resultId, rs.getInt("UserId"), rs.getInt("QuizId"), rs.getTimestamp("StartFrom"), rs.getTimestamp("EndAt"));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (x);
    }
}
