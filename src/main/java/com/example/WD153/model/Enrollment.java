package com.example.janani.model;

public class Enrollment {
    private String studentEmail;
    private String courseCode;

    public Enrollment() {}

    public Enrollment(String studentEmail, String courseCode) {
        this.studentEmail = studentEmail;
        this.courseCode = courseCode;
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
}
