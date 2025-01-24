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

@WebServlet("/deleteProduct")

public class productDeleteServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ecommerce_jsp";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("id");
        System.out.println("Product ID to delete: " + productId); // Debugging log

        if (productId == null || productId.isEmpty()) {
            System.err.println("Error: Product ID is null or empty.");
            response.sendRedirect("product.jsp?status=failure");
            return;
        }

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            connection.setAutoCommit(false); // Start transaction

            // Delete product
            String deleteQuery = "DELETE FROM Products WHERE productId = ?";
            try (PreparedStatement deleteStmt = connection.prepareStatement(deleteQuery)) {
                deleteStmt.setInt(1, Integer.parseInt(productId));
                int rowsDeleted = deleteStmt.executeUpdate();
                if (rowsDeleted == 0) {
                    System.err.println("Error: No rows deleted.");
                    connection.rollback();
                    response.sendRedirect("product.jsp?status=failure");
                    return;
                }
            }

            // Reassign product IDs
            String updateQuery = "UPDATE Products SET productId = productId - 1 WHERE productId > ?";
            try (PreparedStatement updateStmt = connection.prepareStatement(updateQuery)) {
                updateStmt.setInt(1, Integer.parseInt(productId));
                updateStmt.executeUpdate();
            }

            // Reset AUTO_INCREMENT
            String resetAutoIncrementQuery = "ALTER TABLE Products AUTO_INCREMENT = ?";
            try (PreparedStatement resetStmt = connection.prepareStatement(resetAutoIncrementQuery)) {
                resetStmt.setInt(1, getMaxProductId(connection) + 1);
                resetStmt.executeUpdate();
            }

            connection.commit(); // Commit transaction
            System.out.println("Product deleted successfully and IDs updated.");
            response.sendRedirect("product.jsp?status=success");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("product.jsp?status=failure");
        }
    }

    private int getMaxProductId(Connection connection) throws Exception {
        String query = "SELECT MAX(productId) AS maxId FROM Products";
        try (PreparedStatement stmt = connection.prepareStatement(query);
             var rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt("maxId");
            }
        }
        return 0; // No products in the table
    }
}
