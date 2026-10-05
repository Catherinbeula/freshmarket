<%
    com.catherinbeulamarket.model.User user =
            (com.catherinbeulamarket.model.User) session.getAttribute("user");

    boolean isAdmin = "true".equals(session.getAttribute("admin"));
    boolean isSeller = user != null && "SELLER".equals(user.getRole());

    if (!isAdmin && !isSeller) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>FreshMart - Add Product</title>

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

        .save-btn {
            width: 100%;
            border: none;
            background: #6c4ab6;
            color: white;
            padding: 13px;
            border-radius: 22px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        .save-btn:hover {
            background: #59399f;
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

    <div class="form-box">

        <h1>Add Product</h1>

        <form action="add-product" method="post">

            <label>Product Name</label>

            <input type="text"
                   name="name"
                   placeholder="Enter product name"
                   required>

            <label>Price</label>

            <input type="number"
                   name="price"
                   step="0.01"
                   placeholder="Enter price"
                   required>

            <label>Image URL</label>

            <input type="text"
                   name="image"
                   placeholder="Paste image URL"
                   required>

            <label>Category</label>

            <select name="category" required>

                <option value="">Select Category</option>

                <option value="Fruit">
                    Fruit
                </option>

                <option value="Vegetable">
                    Vegetable
                </option>

            </select>

            <button class="save-btn" type="submit">
                Add Product
            </button>

        </form>

    </div>

</div>

</body>

</html>