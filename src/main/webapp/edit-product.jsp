<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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

    int id = Integer.parseInt(request.getParameter("id"));

    ProductDAOImpl productDAO = new ProductDAOImpl();

    Product selectedProduct = null;

    for(Product p : productDAO.getAllProducts()) {
        if(p.getId() == id) {
            selectedProduct = p;
            break;
        }
    }

    if(selectedProduct == null) {
        response.sendRedirect("admin-products.jsp");
        return;
    }
%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>FreshMart - Update Product</title>

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
            max-width: 600px;
            margin: 60px auto;
        }

        .form-box {
            background: white;
            padding: 35px;
            border-radius: 16px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        h1 {
            text-align: center;
            color: #5b3a9e;
            margin-bottom: 30px;
        }

        label {
            display: block;
            color: #5b3a9e;
            font-weight: bold;
            margin-bottom: 7px;
        }

        input,
        select {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #c9b8e8;
            border-radius: 8px;
            outline: none;
        }

        input:focus,
        select:focus {
            border-color: #6c4ab6;
        }

        .buttons {
            display: flex;
            gap: 12px;
        }

        .update-btn,
        .cancel-btn {
            flex: 1;
            padding: 13px;
            border-radius: 22px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
        }

        .update-btn {
            background: #6c4ab6;
            color: white;
            border: none;
        }

        .cancel-btn {
            background: white;
            color: #6c4ab6;
            border: 2px solid #6c4ab6;
        }

    </style>

</head>

<body>

<div class="navbar">

    <div class="logo">
        FreshMart <%= isSeller ? "Seller" : "Admin" %>
    </div>

    <a class="back" href="admin-products.jsp">
        Back
    </a>

</div>

<div class="container">

    <div class="form-box">

        <h1>Update Product</h1>

        <form action="update-product" method="post">

            <input type="hidden"
                   name="id"
                   value="<%= selectedProduct.getId() %>">

            <label>Product Name</label>

            <input type="text"
                   name="name"
                   value="<%= selectedProduct.getName() %>"
                   required>

            <label>Price</label>

            <input type="number"
                   name="price"
                   step="0.01"
                   value="<%= selectedProduct.getPrice() %>"
                   required>

            <label>Image URL</label>

            <input type="text"
                   name="image"
                   value="<%= selectedProduct.getImageUrl() %>"
                   required>

            <label>Category</label>

            <select name="category" required>

                <option value="Fruit"
                    <%= "Fruit".equals(selectedProduct.getCategory()) ? "selected" : "" %>>
                    Fruit
                </option>

                <option value="Vegetable"
                    <%= "Vegetable".equals(selectedProduct.getCategory()) ? "selected" : "" %>>
                    Vegetable
                </option>

            </select>

            <label>Stock</label>

            <input type="number"
                   name="stock"
                   min="0"
                   value="<%= selectedProduct.getStock() %>"
                   required>

            <div class="buttons">

                <button class="update-btn" type="submit">
                    Update
                </button>

                <a class="cancel-btn" href="admin-products.jsp">
                    Cancel
                </a>

            </div>

        </form>

    </div>

</div>

</body>

</html>