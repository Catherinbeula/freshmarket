<%
    String product = request.getParameter("product");
    String price = request.getParameter("price");
    String qty = request.getParameter("qty");

    if (product == null || product.isBlank()
            || price == null || price.isBlank()) {
        response.sendRedirect("products.jsp");
        return;
    }

    if (qty == null || qty.isBlank()) {
        qty = "1";
    }
%>

<!DOCTYPE html>
<html>
<head>

    <title>FreshMart - Checkout</title>

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
            max-width: 700px;
            margin: 40px auto;
        }

        .checkout-box {
            background: white;
            padding: 35px;
            border-radius: 14px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        h1 {
            text-align: center;
            color: #5b3a9e;
            margin-bottom: 30px;
        }

        .order-summary {
            background: #f8f5ff;
            padding: 18px;
            border-radius: 10px;
            margin-bottom: 25px;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }

        .summary-row:last-child {
            margin-bottom: 0;
            font-weight: bold;
            color: #5b3a9e;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #444;
        }

        input,
        textarea,
        select {
            width: 100%;
            padding: 13px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 15px;
        }

        textarea {
            resize: vertical;
            min-height: 90px;
        }

        .place-order {
            display: block;
            width: 100%;
            border: none;
            padding: 14px;
            background: #6c4ab6;
            color: white;
            border-radius: 25px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        .place-order:hover {
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

    <a class="back" href="cart.jsp">
        Back to Cart
    </a>

</div>

<div class="container">

    <div class="checkout-box">

        <h1>Checkout</h1>

        <div class="order-summary">

            <div class="summary-row">
                <span>Product</span>
                <span><%= product %></span>
            </div>

            <div class="summary-row">
                <span>Quantity</span>
                <span><%= qty %> kg</span>
            </div>

            <div class="summary-row">
                <span>Total Price</span>
                <span>₹<%= price %></span>
            </div>

        </div>

        <form action="place-order" method="post">

            <input type="hidden"
                   name="product"
                   value="<%= product %>">

            <input type="hidden"
                   name="price"
                   value="<%= price %>">

            <input type="hidden"
                   name="qty"
                   value="<%= qty %>">

            <label>Full Name</label>

            <input type="text"
                   name="name"
                   placeholder="Enter your full name"
                   required>

            <label>Phone Number</label>

            <input type="tel"
                   name="phone"
                   placeholder="Enter your phone number"
                   required>

            <label>Delivery Address</label>

            <textarea name="address"
                      placeholder="Enter your delivery address"
                      required></textarea>

            <label>Payment Method</label>

            <select name="payment" required>

                <option value="">
                    Select Payment Method
                </option>

                <option value="cod">
                    Cash on Delivery
                </option>

                <option value="upi">
                    UPI
                </option>

                <option value="card">
                    Card
                </option>

            </select>

            <button class="place-order" type="submit">
                Place Order
            </button>

        </form>

    </div>

</div>

<footer>

    <p>
        © 2026 FreshMart. All Rights Reserved.
    </p>

</footer>

</body>
</html>

