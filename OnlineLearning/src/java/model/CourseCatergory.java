/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class CourseCatergory {
    private int CatergoryId;
    private String CatergoryName;

    public CourseCatergory() {
    }

    public CourseCatergory(int CatergoryId, String CatergoryName) {
        this.CatergoryId = CatergoryId;
        this.CatergoryName = CatergoryName;
    }

    public int getCatergoryId() {
        return CatergoryId;
    }

    public void setCatergoryId(int CatergoryId) {
        this.CatergoryId = CatergoryId;
    }

    public String getCatergoryName() {
        return CatergoryName;
    }

    public void setCatergoryName(String CatergoryName) {
        this.CatergoryName = CatergoryName;
    }

    @Override
    public String toString() {
        return "CourseCatergory{" + "CatergoryId=" + CatergoryId + ", CatergoryName=" + CatergoryName + '}';
    }
    
    
}
