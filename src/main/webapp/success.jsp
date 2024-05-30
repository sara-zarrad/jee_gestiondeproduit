<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Opération réussie</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 300px;
            text-align: center;
        }
        h2 {
            margin-bottom: 20px;
            color: #333;
        }
        .success-icon {
            font-size: 48px;
            color: #4caf50;
            margin-bottom: 20px;
        }
        .links {
            margin-top: 20px;
        }
        .links a {
            display: block;
            margin-bottom: 10px;
            text-decoration: none;
            color: #007bff;
            font-size: 16px;
            transition: color 0.3s ease;
        }
        .links a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <span class="success-icon">&#10004;</span>
        <h2>Opération réussie !</h2>
        <div class="links">
            <a href="add_product.html">Ajouter un autre produit</a>
            <a href="listeproduits">Consulter la liste des produits</a><br><br>
            <a href="index.jsp">Retour à la page d'accueil</a>
        </div>
    </div>
</body>
</html>
