package com.example.WD153.controller;

import com.example.WD153.model.Admin;
import com.example.WD153.model.Student;
import com.example.WD153.model.User;
import com.example.WD153.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

@Controller
public class AuthController {

    @Autowired
    private UserService userService;

    @PostMapping("/RegisterEndpoint")
    public String register(@RequestParam("fullname") String fullname,
                           @RequestParam("email") String email,
                           @RequestParam("password") String password,
                           @RequestParam("role") String role,
                           @RequestParam(value = "studentId", required = false) String studentId,
                           @RequestParam(value = "major", required = false) String major) {
        try {
            if (userService.existsByEmail(email)) {
                return "redirect:/register?error=Email+already+exists";
            }
            User user;
            if ("STUDENT".equals(role)) {
                user = new Student(null, fullname, email, password, studentId, major, 0.0);
            } else {
                user = new Admin(null, fullname, email, password);
            }

            userService.registerUser(user);
            return "redirect:/login?registered=true";
        } catch (Exception e) {
            e.printStackTrace();
            String errorMessage = e.getMessage() != null ? e.getMessage() : "Unknown error";
            try {
                errorMessage = java.net.URLEncoder.encode(errorMessage, "UTF-8");
            } catch (java.io.UnsupportedEncodingException ex) {
                // Ignore
            }
            return "redirect:/register?error=" + errorMessage;
        }
    }

    @PostMapping("/LoginEndpoint")
    public String login(@RequestParam("email") String email,
                        @RequestParam("password") String password,
                        HttpSession session) {        try {
            Optional<User> user = userService.loginUser(email, password);
            if (user.isPresent()) {
                session.setAttribute("user", user.get());
                return "redirect:/dashboard";
            } else {
                return "redirect:/login?error=invalid";
            }
        } catch (Exception e) {
            return "redirect:/login?error=error";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/index";
    }
}
