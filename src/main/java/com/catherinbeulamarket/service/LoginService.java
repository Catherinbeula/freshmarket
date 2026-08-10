package com.catherinbeulamarket.service;

import org.springframework.stereotype.Service;

import com.catherinbeulamarket.dao.UserDAO;
import com.catherinbeulamarket.dao.UserDAOImpl;
import com.catherinbeulamarket.model.User;

@Service
public class LoginService {

    private UserDAO userDAO = new UserDAOImpl();

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