package com.catherinbeulamarket.controller;

import com.catherinbeulamarket.model.User;
import com.catherinbeulamarket.service.LoginService;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
public class LoginController {

    private final LoginService loginService;

    public LoginController(LoginService loginService) {
        this.loginService = loginService;
    }

    @PostMapping("/login")
    public String login(
            @RequestParam String email,
            @RequestParam String password) {

        if (email == null || email.isBlank()
                || password == null || password.isBlank()) {

            return "Email and password are required";
        }

        User user = loginService.login(email, password);

        if (user != null) {
            return "Login successful";
        }

        return "Invalid email or password";
    }
}