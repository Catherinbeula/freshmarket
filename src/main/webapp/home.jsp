<%@ page import="com.catherinbeulamarket.model.User" %>

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
%>

<!-- Navigation Bar -->
<div class="navbar">

    <div class="logo">
        FreshMart
    </div>

    <div class="nav-right">
        <span class="welcome">
            Welcome, <%= user.getName() %>
        </span>
        <a class="logout" href="my-orders.jsp">My Orders</a>

        <a class="logout" href="logout">Logout</a>
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

        <p><strong>Name:</strong> <%= user.getName() %></p>

        <p><strong>Email:</strong> <%= user.getEmail() %></p>

        <p><strong>Role:</strong> <%= user.getRole() %></p>

    </div>

    <!-- Products -->
    <h2 class="products-title">
        Our Fresh Products
    </h2>

    <div class="products">

        <div class="product">
            <div class="product-icon">🍎</div>
            <h3>Fresh Apple</h3>
            <p>Fresh and healthy apples</p>
            <a class="shop-btn" href="products.jsp">Shop Now</a>
        </div>

        <div class="product">
            <div class="product-icon">🍌</div>
            <h3>Fresh Banana</h3>
            <p>Sweet and fresh bananas</p>
            <a class="shop-btn" href="products.jsp">Shop Now</a>
        </div>

        <div class="product">
            <div class="product-icon">🍅</div>
            <h3>Fresh Tomato</h3>
            <p>Fresh vegetables for cooking</p>
            <a class="shop-btn" href="products.jsp">Shop Now</a>
        </div>

        <div class="product">
            <div class="product-icon">🥕</div>
            <h3>Fresh Carrot</h3>
            <p>Healthy and fresh carrots</p>
            <a class="shop-btn" href="products.jsp">Shop Now</a>
        </div>

    </div>

</div>

<footer>
    <p>© 2026 FreshMart. All Rights Reserved.</p>
</footer>

</body>
</html>