package com.catherinbeulamarket.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.catherinbeulamarket.dao.UserDAO;
import com.catherinbeulamarket.dao.UserDAOImpl;
import com.catherinbeulamarket.model.User;
import com.catherinbeulamarket.service.LoginService;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private LoginService loginService;

    @Override
    public void init() throws ServletException {
        UserDAO userDAO = new UserDAOImpl();
        loginService = new LoginService(userDAO);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || email.isBlank()
                || password == null || password.isBlank()) {

            response.getWriter().println("Email and password are required");
            return;
        }

        User user = loginService.login(email, password);

        if (user != null) {

            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            response.sendRedirect("home.jsp");

        } else {

            response.getWriter().println("Invalid email or password");
        }
    }
}