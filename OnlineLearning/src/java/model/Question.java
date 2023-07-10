/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.HashMap;
import java.util.List;

/**
 *
 * @author quang
 */
public class Question {
    private int questionId;
    private int questionTypeId;
    private String questionTopic;
    private String questionGroup;
    private String questionDomain;
    private String question;
    private List<String> answers;
    private String correct;
    private String explaination;

    public Question() {
    }

    public Question(int questionTypeId,String questionTopic, String questionGroup, String questionDomain, String question, List<String> answers, String correct, String explaination) {
        this.questionTypeId = questionTypeId;
        this.questionTopic = questionTopic;
        this.questionGroup = questionGroup;
        this.questionDomain = questionDomain;
        this.question = question;
        this.answers = answers;
        this.correct = correct;
        this.explaination = explaination;
    }

    public Question(int questionId, int questionTypeId,String questionTopic, String questionGroup, String questionDomain, String question, List<String> answers, String correct, String explaination) {
        this.questionId = questionId;
        this.questionTypeId = questionTypeId;
        this.questionTopic = questionTopic;
        this.questionGroup = questionGroup;
        this.questionDomain = questionDomain;
        this.question = question;
        this.answers = answers;
        this.correct = correct;
        this.explaination = explaination;
    }

    public int getQuestionTypeId() {
        return questionTypeId;
    }

    public void setQuestionTypeId(int questionTypeId) {
        this.questionTypeId = questionTypeId;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public String getQuestionTopic() {
        return questionTopic;
    }

    public void setQuestionTopic(String questionTopic) {
        this.questionTopic = questionTopic;
    }

    public String getQuestionGroup() {
        return questionGroup;
    }

    public void setQuestionGroup(String questionGroup) {
        this.questionGroup = questionGroup;
    }

    public String getQuestionDomain() {
        return questionDomain;
    }

    public void setQuestionDomain(String questionDomain) {
        this.questionDomain = questionDomain;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public List<String> getAnswers() {
        return answers;
    }

    public void setAnswers(List<String> answers) {
        this.answers = answers;
    }

    public String getCorrect() {
        return correct;
    }

    public void setCorrect(String correct) {
        this.correct = correct;
    }

    public String getExplaination() {
        return explaination;
    }

    public void setExplaination(String explaination) {
        this.explaination = explaination;
    }
    
    
}
