package com.example.janani.service;

import com.example.janani.model.Enrollment;
import org.springframework.stereotype.Service;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class EnrollmentService {

    private final String DATA_FILE = "data/enrollments.txt";

    public EnrollmentService() {
        try {
            File file = new File(DATA_FILE);
            if (!file.exists()) {
                file.getParentFile().mkdirs();
                file.createNewFile();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void enroll(Enrollment enrollment) {
        try (FileWriter fw = new FileWriter(DATA_FILE, true);
             BufferedWriter bw = new BufferedWriter(fw);
             PrintWriter out = new PrintWriter(bw)) {
            out.println(enrollment.getStudentEmail() + "|" + enrollment.getCourseCode());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<Enrollment> getAllEnrollments() {
        List<Enrollment> enrollments = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(DATA_FILE))) {
            String line;
            while ((line = br.readLine()) != null) {
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

    public List<Enrollment> getStudentEnrollments(String email) {
        return getAllEnrollments().stream()
                .filter(e -> e.getStudentEmail().equalsIgnoreCase(email))
                .collect(Collectors.toList());
    }

    public void dropCourse(String email, String courseCode) {
        List<Enrollment> enrollments = getAllEnrollments();
        try (PrintWriter out = new PrintWriter(new FileWriter(DATA_FILE))) {
            for (Enrollment e : enrollments) {
                if (!(e.getStudentEmail().equalsIgnoreCase(email) && e.getCourseCode().equalsIgnoreCase(courseCode))) {
                    out.println(e.getStudentEmail() + "|" + e.getCourseCode());
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
