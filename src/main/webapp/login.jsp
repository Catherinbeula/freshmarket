<!DOCTYPE html>
<html>
<head>
    <title>FreshMart - Login</title>

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

        .login-container {
            width: 900px;
            min-height: 520px;
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
            padding: 60px;
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
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #444;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 14px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            outline: none;
            font-size: 15px;
        }

        input:focus {
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
        }

        button:hover {
            background: #59339d;
        }

        .register-link {
            text-align: center;
            margin-top: 22px;
        }

        .register-link a {
            color: #6f42c1;
            text-decoration: none;
            font-weight: bold;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        @media (max-width: 700px) {
            .login-container {
                width: 90%;
                flex-direction: column;
            }

            .left-section,
            .right-section {
                width: 100%;
            }

            .left-section {
                padding: 35px;
            }

            .right-section {
                padding: 35px;
            }
        }
    </style>
</head>

<body>

<div class="login-container">

    <div class="left-section">
        <h1>FreshMart</h1>
        <p>
            Fresh products,<br>
            fresh choices,<br>
            fresh life.
        </p>
    </div>

    <div class="right-section">

        <h2>Welcome Back!</h2>
        <p class="subtitle">Login to your FreshMart account</p>

        <form action="/freshmart-1.0/api/auth/login" method="post">

            <label>Email:</label>
            <input type="email" name="email" required>

            <label>Password:</label>
            <input type="password" name="password" required>

            <button type="submit">Login</button>

        </form>

        <div class="register-link">
            Don't have an account?
            <a href="register.jsp">Create New Account</a>
        </div>

    </div>

</div>

</body>
</html>