package com.catherinbeulamarket.dao;

import com.catherinbeulamarket.model.Review;
import com.catherinbeulamarket.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAOImpl implements ReviewDAO {

    @Override
    public boolean addReview(Review review) {
        String sql = "INSERT INTO reviews(product_id,user_id,rating,review_text) VALUES(?,?,?,?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1,review.getProductId());
            ps.setInt(2,review.getUserId());
            ps.setInt(3,review.getRating());
            ps.setString(4,review.getReviewText());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<Review> getReviewsByProductId(int productId) {
        List<Review> reviews = new ArrayList<>();

        String sql = "SELECT * FROM reviews WHERE product_id=? ORDER BY created_at DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1,productId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Review review = new Review();

                review.setId(rs.getInt("id"));
                review.setProductId(rs.getInt("product_id"));
                review.setUserId(rs.getInt("user_id"));
                review.setRating(rs.getInt("rating"));
                review.setReviewText(rs.getString("review_text"));
                review.setCreatedAt(rs.getTimestamp("created_at"));

                reviews.add(review);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reviews;
    }

    @Override
    public double getAverageRating(int productId) {
        String sql = "SELECT AVG(rating) FROM reviews WHERE product_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1,productId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getDouble(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0.0;
    }
}