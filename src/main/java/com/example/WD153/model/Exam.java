// Overall Purpose: This file defines the Exam model, representing a student's performance or result in a specific course examination.
package com.example.WD153.model;

/**
 * The Exam class encapsulates the data for a student's examination, 
 * including their email, the course, the exam name, and the marks obtained.
 */

public class Exam {
    private String studentEmail; //Identifies the student taking the exam
    private String courseCode;// Identifies the associated course
    private String examName;// The name or type of the exam (e.g., "Final Assessment")
    private double marks;// Obtained marks
    private double maxMarks;// Total possible marks

    /**
     * Default constructor for instantiation without initial values.
     */

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

     /**
     * Calculates the percentage score based on obtained and maximum marks.
     * @return The percentage as a double
     */

   
    public double getPercentage() {
        return (marks / maxMarks) * 100;
    }
}
