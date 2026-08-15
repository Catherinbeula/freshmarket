package com.catherinbeulamarket.controller;

import com.catherinbeulamarket.model.User;
import com.catherinbeulamarket.service.LoginService;

import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/api/auth")
public class LoginController {

    private final LoginService loginService;

    public LoginController(LoginService loginService) {
        this.loginService = loginService;
    }

    @PostMapping("/login")
    public String login(
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            HttpSession session) {

        if (email == null || email.isBlank()
                || password == null || password.isBlank()) {

            return "redirect:/login.jsp";
        }

        User user = loginService.login(email, password);

        if (user != null) {

            session.setAttribute("user", user);

            return "redirect:/home.jsp";
        }

        return "redirect:/login.jsp";
    }
}

