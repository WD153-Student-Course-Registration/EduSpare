package com.example.janani.controller;

import com.example.janani.service.DashboardService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DashboardController {

    @Autowired
    private DashboardService dashboardService;

    @GetMapping("/dashboard")
    public String getDashboard(@RequestParam(defaultValue = "overview") String tab, 
                               HttpSession session, 
                               Model model) {
        if (session.getAttribute("user") == null) {
            return "redirect:/login";
        }

        model.addAttribute("activeTab", tab);

        switch (tab) {
            case "courses":
                model.addAttribute("courses", dashboardService.getAllCourses());
                break;
            case "grades":
                model.addAttribute("grades", dashboardService.getAllGrades());
                break;
            case "profile":
                // User info is already in session
                break;
            default:
                // Overview stats (can be dynamic later)
                model.addAttribute("enrolledCount", dashboardService.getAllCourses().size());
                break;
        }

        return "dashboard";
    }
}
