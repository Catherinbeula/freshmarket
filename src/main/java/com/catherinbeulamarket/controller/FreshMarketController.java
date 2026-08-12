package com.catherinbeulamarket.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.catherinbeulamarket.dao.UserDAO;
import com.catherinbeulamarket.model.User;

@RestController
@RequestMapping("/api/freshmarket")
public class FreshMarketController {

    private final UserDAO userDAO;

    public FreshMarketController(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @GetMapping("/status")
    public String status() {
        return "FreshMarket API is running";
    }

    @PostMapping("/register")
    public String register(
            @RequestParam String name,
            @RequestParam String email,
            @RequestParam String password,
            @RequestParam String role) {

        User user = new User(name, email, password, role);

        boolean result = userDAO.registerUser(user);

        if (result) {
            return "Register Success";
        }

        return "Register Failed";
    }
}