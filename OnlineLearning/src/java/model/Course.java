/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author admin
 */
public class Course {

    private int CourseId;
    private String CourseName;
    private String CourseDescription;
    private Date CourseCreateDate;
    private int CoursePrice;
    private boolean status;
    private String image;
    private int CatergoryId;
    int IdUser;
    String featureflag;

    public String getFeatureflag() {
        return featureflag;
    }

    public void setFeatureflag(String featureflag) {
        this.featureflag = featureflag;
    }
    

//    public boolean isFeatureflag() {
//        return featureflag;
//    }
//
//    public void setFeatureflag(boolean featureflag) {
//        this.featureflag = featureflag;
//    }
    
    public Course() {
    }

    public Course(int CourseId, String CourseName, String CourseDescription, Date CourseCreateDate, int CoursePrice, boolean status, String image, int CatergoryId, int IdUser) {
        this.CourseId = CourseId;
        this.CourseName = CourseName;
        this.CourseDescription = CourseDescription;
        this.CourseCreateDate = CourseCreateDate;
        this.CoursePrice = CoursePrice;
        this.status = status;
        this.image = image;
        this.CatergoryId = CatergoryId;
        this.IdUser = IdUser;
    }

    public void setCatergoryId(int CatergoryId) {
        this.CatergoryId = CatergoryId;
    }
    
    
    public int getCourseId() {
        return CourseId;
    }
    
    public Course(int CourseId, String CourseName, int CoursePrice) {
        this.CourseId = CourseId;
        this.CourseName = CourseName;
        this.CoursePrice = CoursePrice;
    }

    public Course(int CourseId, String CourseName) {
        this.CourseId = CourseId;
        this.CourseName = CourseName;
    }

    public Course(int productID) {
        this.CourseId = productID;
    }

    public Course(String CourseName) {
        this.CourseName = CourseName;
    }

    public void setCourseId(int CourseId) {
        this.CourseId = CourseId;
    }

    public String getCourseName() {
        return CourseName;
    }

    public void setCourseName(String CourseName) {
        this.CourseName = CourseName;
    }

    public String getCourseDescription() {
        return CourseDescription;
    }

    public void setCourseDescription(String CourseDescription) {
        this.CourseDescription = CourseDescription;
    }

    public Date getCourseCreateDate() {
        return CourseCreateDate;
    }

    public void setCourseCreateDate(Date CourseCreateDate) {
        this.CourseCreateDate = CourseCreateDate;
    }

    public int getCoursePrice() {
        return CoursePrice;
    }

    public void setCoursePrice(int CoursePrice) {
        this.CoursePrice = CoursePrice;
    }

    public boolean isStatus() {
        return status;
        

    }
    
    public int Status() {
        if (status == true) {
            return 1;
        } else {
            return 0;
        }

    }
    
    public Course(int CourseId, String CourseName, String CourseDescription, Date CourseCreateDate, int CoursePrice, boolean status, String image, int CatergoryId, int IdUser,  String featureflag) {
        this.CourseId = CourseId;
        this.CourseName = CourseName;
        this.CourseDescription = CourseDescription;
        this.CourseCreateDate = CourseCreateDate;
        this.CoursePrice = CoursePrice;
        this.status = status;
        this.image = image;
        this.CatergoryId = CatergoryId;
        this.IdUser = IdUser;
        this.featureflag = featureflag;
    }
    
    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getCatergoryId() {
        return CatergoryId;
    }

    public void setCategoryId(int CatergoryId) {
        this.CatergoryId = CatergoryId;
    }

    public int getIdUser() {
        return IdUser;
    }

    public void setIdUser(int IdUser) {
        this.IdUser = IdUser;
    }

    @Override
    public String toString() {
        return "Course{" + "CourseId=" + CourseId + ", CourseName=" + CourseName + ", CourseDescription=" + CourseDescription + ", CourseCreateDate=" + CourseCreateDate + ", CoursePrice=" + CoursePrice + ", status=" + status + ", image=" + image + ", CatergoryId=" + CatergoryId + ", IdUser=" + IdUser + '}';
    }

}
