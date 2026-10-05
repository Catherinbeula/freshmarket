package com.catherinbeulamarket.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.catherinbeulamarket.dao.ProductDAOImpl;

@WebServlet("/delete-product")
public class DeleteProductController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));

            ProductDAOImpl productDAO = new ProductDAOImpl();

            productDAO.deleteProduct(id);

            response.sendRedirect("admin-products.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Delete failed");
        }
    }
}