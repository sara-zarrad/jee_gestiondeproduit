<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Accès Refusé</title>
<style>
body {
    font-family: 'Helvetica Neue', Arial, sans-serif;
    background-color: #f0f2f5; /* Light background color */
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.container {
    text-align: center;
    background-color: #ffffff;
    padding: 50px;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* Subtle box shadow */
}

h1 {
    color: #e74c3c; /* Red color for the error message */
    font-size: 2.5em;
    margin-bottom: 20px;
}

p {
    color: #333333; /* Darker text color for better readability */
    font-size: 1.1em;
    margin: 20px 0;
}

a {
    text-decoration: none;
    color: #ffffff;
    font-weight: bold;
    padding: 12px 24px;
    border-radius: 5px;
    background-color: #3498db; /* Blue background color */
    transition: background-color 0.3s ease;
}

a:hover {
    background-color: #2980b9; /* Darker blue on hover */
}
</style>
</head>
<body>
<div class="container">
    <h1>Accès Refusé</h1>
    <p>Vous n'avez pas la permission d'accéder à cette page.</p>
    <a href="index.jsp">Retour à la page d'accueil</a>
</div>
</body>
</html>
