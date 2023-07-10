/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dell
 */
public class CourseRegister {
    private Course course;
    private Register register;
    private int amount;

    public CourseRegister() {
    }

    public CourseRegister(Course course, Register register, int amount) {
        this.course = course;
        this.register = register;
        this.amount = amount;
    }

    public CourseRegister(Course course, Register register) {
        this.course = course;
        this.register = register;
    }
    
    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Register getRegister() {
        return register;
    }

    public void setRegister(Register register) {
        this.register = register;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
    
}
