/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DAT
 */
public class Blog_Catergory {
    private int Cid;
    private String Cname;

    public Blog_Catergory() {
    }

    public Blog_Catergory(int Cid, String Cname) {
        this.Cid = Cid;
        this.Cname = Cname;
    }

    public int getCid() {
        return Cid;
    }

    public void setCid(int Cid) {
        this.Cid = Cid;
    }

    public String getCname() {
        return Cname;
    }

    public void setCname(String Cname) {
        this.Cname = Cname;
    }

    @Override
    public String toString() {
        return "Blog_Catergory{" + "Cid=" + Cid + ", Cname=" + Cname + '}';
    }
    
}
