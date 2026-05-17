package com.example.janani.controller;

import com.example.janani.model.Course;
import com.example.janani.model.Exam;
import com.example.janani.model.User;
import com.example.janani.service.CourseService;
import com.example.janani.service.ExamService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ExamController {

    @Autowired
    private ExamService examService;

    @Autowired
    private CourseService courseService;

    @GetMapping("/exam")
    public String showExamPage(@RequestParam("courseCode") String courseCode, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null || !"STUDENT".equals(user.getRole())) {
            return "redirect:/login";
        }
        
        Course course = courseService.getAllCourses().stream()
                .filter(c -> c.getCode().equals(courseCode))
                .findFirst()
                .orElse(null);
                
        if (course == null) {
            return "redirect:/dashboard";
        }
        
        model.addAttribute("course", course);
        model.addAttribute("user", user);
        return "exam";
    }

    @PostMapping("/SubmitExam")
    public String submitExam(@RequestParam("courseCode") String courseCode,
                             @RequestParam("marks") double marks,
                             HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null && "STUDENT".equals(user.getRole())) {
            Exam exam = new Exam(user.getEmail(), courseCode, "Final Assessment", marks, 100.0);
            examService.saveExam(exam);
        }
        return "redirect:/dashboard";
    }
}
