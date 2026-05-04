package com.example.janani.service;

import com.example.janani.model.Course;
import com.example.janani.model.Grade;
import org.springframework.stereotype.Service;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

@Service
public class DashboardService {

    private final String COURSES_FILE = "data/courses.txt";
    private final String GRADES_FILE = "data/grades.txt";

    public List<Course> getAllCourses() {
        List<Course> courses = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(COURSES_FILE))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split("\\|");
                if (parts.length >= 4) {
                    courses.add(new Course(parts[0], parts[1], parts[2], Integer.parseInt(parts[3])));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return courses;
    }

    public List<Grade> getAllGrades() {
        List<Grade> grades = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(GRADES_FILE))) {
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
}
