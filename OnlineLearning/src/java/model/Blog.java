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
public class Blog {
   private int Blogid;
   private String Image;
   private String Title;
   private String Content;
   private String BriefInfor;
   private String Author;
   private Date CreateDate;
   private Date UpdateDate;
   private int UserID;
   private int Cid;
    private String Cname;
    private boolean FeatureFlag;

    // Constructor, getter và setter cho các trường dữ liệu khác

    public Blog(int Blogid, String Image, String Title, String Content, String BriefInfor, String Author, Date CreateDate, Date UpdateDate, int UserID, int Cid, boolean FeatureFlag) {
        this.Blogid = Blogid;
        this.Image = Image;
        this.Title = Title;
        this.Content = Content;
        this.BriefInfor = BriefInfor;
        this.Author = Author;
        this.CreateDate = CreateDate;
        this.UpdateDate = UpdateDate;
        this.UserID = UserID;
        this.Cid = Cid;
        this.FeatureFlag = FeatureFlag;
    }

    

    public boolean isFeatureFlag() {
        return FeatureFlag;
    }

    public void setFeatureFlag(boolean FeatureFlag) {
        this.FeatureFlag = FeatureFlag;
    }

  

    public Blog() {
    }

    public Blog(int Blogid, String Image, String Title, String Content, String BriefInfor, String Author, Date CreateDate, Date UpdateDate, int UserID, int Cid) {
        this.Blogid = Blogid;
        this.Image = Image;
        this.Title = Title;
        this.Content = Content;
        this.BriefInfor = BriefInfor;
        this.Author = Author;
        this.CreateDate = CreateDate;
        this.UpdateDate = UpdateDate;
        this.UserID = UserID;
        this.Cid = Cid;
    }

   

    public int getBlogid() {
        return Blogid;
    }
  public String getCname() {
        return Cname;
    }

    public void setCname(String Cname) {
        this.Cname = Cname;
    }
    public void setBlogid(int Blogid) {
        this.Blogid = Blogid;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String Content) {
        this.Content = Content;
    }

    public String getBriefInfor() {
        return BriefInfor;
    }

    public void setBriefInfor(String BriefInfor) {
        this.BriefInfor = BriefInfor;
    }

    public String getAuthor() {
        return Author;
    }

    public void setAuthor(String Author) {
        this.Author = Author;
    }

    public Date getCreateDate() {
        return CreateDate;
    }

    public void setCreateDate(Date CreateDate) {
        this.CreateDate = CreateDate;
    }

    public Date getUpdateDate() {
        return UpdateDate;
    }

    public void setUpdateDate(Date UpdateDate) {
        this.UpdateDate = UpdateDate;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public int getCid() {
        return Cid;
    }

    public void setCid(int Cid) {
        this.Cid = Cid;
    }

    @Override
    public String toString() {
        return "Blog{" + "Blogid=" + Blogid + ", Image=" + Image + ", Title=" + Title + ", Content=" + Content + ", BriefInfor=" + BriefInfor + ", Author=" + Author + ", CreateDate=" + CreateDate + ", UpdateDate=" + UpdateDate + ", UserID=" + UserID + ", Cid=" + Cid + '}';
    }
   
   
   
}
