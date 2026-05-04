package com.example.janani.controller;

import com.example.janani.model.User;
import com.example.janani.service.UserService;
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
    public String register(@RequestParam String fullname,
                           @RequestParam String email,
                           @RequestParam(required = false) String studentId,
                           @RequestParam String password) {
        try {
            User user = new User();
            user.setFullname(fullname);
            user.setEmail(email);
            user.setStudentId(studentId);
            user.setPassword(password);
            
            userService.registerUser(user);
            return "redirect:/login?registered=true";
        } catch (Exception e) {
            return "redirect:/register?error=failed";
        }
    }

    @PostMapping("/LoginEndpoint")
    public String login(@RequestParam String email,
                        @RequestParam String password,
                        HttpSession session) {
        try {
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
