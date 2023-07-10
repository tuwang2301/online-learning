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
public class Result {
    private int resultId;
    private int userId;
    private int quizId;
    private Timestamp startFrom;
    private Timestamp endAt;
    private Account account;
    private Quiz quiz;

    public Result() {
    }

    
    public Result(int resultId, int userId, int quizId, Timestamp startFrom, Timestamp endAt) {
        this.resultId = resultId;
        this.userId = userId;
        this.quizId = quizId;
        this.startFrom = startFrom;
        this.endAt = endAt;
    }

    public int getResultId() {
        return resultId;
    }

    public void setResultId(int resultId) {
        this.resultId = resultId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getQuizId() {
        return quizId;
    }

    public void setQuizId(int quizId) {
        this.quizId = quizId;
    }

    public Timestamp getStartFrom() {
        return startFrom;
    }

    public void setStartFrom(Timestamp startFrom) {
        this.startFrom = startFrom;
    }

    public Timestamp getEndAt() {
        return endAt;
    }

    public void setEndAt(Timestamp endAt) {
        this.endAt = endAt;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Quiz getQuiz() {
        return quiz;
    }

    public void setQuiz(Quiz quiz) {
        this.quiz = quiz;
    }
    
    
    
}
