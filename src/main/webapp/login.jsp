<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<style>
    body {
        font-family: 'Roboto', sans-serif;
        background: #f0f2f5;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .login-container {
        background-color: #fff;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        padding: 40px;
        width: 350px;
        text-align: center;
    }
    .login-container h2 {
        margin-bottom: 20px;
        color: #333;
        font-weight: 500;
    }
    .login-form input[type="text"], 
    .login-form input[type="password"] {
        width: 100%;
        padding: 12px;
        margin: 10px 0;
        border: 1px solid #ddd;
        border-radius: 8px;
        box-sizing: border-box;
    }
    .login-form button {
        width: 100%;
        background-color: #28a745;
        color: white;
        padding: 12px;
        margin: 10px 0;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s ease;
    }
    .login-form button:hover {
        background-color: #218838;
    }
    .links a {
        display: inline-block;
        margin: 10px 5px;
        text-decoration: none;
        color: #28a745;
        font-size: 14px;
        transition: color 0.3s ease;
    }
    .links a:hover {
        color: #218838;
    }
</style>
</head>
<body>

<div class="login-container">
    <h2>Login</h2>
    <form class="login-form" action="login" method="post">
        <input type="text" id="username" name="username" placeholder="Username">
        <input type="password" id="password" name="password" placeholder="Password">
        <button type="submit">Submit</button>
    </form>
    <div class="links">
        <a href="signup.jsp">Sign Up</a>
        <a href="index.jsp">Home</a>
    </div>
</div>

</body>
</html>
