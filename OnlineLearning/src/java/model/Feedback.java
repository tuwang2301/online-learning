/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dell
 */
public class Feedback {
    private int id;
    private Account account;
    private Course course;
    private int star;
    private String feedbackDetail;

    public Feedback() {
    }
    
    public Feedback(Course course, int star) {
        this.course = course;
        this.star = star;
    }
    
    public Feedback(Account account, int star) {
        this.account = account;
        this.star = star;
    }
    
    public Feedback(int id, Account account, Course course, int star, String feedbackDetail) {
        this.id = id;
        this.account = account;
        this.course = course;
        this.star = star;
        this.feedbackDetail = feedbackDetail;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Account getUser() {
        return account;
    }

    public void setUser(Account account) {
        this.account = account;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

    public String getFeedbackDetail() {
        return feedbackDetail;
    }

    public void setFeedbackDetail(String feedbackDetail) {
        this.feedbackDetail = feedbackDetail;
    }

   
    
    
}
