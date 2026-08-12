package com.catherinbeulamarket.service;

import org.springframework.stereotype.Service;

import com.catherinbeulamarket.dao.UserDAO;
import com.catherinbeulamarket.model.User;

@Service
public class LoginService {

    private final UserDAO userDAO;

    public LoginService(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    public User login(String email, String password) {
        return userDAO.loginUser(email, password);
    }

    public boolean register(User user) {
        return userDAO.registerUser(user);
    }

    public String getStatus() {
        return "FreshMarket Login Service is running";
    }
}