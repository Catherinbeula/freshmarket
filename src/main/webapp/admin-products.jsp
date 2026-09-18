<%
    if (!"true".equals(session.getAttribute("admin"))) {
        response.sendRedirect("admin-login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>FreshMart - Admin Products</title>

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

        .container {
            width: 90%;
            max-width: 1100px;
            margin: 40px auto;
        }

        h1 {
            text-align: center;
            color: #5b3a9e;
            margin-bottom: 35px;
        }

        .products-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 25px;
        }

        .product-card {
            background: white;
            padding: 25px 20px;
            text-align: center;
            border-radius: 14px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        .product-icon {
            font-size: 55px;
            margin-bottom: 15px;
        }

        .product-card h2 {
            color: #5b3a9e;
            margin-bottom: 10px;
            font-size: 20px;
        }

        .product-card p {
            color: #666;
            margin-bottom: 8px;
        }

        .price {
            font-weight: bold;
            color: #6c4ab6;
            font-size: 18px;
        }

        footer {
            margin-top: 50px;
            background: #6c4ab6;
            color: white;
            text-align: center;
            padding: 18px;
        }

        @media (max-width: 900px) {
            .products-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 550px) {
            .products-grid {
                grid-template-columns: 1fr;
            }

            .navbar {
                padding: 15px 20px;
            }
        }
    </style>
</head>

<body>

<div class="navbar">

    <div class="logo">
        FreshMart Admin
    </div>

    <a class="back" href="admin.jsp">
        Back to Dashboard
    </a>

</div>

<div class="container">

    <h1>Products</h1>

    <div class="products-grid">

        <div class="product-card">
            <div class="product-icon">🍎</div>
            <h2>Fresh Apple</h2>
            <p>Available</p>
            <div class="price">₹120 / kg</div>
        </div>

        <div class="product-card">
            <div class="product-icon">🍌</div>
            <h2>Fresh Banana</h2>
            <p>Available</p>
            <div class="price">₹60 / kg</div>
        </div>

        <div class="product-card">
            <div class="product-icon">🍅</div>
            <h2>Fresh Tomato</h2>
            <p>Available</p>
            <div class="price">₹50 / kg</div>
        </div>

        <div class="product-card">
            <div class="product-icon">🥕</div>
            <h2>Fresh Carrot</h2>
            <p>Available</p>
            <div class="price">₹80 / kg</div>
        </div>

    </div>

</div>

<footer>
    <p>© 2026 FreshMart. All Rights Reserved.</p>
</footer>

</body>
</html>