<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Home Page</title>
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

table {
    margin: 40px auto;
    border-collapse: collapse;
    width: 90%;
    background-color: #f9f9f9;
    border: 1px solid #ccc;
}

th, td {
    padding: 15px;
    text-align: left;
    border: 1px solid #ddd;
}

th {
    background-color: #e50914;
    color: #fff;
}

td {
    color: #333;
}

button {
    background-color: #e50914;
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.3s;
}

button:hover {
    background-color: #f40612;
    transform: scale(1.05);
}

a {
    color: inherit;
    text-decoration: none;
}

#abc {
    position: fixed;
    top: 12%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #e50914;
    color: #fff;
    padding: 5px;
    border-radius: 10px;
    z-index: 1000;
    display: none;
    text-align: center;
}
</style>
</head>
<body>
    <header>
        <h1>Admin Home Page</h1>
        <ul>
            <li><a href="create_page">Create Users</a></li>
            <li><a href="logout">Logout</a></li>
        </ul>
    </header>

    <div id="abc">Your message here!</div>

    <table cellspacing="0" cellpadding="10" border="1"> 
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone Number</th>
        <th>Role</th>
        <th>Password</th>
        <th colspan="2" style="text-align: center;">Action</th>
    </tr>
    <%
    ResultSet rs = (ResultSet) request.getAttribute("rs");
    while (rs.next()) {
    %>
        <tr>
            <td><%=rs.getInt(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getLong(4)%></td>
            <td><%=rs.getString(5)%></td>
            <td><%=rs.getString(6)%></td>
            <td><a href="update_page?id=<%=rs.getInt(1)%>"><button>Update</button></a></td>
            <td><a href="delete?id=<%=rs.getInt(1)%>"><button>Delete</button></a></td>
        </tr>
    <%
    }
    %>
    </table>

<script type="text/javascript">
    let abc = document.getElementById("abc");
    if(abc){
        abc.style.display = "block";
        setTimeout(()=>{abc.style.display="none"}, 2000);
    }
</script>
</body>
</html>
