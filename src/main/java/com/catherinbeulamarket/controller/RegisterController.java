package com.catherinbeulamarket.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.catherinbeulamarket.dao.UserDAO;
import com.catherinbeulamarket.dao.UserDAOImpl;
import com.catherinbeulamarket.model.User;

@WebServlet("/register")
public class RegisterController extends HttpServlet {

    private final UserDAO userDAO = new UserDAOImpl();

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (name == null || name.isBlank()
                || email == null || email.isBlank()
                || password == null || password.isBlank()) {

            response.getWriter().println("All fields are required");
            return;
        }

        User user = new User();

        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setRole("USER");

        boolean registered = userDAO.registerUser(user);

        if (registered) {
            response.getWriter().println("Registration successful");
        } else {
            response.getWriter().println("Registration failed");
        }
    }
}

