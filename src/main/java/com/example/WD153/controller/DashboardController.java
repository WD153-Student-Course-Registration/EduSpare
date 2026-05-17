package com.example.janani.controller;

import com.example.janani.model.*;
import com.example.janani.service.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
public class DashboardController {

    @Autowired
    private UserService userService;

    @Autowired
    private CourseService courseService;

    @Autowired
    private EnrollmentService enrollmentService;

    @Autowired
    private GradeService gradeService;

    @Autowired
    private ExamService examService;

    @Autowired
    private TeacherService teacherService;

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        
        model.addAttribute("user", user);
        
        if ("ADMIN".equals(user.getRole())) {
            model.addAttribute("users", userService.getAllUsers());
            model.addAttribute("availableCourses", courseService.getAllCourses());
            return "dashboard";
        } else {
            Student student = (Student) user;
            List<Enrollment> enrollments = enrollmentService.getStudentEnrollments(student.getEmail());
            List<String> enrolledCodes = enrollments.stream()
                    .map(Enrollment::getCourseCode)
                    .collect(Collectors.toList());
            
            List<Course> enrolledCourses = courseService.getAllCourses().stream()
                    .filter(c -> enrolledCodes.contains(c.getCode()))
                    .collect(Collectors.toList());
            
            List<Exam> studentExams = examService.getStudentExams(student.getEmail());
            
            int totalCredits = enrolledCourses.stream().mapToInt(Course::getCredits).sum();
            
            // Prioritize Exam results for GPA calculation
            double calculatedGPA = gradeService.calculateGPAFromExams(studentExams);
            if (calculatedGPA == 0) calculatedGPA = gradeService.calculateGPA(student.getEmail());
            
            student.setGpa(calculatedGPA);
            
            model.addAttribute("student", student);
            model.addAttribute("enrolledCourses", enrolledCourses);
            model.addAttribute("enrolledCodes", enrolledCodes);
            model.addAttribute("studentExams", studentExams);
            model.addAttribute("totalCredits", totalCredits);
            model.addAttribute("gpa", String.format("%.2f", calculatedGPA));
            model.addAttribute("availableCourses", courseService.getAllCourses());
            return "dashboard";
        }
    }

    @GetMapping("/teachers")
    public String teachers(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        model.addAttribute("user", user);
        
        List<Course> allCourses = courseService.getAllCourses();
        Map<String, List<Course>> courseMap = allCourses.stream()
                .collect(Collectors.groupingBy(Course::getInstructor));
                
        List<Teacher> standaloneTeachers = teacherService.getAllTeachers();
        Map<Teacher, List<Course>> teacherProfiles = new java.util.LinkedHashMap<>();
        
        for (Teacher t : standaloneTeachers) {
            teacherProfiles.put(t, courseMap.getOrDefault(t.getName(), new java.util.ArrayList<>()));
            courseMap.remove(t.getName());
        }
        
        for (Map.Entry<String, List<Course>> entry : courseMap.entrySet()) {
            if (!"Unassigned".equals(entry.getKey())) {
                Teacher unknownTeacher = new Teacher(entry.getKey(), "Lead Instructor", "General");
                teacherProfiles.put(unknownTeacher, entry.getValue());
            }
        }
                
        model.addAttribute("teacherProfiles", teacherProfiles);
        return "teachers";
    }

    @GetMapping("/courseDetails")
    public String courseDetails(@RequestParam("code") String code, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        Course course = courseService.getAllCourses().stream()
                .filter(c -> c.getCode().equals(code))
                .findFirst()
                .orElse(null);
        
        if (course == null) {
            return "redirect:/dashboard";
        }
        
        model.addAttribute("user", user);
        model.addAttribute("course", course);
        return "courseDetails";
    }

    @GetMapping("/studentProfile")
    public String studentProfile(@RequestParam("email") String email, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null || !"ADMIN".equals(user.getRole())) {
            return "redirect:/dashboard";
        }

        User targetUser = userService.getAllUsers().stream()
                .filter(u -> u.getEmail().equals(email))
                .findFirst()
                .orElse(null);

        if (targetUser == null || !"STUDENT".equals(targetUser.getRole())) {
            return "redirect:/dashboard";
        }

        Student student = (Student) targetUser;
        List<Enrollment> enrollments = enrollmentService.getStudentEnrollments(student.getEmail());
        List<String> enrolledCodes = enrollments.stream()
                .map(Enrollment::getCourseCode)
                .collect(Collectors.toList());

        List<Course> enrolledCourses = courseService.getAllCourses().stream()
                .filter(c -> enrolledCodes.contains(c.getCode()))
                .collect(Collectors.toList());

        List<Exam> studentExams = examService.getStudentExams(student.getEmail());

        int totalCredits = enrolledCourses.stream().mapToInt(Course::getCredits).sum();

        double calculatedGPA = gradeService.calculateGPAFromExams(studentExams);
        if (calculatedGPA == 0) calculatedGPA = gradeService.calculateGPA(student.getEmail());
        
        student.setGpa(calculatedGPA);

        model.addAttribute("user", user);
        model.addAttribute("student", student);
        model.addAttribute("enrolledCourses", enrolledCourses);
        model.addAttribute("studentExams", studentExams);
        model.addAttribute("totalCredits", totalCredits);
        model.addAttribute("gpa", String.format("%.2f", calculatedGPA));

        return "studentProfile";
    }

    @PostMapping("/UpdateProfile")
    public String updateProfile(@RequestParam("fullname") String fullname,
                                @RequestParam(value = "studentId", required = false) String studentId,
                                @RequestParam(value = "major", required = false) String major,
                                HttpSession session) {
        User currentUser = (User) session.getAttribute("user");
        if (currentUser == null) return "redirect:/login";

        User updatedUser;
        if ("STUDENT".equals(currentUser.getRole())) {
            Student s = (Student) currentUser;
            updatedUser = new Student(s.getId(), fullname, currentUser.getEmail(), s.getPassword(), studentId, major, s.getGpa());
        } else {
            updatedUser = new Admin(currentUser.getId(), fullname, currentUser.getEmail(), currentUser.getPassword());
        }

        userService.updateUser(currentUser.getEmail(), updatedUser);
        session.setAttribute("user", updatedUser);
        return "redirect:/dashboard";
    }

    @PostMapping("/ChangePassword")
    public String changePassword(@RequestParam("newPassword") String newPassword, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            user.setPassword(newPassword);
            userService.updateUser(user.getEmail(), user);
        }
        return "redirect:/dashboard?passwordChanged=true";
    }

    @PostMapping("/DeleteUser")
    public String deleteUser(@RequestParam("email") String email, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null && "ADMIN".equals(user.getRole())) {
            userService.deleteUser(email);
        }
        return "redirect:/dashboard";
    }
}
