package web;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import dao.ProduitDaoImpl;
import dao.UserDao;
import metier.Produit;
@WebServlet("/modifierProduit")
public class ModifierProduitServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        UserDao ud = new UserDao();
        String role = ud.getUserRole(username);

        if ("ADMIN".equals(role)) {
            try {
                String idProduitStr = request.getParameter("idProduit");
                String nomProduit = request.getParameter("nomProduit");
                String prixStr = request.getParameter("prix");

                if (idProduitStr == null || nomProduit == null && prixStr == null ) {
                    throw new IllegalArgumentException("Veuillez remplir un case au minimum.");
                }
                Long idProduit = Long.parseLong(idProduitStr);
                double prix = Double.parseDouble(prixStr);
                
                Produit produit = new Produit();
                
                if( nomProduit.isEmpty() ) {
                    produit.setIdProduit(idProduit);
                    produit.setPrix(prix);
                }else if( prixStr.isEmpty() ) {
                    produit.setIdProduit(idProduit);
                    produit.setNomProduit(nomProduit);
                }else {
 
                produit.setIdProduit(idProduit);
                produit.setNomProduit(nomProduit);
                produit.setPrix(prix);
                }
                ProduitDaoImpl produitDao = new ProduitDaoImpl();
                produitDao.updateProduit(produit);

                response.sendRedirect("listeproduits");
            } catch (NumberFormatException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Failed to modify product. Invalid price format.");
                request.getRequestDispatcher("modifierProduit.jsp").forward(request, response);
            } catch (IllegalArgumentException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Failed to modify product. " + e.getMessage());
                request.getRequestDispatcher("modifierProduit.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Failed to modify product. Please try again later.");
                request.getRequestDispatcher("modifierProduit.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("AccessDenied.jsp");
        }
    }
}
