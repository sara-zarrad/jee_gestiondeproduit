<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Liste des Produits</title>
<style>
    body {
        font-family: 'Roboto', sans-serif;
        background: #f0f2f5;
        margin: 0;
        padding: 0;
    }
    .container {
        max-width: 900px;
        margin: 50px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }
    h1 {
        color: #333;
        margin-bottom: 20px;
        text-align: center;
        font-size: 2em;
        font-weight: 500;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }
    th, td {
        padding: 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #007bff;
        color: #fff;
    }
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    tr:hover {
        background-color: #f1f1f1;
    }
    .actions {
        display: flex;
        gap: 10px;
    }
    .actions a, .actions input[type="submit"] {
        background-color: #28a745;
        color: #fff;
        border: none;
        padding: 10px;
        border-radius: 5px;
        text-decoration: none;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    .actions a:hover, .actions input[type="submit"]:hover {
        background-color: #218838;
    }
    .search-form {
        display: flex;
        justify-content: center;
        margin-bottom: 20px;
    }
    .search-form input[type="text"] {
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 5px 0 0 5px;
        width: 300px;
    }
    .search-form input[type="submit"] {
        padding: 10px 20px;
        font-size: 16px;
        border: none;
        background-color: #007bff;
        color: #fff;
        border-radius: 0 5px 5px 0;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    .search-form input[type="submit"]:hover {
        background-color: #0056b3;
    }
    .links {
        text-align: center;
        margin-top: 20px;
    }
    .links a {
        text-decoration: none;
        color: #007bff;
        font-weight: bold;
        margin: 0 10px;
        padding: 10px 20px;
        border: 2px solid #007bff;
        border-radius: 5px;
        transition: all 0.3s ease;
    }
    .links a:hover {
        background-color: #007bff;
        color: #fff;
    }
</style>
</head>
<body>
	<div class="container">
		<h1>Liste des Produits</h1>

		<!-- Search Form -->
		<form method="get" action="listeproduits" class="search-form">
			<input type="text" name="search" placeholder="Rechercher un produit...">
			<input type="submit" value="Rechercher">
		</form>
		
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>Nom Produit</th>
					<th>Prix</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<%@ page import="metier.Produit"%>
				<%@ page import="java.util.ArrayList"%>
				<%@ page import="java.io.IOException"%>
				<%@ page import="jakarta.servlet.ServletException"%>
				<%@ page import="jakarta.servlet.http.HttpServletRequest"%>
				<%@ page import="jakarta.servlet.http.HttpServletResponse"%>
				
				<% 
				ArrayList<Produit> produits = (ArrayList<Produit>) request.getAttribute("produits");
				if (produits != null && !produits.isEmpty()) {
					for (Produit produit : produits) {
				%>
				<tr>
					<td><%=produit.getIdProduit()%></td>
					<td><%=produit.getNomProduit()%></td>
					<td><%=produit.getPrix()%> TND</td>
					<td class="actions"><%@ page import="java.net.URLEncoder" %>
<a href="modifierProduit.jsp?idProduit=<%= produit.getIdProduit() %>&nomProduit=<%= URLEncoder.encode(produit.getNomProduit(), "UTF-8") %>&prix=<%= produit.getPrix() %>" >Modifier</a>

						<form action="supprimerProduit" method="post">
							<input type="hidden" name="idProduit"
								value="<%=produit.getIdProduit()%>"> <input
								type="submit" value="Supprimer">
						</form>
					</td>

				</tr>
				<%
				} // end of for loop
				} else {
				%>
				<tr>
					<td colspan="4">Aucun produit disponible</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
	<br>

	<div class="links">
		<a href="add_product.html">Ajouter une autre produit</a><br> <br> 
		<a href="index.jsp">Retour à la page d'accueil</a>

	</div>
</body>
</html>