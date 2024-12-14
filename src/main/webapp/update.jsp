<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Page</title>
<style type="text/css">
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #fff;
    color: #333;
}

header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #e50914;
    padding: 20px;
    color: #fff;
}

header h1 {
    margin: 0;
    font-size: 24px;
}

ul {
    list-style-type: none;
    display: flex;
    gap: 10px;
    margin: 0;
    padding: 0;
}

ul > li > a {
    border: 1px solid #e50914;
    padding: 10px 20px;
    border-radius: 5px;
    text-decoration: none;
    color: #e50914;
    background-color: #fff;
    transition: background-color 0.3s, color 0.3s;
}

ul > li > a:hover {
    background-color: #f40612;
    color: #fff;
}

form {
    max-width: 600px;
    margin: 40px auto;
    padding: 20px;
    background-color: #f9f9f9;
    border: 1px solid #ccc;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

form h1 {
    margin-bottom: 20px;
    font-size: 24px;
    color: #e50914;
}

form label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
}

form input {
    width: calc(100% - 20px);
    padding: 10px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
}

form button {
    width: 100%;
    padding: 10px;
    border: none;
    border-radius: 5px;
    background-color: #e50914;
    color: #fff;
    font-size: 18px;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.3s;
}

form button:hover {
    background-color: #f40612;
    transform: scale(1.05);
}
</style>
</head>
<body>
    <header>
        <h1>Admin Home Page</h1>
        <ul>
            <li><a href="#">Users</a></li>
            <li><a href="create_page">Create Users</a></li>
            <li><a href="#">Products</a></li>
            <li><a href="#">Create Product</a></li>
            <li><a href="about">About</a></li>
            <li><a href="contact">Contact</a></li>
            <li><a href="logout">Logout</a></li>
        </ul>
    </header>

    <form action="update" method="post">
        <h1>User Update Page</h1>
        <%
        ResultSet rs = (ResultSet) request.getAttribute("rs");
        %>
        <label for="id">ID</label>
        <input type="text" id="id" name="id" value="<%= rs.getInt(1) %>" readonly>
        
        <label for="name">Name</label>
        <input type="text" id="name" name="name" value="<%= rs.getString(2) %>">
        
        <label for="email">Email</label>
        <input type="email" id="email" name="email" value="<%= rs.getString(3) %>">
        
        <label for="phone">Phone Number</label>
        <input type="tel" id="phone" name="phone" value="<%= rs.getLong(4) %>">
        
        <label for="role">Role</label>
        <input type="text" id="role" name="role" value="<%= rs.getString(5) %>">
        
        <label for="password">Password</label>
        <input type="password" id="password" name="password" value="<%= rs.getString(6) %>">
        
        <button type="submit">Update</button>    
    </form>
</body>
</html>
