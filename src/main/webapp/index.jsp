<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Main Page</title>
<style>body {
    font-family: 'Roboto', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f0f2f5;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}

.navbar {
    background-color: #007bff;
    padding: 10px 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.navbar a {
    color: #fff;
    text-decoration: none;
    font-size: 18px;
    margin-right: 20px;
    transition: color 0.3s ease;
}

.navbar a:hover {
    color: #ffcc00;
}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropbtn {
    background-color: #007bff;
    color: white;
    padding: 10px 20px;
    font-size: 16px;
    border: none;
    cursor: pointer;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

.dropbtn:hover {
    background-color: #0056b3;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #fff;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    border-radius: 5px;
    z-index: 1;
}

.dropdown:hover .dropdown-content {
    display: block;
}

.dropdown-content ul {
    list-style: none;
    padding: 10px;
    margin: 0;
}

.dropdown-content ul li {
    padding: 8px 16px;
    border-bottom: 1px solid #ddd;
}

.dropdown-content ul li:last-child {
    border-bottom: none;
}

.dropdown-content ul li span {
    display: block;
}

.logout-btn form {
    display: flex;
    justify-content: center;
    align-items: center;
}

.logout-btn button {
    background-color: #e74c3c;
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.logout-btn button:hover {
    background-color: #c0392b;
}

.container {
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-align: center;
    padding: 20px;
}

.container h1 {
    color: #333;
    margin-bottom: 20px;
    font-size: 2em;
}

.links a {
    display: inline-block;
    margin: 10px;
    text-decoration: none;
    color: #007bff;
    font-size: 18px;
    padding: 10px 20px;
    border: 2px solid #007bff;
    border-radius: 5px;
    transition: all 0.3s ease;
}

.links a:hover {
    background-color: #007bff;
    color: #fff;
}

footer {
    background-color: #007bff;
    color: #fff;
    text-align: center;
    padding: 10px 20px;
    position: relative;
    bottom: 0;
    width: 100%;
}


</style>
</head>
<body>
	<div class="navbar">
		<a href="index.jsp">Home</a>
		
	
						<form action="logout" method="get" style="margin-left:35px;">
							<button type="submit"
								style="background-color: #e74c3c; color: #fff; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer; transition: background-color 0.3s;">Logout</button>
						</form>
	
	
			</div>


	<div class="container">
		<h1>Bienvenue, <%@ page import="jakarta.servlet.http.HttpSession"%>
						<%
						HttpSession sessions = request.getSession(false); String usernames = (String) sessions.getAttribute("username");
						if (usernames != null) {
						%><%= usernames %> <% } else {%> Client <% } %></h1>
		<div class="links">
			<%
			if (session.getAttribute("username") == null) {
			%>
			<a href="login.jsp">Login</a> <a href="signup.jsp">Sign Up</a>
			<%
			} else {
			%>
			<a href="add_product.html">Ajouter un autre produit</a> <a
				href="listeproduits">Consulter la liste des produits</a><br>
			<br>
			<%
			}
			%>
		</div>

	</div>
</body>
</html>
