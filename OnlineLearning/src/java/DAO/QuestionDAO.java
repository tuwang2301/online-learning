/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.*;
import model.*;
import DAO.*;

public class QuestionDAO extends MyDAO {

    public List<Question> getQuestionsByQuizId(int quizId) {
        List<Question> list = new ArrayList<>();
        xSql = "select q.QuestionId, QuestionTypeId, QuestionTopic, "
                + "QuestionGroup, QuestionDomain, Question, "
                + "QuestionAnwsers, CorrectAnwser, Explaination "
                + "from Quiz_Question as qq, Question as q "
                + "where qq.QuestionId = q.QuestionId and qq.QuizId = ?";

        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, quizId);
            rs = ps.executeQuery();
            while (rs.next()) {
                int questionId = rs.getInt(1);
                int questionTypeId = rs.getInt(2);
                String topic = rs.getString(3),
                        group = rs.getString(4),
                        domain = rs.getString(5),
                        question = rs.getString(6).trim();
                String answers = null;
                List<String> allAnswers = new ArrayList<>();
                if (rs.getString(7) != null) {
                    answers = rs.getString(7).trim();
                }
                String correctAns = rs.getString(8).trim()
                ,
                        explanation = rs.getString(9);
                if(answers!=null){
                    String[] answer = answers.split("\\s{2,}");
                for (String string : answer) {
                    allAnswers.add(string);
                }
                }
                // create object
                Question q = new Question(questionId, questionTypeId, topic, group, domain, question, allAnswers, correctAns, explanation);
                list.add(q);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public Question getQuestionById(int questionId) {
        Question ques = new Question();
        xSql = "  select * from Question where QuestionId = ?";

        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, questionId);
            rs = ps.executeQuery();
            while (rs.next()) {
                int questionTypeId = rs.getInt(2);
                String topic = rs.getString(3),
                        group = rs.getString(4),
                        domain = rs.getString(5),
                        question = rs.getString(6).trim();
                String answers = null;
                List<String> allAnswers = new ArrayList<>();
                if (rs.getString(7) != null) {
                    answers = rs.getString(7).trim();
                }
                String correctAns = rs.getString(8).trim()
                ,
                        explanation = rs.getString(9);
                if(answers!=null){
                    String[] answer = answers.split("\\s{2,}");
                for (String string : answer) {
                    allAnswers.add(string);
                }
                }
                // create object
                ques = new Question(questionId, questionTypeId, topic, group, domain, question, allAnswers, correctAns, explanation);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ques;
    }

    public static void main(String[] args) {
        QuestionDAO qD = new QuestionDAO();
        List<Question> questions = qD.getQuestionsByQuizId(2);
        for (Question question : questions) {
            System.out.println("All answers of question " + question.getQuestion());
            List<String> answers = question.getAnswers();
            for (String answer : answers) {
                System.out.println(answer);
            }
        }
    }
}
