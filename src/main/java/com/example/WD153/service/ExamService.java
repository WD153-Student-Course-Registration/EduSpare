package com.example.janani.service;

import com.example.janani.model.Exam;
import org.springframework.stereotype.Service;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ExamService {

    private final String DATA_FILE = "data/exams.txt";

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

    public void deleteExam(String email, String courseCode) {
        List<Exam> exams = getAllExams();
        try (PrintWriter out = new PrintWriter(new FileWriter(DATA_FILE))) {
            for (Exam e : exams) {
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

    public List<Exam> getAllExams() {
        List<Exam> exams = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(DATA_FILE))) {
            String line;
            while ((line = br.readLine()) != null) {
                if (line.trim().isEmpty()) continue;
                String[] parts = line.split("\\|");
                if (parts.length >= 5) {
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

    public List<Exam> getStudentExams(String email) {
        return getAllExams().stream()
                .filter(e -> e.getStudentEmail().equalsIgnoreCase(email))
                .collect(Collectors.toList());
    }
}
