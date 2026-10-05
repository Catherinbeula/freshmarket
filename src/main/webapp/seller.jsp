<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.catherinbeulamarket.model.User" %>

<%
    User user = (User) session.getAttribute("user");

    if (user == null || !"SELLER".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FreshMart - Seller Dashboard</title>

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

        .logout {
            text-decoration: none;
            background: white;
            color: #6c4ab6;
            padding: 9px 18px;
            border-radius: 20px;
            font-weight: bold;
        }

        .container {
            width: 90%;
            max-width: 1000px;
            margin: 80px auto 40px;
        }

        h1 {
            text-align: center;
            color: #5b3a9e;
            margin-bottom: 10px;
        }

        .welcome {
            text-align: center;
            color: #777;
            margin-bottom: 40px;
        }

        .seller-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px;
        }

        .seller-card {
            background: white;
            padding: 30px 20px;
            text-align: center;
            border-radius: 14px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        .seller-icon {
            font-size: 45px;
            margin-bottom: 15px;
        }

        .seller-card h2 {
            color: #5b3a9e;
            margin-bottom: 10px;
        }

        .seller-card p {
            color: #777;
            margin-bottom: 20px;
            line-height: 1.5;
        }

        .seller-btn {
            display: inline-block;
            text-decoration: none;
            background: #6c4ab6;
            color: white;
            padding: 10px 20px;
            border-radius: 22px;
            font-weight: bold;
        }

        .seller-btn:hover {
            background: #59399f;
        }

        footer {
            margin-top: 80px;
            background: #6c4ab6;
            color: white;
            text-align: center;
            padding: 18px;
        }

        @media (max-width: 800px) {
            .seller-grid {
                grid-template-columns: 1fr;
            }

            .navbar {
                padding: 15px 20px;
            }

            .container {
                margin-top: 50px;
            }
        }
    </style>
</head>

<body>

<div class="navbar">

    <div class="logo">
        FreshMart Seller
    </div>

    <a class="logout" href="logout">
        Logout
    </a>

</div>

<div class="container">

    <h1>Seller Dashboard</h1>

    <p class="welcome">
        Welcome, <%= user.getName() %>
    </p>

    <div class="seller-grid">

        <div class="seller-card">

            <div class="seller-icon">📦</div>

            <h2>Products</h2>

            <p>
                Add, update and remove FreshMart products.
            </p>

            <a class="seller-btn" href="admin-products.jsp">
                Manage Products
            </a>

        </div>

        <div class="seller-card">

            <div class="seller-icon">➕</div>

            <h2>Add Product</h2>

            <p>
                Add a new product to FreshMart.
            </p>

            <a class="seller-btn" href="add-product.jsp">
                Add Product
            </a>

        </div>

        <div class="seller-card">

            <div class="seller-icon">🛒</div>

            <h2>Orders</h2>

            <p>
                View orders received for your products.
            </p>

            <a class="seller-btn" href="admin-orders.jsp">
                View Orders
            </a>

        </div>

    </div>

</div>

<footer>

    <p>© 2026 FreshMart. All Rights Reserved.</p>

</footer>

</body>
</html>