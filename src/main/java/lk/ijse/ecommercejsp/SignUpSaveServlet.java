package lk.ijse.ecommercejsp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

@WebServlet(name = "signup-save", value = "/signup-save")

public class SignUpSaveServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/ecommerce_jsp";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String role = req.getParameter("role");

        try {
            // Load JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a database connection
            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                // SQL to insert user details (userId is auto-incremented by MySQL)
                String sql = "INSERT INTO User (userName, password, role) VALUES (?, ?, ?)";
                try (PreparedStatement pst = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
                    pst.setString(1, username);
                    pst.setString(2, password);
                    pst.setString(3, role);

                    // Execute the query
                    int rowsAffected = pst.executeUpdate();

                    // Get the auto-generated userId
                    if (rowsAffected > 0) {
                        ResultSet generatedKeys = pst.getGeneratedKeys();
                        if (generatedKeys.next()) {
                            int generatedUserId = generatedKeys.getInt(1);  // Retrieve the auto-incremented userId
                            String formattedUserId = "U" + String.format("%03d", generatedUserId); // Format it as 'U001', 'U002', etc.

                            // Redirect to the success page with the formatted userId
                            resp.sendRedirect("signUp.jsp?message=Signup Successful&userId=" + formattedUserId);
                        }
                    } else {
                        resp.sendRedirect("signUp.jsp?error=Signup Failed");
                    }
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            resp.sendRedirect("signUp.jsp?error=Signup Failed: " + e.getMessage());
        }
    }

}


