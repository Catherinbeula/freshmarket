<%
    if (!"true".equals(session.getAttribute("admin"))) {
        response.sendRedirect("admin-login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>FreshMart - Admin Dashboard</title>

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
            margin: 40px auto;
        }

        h1 {
            text-align: center;
            color: #5b3a9e;
            margin-bottom: 35px;
        }

        .admin-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px;
        }

        .admin-card {
            background: white;
            padding: 30px 20px;
            text-align: center;
            border-radius: 14px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        .admin-icon {
            font-size: 45px;
            margin-bottom: 15px;
        }

        .admin-card h2 {
            color: #5b3a9e;
            margin-bottom: 10px;
        }

        .admin-card p {
            color: #777;
            margin-bottom: 20px;
        }

        .admin-btn {
            display: inline-block;
            text-decoration: none;
            background: #6c4ab6;
            color: white;
            padding: 10px 20px;
            border-radius: 22px;
            font-weight: bold;
        }

        .admin-btn:hover {
            background: #59399f;
        }

        footer {
            margin-top: 50px;
            background: #6c4ab6;
            color: white;
            text-align: center;
            padding: 18px;
        }

        @media (max-width: 800px) {
            .admin-grid {
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

    <a class="logout" href="logout">
    Logout
</a>

</div>

<div class="container">

    <h1>Admin Dashboard</h1>

    <div class="admin-grid">

        <div class="admin-card">
            <div class="admin-icon">📦</div>
            <h2>Products</h2>
            <p>Manage FreshMart products.</p>
            <a class="admin-btn" href="admin-products.jsp">
                View Products
            </a>
        </div>

        <div class="admin-card">
            <div class="admin-icon">🛒</div>
            <h2>Orders</h2>
            <p>View customer orders.</p>
            <a class="admin-btn" href="admin-orders.jsp">
    View Orders
</a>

        </div>

        <div class="admin-card">
            <div class="admin-icon">👤</div>
            <h2>Users</h2>
            <p>Manage registered users.</p>
           
            <a class="admin-btn" href="admin-users.jsp">
    View Users
</a>
        </div>

    </div>

</div>

<footer>
    <p>© 2026 FreshMart. All Rights Reserved.</p>
</footer>

</body>
</html>