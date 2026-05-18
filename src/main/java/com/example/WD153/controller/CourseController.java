package com.example.janani.controller;

import com.example.janani.model.Course;
import com.example.janani.model.Enrollment;
import com.example.janani.model.User;
import com.example.janani.model.Teacher;
import com.example.janani.service.CourseService;
import com.example.janani.service.EnrollmentService;
import com.example.janani.service.ExamService;
import com.example.janani.service.TeacherService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CourseController {

    @Autowired
    private CourseService courseService;

    @Autowired
    private EnrollmentService enrollmentService;

    @Autowired
    private ExamService examService;

    @Autowired
    private TeacherService teacherService;

    @PostMapping("/AddCourse")
    public String addCourse(@RequestParam("code") String code,
                            @RequestParam("title") String title,
                            @RequestParam("instructor") String instructor,
                            @RequestParam("credits") int credits,
                            @RequestParam("maxCapacity") int maxCapacity,
                            HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null && "ADMIN".equals(user.getRole())) {
            Course course = new Course(code, title, instructor, credits, maxCapacity);
            courseService.saveCourse(course);
        }
        return "redirect:/dashboard";
    }

    @PostMapping("/UpdateCourse")
    public String updateCourse(@RequestParam("oldCode") String oldCode,
                               @RequestParam("code") String code,
                               @RequestParam("title") String title,
                               @RequestParam("instructor") String instructor,
                               @RequestParam("credits") int credits,
                               @RequestParam("maxCapacity") int maxCapacity,
                               HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null && "ADMIN".equals(user.getRole())) {
            Course course = new Course(code, title, instructor, credits, maxCapacity);
            courseService.updateCourse(oldCode, course);
        }
        return "redirect:/dashboard";
    }

    @PostMapping("/DeleteCourse")
    public String deleteCourse(@RequestParam("code") String code, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null && "ADMIN".equals(user.getRole())) {
            courseService.deleteCourse(code);
        }
        return "redirect:/dashboard";
    }

    @PostMapping("/EnrollCourse")
    public String enrollCourse(@RequestParam("courseCode") String courseCode, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null && "STUDENT".equals(user.getRole())) {
            enrollmentService.enroll(new Enrollment(user.getEmail(), courseCode));
        }
        return "redirect:/dashboard";
    }

    @PostMapping("/DropCourse")
    public String dropCourse(@RequestParam("courseCode") String courseCode, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null && "STUDENT".equals(user.getRole())) {
            enrollmentService.dropCourse(user.getEmail(), courseCode);
            examService.deleteExam(user.getEmail(), courseCode);
        }
        return "redirect:/dashboard";
    }

    @PostMapping("/RemoveTeacher")
    public String removeTeacher(@RequestParam("instructor") String instructor, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null && "ADMIN".equals(user.getRole())) {
            java.util.List<Course> courses = courseService.getAllCourses();
            for (Course c : courses) {
                if (c.getInstructor().equals(instructor)) {
                    Course updated = new Course(c.getCode(), c.getTitle(), "Unassigned", c.getDescription(), c.getCredits(), c.getMaxCapacity());
                    courseService.updateCourse(c.getCode(), updated);
                }
            }
            teacherService.deleteTeacher(instructor);
        }
        return "redirect:/teachers";
    }

    @PostMapping("/AddTeacher")
    public String addTeacher(@RequestParam("name") String name,
                             @RequestParam("title") String title,
                             @RequestParam("department") String department,
                             HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null && "ADMIN".equals(user.getRole())) {
            Teacher teacher = new Teacher(name, title, department);
            teacherService.saveTeacher(teacher);
        }
        return "redirect:/teachers";
    }
}
