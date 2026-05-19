package com.example.WD153.service;

/**
 * TeacherService provides methods to add, retrieve, and delete teachers.
 * It uses flat-file storage for data persistence.
 */



import com.example.WD153.model.Teacher;
import org.springframework.stereotype.Service;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

@Service
public class TeacherService {

    private final String DATA_FILE = "data/teachers.txt";

      /**
     * Initializes the service and creates the necessary data file if missing.
     */

    public TeacherService() {
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
     * Appends a new teacher record to the text file using a pipe delimiter.
     */

    public void saveTeacher(Teacher teacher) {
        try (FileWriter fw = new FileWriter(DATA_FILE, true);
             BufferedWriter bw = new BufferedWriter(fw);
             PrintWriter out = new PrintWriter(bw)) {
            out.println(String.format("%s|%s|%s", teacher.getName(), teacher.getTitle(), teacher.getDepartment()));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

      /**
     * Reads all teacher records from the text file.
     * @return A list of Teacher objects.
     */

    public List<Teacher> getAllTeachers() {
        List<Teacher> teachers = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(DATA_FILE))) {
            String line;
            while ((line = br.readLine()) != null) {
                if (line.trim().isEmpty()) continue;
                String[] parts = line.split("\\|");
                if (parts.length >= 1) {
                    String name = parts[0];
                    String title = parts.length > 1 ? parts[1] : "Instructor";
                    String dept = parts.length > 2 ? parts[2] : "General";
                    teachers.add(new Teacher(name, title, dept));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return teachers;
    }

     /**
         * Removes a teacher by rewriting the text file, omitting the specific teacher by name.
         */


    public void deleteTeacher(String name) {
        List<Teacher> teachers = getAllTeachers();
        try (PrintWriter out = new PrintWriter(new FileWriter(DATA_FILE))) {
            for (Teacher t : teachers) {
                if (!t.getName().equalsIgnoreCase(name)) {
                    out.println(String.format("%s|%s|%s", t.getName(), t.getTitle(), t.getDepartment()));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
