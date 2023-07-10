/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dell
 */
public class UserStatus {
    private int id;
    private String StatusName;

    public UserStatus() {
    }

    public UserStatus(int id, String StatusName) {
        this.id = id;
        this.StatusName = StatusName;
    }

    public UserStatus(String StatusName) {
        this.StatusName = StatusName;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStatusName() {
        return StatusName;
    }

    public void setStatusName(String StatusName) {
        this.StatusName = StatusName;
    }

    @Override
    public String toString() {
        return "UserStatus{" + "id=" + id + ", StatusName=" + StatusName + '}';
    }
    
        
}
