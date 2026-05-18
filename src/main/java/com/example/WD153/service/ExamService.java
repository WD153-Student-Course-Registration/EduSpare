// Overall Purpose: This service handles the persistent storage and retrieval of exam records using a text file.
package com.example.WD153.service;

import com.example.WD153.model.Exam;
import org.springframework.stereotype.Service;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Service responsible for managing Exam data, including saving, deleting, and fetching records.
 */

@Service
public class ExamService {
    // File path where exam results are saved
    private final String DATA_FILE = "data/exams.txt";

    /**
     * Constructor initializes the service and ensures the data file exists.
     */
    public ExamService() {
        try {
            File file = new File(DATA_FILE);
            if (!file.exists()) {
                if (file.getParentFile() != null) file.getParentFile().mkdirs();
                file.createNewFile();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    /**
     * Saves a new exam record to the text file.
     * Uses append mode so previous records are not overwritten.
     */

    public void saveExam(Exam exam) {
        try (FileWriter fw = new FileWriter(DATA_FILE, true);
             BufferedWriter bw = new BufferedWriter(fw);
             PrintWriter out = new PrintWriter(bw)) {
            // Write exam details separated by the '|' delimiter
            out.println(String.format("%s|%s|%s|%.2f|%.2f",
                    exam.getStudentEmail(),
                    exam.getCourseCode(),
                    exam.getExamName(),
                    exam.getMarks(),
                    exam.getMaxMarks()));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * Deletes a specific exam record for a student by rewriting the file without it.
     */

     public void deleteExam(String email, String courseCode) {
        List<Exam> exams = getAllExams();
        try (PrintWriter out = new PrintWriter(new FileWriter(DATA_FILE))) {
            for (Exam e : exams) {
                // If the record does not match the target, write it back
                if (!(e.getStudentEmail().equalsIgnoreCase(email) && e.getCourseCode().equalsIgnoreCase(courseCode))) {
                    out.println(String.format("%s|%s|%s|%.2f|%.2f",
                            e.getStudentEmail(),
                            e.getCourseCode(),
                            e.getExamName(),
                            e.getMarks(),
                            e.getMaxMarks()));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * Retrieves all exam records from the text file.
     * Parses each line and creates Exam objects.
     */

    public List<Exam> getAllExams() {
        List<Exam> exams = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(DATA_FILE))) {
            String line;
            while ((line = br.readLine()) != null) {
                if (line.trim().isEmpty()) continue;
                String[] parts = line.split("\\|");
                if (parts.length >= 5) {
                    // Reconstruct Exam object from the delimited string
                    exams.add(new Exam(parts[0], parts[1], parts[2], 
                            Double.parseDouble(parts[3]), 
                            Double.parseDouble(parts[4])));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return exams;
    }
    /**
     * Fetches all exam results for a specific student using their email.
     */
    public List<Exam> getStudentExams(String email) {
        return getAllExams().stream()
                .filter(e -> e.getStudentEmail().equalsIgnoreCase(email))
                .collect(Collectors.toList());
    }
}



    


    

