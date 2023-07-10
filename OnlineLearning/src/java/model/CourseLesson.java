/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class CourseLesson {
    int LessonId;
    int CourseId;
    String LessonName;
    String LessonTopic;
    int LessonOrder;
    int LessonTypeId;
    String VideoLink;
    String Content;
    boolean status;
    int QuizId;

    public CourseLesson() {
    }

    public CourseLesson(int LessonId, int CourseId, String LessonName, String LessonTopic, int LessonOrder, int LessonTypeId, String VideoLink, String Content, boolean status, int QuizId) {
        this.LessonId = LessonId;
        this.CourseId = CourseId;
        this.LessonName = LessonName;
        this.LessonTopic = LessonTopic;
        this.LessonOrder = LessonOrder;
        this.LessonTypeId = LessonTypeId;
        this.VideoLink = VideoLink;
        this.Content = Content;
        this.status = status;
        this.QuizId = QuizId;
    }

    public int getLessonId() {
        return LessonId;
    }

    public void setLessonId(int LessonId) {
        this.LessonId = LessonId;
    }

    public int getCourseId() {
        return CourseId;
    }

    public void setCourseId(int CourseId) {
        this.CourseId = CourseId;
    }

    public String getLessonName() {
        return LessonName;
    }

    public void setLessonName(String LessonName) {
        this.LessonName = LessonName;
    }

    public String getLessonTopic() {
        return LessonTopic;
    }

    public void setLessonTopic(String LessonTopic) {
        this.LessonTopic = LessonTopic;
    }

    public int getLessonOrder() {
        return LessonOrder;
    }

    public void setLessonOrder(int LessonOrder) {
        this.LessonOrder = LessonOrder;
    }

    public int getLessonTypeId() {
        return LessonTypeId;
    }

    public void setLessonTypeId(int LessonTypeId) {
        this.LessonTypeId = LessonTypeId;
    }

    public String getVideoLink() {
        return VideoLink;
    }

    public void setVideoLink(String VideoLink) {
        this.VideoLink = VideoLink;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String Content) {
        this.Content = Content;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getQuizId() {
        return QuizId;
    }

    public void setQuizId(int QuizId) {
        this.QuizId = QuizId;
    }

    @Override
    public String toString() {
        return "CourseLesson{" + "LessonId=" + LessonId + ", CourseId=" + CourseId + ", LessonName=" + LessonName + ", LessonTopic=" + LessonTopic + ", LessonOrder=" + LessonOrder + ", LessonTypeId=" + LessonTypeId + ", VideoLink=" + VideoLink + ", Content=" + Content + ", status=" + status + ", QuizId=" + QuizId + '}';
    }
    
    
}
