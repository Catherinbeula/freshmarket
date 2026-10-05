<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.catherinbeulamarket.model.Product" %>
<%@ page import="com.catherinbeulamarket.dao.ProductDAOImpl" %>

<%
    com.catherinbeulamarket.model.User user =
            (com.catherinbeulamarket.model.User) session.getAttribute("user");

    boolean isAdmin = "true".equals(session.getAttribute("admin"));
    boolean isSeller = user != null && "SELLER".equals(user.getRole());

    if (!isAdmin && !isSeller) {
        response.sendRedirect("login.jsp");
        return;
    }

    ProductDAOImpl productDAO=new ProductDAOImpl();
    List<Product> products=productDAO.getAllProducts();
%>

<!DOCTYPE html>

<html>

<head>

    <title>FreshMart - Manage Products</title>

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
            margin: 50px auto;
        }

        .top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        h1 {
            color: #5b3a9e;
        }

        .add-btn {
            text-decoration: none;
            background: #6c4ab6;
            color: white;
            padding: 12px 22px;
            border-radius: 22px;
            font-weight: bold;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(3,1fr);
            gap: 25px;
        }

        .product-card {
            background: white;
            border-radius: 14px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        .product-card img {
            width: 160px;
            height: 150px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 15px;
        }

        .product-card h2 {
            color: #5b3a9e;
            margin-bottom: 8px;
        }

        .price {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 8px;
        }

        .category {
            color: #777;
            margin-bottom: 18px;
        }

        .actions {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .update {
            text-decoration: none;
            background: #6c4ab6;
            color: white;
            padding: 9px 16px;
            border-radius: 18px;
        }

        .remove {
            background: #6c4ab6;
            color: white;
            border: none;
            padding: 9px 16px;
            border-radius: 18px;
            cursor: pointer;
        }

        @media (max-width: 800px) {

            .product-grid {
                grid-template-columns: 1fr;
            }

            .navbar {
                padding: 15px 20px;
            }

            .top {
                flex-direction: column;
                gap: 20px;
            }

        }

    </style>

</head>

<body>

<div class="navbar">

    <div class="logo">
        FreshMart <%= isSeller ? "Seller" : "Admin" %>
    </div>

    <a class="back"
       href="<%= isSeller ? "seller.jsp" : "admin.jsp" %>">
        Back
    </a>

</div>

<div class="container">

    <div class="top">

        <h1>Manage Products</h1>

        <a class="add-btn" href="add-product.jsp">
            + Add Product
        </a>

    </div>

    <div class="product-grid">

        <% for(Product product : products) { %>

        <div class="product-card">

            <img src="<%= product.getImageUrl() %>"
                 alt="<%= product.getName() %>">

            <h2>
                <%= product.getName() %>
            </h2>

            <div class="price">
                ₹ <%= product.getPrice() %>
            </div>

            <div class="category">
                <%= product.getCategory() %>
            </div>

            <div class="actions">

                <a class="update"
                   href="edit-product.jsp?id=<%= product.getId() %>">
                    Update
                </a>

                <form action="delete-product" method="post">

                    <input type="hidden"
                           name="id"
                           value="<%= product.getId() %>">

                    <button class="remove" type="submit">
                        Remove
                    </button>

                </form>

            </div>

        </div>

        <% } %>

    </div>

</div>

</body>

</html>