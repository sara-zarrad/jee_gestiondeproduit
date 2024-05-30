package web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import dao.UserDao;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String errorMessage = null;

        if (username != null && password != null && !username.isEmpty() && !password.isEmpty()) {
            UserDao userDao = new UserDao();
            if (userDao.createUser(username, password, "ADMIN")) {
            
           
                response.sendRedirect("login.jsp"); 
                return;
            } else {
                errorMessage = "Failed to create user";
            }
        } else {
            errorMessage = "Please enter both username and password";
        }

        request.setAttribute("error", errorMessage);
        request.getRequestDispatcher("signup.jsp").forward(request, response); // Redirect to signup.jsp with error message
    }
}
