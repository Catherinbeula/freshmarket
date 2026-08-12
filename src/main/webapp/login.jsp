<!DOCTYPE html>
<html>
<head>
    <title>FreshMart - Login</title>
</head>
<body>

<h2>FreshMart Login</h2>

<form action="/freshmart-1.0/api/auth/login" method="post">

    <label>Email:</label>
    <input type="email" name="email" required>
    <br><br>

    <label>Password:</label>
    <input type="password" name="password" required>
    <br><br>

    <button type="submit">Login</button>

</form>

<br>

<a href="register.jsp">Create New Account</a>

</body>
</html>