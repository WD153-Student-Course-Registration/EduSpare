package com.example.WD153.service;

import com.example.WD153.model.Course;
import org.springframework.stereotype.Service;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

@Service
public class CourseService {

    private final String DATA_FILE = "data/courses.txt";

    public CourseService() {
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

    public void saveCourse(Course course) {
        try (FileWriter fw = new FileWriter(DATA_FILE, true);
             BufferedWriter bw = new BufferedWriter(fw);
             PrintWriter out = new PrintWriter(bw)) {
            out.println(formatCourse(course));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private String formatCourse(Course c) {
        return String.format("%s|%s|%s|%s|%d|%d", 
                c.getCode(), 
                c.getTitle(), 
                c.getInstructor(), 
                c.getDescription().replace("\n", " "), // Ensure one line
                c.getCredits(), 
                c.getMaxCapacity());
    }

    public List<Course> getAllCourses() {
        System.out.println("--- [CourseService] 1. Opening courses.txt ---");
        List<Course> courses = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(DATA_FILE))) {
            String line;
            int lineNumber = 1;
            while ((line = br.readLine()) != null) {
                System.out.println("--- [CourseService] 2. Reading line " + lineNumber + ": " + line + " ---");
                if (line.trim().isEmpty()) continue;
                String[] parts = line.split("\\|");
                if (parts.length >= 4) {
                    try {
                        String code = parts[0];
                        String title = parts[1];
                        String instructor;
                        String description = "Learn the fundamentals of " + title;
                        int credits;
                        int capacity = 50;

                        if (parts.length >= 6) {
                            instructor = parts[2];
                            description = parts[3];
                            credits = Integer.parseInt(parts[4]);
                            capacity = Integer.parseInt(parts[5]);
                        } else if (parts.length == 5) {
                            instructor = parts[2];
                            credits = Integer.parseInt(parts[3]);
                            capacity = Integer.parseInt(parts[4]);
                        } else {
                            instructor = parts[2];
                            credits = Integer.parseInt(parts[3]);
                        }
                        courses.add(new Course(code, title, instructor, description, credits, capacity));
                        System.out.println("--- [CourseService] 3. Successfully parsed course: " + code + " ---");
                    } catch (NumberFormatException e) {
                        System.err.println("Skipping malformed course line " + lineNumber + ": " + line);
                    }
                }
                lineNumber++;
            }
            System.out.println("--- [CourseService] 4. Successfully loaded " + courses.size() + " courses ---");
        } catch (IOException e) {
            System.err.println("--- [CourseService] ERROR reading courses.txt: " + e.getMessage());
            e.printStackTrace();
        }
        return courses;
    }

    public void updateCourse(String oldCode, Course updatedCourse) {
        List<Course> courses = getAllCourses();
        try (PrintWriter out = new PrintWriter(new FileWriter(DATA_FILE))) {
            for (Course c : courses) {
                if (c.getCode().equalsIgnoreCase(oldCode)) {
                    out.println(formatCourse(updatedCourse));
                } else {
                    out.println(formatCourse(c));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void deleteCourse(String code) {
        List<Course> courses = getAllCourses();
        try (PrintWriter out = new PrintWriter(new FileWriter(DATA_FILE))) {
            for (Course c : courses) {
                if (!c.getCode().equalsIgnoreCase(code)) {
                    out.println(formatCourse(c));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
