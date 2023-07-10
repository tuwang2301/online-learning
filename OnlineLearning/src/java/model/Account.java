/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author quang
 */
public class Account {
    private int Id;
    private String userName;
    private String passWord;
    private String fullName;
    private boolean gender;
    private String address;
    private String email;
    private String phoneNum;
    private int roleId;
    private Timestamp time;
    private int statusId;

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public Account(int Id, String userName, String passWord, String fullName, boolean gender, String address, String email, String phoneNum, int roleId, Timestamp time, int statusId) {
        this.Id = Id;
        this.userName = userName;
        this.passWord = passWord;
        this.fullName = fullName;
        this.gender = gender;
        this.address = address;
        this.email = email;
        this.phoneNum = phoneNum;
        this.roleId = roleId;
        this.time = time;
        this.statusId = statusId;
    }

    
 

    public Account() {
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public Account(String userName, String passWord, String fullName, boolean gender, String address, String email, String phoneNum, int roleId) {
        this.userName = userName;
        this.passWord = passWord;
        this.fullName = fullName;
        this.gender = gender;
        this.address = address;
        this.email = email;
        this.phoneNum = phoneNum;
        this.roleId = roleId;
    }
    
    public Account(int id, String userName, String passWord, String fullName, boolean gender, String address, String email, String phoneNum, int roleId) {
        this.Id = id;
        this.userName = userName;
        this.passWord = passWord;
        this.fullName = fullName;
        this.gender = gender;
        this.address = address;
        this.email = email;
        this.phoneNum = phoneNum;
        this.roleId = roleId;
    }

    
    public Account(String userName) {
        this.userName = userName;
    }
    
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public boolean getGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

public String getRoleName(){
        switch (this.roleId){
            case 1:
                return "Customer";
            case 2:
                return "Seller";
            case 3:
                return "Admin";
            default:
                return "Guest";
        }
    }

    public void setGender(String gender) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public String toString() {
        return "Account{" + "fullName=" + fullName + email+ '}';
    }
      

   
    
}
