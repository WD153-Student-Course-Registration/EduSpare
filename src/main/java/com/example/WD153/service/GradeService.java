package com.example.janani.service;

import com.example.janani.model.Exam;
import com.example.janani.model.Grade;
import org.springframework.stereotype.Service;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class GradeService {

    private final String DATA_FILE = "data/grades.txt";

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

    public double calculateGPA(String email) {
        List<Grade> studentGrades = getAllGrades().stream()
                .filter(g -> g.getStudentEmail().equalsIgnoreCase(email))
                .collect(Collectors.toList());

        if (studentGrades.isEmpty()) return 0.0;

        double totalPoints = 0;
        for (Grade g : studentGrades) {
            totalPoints += convertGradeToPoints(g.getGradeValue());
        }
        return totalPoints / studentGrades.size();
    }

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

    public double calculateGPAFromExams(List<Exam> exams) {
        if (exams.isEmpty()) return 0.0;
        
        double totalPercentage = 0;
        for (Exam e : exams) {
            totalPercentage += e.getPercentage();
        }
        
        double averagePercentage = totalPercentage / exams.size();
        
        // Convert percentage to 4.0 scale
        if (averagePercentage >= 85) return 4.0;
        if (averagePercentage >= 75) return 3.5;
        if (averagePercentage >= 65) return 3.0;
        if (averagePercentage >= 55) return 2.5;
        if (averagePercentage >= 45) return 2.0;
        return 1.0;
    }
}
