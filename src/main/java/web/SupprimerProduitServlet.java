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

@WebServlet("/supprimerProduit")
public class SupprimerProduitServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        	UserDao ud = new UserDao();
        	String role = ud.getUserRole(username);
        	
        if ("ADMIN".equals(role)) {
            try {
                Long idProduit = Long.parseLong(request.getParameter("idProduit"));

                ProduitDaoImpl produitDao = new ProduitDaoImpl();
                produitDao.deleteProduit(idProduit);

                response.sendRedirect("listeproduits");
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Failed to delete product. Please try again later.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("AccessDenied.jsp");
        }
    }
}
