<!DOCTYPE html>
<html>
<head>
    <title>FreshMart - Register</title>

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
            background: #f3edff;
        }

        .register-container {
            width: 900px;
            min-height: 560px;
            display: flex;
            background: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(80, 50, 120, 0.15);
        }

        .left-section {
            width: 45%;
            background: #6f42c1;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 40px;
            text-align: center;
        }

        .left-section h1 {
            font-size: 42px;
            margin-bottom: 15px;
        }

        .left-section p {
            font-size: 17px;
            line-height: 1.6;
        }

        .right-section {
            width: 55%;
            padding: 50px 60px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .right-section h2 {
            color: #4b287d;
            font-size: 30px;
            margin-bottom: 10px;
        }

        .subtitle {
            color: #777;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-bottom: 7px;
            color: #444;
            font-weight: bold;
        }

        input,
        select {
            width: 100%;
            padding: 13px;
            margin-bottom: 16px;
            border: 1px solid #ddd;
            border-radius: 8px;
            outline: none;
            font-size: 15px;
            background: white;
        }

        input:focus,
        select:focus {
            border-color: #6f42c1;
        }

        button {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 8px;
            background: #6f42c1;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 5px;
        }

        button:hover {
            background: #59339d;
        }

        .login-link {
            text-align: center;
            margin-top: 20px;
        }

        .login-link a {
            color: #6f42c1;
            text-decoration: none;
            font-weight: bold;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        @media (max-width: 700px) {
            .register-container {
                width: 90%;
                flex-direction: column;
            }

            .left-section,
            .right-section {
                width: 100%;
            }

            .left-section {
                padding: 30px;
            }

            .right-section {
                padding: 35px;
            }
        }
    </style>
</head>

<body>

<div class="register-container">

    <div class="left-section">
        <h1>FreshMart</h1>
        <p>
            Join FreshMart today.<br>
            Shop fresh products<br>
            with ease.
        </p>
    </div>

    <div class="right-section">

        <h2>Create Account</h2>
        <p class="subtitle">Register for your FreshMart account</p>

        <form action="register" method="post">

            <label>Name:</label>
            <input type="text" name="name" required>

            <label>Email:</label>
            <input type="email" name="email" required>

            <label>Password:</label>
            <input type="password" name="password" required>

            <label>Role:</label>
            <select name="role">
                <option value="CUSTOMER">Customer</option>
                <option value="ADMIN">Admin</option>
            </select>

            <button type="submit">Register</button>

        </form>

        <div class="login-link">
            Already have an account?
            <a href="login.jsp">Login</a>
        </div>

    </div>

</div>

</body>
</html>