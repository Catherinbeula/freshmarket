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

        .products {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 22px;
        }

        .product {
            background: white;
            padding: 25px 15px;
            text-align: center;
            border-radius: 14px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        .product-icon {
            font-size: 50px;
            margin-bottom: 15px;
        }

        .product h3 {
            color: #444;
            margin-bottom: 8px;
        }

        .product p {
            color: #777;
            margin-bottom: 18px;
        }

        .price {
            color: #6c4ab6;
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .cart-btn {
            border: none;
            background: #6c4ab6;
            color: white;
            padding: 10px 20px;
            border-radius: 20px;
            cursor: pointer;
            font-weight: bold;
        }

        .cart-btn:hover {
            background: #59399f;
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
        }
    </style>
</head>

<body>

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

    <div class="products">

        <div class="product">
            <div class="product-icon">🍎</div>
            <h3>Fresh Apple</h3>
            <p>Fresh and healthy apples</p>
            <div class="price">₹120 / kg</div>
            <a class="cart-btn" href="cart.jsp?product=Fresh%20Apple&price=120">Add to Cart</a>
        </div>

        <div class="product">
            <div class="product-icon">🍌</div>
            <h3>Fresh Banana</h3>
            <p>Sweet and fresh bananas</p>
            <div class="price">₹60 / kg</div>
            <a class="cart-btn" href="cart.jsp?product=Fresh%20Banana&price=60">Add to Cart</a>
        </div>

        <div class="product">
            <div class="product-icon">🍅</div>
            <h3>Fresh Tomato</h3>
            <p>Fresh vegetables for cooking</p>
            <div class="price">₹50 / kg</div>
            <a class="cart-btn" href="cart.jsp?product=Fresh%20Tomato&price=50">Add to Cart</a>
        </div>

        <div class="product">
            <div class="product-icon">🥕</div>
            <h3>Fresh Carrot</h3>
            <p>Healthy and fresh carrots</p>
            <div class="price">₹80 / kg</div>
            <a class="cart-btn" href="cart.jsp?product=Fresh%20Carrot&price=80">Add to Cart</a>
        </div>

    </div>

</div>

<footer>
    <p>© 2026 FreshMart. All Rights Reserved.</p>
</footer>

</body>
</html>
