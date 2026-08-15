<%
    String product = request.getParameter("product");
    String price = request.getParameter("price");

    if (product == null || product.isBlank()
            || price == null || price.isBlank()) {
        response.sendRedirect("products.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>FreshMart - Cart</title>

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
            max-width: 900px;
            margin: 40px auto;
        }

        .cart-box {
            background: white;
            padding: 30px;
            border-radius: 14px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        h1 {
            text-align: center;
            color: #5b3a9e;
            margin-bottom: 30px;
        }

        .cart-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 18px 0;
            border-bottom: 1px solid #eee;
        }

        .item-name {
            font-size: 18px;
            font-weight: bold;
        }

        .item-price {
            color: #6c4ab6;
            font-weight: bold;
        }

        .total {
            text-align: right;
            margin-top: 25px;
            font-size: 22px;
            font-weight: bold;
            color: #5b3a9e;
        }

        .checkout {
            display: block;
            width: 220px;
            margin: 25px auto 0;
            padding: 12px;
            text-align: center;
            text-decoration: none;
            background: #6c4ab6;
            color: white;
            border-radius: 25px;
            font-weight: bold;
        }

        .checkout:hover {
            background: #59399f;
        }

        footer {
            margin-top: 50px;
            background: #6c4ab6;
            color: white;
            text-align: center;
            padding: 18px;
        }
    </style>
</head>

<body>

<div class="navbar">

    <div class="logo">
        FreshMart
    </div>

    <a class="back" href="products.jsp">
        Back to Products
    </a>

</div>

<div class="container">

    <div class="cart-box">

        <h1>Your Cart</h1>

        <div class="cart-item">
            <span class="item-name"><%= product %></span>
            <span class="item-price">₹<%= price %> / kg</span>
        </div>

        <div class="total">
            Total: ₹<%= price %>
        </div>

        <a class="checkout" href="#">
            Proceed to Checkout
        </a>

    </div>

</div>

<footer>
    <p>© 2026 FreshMart. All Rights Reserved.</p>
</footer>

</body>
</html>
