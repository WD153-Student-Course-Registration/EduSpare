// Overall Purpose: This service manages the CRUD operations for Teacher entities, backing data with a text file.

package com.example.WD153.service;


/**
 * TeacherService provides methods to add, retrieve, and delete teachers.
 * It uses flat-file storage for data persistence.
 */

@Service
public class TeacherService {

    // Text file storing teacher records

    private final String DATA_FILE = "data/teachers.txt";

    /**
     * Initializes the service and creates the necessary data file if missing.
     */

    public TeacherService() {
        try {
            File file = new File(DATA_FILE);
            if (!file.exists()) {
                if (file.getParentFile() !ethod from the Java File class.

🔹 Simple meaning:= null) file.getParentFile().mkdirs();
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
            System.out.println(String.format("%s|%s|%s", teacher.getName(), teacher.getTitle(), teacher.getDepartment()));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

