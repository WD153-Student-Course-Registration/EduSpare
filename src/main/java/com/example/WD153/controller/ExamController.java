// Overall Purpose: This controller manages web requests related to taking and submitting exams.
package com.example.WD153.controller;

import com.example.WD153.model.Course;
import com.example.WD153.model.Exam;
import com.example.WD153.model.User;
import com.example.WD153.service.CourseService;
import com.example.WD153.service.ExamService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Controller class that handles the exam routing and submission logic.
 */

@Controller
public class ExamController {

    @Autowired
    private ExamService examService; // Service to manage exam data operations

    @Autowired
    private CourseService courseService; // Service to manage course data operations

     /**
     * Handles GET requests to display the exam page for a specific course.
     * Validates that a user is logged in and is a "STUDENT".
     */

    @GetMapping("/exam")
    public String showExamPage(@RequestParam("courseCode") String courseCode, HttpSession session, Model model) {
        // Retrieve the currently logged-in user from the session
        User user = (User) session.getAttribute("user");
        if (user == null || !"STUDENT".equals(user.getRole())) {
            // Redirect to login if not authorized
            return "redirect:/login";
        }
        
         // Find the course details for the exam
        Course course = courseService.getAllCourses().stream()
                .filter(c -> c.getCode().equals(courseCode))
                .findFirst()
                .orElse(null);
                
        if (course == null) {
        // Redirect to dashboard if the course is invalid
            return "redirect:/dashboard";
        }
        
        // Pass course and user details to the view
        model.addAttribute("course", course);
        model.addAttribute("user", user);
        return "exam"; // Renders the exam.jsp view
    }
    
     /**
     * Handles POST requests when a student submits an exam.
     * Automatically calculates or receives the marks and saves the exam record.
     */
    
    @PostMapping("/SubmitExam")
    public String submitExam(@RequestParam("courseCode") String courseCode,
                             @RequestParam("marks") double marks,
                             HttpSession session) {
        // Retrieve the current user from the session
        User user = (User) session.getAttribute("user");
        if (user != null && "STUDENT".equals(user.getRole())) {
            // Create a new Exam record and save it using ExamService
            Exam exam = new Exam(user.getEmail(), courseCode, "Final Assessment", marks, 100.0);
            examService.saveExam(exam);
        }
        // Redirect back to the dashboard after submission
        return "redirect:/dashboard";
    }
}
