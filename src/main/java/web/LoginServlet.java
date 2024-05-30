package web;
import dao.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import metier.User;
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String errorMessage = null;

        if (username != null && password != null && !username.isEmpty() && !password.isEmpty()) {
            User user = new User(username, password);
            if (user.verif()) {
            	  HttpSession session = request.getSession();
                  session.setAttribute("username", username);
                  UserDao ud = new UserDao();
                    String role =ud.getUserRole(username);
                  session.setAttribute("role", role);
                
                  request.getRequestDispatcher("index.jsp").forward(request, response); // Redirect to login.jsp with error message
                
                return;
            } else {
                errorMessage = "Incorrect username or password";
            }
        } else {
            errorMessage = "Please enter both username and password";
        }

        request.setAttribute("error", errorMessage);
        request.getRequestDispatcher("login.jsp").forward(request, response); // Redirect to login.jsp with error message
    }
}
