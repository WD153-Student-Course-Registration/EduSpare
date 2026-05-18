
package com.example.WD153.model;

/**
 * The Grade class acts as a DTO to store a student's final letter grade for a specific course.
 */

public class Grade {
    private String studentEmail;
    private String courseCode;
    private String gradeValue; // A, B, C, etc.

    /**
     * Default constructor required for framework instantiation.
     */

    public Grade() {}

    /**
     * Parameterized constructor to initialize a grade.
     */

    public Grade(String studentEmail, String courseCode, String gradeValue) {
        this.studentEmail = studentEmail;
        this.courseCode = courseCode;
        this.gradeValue = gradeValue;
    }

    // --- Getters and Setters ---

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
