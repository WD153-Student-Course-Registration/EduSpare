// Overall Purpose: This file defines the Student model class, which inherits from the base User class and adds student-specific attributes.
package com.example.WD153.model;

/**
 * The Student class extends the User class, inheriting common properties like id, fullname, email, and password.
 * It introduces additional properties specific to a student profile.
 */

public class Student extends User {
    // Unique identifier assigned by the institution
    private String studentId;
    // The student's chosen academic major or field of study
    private String major;
    // The student's Grade Point Average
    private double gpa;

    /**
     * Default constructor.
     * Explicitly sets the role of this user type to "STUDENT".
     */
    public Student() {
        super();
        this.role = "STUDENT";
    }

    /**
     * Parameterized constructor for fully initializing a Student object.
     * Calls the superclass (User) constructor for common attributes.
     */
    public Student(Long id, String fullname, String email, String password, String studentId, String major, double gpa) {
        super(id, fullname, email, password, "STUDENT");
        this.studentId = studentId;
        this.major = major;
        this.gpa = gpa;
    }

    // --- Getters and Setters ---

    // Retrieves the student ID

    public String getStudentId() {
        return studentId;
    }
    // Updates the student ID
    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    // Retrieves the student's major
    public String getMajor() {
        return major;
    }

    // Updates the student's major
    public void setMajor(String major) {
        this.major = major;
    }

    // Retrieves the student's GPA
    public double getGpa() {
        return gpa;
    }
    
    // Updates the student's GPA
    public void setGpa(double gpa) {
        this.gpa = gpa;
    }
}
