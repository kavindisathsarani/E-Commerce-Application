package lk.ijse.ecommercejsp;

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

@WebServlet(name = "addToCart", value = "/addToCart")
public class addToCartServlet extends HttpServlet {
    // Database connection details
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ecommerce_jsp";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve form data
        int userId = 0;
        int productId = 0;
        int quantity = 0;

        try {
            // Check if the parameters are not null or empty
            String userIdParam = req.getParameter("userId");
            String productIdParam = req.getParameter("productId");
            String quantityParam = req.getParameter("quantity");

            if (userIdParam != null && !userIdParam.isEmpty()) {
                userId = Integer.parseInt(userIdParam);
            } else {
                resp.sendRedirect("cart.jsp?error=User ID is missing or invalid");
                return; // Stop further processing
            }

            if (productIdParam != null && !productIdParam.isEmpty()) {
                productId = Integer.parseInt(productIdParam);
            } else {
                resp.sendRedirect("cart.jsp?error=Product ID is missing or invalid");
                return; // Stop further processing
            }

            if (quantityParam != null && !quantityParam.isEmpty()) {
                quantity = Integer.parseInt(quantityParam);
            } else {
                resp.sendRedirect("cart.jsp?error=Quantity is missing or invalid");
                return; // Stop further processing
            }

            // Database connection and insertion
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "INSERT INTO Cart (userId, productId, quantity) VALUES (?, ?, ?)";
                PreparedStatement pst = connection.prepareStatement(sql);
                pst.setInt(1, userId);
                pst.setInt(2, productId);
                pst.setInt(3, quantity);

                int rowsInserted = pst.executeUpdate();
                if (rowsInserted > 0) {
                    // Success response
                    resp.sendRedirect("cart.jsp?message=Item added to cart successfully");
                } else {
                    // Failure response
                    resp.sendRedirect("cart.jsp?error=Failed to add item to cart");
                }
            }
        } catch (NumberFormatException e) {
            // Handle invalid number format
            e.printStackTrace();
            resp.sendRedirect("cart.jsp?error=Invalid input data");
        } catch (SQLException | ClassNotFoundException e) {
            // Handle SQL or ClassNotFound exceptions
            e.printStackTrace();
            resp.sendRedirect("cart.jsp?error=An error occurred while adding item to cart");
        }
    }
}
