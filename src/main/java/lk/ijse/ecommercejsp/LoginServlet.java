package lk.ijse.ecommercejsp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.logging.*;
@WebServlet(name = "login", value = "/login")


public class LoginServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ecommerce_jsp";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("username").trim();  // Trim input to avoid leading/trailing spaces
        String password = req.getParameter("password").trim();  // Trim input to avoid leading/trailing spaces
        String role = req.getParameter("role").trim();  // Trim role to avoid leading/trailing spaces



        String sql = "SELECT * FROM user WHERE userName = ? AND password = ? AND role = ?";

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pst = connection.prepareStatement(sql)) {

            // Set the parameters for the query
            pst.setString(1, userName); // First parameter for userName
            pst.setString(2, password); // Second parameter for password
            pst.setString(3, role);     // Third parameter for role

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                // If a matching record is found, retrieve user details
                String retrievedUserName = rs.getString("userName");
                String retrievedPassword = rs.getString("password");
                String retrievedRole = rs.getString("role");


                // Store user data in session (or perform other actions)
                req.getSession().setAttribute("userName", retrievedUserName);
                req.getSession().setAttribute("role", retrievedRole);

                // Redirect to dashboard.jsp after successful login
                resp.sendRedirect("dashboardCustomer.jsp");
            } else {
                // If no record is found, redirect to login page with error
                resp.sendRedirect("index.jsp?error=true");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("index.jsp?error=true");
        }
    }
}