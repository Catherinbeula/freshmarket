package com.catherinbeulamarket.controller;

import com.catherinbeulamarket.dao.ReviewDAOImpl;
import com.catherinbeulamarket.model.Review;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/review")
public class ReviewController extends HttpServlet {

    private final ReviewDAOImpl reviewDAO = new ReviewDAOImpl();

    @Override
    protected void doPost(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException {

        HttpSession session = request.getSession(false);

        if(session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int productId = Integer.parseInt(request.getParameter("productId"));
        int rating = Integer.parseInt(request.getParameter("rating"));
        String reviewText = request.getParameter("reviewText");

        if(rating < 1 || rating > 5) {
            response.sendRedirect("products.jsp");
            return;
        }

        Object userObject = session.getAttribute("user");

        com.catherinbeulamarket.model.User user =
                (com.catherinbeulamarket.model.User) userObject;

        Review review = new Review();
        review.setProductId(productId);
        review.setUserId(user.getId());
        review.setRating(rating);
        review.setReviewText(reviewText);

        reviewDAO.addReview(review);

        response.sendRedirect("products.jsp");
    }
}