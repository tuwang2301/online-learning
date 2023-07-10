/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author DAT
 */
public class Register {

    private int RegId;
    private int UserId;
    private String RegTime;
    private int PackageId;
    private double Cost;
    private String ValidFrom;
    private String ValidTo;
    private boolean status;
    private Account account;
    private int price;

    private int CourseId;

    public Register() {
    }

    public Register(int CourseId) {
        this.CourseId = CourseId;

    }
    
    public Register(Account account, int price) {
        this.account = account;
        this.price = price;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getRegId() {
        return RegId;
    }

    public void setRegId(int RegId) {
        this.RegId = RegId;
    }

    public Register(int UserId, String RegTime, int PackageId, double Cost, String ValidFrom, String ValidTo, boolean status, int CourseId) {
        this.UserId = UserId;
        this.RegTime = RegTime;
        this.PackageId = PackageId;
        this.Cost = Cost;
        this.ValidFrom = ValidFrom;
        this.ValidTo = ValidTo;
        this.status = status;
        this.CourseId = CourseId;
        
    }

    public int getPackageId() {
        return PackageId;
    }

    public void setPackageId(int PackageId) {
        this.PackageId = PackageId;
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int UserId) {
        this.UserId = UserId;
    }

    public double getCost() {
        return Cost;
    }

    public void setCost(double Cost) {
        this.Cost = Cost;
    }

    public String getRegTime() {
        return RegTime;
    }

    public void setRegTime(String RegTime) {
        this.RegTime = RegTime;
    }

    public String getValidFrom() {
        return ValidFrom;
    }

    public void setValidFrom(String ValidFrom) {
        this.ValidFrom = ValidFrom;
    }

    public String getValidTo() {
        return ValidTo;
    }

    public void setValidTo(String ValidTo) {
        this.ValidTo = ValidTo;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getCourseId() {
        return CourseId;
    }

    public void setCourseId(int CourseId) {
        this.CourseId = CourseId;
    }

    @Override
    public String toString() {
        return "Register{" + "UserId=" + UserId + ", RegTime=" + RegTime + ", PackageId=" + PackageId + ", Cost=" + Cost + ", ValidFrom=" + ValidFrom + ", ValidTo=" + ValidTo + ", status=" + status + ", CourseId=" + CourseId + '}';
    }

}
