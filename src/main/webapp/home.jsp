<%@ page import="com.catherinbeulamarket.model.User" %>

<!DOCTYPE html>
<html>
<head>
    <title>FreshMart - Home</title>
</head>
<body>

<%
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<h2>Welcome to FreshMart</h2>

<p>Welcome, <%= user.getName() %>!</p>

<p>Email: <%= user.getEmail() %></p>

<p>Role: <%= user.getRole() %></p>

<h3>Fresh Fruits and Vegetables</h3>

<ul>
    <li>Apple</li>
    <li>Banana</li>
    <li>Tomato</li>
    <li>Carrot</li>
</ul>

<br>

<a href="logout">Logout</a>

</body>
</html>