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

