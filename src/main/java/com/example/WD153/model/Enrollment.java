// Overall Purpose: This file defines the Enrollment model class, which represents a student's registration in a specific course.
package com.example.WD153.model;

/**
 * The Enrollment class serves as a data transfer object (DTO) and model entity 
 * to store the relationship between a student and a course.
 */

public class Enrollment {
    // Stores the email address of the enrolled student as a unique identifier
    private String studentEmail;
    // Stores the unique code of the course the student is enrolled in
    private String courseCode;


    /**
     * Default constructor required for frameworks and empty initializations.
     */
    public Enrollment() {}

    /**
     * Parameterized constructor to create an Enrollment instance with specific details.
     * @param studentEmail Email of the student
     * @param courseCode Code of the enrolled course
     */
    public Enrollment(String studentEmail, String courseCode) {
        this.studentEmail = studentEmail;
        this.courseCode = courseCode;
    }

    // --- Getters and Setters ---

    // Retrieves the student's email
    public String getStudentEmail() {
        return studentEmail;
    }
    
    // Updates the student's email
    public void setStudentEmail(String studentEmail) {
        this.studentEmail = studentEmail;
    }
    
    // Retrieves the course code
    public String getCourseCode() {
        return courseCode;
    }

    // Updates the course code
    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }
}
