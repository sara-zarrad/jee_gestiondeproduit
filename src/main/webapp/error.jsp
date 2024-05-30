<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Error</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.container {
    text-align: center;
    background-color: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    color: #e74c3c;
    margin-bottom: 20px;
}

p {
    color: #333;
    margin-bottom: 20px;
}

a {
    text-decoration: none;
    color: #007bff;
    font-weight: bold;
    padding: 10px 20px;
    border: 2px solid #007bff;
    border-radius: 5px;
    transition: all 0.3s ease;
}

a:hover {
    background-color: #007bff;
    color: #fff;
}
</style>
</head>
<body>
<div class="container">
    <h1>Error</h1>
    <p><%= request.getAttribute("errorMessage") %></p>
    <a href="index.jsp">Return to Home</a>
</div>
</body>
</html>
