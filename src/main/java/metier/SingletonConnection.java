package metier;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SingletonConnection {
    private static final String USERNAME = "root";
    private static final String PASSWORD = "";
    private static Connection connection;

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_jde", USERNAME, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            // Proper error handling: log or throw a custom exception
            e.printStackTrace();
            throw new RuntimeException("Failed to initialize database connection", e);
        }
    }

    public static Connection getConnection() {
        try {
            if (connection.isClosed()) {
                // Reopen the connection if it's closed
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_jde", USERNAME, PASSWORD);
            }
        } catch (SQLException e) {
            // Proper error handling: log or throw a custom exception
            e.printStackTrace();
            throw new RuntimeException("Failed to get database connection", e);
        }
        return connection;
    }
}
