<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modifier Produit</title>
    <style>
body {
    font-family: 'Roboto', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f0f2f5;
}

.container {
    max-width: 400px;
    margin: 50px auto;
    padding: 40px;
    background-color: #fff;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    margin-bottom: 20px;
    color: #333;
    font-weight: 500;
}

form {
    display: flex;
    flex-direction: column;
}

label {
    margin-bottom: 8px;
    color: #555;
    font-weight: 400;
}

input[type="text"],
input[type="number"],
input[type="submit"] {
    padding: 12px;
    margin-bottom: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-sizing: border-box;
}

input[type="submit"] {
    background-color: #007bff;
    color: white;
    cursor: pointer;
    transition: background-color 0.3s ease;
    font-size: 16px;
    font-weight: 500;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

.error {
    color: red;
    margin-bottom: 20px;
    text-align: center;
}

.links {
    margin-top: 20px;
    text-align: center;
}

.links a {
    display: inline-block;
    margin-right: 10px;
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
    <div class="container">
        <h1>Modifier Produit</h1>
        <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="error"><%= request.getAttribute("errorMessage") %></div>
        <% } %>
	<form id="modifierForm" action="modifierProduit" method="post">
            <label for="idProduit">ID Produit:</label>
            <input type="text" id="idProduit" name="idProduit" value="<%= request.getParameter("idProduit") %>" readonly required>
            <label for="nomProduit">Nom du produit:</label>
            <input type="text" id="nomProduit" name="nomProduit" value="<%= request.getParameter("nomProduit") %>" placeholder="Entrer un nouveau nom du produit">
            <label for="prix">Prix:</label>
            <input type="number" step="0.01" id="prix" name="prix" value="<%= request.getParameter("prix") %>" placeholder="En dinar">
            <input type="submit" value="Modifier">
        </form>
        <div class="links">
            <a href="listeproduits">Retour à la liste des produits</a>
        </div>
    </div>
</body>
</html>
