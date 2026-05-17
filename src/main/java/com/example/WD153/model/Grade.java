package com.example.janani.model;

public class Grade {
    private String studentEmail;
    private String courseCode;
    private String gradeValue; // A, B, C, etc.

    public Grade() {}

    public Grade(String studentEmail, String courseCode, String gradeValue) {
        this.studentEmail = studentEmail;
        this.courseCode = courseCode;
        this.gradeValue = gradeValue;
    }

    public String getStudentEmail() {
        return studentEmail;
    }

    public void setStudentEmail(String studentEmail) {
        this.studentEmail = studentEmail;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    public String getGradeValue() {
        return gradeValue;
    }

    public void setGradeValue(String gradeValue) {
        this.gradeValue = gradeValue;
    }
}
