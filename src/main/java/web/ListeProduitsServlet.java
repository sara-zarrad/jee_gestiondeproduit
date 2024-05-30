package web;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import metier.Produit;
import dao.ProduitDaoImpl;

@WebServlet("/listeproduits")
public class ListeProduitsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProduitDaoImpl produitDao = new ProduitDaoImpl();
        String searchQuery = request.getParameter("search");
        
        try {
            List<Produit> produits;
            if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                produits = produitDao.produitsParMC(searchQuery);
            } else {
                produits = produitDao.getAllProduits();
            }
            
            request.setAttribute("produits", produits);
            request.getRequestDispatcher("listeproduit.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Failed to retrieve products. Please try again later.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
