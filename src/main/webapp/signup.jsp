<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
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
        .signup-container {
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 350px;
            text-align: center;
        }
        .signup-container h2 {
            margin-bottom: 20px;
            color: #333;
            font-weight: 500;
        }
        .signup-form input[type="text"],
        .signup-form input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-sizing: border-box;
        }
        .signup-form button {
            width: 100%;
            background-color: #007bff;
            color: white;
            padding: 12px;
            margin: 10px 0;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        .signup-form button:hover {
            background-color: #0056b3;
        }
        .links a {
            display: inline-block;
            margin: 10px 5px;
            text-decoration: none;
            color: #007bff;
            font-size: 14px;
            transition: color 0.3s ease;
        }
        .links a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
<div class="signup-container">
    <h2>Sign Up</h2>
    <form class="signup-form" action="signup" method="post">
        <input type="text" id="username" name="username" placeholder="Enter your username">
        <input type="password" id="password" name="password" placeholder="Enter your password">
        <button type="submit">Sign Up</button>
    </form>
    <div class="links">
        <a href="login.jsp">Login</a>
        <a href="index.jsp">Home</a>
    </div>
</div>
</body>
</html>
