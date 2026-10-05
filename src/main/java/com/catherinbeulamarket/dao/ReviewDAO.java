package com.catherinbeulamarket.dao;

import com.catherinbeulamarket.model.Review;
import java.util.List;

public interface ReviewDAO {

    boolean addReview(Review review);

    List<Review> getReviewsByProductId(int productId);

    double getAverageRating(int productId);
}