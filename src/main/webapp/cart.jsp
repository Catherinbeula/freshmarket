<%
    String product = request.getParameter("product");
    String price = request.getParameter("price");
    String qtyParam = request.getParameter("qty");

    if (product == null || product.isBlank()
            || price == null || price.isBlank()) {
        response.sendRedirect("products.jsp");
        return;
    }

    java.math.BigDecimal unitPrice = new java.math.BigDecimal(price);

    int quantity = 1;

    if (qtyParam != null && !qtyParam.isBlank()) {
        try {
            quantity = Integer.parseInt(qtyParam);
        } catch (NumberFormatException e) {
            quantity = 1;
        }
    }

    if (quantity < 1) {
        quantity = 1;
    }

    java.math.BigDecimal total =
            unitPrice.multiply(java.math.BigDecimal.valueOf(quantity));

    String image = "";

if (product.equals("Fresh Apple")) {
    image = "https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?auto=format&fit=crop&w=500&q=80";
} else if (product.equals("Fresh Banana")) {
    image = "https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?auto=format&fit=crop&w=500&q=80";
} else if (product.equals("Fresh Tomato")) {
    image = "https://images.unsplash.com/photo-1546094096-0df4bcaaa337?auto=format&fit=crop&w=500&q=80";
} else if (product.equals("Fresh Carrot")) {
    image = "https://images.unsplash.com/photo-1447175008436-170170753f8e?auto=format&fit=crop&w=500&q=80";
}

    String encodedProduct =
            java.net.URLEncoder.encode(product, "UTF-8");
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
            align-items: center;
            justify-content: space-between;
            gap: 20px;
            padding: 20px 0;
            border-bottom: 1px solid #eee;
        }

        .product-info {
            display: flex;
            align-items: center;
            gap: 18px;
            flex: 1;
        }

        .cart-image {
            width: 100px;
            height: 100px;
            object-fit: contain;
            border-radius: 12px;
        }

        .item-name {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 8px;
        }

        .item-price {
            color: #6c4ab6;
            font-weight: bold;
        }

        .quantity-box {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .quantity-btn {
            width: 36px;
            height: 36px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            background: #6c4ab6;
            color: white;
            border-radius: 50%;
            font-size: 22px;
            font-weight: bold;
        }

        .quantity-btn:hover {
            background: #59399f;
        }

        .quantity {
            min-width: 30px;
            text-align: center;
            font-size: 18px;
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

        @media (max-width: 700px) {

            .navbar {
                padding: 15px 20px;
            }

            .cart-item {
                flex-direction: column;
                align-items: center;
            }

            .product-info {
                flex-direction: column;
                text-align: center;
            }

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

            <div class="product-info">

                <img class="cart-image"
     src="<%= request.getContextPath() + "/" + image %>"
     alt="<%= product %>">

                <div>

                    <div class="item-name">
                        <%= product %>
                    </div>

                    <div class="item-price">
                        ₹<%= unitPrice %> / kg
                    </div>

                </div>

            </div>

            <div class="quantity-box">

                <a class="quantity-btn"
                   href="cart.jsp?product=<%= encodedProduct %>&price=<%= unitPrice %>&qty=<%= quantity > 1 ? quantity - 1 : 1 %>">
                    -
                </a>

                <span class="quantity">
                    <%= quantity %>
                </span>

                <a class="quantity-btn"
                   href="cart.jsp?product=<%= encodedProduct %>&price=<%= unitPrice %>&qty=<%= quantity + 1 %>">
                    +
                </a>

            </div>

        </div>

        <div class="total">
            Total: ₹<%= total %>
        </div>

        <a class="checkout"
           href="checkout.jsp?product=<%= encodedProduct %>&price=<%= total %>&qty=<%= quantity %>">
            Proceed to Checkout
        </a>

    </div>

</div>

<footer>
    <p>© 2026 FreshMart. All Rights Reserved.</p>
</footer>

</body>
</html>