// Overall Purpose: This is the main controller that powers the dashboard views for both Students and Admins, orchestrating data from multiple services.
package com.example.WD153.controller;

import com.example.WD153.model.*;
import com.example.WD153.service.*;
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

    /**
     * Main handler for the /dashboard route.
     * Renders different data sets based on whether the logged-in user is an ADMIN or STUDENT.
     */


    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        
        model.addAttribute("user", user);
        
        if ("ADMIN".equals(user.getRole())) {
            // Admins need a global view of users and available courses
            model.addAttribute("users", userService.getAllUsers());
            model.addAttribute("availableCourses", courseService.getAllCourses());
            return "dashboard";
        } else {
            // Students need a personalized view of their enrollments and academic standing
            Student student = (Student) user;
            List<Enrollment> enrollments = enrollmentService.getStudentEnrollments(student.getEmail());
            List<String> enrolledCodes = enrollments.stream()
                    .map(Enrollment::getCourseCode)
                    .collect(Collectors.toList());

            // Extract just the course codes the student is enrolled in

            List<Course> enrolledCourses = courseService.getAllCourses().stream()
                    .filter(c -> enrolledCodes.contains(c.getCode()))
                    .collect(Collectors.toList());

            // Fetch exams and calculate totals
            List<Exam> studentExams = examService.getStudentExams(student.getEmail());
            
            int totalCredits = enrolledCourses.stream().mapToInt(Course::getCredits).sum();
            
            // Prioritize Exam results for GPA calculation
            double calculatedGPA = gradeService.calculateGPAFromExams(studentExams);
            if (calculatedGPA == 0) calculatedGPA = gradeService.calculateGPA(student.getEmail());
            
            student.setGpa(calculatedGPA);

            // Pass all structured data to the JSP view
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

    /**
     * Handles the display of the faculty directory.
     * Correlates standalone teacher profiles with instructors assigned to courses.
     */

    @GetMapping("/teachers")
    public String teachers(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        model.addAttribute("user", user);

        // Group all courses by instructor name
        List<Course> allCourses = courseService.getAllCourses();
        Map<String, List<Course>> courseMap = allCourses.stream()
                .collect(Collectors.groupingBy(Course::getInstructor));

        // Combine registered teachers with the grouped courses
        List<Teacher> standaloneTeachers = teacherService.getAllTeachers();
        Map<Teacher, List<Course>> teacherProfiles = new java.util.LinkedHashMap<>();
        
        for (Teacher t : standaloneTeachers) {
            teacherProfiles.put(t, courseMap.getOrDefault(t.getName(), new java.util.ArrayList<>()));
            courseMap.remove(t.getName());
        }

        // Handle courses whose instructors aren't officially in the Teacher database
        for (Map.Entry<String, List<Course>> entry : courseMap.entrySet()) {
            if (!"Unassigned".equals(entry.getKey())) {
                Teacher unknownTeacher = new Teacher(entry.getKey(), "Lead Instructor", "General");
                teacherProfiles.put(unknownTeacher, entry.getValue());
            }
        }
                
        model.addAttribute("teacherProfiles", teacherProfiles);
        return "teachers";
    }

    /**
     * Fetches details for a specific course to be viewed by the user.
     */

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

    /**
     * Allows an Admin to view a specific student's profile and academic record.
     */

    @GetMapping("/studentProfile")
    public String studentProfile(@RequestParam("email") String email, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        // Access control: only ADMINs can view this route
        if (user == null || !"ADMIN".equals(user.getRole())) {
            return "redirect:/dashboard";
        }

        // Find the target user
        User targetUser = userService.getAllUsers().stream()
                .filter(u -> u.getEmail().equals(email))
                .findFirst()
                .orElse(null);

        if (targetUser == null || !"STUDENT".equals(targetUser.getRole())) {
            return "redirect:/dashboard";
        }

        // Reconstruct the student's dashboard data (similar to student dashboard logic)
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

    /**
     * Handles the form submission to update a user's own profile information.
     */

    @PostMapping("/UpdateProfile")
    public String updateProfile(@RequestParam("fullname") String fullname,
                                @RequestParam(value = "studentId", required = false) String studentId,
                                @RequestParam(value = "major", required = false) String major,
                                HttpSession session) {
        User currentUser = (User) session.getAttribute("user");
        if (currentUser == null) return "redirect:/login";

        // Recreate the user object with updated fields while preserving immutable ones
        User updatedUser;
        if ("STUDENT".equals(currentUser.getRole())) {
            Student s = (Student) currentUser;
            updatedUser = new Student(s.getId(), fullname, currentUser.getEmail(), s.getPassword(), studentId, major, s.getGpa());
        } else {
            updatedUser = new Admin(currentUser.getId(), fullname, currentUser.getEmail(), currentUser.getPassword());
        }

        userService.updateUser(currentUser.getEmail(), updatedUser);
        session.setAttribute("user", updatedUser);// Update the active session
        return "redirect:/dashboard";
    }


    /**
     * Handles password change requests from the settings tab.
     */

    @PostMapping("/ChangePassword")
    public String changePassword(@RequestParam("newPassword") String newPassword, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            user.setPassword(newPassword);
            userService.updateUser(user.getEmail(), user);
        }
        return "redirect:/dashboard?passwordChanged=true";
    }

    /**
     * Allows an Admin to delete a user from the system.
     */

    @PostMapping("/DeleteUser")
    public String deleteUser(@RequestParam("email") String email, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null && "ADMIN".equals(user.getRole())) {
            userService.deleteUser(email);
        }
        return "redirect:/dashboard";
    }
}
