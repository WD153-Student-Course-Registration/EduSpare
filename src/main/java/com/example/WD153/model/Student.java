package com.example.WD153.model;

public class Student extends User {
    private String studentId;
    private String major;
    private double gpa;

    public Student() {
        super();
        this.role = "STUDENT";
    }

    public Student(Long id, String fullname, String email, String password, String studentId, String major, double gpa) {
        super(id, fullname, email, password, "STUDENT");
        this.studentId = studentId;
        this.major = major;
        this.gpa = gpa;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public double getGpa() {
        return gpa;
    }

    public void setGpa(double gpa) {
        this.gpa = gpa;
    }
}
