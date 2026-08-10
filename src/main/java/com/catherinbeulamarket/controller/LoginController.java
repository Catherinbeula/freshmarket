package com.catherinbeulamarket.controller;

import com.catherinbeulamarket.dto.LoginRequest;
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
    public String login(@RequestBody LoginRequest request) {

        if (request.getEmail() == null || request.getEmail().isBlank()
                || request.getPassword() == null || request.getPassword().isBlank()) {
            return "Email and password are required";
        }

        User user = loginService.login(
                request.getEmail(),
                request.getPassword()
        );

        if (user != null) {
            return "Login successful";
        }

        return "Invalid email or password";
    }
}