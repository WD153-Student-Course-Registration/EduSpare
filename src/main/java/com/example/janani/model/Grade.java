package com.example.janani.model;

public class Grade {
    private String courseName;
    private String grade;
    private String semester;

    public Grade(String courseName, String grade, String semester) {
        this.courseName = courseName;
        this.grade = grade;
        this.semester = semester;
    }

    public String getCourseName() { return courseName; }
    public String getGrade() { return grade; }
    public String getSemester() { return semester; }
}
