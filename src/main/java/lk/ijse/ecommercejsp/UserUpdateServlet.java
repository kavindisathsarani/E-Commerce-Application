package lk.ijse.ecommercejsp;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
@WebServlet(name = "UserUpdateServlet", value = "/user-update")

public class UserUpdateServlet extends HttpServlet {
    String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DB_USER = "root";
    String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Fetching the logged-in user details from the session
        Integer userId = (Integer) req.getSession().getAttribute("userId"); // userId is an integer in the session
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String role = req.getParameter("role");

        // Checking if the user is logged in
        if (userId == null) {
            resp.sendRedirect("index.jsp"); // Redirect to login page if not logged in
            return;
        }

        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection to the database
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // SQL query to update user profile
            String sql = "UPDATE user SET userName = ?, password = ?, role = ? WHERE userId = ?";
            PreparedStatement pst = connection.prepareStatement(sql);

            // Set the parameters for the prepared statement
            pst.setString(1, username);
            pst.setString(2, password);  // Make sure password is hashed before saving
            pst.setString(3, role);
            pst.setInt(4, userId);  // Use setInt for integer userId

            // Execute the update query
            int updatedRowCount = pst.executeUpdate();

            // Redirect based on update result
            if (updatedRowCount > 0) {
                resp.sendRedirect("user-update.jsp?success=true"); // Profile updated successfully
            } else {
                resp.sendRedirect("user-update.jsp?error=true"); // Profile update failed
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            resp.sendRedirect("user-update.jsp?error=true"); // Handle exception and redirect with error
        }
    }
}
