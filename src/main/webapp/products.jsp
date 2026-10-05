<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.catherinbeulamarket.model.Product" %>
<%@ page import="com.catherinbeulamarket.dao.ProductDAOImpl" %>
<%@ page import="com.catherinbeulamarket.dao.ReviewDAOImpl" %>
<%@ page import="com.catherinbeulamarket.model.Review" %>

<!DOCTYPE html>

<html>

<head>

    <title>FreshMart - Products</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f8f5ff;
            color: #333;
        }

        .navbar {
            background: #6c4ab6;
            padding: 18px 50px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 25px;
            font-weight: bold;
        }

        .back {
            text-decoration: none;
            background: white;
            color: #6c4ab6;
            padding: 9px 18px;
            border-radius: 20px;
            font-weight: bold;
        }

        .title-section {
            text-align: center;
            padding: 45px 20px;
            background: #eee7ff;
        }

        .title-section h1 {
            color: #5b3a9e;
            font-size: 36px;
            margin-bottom: 10px;
        }

        .title-section p {
            color: #555;
            font-size: 17px;
        }

        .container {
            width: 90%;
            max-width: 1100px;
            margin: 40px auto;
        }

        .search-filter {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-bottom: 30px;
        }

        .search-box {
            width: 300px;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 25px;
            font-size: 15px;
        }

        .filter-box {
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 25px;
            font-size: 15px;
        }

        .products {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 22px;
        }

        .product {
            background: white;
            padding: 20px 15px 25px;
            text-align: center;
            border-radius: 14px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        .product-image {
            width: 160px;
            height: 160px;
            object-fit: contain;
            display: block;
            margin: 0 auto 15px;
        }

        .product h3 {
            color: #444;
            margin-bottom: 8px;
        }

        .product p {
            color: #777;
            margin-bottom: 10px;
        }

        .price {
            color: #6c4ab6;
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .stock {
            color: #555;
            font-size: 14px;
            margin-bottom: 12px;
        }

        .out-stock {
            color: #d32f2f;
            font-weight: bold;
        }

        .rating {
            margin: 10px 0;
            font-size: 18px;
            color: #f5a623;
        }

        .rating span {
            color: #555;
            font-size: 14px;
        }

        .review-form {
            margin: 12px 0 18px;
        }

        .review-form select,
        .review-form input {
            width: 100%;
            padding: 8px;
            margin-bottom: 8px;
            border: 1px solid #ddd;
            border-radius: 8px;
        }

        .review-form button {
            border: none;
            cursor: pointer;
        }

        .reviews {
            margin-top: 15px;
            text-align: left;
            border-top: 1px solid #eee;
            padding-top: 12px;
        }

        .review-title {
            color: #5b3a9e;
            font-weight: bold;
            margin-bottom: 8px;
        }

        .review-item {
            background: #f8f5ff;
            padding: 8px;
            border-radius: 8px;
            margin-bottom: 8px;
        }

        .review-stars {
            color: #f5a623;
            font-size: 15px;
        }

        .review-text {
            color: #555;
            font-size: 13px;
            margin-top: 4px;
        }

        .button-box {
            display: flex;
            justify-content: center;
            gap: 8px;
            flex-wrap: wrap;
        }

        .cart-btn {
            display: inline-block;
            text-decoration: none;
            background: #6c4ab6;
            color: white;
            padding: 10px 15px;
            border-radius: 20px;
            font-weight: bold;
        }

        .cart-btn:hover {
            background: #59399f;
        }

        .order-btn {
            display: inline-block;
            text-decoration: none;
            background: #5b3a9e;
            color: white;
            padding: 10px 15px;
            border-radius: 20px;
            font-weight: bold;
        }

        .order-btn:hover {
            background: #452d7d;
        }

        footer {
            margin-top: 45px;
            background: #6c4ab6;
            color: white;
            text-align: center;
            padding: 18px;
        }

        @media (max-width: 900px) {

            .products {
                grid-template-columns: repeat(2, 1fr);
            }

        }

        @media (max-width: 550px) {

            .navbar {
                padding: 15px 20px;
            }

            .products {
                grid-template-columns: 1fr;
            }

            .search-filter {
                flex-direction: column;
                align-items: center;
            }

            .search-box {
                width: 100%;
            }

        }

    </style>

</head>

<body>

<%

    ProductDAOImpl productDAO = new ProductDAOImpl();

    String search = request.getParameter("search");
    String category = request.getParameter("category");

    List<Product> products = productDAO.getAllProducts();

    if(search != null && !search.isBlank()) {

        products.removeIf(
            p -> !p.getName()
                  .toLowerCase()
                  .contains(search.toLowerCase())
        );

    }

    if(category != null && !category.isBlank()) {

        products.removeIf(
            p -> !p.getCategory()
                  .equalsIgnoreCase(category)
        );

    }

%>

<div class="navbar">

    <div class="logo">
        FreshMart
    </div>

    <a class="back" href="home.jsp">
        Back to Home
    </a>

</div>

<div class="title-section">

    <h1>Fresh Products</h1>

    <p>
        Choose fresh and healthy products for your everyday needs.
    </p>

</div>

<div class="container">

    <form class="search-filter"
          method="get"
          action="products.jsp">

        <input
            class="search-box"
            type="text"
            name="search"
            placeholder="Search products..."
            value="<%= search != null ? search : "" %>"
        >

        <select class="filter-box" name="category">

            <option value="">
                All Categories
            </option>

            <option value="Fruit"
                <%= "Fruit".equalsIgnoreCase(category) ? "selected" : "" %>>
                Fruit
            </option>

            <option value="Vegetable"
                <%= "Vegetable".equalsIgnoreCase(category) ? "selected" : "" %>>
                Vegetable
            </option>

        </select>

        <button class="cart-btn" type="submit">
            Search
        </button>

    </form>

    <div class="products">

        <% for(Product product : products) { %>

        <div class="product">

            <img class="product-image"
                 src="<%= product.getImageUrl() %>"
                 alt="<%= product.getName() %>">

            <h3>
                <%= product.getName() %>
            </h3>

            <p>
                <%= product.getCategory() %>
            </p>
            <div>Stock Debug: <%= product.getStock() %></div>

            <div class="stock <%= product.getStock() == 0 ? "out-stock" : "" %>">
                <% if(product.getStock() > 0) { %>
                    Stock: <%= product.getStock() %>
                <% } else { %>
                    Out of Stock
                <% } %>
            </div>

            <div class="price">
                ₹<%= product.getPrice() %> / kg
            </div>

            <%

                ReviewDAOImpl reviewDAO = new ReviewDAOImpl();

                double averageRating =
                        reviewDAO.getAverageRating(product.getId());

                int fullStars = (int) averageRating;

            %>

            <div class="rating">

                <%

                    for(int i = 1; i <= 5; i++) {

                        if(i <= fullStars) {

                %>

                            ⭐

                <%

                        } else {

                %>

                            ☆

                <%

                        }

                    }

                %>

                <span>
                    <%= String.format("%.1f",averageRating) %>/5
                </span>

            </div>

            <form class="review-form"
                  action="review"
                  method="post">

                <input type="hidden"
                       name="productId"
                       value="<%= product.getId() %>">

                <select name="rating" required>

                    <option value="">
                        Give Rating
                    </option>

                    <option value="5">
                        ⭐⭐⭐⭐⭐
                    </option>

                    <option value="4">
                        ⭐⭐⭐⭐
                    </option>

                    <option value="3">
                        ⭐⭐⭐
                    </option>

                    <option value="2">
                        ⭐⭐
                    </option>

                    <option value="1">
                        ⭐
                    </option>

                </select>

                <input type="text"
                       name="reviewText"
                       placeholder="Write your review"
                       maxlength="500"
                       required>

                <button class="cart-btn" type="submit">
                    Submit Review
                </button>

            </form>

            <%

                List<Review> reviews =
                        reviewDAO.getReviewsByProductId(product.getId());

            %>

            <% if(!reviews.isEmpty()) { %>

            <div class="reviews">

                <div class="review-title">
                    Customer Reviews
                </div>

                <% for(Review review : reviews) { %>

                <div class="review-item">

                    <div class="review-stars">

                        <%

                            for(int i = 1; i <= 5; i++) {

                                if(i <= review.getRating()) {

                        %>

                                    ⭐

                        <%

                                } else {

                        %>

                                    ☆

                        <%

                                }

                            }

                        %>

                    </div>

                    <div class="review-text">
                        <%= review.getReviewText() %>
                    </div>

                </div>

                <% } %>

            </div>

            <% } %>

            <div class="button-box">

                <% if(product.getStock() > 0) { %>

                    <a class="cart-btn"
                       href="cart.jsp?action=add&product=<%= java.net.URLEncoder.encode(product.getName(),"UTF-8") %>">
                        Add to Cart
                    </a>

                    <a class="order-btn"
                       href="cart.jsp?direct=true&product=<%= java.net.URLEncoder.encode(product.getName(),"UTF-8") %>&price=<%= product.getPrice() %>&qty=1">
                        Place Order
                    </a>

                <% } else { %>

                    <span class="order-btn">
                        Out of Stock
                    </span>

                <% } %>

            </div>

        </div>

        <% } %>

    </div>

</div>

<footer>

    <p>
        © 2026 FreshMart. All Rights Reserved.
    </p>

</footer>

</body>

</html>