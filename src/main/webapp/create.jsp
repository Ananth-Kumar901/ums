<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Account Page</title>
<style type="text/css">
/* Basic Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Body and font styles */
body {
    font-family: Arial, sans-serif;
    background-color: #ffffff;
    color: #141414;
    line-height: 1.6;
    padding-left: 10px;
    padding-right: 10px;
    
}

/* Header styles */
header {
    background-color: #ffffff;
    padding: 20px 0;
    text-align: center;
    border-bottom: 1px solid #e50914;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

header h1 {
    font-size: 2em;
    color: #e50914;
    margin-bottom: 10px;
}

header ul {
    list-style: none;
}

header ul li {
    display: inline;
    margin: 0 10px;
}

header ul li a {
    color: #141414;
    text-decoration: none;
    font-size: 1.1em;
    transition: color 0.3s;
}

header ul li a:hover {
    color: #e50914;
}

/* Main styles */
main {
    padding: 20px;
    text-align: center;
}

main h1 {
    font-size: 2.5em;
    margin-bottom: 20px;
}

form {
    background: #f5f5f5;
    padding: 20px;
    border-radius: 8px;
    display: inline-block;
    width: 45%;
    text-align: left;
    border: 1px solid #e50914;
}

form label {
    display: block;
    margin-bottom: 8px;
    color: #141414;
}

form input {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ddd;
    border-radius: 4px;
}

form input[type="text"], form input[type="email"], form input[type="tel"], form input[type="password"] {
    background-color: #ffffff;
    color: #141414;
}

form button {
    width: 100%;
    padding: 10px;
    background-color: #e50914;
    border: none;
    border-radius: 4px;
    color: #ffffff;
    font-size: 1.1em;
    cursor: pointer;
    transition: background-color 0.3s;
}

form button:hover {
    background-color: #f40612;
}

span {
    display: block;
    margin-top: 15px;
}

span a {
    color: #e50914;
    text-decoration: none;
    transition: color 0.3s;
}

span a:hover {
    color: #f40612;
}

/* Footer styles */
footer {
    background-color: #ffffff;
    padding: 20px 0;
    text-align: center;
    border-top: 1px solid #e50914;
}

footer h3 {
    font-size: 1.5em;
    color: #e50914;
    margin-bottom: 10px;
}

footer ul {
    list-style: none;
}

footer ul li {
    display: inline;
    margin: 0 10px;
    color: #141414;
}

footer ul li:hover {
    color: #e50914;
}

</style>
</head>
<body>
	<header>
		<h1>User Management System</h1>
		<ul>
			<li> <a href="login_page">Login</a> </li>
		</ul>
	</header>
	<main>
		<h1>Create Account </h1>
		<form action="create" method="post">
			<label for="id">Id</label> <input id="id" type="text"  name="id" placeholder="Enter ID" required="required">
			<label for="name">Name</label> <input id="name" type="text"  name="name" placeholder="Enter Name" required="required">
			<label for="email">Email</label> <input id="email" type="email"  name="email" placeholder="Enter Email" required="required">
			<label for="phone">Phone Number</label> <input id="phone" type="tel"  name="phone" placeholder="Enter Phone Number" required="required">
			<label for="role">Role</label> 
											<select id="role" name="role" required="required" >
												<option selected="selected" value="USER">---Select---</option>
												<option value="USER">USER</option>
												<option value="ADMIN">ADMIN</option>
											</select>
			<label for="password">Password</label> <input id="password" type="password"  name="password" placeholder="Enter Password" required="required">
			<button type="submit">Create Account</button>	
		</form>
		<span>You have Account Already? <a href="login_page">Click Here</a> to Login</span>
	</main>
	<footer>
		<h3>UMS</h3>
		<ul>
			<li>Home</li>
			<li>Products</li>
			<li>Services</li>
			<li>About</li>
			<li>Carrier</li>
			<li>Contact</li>
		</ul>
	</footer>
</body>
</html>