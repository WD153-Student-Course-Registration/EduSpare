package com.example.janani.service;

import com.example.janani.model.User;
import org.springframework.stereotype.Service;
import java.io.*;
import java.util.Optional;

@Service
public class UserService {

    private final String DATA_FILE = "data/users.txt";

    public UserService() {
        // Ensure the file exists
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

    public User registerUser(User user) {
        try (FileWriter fw = new FileWriter(DATA_FILE, true);
             BufferedWriter bw = new BufferedWriter(fw);
             PrintWriter out = new PrintWriter(bw)) {
            
            // Format: fullname|email|studentId|password
            String userData = String.format("%s|%s|%s|%s",
                    user.getFullname(),
                    user.getEmail(),
                    user.getStudentId(),
                    user.getPassword());
            
            out.println(userData);
            return user;
        } catch (IOException e) {
            throw new RuntimeException("Could not save user to file", e);
        }
    }

    public Optional<User> loginUser(String email, String password) {
        try (BufferedReader br = new BufferedReader(new FileReader(DATA_FILE))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split("\\|");
                if (parts.length >= 4) {
                    String storedEmail = parts[1];
                    String storedPassword = parts[3];
                    
                    if (storedEmail.equalsIgnoreCase(email) && storedPassword.equals(password)) {
                        User user = new User();
                        user.setFullname(parts[0]);
                        user.setEmail(parts[1]);
                        user.setStudentId(parts[2]);
                        user.setPassword(parts[3]);
                        return Optional.of(user);
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return Optional.empty();
    }
}
