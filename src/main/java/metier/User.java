package metier;

import dao.UserDao;

public class User {
    private String username;
    private String password;
    private String role = "ADMIN"; 

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }



    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean verif() {
        UserDao userDao = new UserDao();
        if (userDao.validateUser(username, password)) {
            this.role = userDao.getUserRole(username); // Fetch role from DAO
            return true;
        }
        return false;
    }
}
