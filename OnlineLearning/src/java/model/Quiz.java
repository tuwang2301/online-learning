/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author quang
 */
public class Quiz {
    private int quizId;
    private String testName;
    private Course course;
    private String examLevel;
    private int duration;
    private int passRate;
    private String quizType;
    private int numberOfQues;
    private String examDes;

    public Quiz() {
    }

    public Quiz(int quizId, String testName, Course course, String examLevel, int duration, int passRate, String quizType, int numberOfQues, String examDes) {
        this.quizId = quizId;
        this.testName = testName;
        this.course = course;
        this.examLevel = examLevel;
        this.duration = duration;
        this.passRate = passRate;
        this.quizType = quizType;
        this.numberOfQues = numberOfQues;
        this.examDes = examDes;
    }

    public Quiz(String testName, Course course, String examLevel, int duration, int passRate, String quizType, int numberOfQues, String examDes) {
        this.testName = testName;
        this.course = course;
        this.examLevel = examLevel;
        this.duration = duration;
        this.passRate = passRate;
        this.quizType = quizType;
        this.numberOfQues = numberOfQues;
        this.examDes = examDes;
    }

    public int getQuizId() {
        return quizId;
    }

    public void setQuizId(int quizId) {
        this.quizId = quizId;
    }

    public String getTestName() {
        return testName;
    }

    public void setTestName(String testName) {
        this.testName = testName;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public String getExamLevel() {
        return examLevel;
    }

    public void setExamLevel(String examLevel) {
        this.examLevel = examLevel;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public int getPassRate() {
        return passRate;
    }

    public void setPassRate(int passRate) {
        this.passRate = passRate;
    }

    public String getQuizType() {
        return quizType;
    }

    public void setQuizType(String quizType) {
        this.quizType = quizType;
    }

    public int getNumberOfQues() {
        return numberOfQues;
    }

    public void setNumberOfQues(int numberOfQues) {
        this.numberOfQues = numberOfQues;
    }

    public String getExamDes() {
        return examDes;
    }

    public void setExamDes(String examDes) {
        this.examDes = examDes;
    }
    
    
}
