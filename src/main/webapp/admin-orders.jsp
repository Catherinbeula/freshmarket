<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.catherinbeulamarket.util.DBConnection" %>

<%
    if (!"true".equals(session.getAttribute("admin"))) {
        response.sendRedirect("admin-login.jsp");
        return;
    }

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
%>

<!DOCTYPE html>
<html>
<head>

    <title>FreshMart - Admin Orders</title>

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
            max-width: 1150px;
            margin: 40px auto;
        }

        .orders-box {
            background: white;
            padding: 30px;
            border-radius: 14px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
            overflow-x: auto;
        }

        h1 {
            text-align: center;
            color: #5b3a9e;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th,
        td {
            padding: 14px;
            text-align: center;
            border-bottom: 1px solid #eee;
            white-space: nowrap;
        }

        th {
            background: #eee7ff;
            color: #5b3a9e;
        }

        td {
            color: #555;
        }

        .status {
            color: #6c4ab6;
            font-weight: bold;
        }

        .no-orders {
            text-align: center;
            color: #777;
            padding: 25px;
        }

        .error {
            text-align: center;
            color: #c0392b;
            padding: 25px;
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

    <div class="orders-box">

        <h1>Customer Orders</h1>

        <table>

            <thead>

                <tr>
                    <th>Order ID</th>
                    <th>Email</th>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Total Price</th>
                    <th>Status</th>
                    <th>Order Date</th>
                </tr>

            </thead>

            <tbody>

            <%
                boolean hasOrders = false;

                try {

                    con = DBConnection.getConnection();

                    String sql =
                            "SELECT order_id, email, product, price, quantity, status, order_date " +
                            "FROM orders " +
                            "ORDER BY order_date DESC";

                    ps = con.prepareStatement(sql);

                    rs = ps.executeQuery();

                    while (rs.next()) {

                        hasOrders = true;
            %>

                <tr>

                    <td>
                        <%= rs.getInt("order_id") %>
                    </td>

                    <td>
                        <%= rs.getString("email") %>
                    </td>

                    <td>
                        <%= rs.getString("product") %>
                    </td>

                    <td>
                        <%= rs.getInt("quantity") %> kg
                    </td>

                    <td>
                        ₹<%= rs.getBigDecimal("price") %>
                    </td>

                    <td class="status">
                        <%= rs.getString("status") %>
                    </td>

                    <td>
                        <%= rs.getTimestamp("order_date") %>
                    </td>

                </tr>

            <%
                    }

                    if (!hasOrders) {
            %>

                <tr>

                    <td colspan="7" class="no-orders">
                        No customer orders found.
                    </td>

                </tr>

            <%
                    }

                } catch (Exception e) {
            %>

                <tr>

                    <td colspan="7" class="error">
                        Unable to load customer orders.
                    </td>

                </tr>

            <%
                    e.printStackTrace();

                } finally {

                    try {
                        if (rs != null) rs.close();
                    } catch (Exception ignored) {
                    }

                    try {
                        if (ps != null) ps.close();
                    } catch (Exception ignored) {
                    }

                    try {
                        if (con != null) con.close();
                    } catch (Exception ignored) {
                    }

                }
            %>

            </tbody>

        </table>

    </div>

</div>

<footer>

    <p>© 2026 FreshMart. All Rights Reserved.</p>

</footer>

</body>
</html>