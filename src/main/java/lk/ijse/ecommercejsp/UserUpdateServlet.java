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

        // Retrieve data from the form
        String username = req.getParameter("username").trim();
        String password = req.getParameter("password").trim();
        int userId = (int) req.getSession().getAttribute("userId"); // Get userId from session

        // SQL query for updating the user information (without role)
        String sql = "UPDATE user SET userName = ?, password = ? WHERE userId = ?";

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pst = connection.prepareStatement(sql)) {

            // Set the parameters for the update query
            pst.setString(1, username);
            pst.setString(2, password); // You may want to hash the password before saving
            pst.setInt(3, userId);

            // Execute the update query
            int updatedRows = pst.executeUpdate();

            // If update is successful, redirect to success page
            if (updatedRows > 0) {
                resp.sendRedirect("profile.jsp?success=true");
            } else {
                resp.sendRedirect("profile.jsp?success=true");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("profile.jsp?error=true");
        }
    }

}
