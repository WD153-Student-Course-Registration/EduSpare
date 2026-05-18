package com.example.WD153.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController {

    @GetMapping({"/", "/index", "/index.jsp"})
    public String index() {
        return "index";
    }

    @GetMapping({"/login", "/login.jsp"})
    public String loginPage() {
        return "login";
    }

    @GetMapping({"/register", "/register.jsp"})
    public String registerPage() {
        return "register";
    }
}
