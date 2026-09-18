<!DOCTYPE html>
<html>
<head>
    <title>FreshMart - Order Successful</title>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #f8f5ff;
        }

        .success-box {
            width: 90%;
            max-width: 600px;
            background: white;
            padding: 50px 35px;
            text-align: center;
            border-radius: 18px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }

        .success-icon {
            font-size: 65px;
            margin-bottom: 20px;
        }

        h1 {
            color: #5b3a9e;
            font-size: 34px;
            margin-bottom: 15px;
        }

        p {
            color: #666;
            font-size: 17px;
            line-height: 1.6;
            margin-bottom: 25px;
        }

        .home-btn {
            display: inline-block;
            text-decoration: none;
            background: #6c4ab6;
            color: white;
            padding: 12px 25px;
            border-radius: 25px;
            font-weight: bold;
        }

        .home-btn:hover {
            background: #59399f;
        }
    </style>
</head>

<body>

<div class="success-box">

    <div class="success-icon">✅</div>

    <h1>Order Placed Successfully!</h1>
    <p><strong>Order ID:</strong> FM2026-001</p>

    <p>
        Thank you for shopping with FreshMart.<br>
        Your order has been placed successfully.
    </p>

    <a class="home-btn" href="home.jsp">
        Back to Home
    </a>

</div>

</body>
</html>