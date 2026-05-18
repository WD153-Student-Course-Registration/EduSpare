package com.example.WD153.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * PageController acts as a basic router for static or primary entry pages.
 * It maps root URLs to their corresponding JSP views.
 */

@Controller
public class PageController {

    
    /**
     * Maps the root and index URLs to the landing page.
     * @return The "index" view name to render index.jsp
     */

    @GetMapping({"/", "/index", "/index.jsp"})
    public String index() {
        return "index";
    }

    /**
     * Maps login-related URLs to the login page.
     * @return The "login" view name to render login.jsp
     */

    @GetMapping({"/login", "/login.jsp"})
    public String loginPage() {
        return "login";
    }

    /**
     * Maps registration-related URLs to the registration page.
     * @return The "register" view name to render register.jsp
     */

    @GetMapping({"/register", "/register.jsp"})
    public String registerPage() {
        return "register";
    }
}
