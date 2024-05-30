package web;
import dao.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import metier.Produit;
import dao.ProduitDaoImpl;

@WebServlet("/ajouter")
public class ProduitServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ProduitServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        	UserDao ud = new UserDao();
        	String role = ud.getUserRole(username);
        if ("ADMIN".equals(role)) {
            String productName = request.getParameter("productName");
            double productPrice = Double.parseDouble(request.getParameter("productPrice"));
            Produit p = new Produit(productName, productPrice);
            ProduitDaoImpl pdao = new ProduitDaoImpl();
            try {
                pdao.save(p);
                response.sendRedirect("success.jsp");
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Failed to add product. Please try again later.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("AccessDenied.jsp");
        }
    }
}
