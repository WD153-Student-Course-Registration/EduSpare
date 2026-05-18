package com.example.WD153.service;

import com.example.WD153.model.Admin;
import com.example.WD153.model.Student;
import com.example.WD153.model.User;
import org.springframework.stereotype.Service;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    private final String DATA_FILE = "data/users.txt";

    public UserService() {
        try {
            File file = new File(DATA_FILE);
            if (!file.exists()) {
                if (file.getParentFile() != null) {
                    file.getParentFile().mkdirs();
                }
                file.createNewFile();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public boolean existsByEmail(String email) {
        return getAllUsers().stream()
                .anyMatch(u -> u.getEmail().equalsIgnoreCase(email));
    }

    public void registerUser(User user) {
        try (FileWriter fw = new FileWriter(DATA_FILE, true);
             BufferedWriter bw = new BufferedWriter(fw);
             PrintWriter out = new PrintWriter(bw)) {
            
            String userData = formatUser(user);
            out.println(userData);
        } catch (IOException e) {
            throw new RuntimeException("Could not save user to file", e);
        }
    }

    private String formatUser(User user) {
        if (user instanceof Student) {
            Student s = (Student) user;
            return String.format("%s|%s|%s|%s|%s|%s|%s",
                    s.getRole(), s.getFullname(), s.getEmail(), s.getPassword(),
                    s.getStudentId(), s.getMajor(), s.getGpa());
        } else {
            return String.format("%s|%s|%s|%s|||",
                    user.getRole(), user.getFullname(), user.getEmail(), user.getPassword());
        }
    }

    public Optional<User> loginUser(String email, String password) {
        return getAllUsers().stream()
                .filter(u -> u.getEmail().equalsIgnoreCase(email) && u.getPassword().equals(password))
                .findFirst();
    }

    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(DATA_FILE))) {
            String line;
            while ((line = br.readLine()) != null) {
                if (line.trim().isEmpty()) continue;
                String[] parts = line.split("\\|", -1);
                if (parts.length >= 4) {
                    String role = parts[0];
                    User user;
                    if ("STUDENT".equals(role)) {
                        Student s = new Student();
                        s.setFullname(parts.length > 1 ? parts[1] : "");
                        s.setEmail(parts.length > 2 ? parts[2] : "");
                        s.setPassword(parts.length > 3 ? parts[3] : "");
                        if (parts.length > 4) s.setStudentId(parts[4]);
                        if (parts.length > 5) s.setMajor(parts[5]);
                        if (parts.length > 6 && !parts[6].trim().isEmpty()) {
                            try {
                                s.setGpa(Double.parseDouble(parts[6].trim()));
                            } catch (NumberFormatException e) {
                                s.setGpa(0.0);
                            }
                        }
                        user = s;
                    } else if ("ADMIN".equals(role)) {
                        Admin a = new Admin();
                        a.setFullname(parts.length > 1 ? parts[1] : "");
                        a.setEmail(parts.length > 2 ? parts[2] : "");
                        a.setPassword(parts.length > 3 ? parts[3] : "");
                        user = a;
                    } else {
                        user = new User();
                        user.setFullname(parts[0]);
                        user.setEmail(parts.length > 1 ? parts[1] : "");
                        user.setRole("STUDENT");
                    }
                    users.add(user);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return users;
    }

    public void updateUser(String oldEmail, User updatedUser) {
        List<User> users = getAllUsers();
        try (PrintWriter out = new PrintWriter(new FileWriter(DATA_FILE))) {
            for (User u : users) {
                if (u.getEmail().equalsIgnoreCase(oldEmail)) {
                    out.println(formatUser(updatedUser));
                } else {
                    out.println(formatUser(u));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void deleteUser(String email) {
        List<User> users = getAllUsers();
        try (PrintWriter out = new PrintWriter(new FileWriter(DATA_FILE))) {
            for (User u : users) {
                if (!u.getEmail().equalsIgnoreCase(email)) {
                    out.println(formatUser(u));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
