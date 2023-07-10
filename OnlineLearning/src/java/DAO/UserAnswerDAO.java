/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.text.DecimalFormat;
import java.util.*;
import model.*;

public class UserAnswerDAO extends MyDAO {

    QuestionDAO qD = new QuestionDAO();
    AccountDAO aD = new AccountDAO();

    public List<Answer> createAnswerList(int quizId, Account user) {
        List<Answer> answers = new ArrayList<>();
        QuestionDAO qD = new QuestionDAO();
        List<Question> questions = qD.getQuestionsByQuizId(quizId);
        for (Question question : questions) {
            answers.add(new Answer(question, "", user, false, "unanswered"));
        }
        return answers;
    }

    public int countAnswered(List<Answer> answers) {
        int count = 0;
        for (Answer answer : answers) {
            if (!answer.getStatus().equals("unanswered")) {
                count++;
            }
        }
        return count;
    }
    
     public int countCorrect(List<Answer> answers) {
        int count = 0;
        for (Answer answer : answers) {
            if (answer.getStatus().equals("correct")) {
                count++;
            }
        }
        return count;
    }
     
      public int countMark(List<Answer> answers) {
        int count = 0;
        for (Answer answer : answers) {
            if (answer.isIsMarked()) {
                count++;
            }
        }
        return count;
    }

        public boolean isCorrect(Question question, String userAnswer) {
        int questionType = question.getQuestionTypeId();
        switch (questionType) {
            case 1:
                return question.getCorrect().equals(userAnswer);
            case 2:
                char[] arr = userAnswer.toCharArray();
                Arrays.sort(arr);
                String sorted = String.valueOf(arr);
                return question.getCorrect().equals(sorted);
            case 3:
                return question.getCorrect().equals(userAnswer.toLowerCase());
            default:
                break;
        }
        return false;
    }

   

    public boolean isUnanswered(String answer) {
        return (answer == null || answer.isEmpty() || answer.equals("undefined"));
    }

    public void insert(Answer answer, int resultId) {
        xSql = "insert into UserAnswer (QuestionId,UserAnswer,UserId,isMarked,Status,ResultId) values (?,?,?,?,?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, answer.getQuestion().getQuestionId());
            if (isUnanswered(answer.getUserAnswer())) {
                ps.setString(2, "");
            } else {
                ps.setString(2, answer.getUserAnswer());
            }
            ps.setInt(3, answer.getUser().getId());
            ps.setBoolean(4, answer.isIsMarked());
            ps.setString(5, answer.getStatus());
            ps.setInt(6, resultId);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insertResult(int UserId, int QuizId) {
        UserAnswerDAO uAD = new UserAnswerDAO();
        int newestId = uAD.getNewestResultId();
        xSql = "insert into Result (ResultId, UserId,QuizId,StartFrom) values (?,?,?,GETDATE())";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, newestId+1);
            ps.setInt(2, UserId);
            ps.setInt(3, QuizId);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void update(int UserId, int QuizId) {
        xSql = "UPDATE Result\n"
                + "SET EndAt = GETDATE()\n"
                + "WHERE ResultId = (SELECT TOP 1 ResultId\n"
                + "            FROM Result\n"
                + "            WHERE UserId = ? AND QuizId = ?\n"
                + "            ORDER BY ResultId DESC);";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, UserId);
            ps.setInt(2, QuizId);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void clearResult() {
        xSql = "DELETE FROM Result WHERE EndAt IS NULL";
        try {
            ps = con.prepareStatement(xSql);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Answer> getAnswersByResultId(int resultId) {
        List<Answer> answers = new ArrayList<>();
        xSql = "select * from UserAnswer where ResultId = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, resultId);
            rs = ps.executeQuery();
            while (rs.next()) {
                int questionId = rs.getInt("QuestionId");
                Question question = qD.getQuestionById(questionId);
                String answer = rs.getString("UserAnswer");
                Account user = aD.getUserById(rs.getInt("UserId"));
                boolean isMarked = rs.getBoolean("isMarked");
                String status = rs.getString("Status");
                answers.add(new Answer(question, answer, user, isMarked, status));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return answers;
    }

    public int getNewestResultId() {
        xSql = "SELECT TOP 1* FROM Result ORDER BY ResultId DESC";
        int resultId = 0;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                resultId = rs.getInt("ResultId");
            }
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultId;
    }
    
    public int getNewestResultId(int UserId, int QuizId) {
        xSql = "SELECT TOP 1* FROM Result WHERE UserId = ? AND QuizId = ? ORDER BY ResultId DESC";
        int resultId = 0;
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, UserId);
            ps.setInt(2, QuizId);
            rs = ps.executeQuery();
            while (rs.next()) {
                resultId = rs.getInt("ResultId");
            }
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultId;
    }

    public static void main(String[] args) {
        UserAnswerDAO uaD = new UserAnswerDAO();
        QuizDAO qD = new QuizDAO();
        Account user = new Account();
        List<Answer> answers = uaD.getAnswersByResultId(3);
        for (Answer answer : answers) {
            System.out.println(answer.getUserAnswer());
        }
        uaD.clearResult();
        int resultId = uaD.getNewestResultId(1, 1);
        System.out.println(resultId);
        double score = ((double) uaD.countCorrect(answers) / answers.size()) * 10;
        DecimalFormat df = new DecimalFormat("#.##");
        String scoreString = df.format(score);
        double passScore = 10 * ((double)qD.getQuizz(3).getPassRate() / 100);
        String pass = (score >= passScore) ? "correct" : "incorrect";
        System.out.println("Score:" + score);
        System.out.println("Score string:" + scoreString);
        System.out.println("Pass rate:" + qD.getQuizz(3).getPassRate());
        System.out.println("Pass score:" + passScore);
        System.out.println("Pass:" + pass);
    }
}
