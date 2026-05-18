// Overall Purpose: This service calculates GPAs and manages grade records, reading from a file-based data store.

package com.example.WD153.service;

import com.example.WD153.model.Exam;
import com.example.WD153.model.Grade;
import org.springframework.stereotype.Service;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * GradeService provides the logic to calculate Grade Point Averages (GPA)
 * either from stored letter grades or dynamically from exam percentages.
 */

@Service
public class GradeService {
    // Text file where legacy letter grades are stored

    private final String DATA_FILE = "data/grades.txt";


    /**
     * Initializes the service and creates the grades file if it doesn't exist.
     */

    public GradeService() {
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
     * Reads all grade records from the data file.
     */

    public List<Grade> getAllGrades() {
        List<Grade> grades = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(DATA_FILE))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split("\\|");
                if (parts.length >= 3) {
                    grades.add(new Grade(parts[0], parts[1], parts[2]));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return grades;
    }

    /**
     * Calculates the overall GPA based on legacy letter grades stored in the file.
     * @param email The student's email
     * @return The calculated GPA on a 4.0 scale
     */

    public double calculateGPA(String email) {
        // Filter grades for the specific student
        List<Grade> studentGrades = getAllGrades().stream()
                .filter(g -> g.getStudentEmail().equalsIgnoreCase(email))
                .collect(Collectors.toList());

        if (studentGrades.isEmpty()) return 0.0;

        double totalPoints = 0;
        // Sum up the converted points
        for (Grade g : studentGrades) {
            totalPoints += convertGradeToPoints(g.getGradeValue());
        }
        return totalPoints / studentGrades.size();
    }

    /**
     * Internal helper to convert a letter grade (e.g., "A-") into a numerical GPA point value.
     */

    private double convertGradeToPoints(String gradeValue) {
        if (gradeValue == null) return 0.0;
        switch (gradeValue.trim().toUpperCase()) {
            case "A+":
            case "A": return 4.0;
            case "A-": return 3.7;
            case "B+": return 3.3;
            case "B": return 3.0;
            case "B-": return 2.7;
            case "C+": return 2.3;
            case "C": return 2.0;
            case "C-": return 1.7;
            case "D+": return 1.3;
            case "D": return 1.0;
            case "F": return 0.0;
            default: return 0.0;
        }
    }

    /**
     * Calculates a dynamic GPA based purely on recent exam percentage scores.
     * This is the primary method used by the dashboard.
     * @param exams List of student's completed exams
     * @return GPA on a 4.0 scale
     */

    public double calculateGPAFromExams(List<Exam> exams) {
        if (exams.isEmpty()) return 0.0;

        // Sum all exam percentages
        double totalPercentage = 0;
        for (Exam e : exams) {
            totalPercentage += e.getPercentage();
        }

        // Find average percentage
        double averagePercentage = totalPercentage / exams.size();

        // Convert the average percentage to the 4.0 scale using distinct brackets
        if (averagePercentage >= 85) return 4.0;
        if (averagePercentage >= 75) return 3.5;
        if (averagePercentage >= 65) return 3.0;
        if (averagePercentage >= 55) return 2.5;
        if (averagePercentage >= 45) return 2.0;
        return 1.0;
    }
}
