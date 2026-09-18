package com.catherinbeulamarket.controller;

import com.catherinbeulamarket.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/place-order")
public class OrderController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String product = request.getParameter("product");
        String price = request.getParameter("price");
        String qty = request.getParameter("qty");

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String email = ((com.catherinbeulamarket.model.User)
                session.getAttribute("user")).getEmail();

        try {
            int quantity = Integer.parseInt(qty);

            if (quantity < 1) {
                quantity = 1;
            }

            BigDecimal totalPrice = new BigDecimal(price);

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO orders(email, product, price, status, quantity) VALUES(?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, product);
            ps.setBigDecimal(3, totalPrice);
            ps.setString(4, "PLACED");
            ps.setInt(5, quantity);

            ps.executeUpdate();

            ps.close();
            con.close();

            response.sendRedirect("order-success.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Order failed");
        }
    }
}