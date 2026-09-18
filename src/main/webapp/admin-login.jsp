<%
    String message = "";

    if ("POST".equalsIgnoreCase(request.getMethod())) {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if ("admin".equals(username) && "admin123".equals(password)) {

            session.setAttribute("admin", "true");
            response.sendRedirect("admin.jsp");
            return;

        } else {
            message = "Invalid admin username or password";
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>FreshMart - Admin Login</title>

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

        .login-box {
            width: 90%;
            max-width: 420px;
            background: white;
            padding: 35px;
            border-radius: 16px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.08);
        }

        h1 {
            text-align: center;
            color: #5b3a9e;
            margin-bottom: 10px;
        }

        .subtitle {
            text-align: center;
            color: #777;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #444;
        }

        input {
            width: 100%;
            padding: 13px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 15px;
        }

        .login-btn {
            width: 100%;
            border: none;
            padding: 13px;
            background: #6c4ab6;
            color: white;
            border-radius: 25px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        .login-btn:hover {
            background: #59399f;
        }

        .error {
            text-align: center;
            color: #c0392b;
            margin-bottom: 18px;
            font-size: 14px;
        }

        .back {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #6c4ab6;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
</head>

<body>

<div class="login-box">

    <h1>Admin Login</h1>

    <p class="subtitle">
        FreshMart Administration
    </p>

    <%
        if (!message.isEmpty()) {
    %>
        <div class="error">
            <%= message %>
        </div>
    <%
        }
    %>

    <form method="post">

        <label>Username</label>
        <input type="text"
               name="username"
               placeholder="Enter admin username"
               required>

        <label>Password</label>
        <input type="password"
               name="password"
               placeholder="Enter admin password"
               required>

        <button class="login-btn" type="submit">
            Admin Login
        </button>

    </form>

    <a class="back" href="home.jsp">
        Back to Home
    </a>

</div>

</body>
</html>