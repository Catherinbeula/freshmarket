<%@ page import="java.util.List" %>
<%@ page import="com.catherinbeulamarket.model.Product" %>
<%@ page import="com.catherinbeulamarket.dao.ProductDAOImpl" %>
<%@ page import="com.catherinbeulamarket.model.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html>

<head>

    <title>FreshMart - Home</title>

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
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: white;
        }

        .logo {
            font-size: 25px;
            font-weight: bold;
        }

        .nav-right {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .welcome {
            font-size: 15px;
        }

        .logout {
            text-decoration: none;
            background: white;
            color: #6c4ab6;
            padding: 9px 18px;
            border-radius: 20px;
            font-weight: bold;
        }

        .hero {
            text-align: center;
            padding: 55px 20px;
            background: #eee7ff;
        }

        .hero h1 {
            color: #5b3a9e;
            font-size: 38px;
            margin-bottom: 12px;
        }

        .hero p {
            font-size: 17px;
            color: #555;
        }

        .container {
            width: 90%;
            max-width: 1100px;
            margin: 35px auto;
        }

        .user-box {
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
            margin-bottom: 35px;
        }

        .user-box h3 {
            color: #6c4ab6;
            margin-bottom: 10px;
        }

        .search-box {
            display: flex;
            justify-content: center;
            gap: 12px;
            margin-bottom: 30px;
        }

        .search-input {
            width: 350px;
            padding: 12px 18px;
            border: 1px solid #ddd;
            border-radius: 25px;
            font-size: 15px;
            outline: none;
        }

        .search-button {
            border: none;
            background: #6c4ab6;
            color: white;
            padding: 12px 25px;
            border-radius: 25px;
            font-weight: bold;
            cursor: pointer;
        }

        .search-button:hover {
            background: #59399f;
        }

        .products-title {
            text-align: center;
            color: #5b3a9e;
            margin-bottom: 25px;
        }

        .products {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
        }

        .product {
            background: white;
            padding: 25px 15px;
            text-align: center;
            border-radius: 14px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        .product-icon {
            font-size: 45px;
            margin-bottom: 12px;
        }

        .product h3 {
            color: #444;
            margin-bottom: 8px;
        }

        .product p {
            color: #777;
            margin-bottom: 15px;
        }

        .shop-btn {
            display: inline-block;
            text-decoration: none;
            background: #6c4ab6;
            color: white;
            padding: 9px 18px;
            border-radius: 20px;
        }

        footer {
            margin-top: 45px;
            background: #6c4ab6;
            color: white;
            text-align: center;
            padding: 18px;
        }

        @media (max-width: 800px) {

            .products {
                grid-template-columns: repeat(2, 1fr);
            }

        }

        @media (max-width: 500px) {

            .navbar {
                padding: 15px 20px;
            }

            .nav-right {
                gap: 8px;
            }

            .products {
                grid-template-columns: 1fr;
            }

            .hero h1 {
                font-size: 30px;
            }

            .search-box {
                flex-direction: column;
                align-items: center;
            }

            .search-input {
                width: 90%;
            }

        }

    </style>

</head>

<body>

<%

    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    ProductDAOImpl productDAO=new ProductDAOImpl();

    String search=request.getParameter("search");

    List<Product> products=productDAO.getAllProducts();

    if(search!=null && !search.isBlank()) {

        products.removeIf(p ->
            !p.getName().toLowerCase().contains(search.toLowerCase())
        );

    }

%>

<!-- Navigation Bar -->

<div class="navbar">

    <div class="logo">
        BeulaMart
    </div>

    <div class="nav-right">

        <span class="welcome">
            Welcome, <%= user.getName() %>
        </span>

        <a class="logout" href="my-orders.jsp">
            My Orders
        </a>

        <a class="logout" href="cart.jsp">
            My Cart
        </a>

        <a class="logout" href="logout">
            Logout
        </a>

    </div>

</div>

<!-- Hero Section -->

<div class="hero">

    <h1>Fresh Fruits & Vegetables</h1>

    <p>
        Fresh quality products delivered for your everyday needs.
    </p>

</div>

<div class="container">

    <!-- User Information -->

    <div class="user-box">

        <h3>Your Account</h3>

        <p>
            <strong>Name:</strong>
            <%= user.getName() %>
        </p>

        <p>
            <strong>Email:</strong>
            <%= user.getEmail() %>
        </p>

        <p>
            <strong>Role:</strong>
            <%= user.getRole() %>
        </p>

    </div>

    <!-- Search -->

    <form class="search-box" method="get" action="home.jsp">

        <input
            class="search-input"
            type="text"
            name="search"
            placeholder="Search products..."
            value="<%= search != null ? search : "" %>"
        >

        <button class="search-button" type="submit">
            Search
        </button>

    </form>

    <!-- Products -->

    <h2 class="products-title">
        Our Fresh Products
    </h2>

    <div class="products">

        <% for(Product product : products) { %>

        <div class="product">

            <div class="product-icon">

                <img
                    src="<%= product.getImageUrl() %>"
                    alt="<%= product.getName() %>"
                    style="width:100px;height:100px;object-fit:contain;"
                >

            </div>

            <h3>
                <%= product.getName() %>
            </h3>

            <p>
                <%= product.getCategory() %>
            </p>

            <% if(product.getStock() > 0) { %>

                <p>
                    Stock: <%= product.getStock() %>
                </p>

            <% } else { %>

                <p style="color:#d32f2f;font-weight:bold;">
                    Out of Stock
                </p>

            <% } %>

            <p>
                ₹ <%= product.getPrice() %>
            </p>

            <a class="shop-btn" href="products.jsp">
                Shop Now
            </a>

        </div>

        <% } %>

    </div>

</div>

<footer>

    <p>© 2026 BeulaMart. All Rights Reserved.</p>

</footer>

</body>

</html>