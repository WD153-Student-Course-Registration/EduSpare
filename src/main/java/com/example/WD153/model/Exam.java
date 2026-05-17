package com.example.janani.model;

public class Exam {
    private String studentEmail;
    private String courseCode;
    private String examName;
    private double marks; // Obtained marks
    private double maxMarks; // Total possible marks

    public Exam() {}

    public Exam(String studentEmail, String courseCode, String examName, double marks, double maxMarks) {
        this.studentEmail = studentEmail;
        this.courseCode = courseCode;
        this.examName = examName;
        this.marks = marks;
        this.maxMarks = maxMarks;
    }

    public String getStudentEmail() { return studentEmail; }
    public void setStudentEmail(String studentEmail) { this.studentEmail = studentEmail; }

    public String getCourseCode() { return courseCode; }
    public void setCourseCode(String courseCode) { this.courseCode = courseCode; }

    public String getExamName() { return examName; }
    public void setExamName(String examName) { this.examName = examName; }

    public double getMarks() { return marks; }
    public void setMarks(double marks) { this.marks = marks; }

    public double getMaxMarks() { return maxMarks; }
    public void setMaxMarks(double maxMarks) { this.maxMarks = maxMarks; }
    
    public double getPercentage() {
        return (marks / maxMarks) * 100;
    }
}
