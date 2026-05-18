// Overall Purpose: This service class handles the business logic and file-based data operations for managing student course enrollments.
package com.example.WD153.service;

import com.example.WD153.model.Enrollment;
import org.springframework.stereotype.Service;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Service class annotated with @Service to be managed by Spring's dependency injection.
 * It provides methods to enroll students, fetch enrollments, and drop courses.
 */

@Service
public class EnrollmentService {

    // Defines the relative path to the text file where enrollment records are persistently stored
    private final String DATA_FILE = "data/enrollments.txt";
    
    /**
     * Constructor initializes the EnrollmentService.
     * It ensures that the required data directory and file exist when the application starts.
     */
    
    public EnrollmentService() {
        try {
            File file = new File(DATA_FILE);
            // If the file doesn't exist, create parent directories and the file itself
            if (!file.exists()) {
                file.getParentFile().mkdirs();
                file.createNewFile();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    /**
     * Enrolls a student in a course by appending their enrollment details to the text file.
     * @param enrollment The Enrollment object containing student email and course code
     */
    
    public void enroll(Enrollment enrollment) {
        // Uses FileWriter in append mode (true) to add new records without overwriting existing ones
        try (FileWriter fw = new FileWriter(DATA_FILE, true);
             BufferedWriter bw = new BufferedWriter(fw);
             PrintWriter out = new PrintWriter(bw)) {
            // Stores the record in "studentEmail|courseCode" format
            out.println(enrollment.getStudentEmail() + "|" + enrollment.getCourseCode());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * Reads the data file and retrieves all enrollment records.
     * @return A list of all Enrollment objects
     */
    
    public List<Enrollment> getAllEnrollments() {
        List<Enrollment> enrollments = new ArrayList<>();
        // Uses BufferedReader to read the file line by line
        try (BufferedReader br = new BufferedReader(new FileReader(DATA_FILE))) {
            String line;
            while ((line = br.readLine()) != null) {
                // Splits each line by the pipe '|' delimiter
                String[] parts = line.split("\\|");
                if (parts.length >= 2) {
                    enrollments.add(new Enrollment(parts[0], parts[1]));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return enrollments;
    }


    /**
     * Fetches all courses a specific student is enrolled in.
     * @param email The student's email address
     * @return A list of enrollments matching the provided email
     */
    public List<Enrollment> getStudentEnrollments(String email) {
        // Uses Java Streams to filter the list of all enrollments by the student's email
        return getAllEnrollments().stream()
                .filter(e -> e.getStudentEmail().equalsIgnoreCase(email))
                .collect(Collectors.toList());
    }
    
    /**
     * Removes a specific course enrollment for a student.
     * @param email The student's email
     * @param courseCode The code of the course to be dropped
     */

    public void dropCourse(String email, String courseCode) {
        // Retrieves all current enrollments
        List<Enrollment> enrollments = getAllEnrollments();
        // Overwrites the data file, omitting the specific enrollment to be dropped
        try (PrintWriter out = new PrintWriter(new FileWriter(DATA_FILE))) {
            for (Enrollment e : enrollments) {
                // If this is NOT the enrollment we want to drop, write it back to the file
                if (!(e.getStudentEmail().equalsIgnoreCase(email) && e.getCourseCode().equalsIgnoreCase(courseCode))) {
                    out.println(e.getStudentEmail() + "|" + e.getCourseCode());
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
