<!DOCTYPE html>
<html>
<head>
    <title>FreshMart - Register</title>
</head>
<body>

<h2>FreshMart Registration</h2>

<form action="/freshmart-1.0/api/freshmarket/register" method="post">

    <label>Name:</label>
    <input type="text" name="name" required>
    <br><br>

    <label>Email:</label>
    <input type="email" name="email" required>
    <br><br>

    <label>Password:</label>
    <input type="password" name="password" required>
    <br><br>

    <label>Role:</label>
    <select name="role">
        <option value="CUSTOMER">Customer</option>
        <option value="ADMIN">Admin</option>
    </select>
    <br><br>

    <button type="submit">Register</button>

</form>

<br>

<a href="login.jsp">Already have an account? Login</a>

</body>
</html>