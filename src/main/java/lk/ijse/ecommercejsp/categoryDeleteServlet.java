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

@WebServlet("/deleteCategory")
public class categoryDeleteServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ecommerce_jsp";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryId = request.getParameter("id");
        System.out.println("Category ID to delete: " + categoryId); // Debugging log

        if (categoryId == null || categoryId.isEmpty()) {
            System.err.println("Error: Category ID is null or empty.");
            response.sendRedirect("category.jsp?status=failure");
            return;
        }

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            connection.setAutoCommit(false); // Start transaction

            // Delete category
            String deleteQuery = "DELETE FROM Categories WHERE categoryId = ?";
            try (PreparedStatement deleteStmt = connection.prepareStatement(deleteQuery)) {
                deleteStmt.setInt(1, Integer.parseInt(categoryId));
                int rowsDeleted = deleteStmt.executeUpdate();
                if (rowsDeleted == 0) {
                    System.err.println("Error: No rows deleted.");
                    connection.rollback();
                    response.sendRedirect("category.jsp?status=failure");
                    return;
                }
            }

            // Reassign category IDs (if needed)
            String updateQuery = "UPDATE Categories SET categoryId = categoryId - 1 WHERE categoryId > ?";
            try (PreparedStatement updateStmt = connection.prepareStatement(updateQuery)) {
                updateStmt.setInt(1, Integer.parseInt(categoryId));
                updateStmt.executeUpdate();
            }

            // Reset AUTO_INCREMENT (optional)
            String resetAutoIncrementQuery = "ALTER TABLE Categories AUTO_INCREMENT = ?";
            try (PreparedStatement resetStmt = connection.prepareStatement(resetAutoIncrementQuery)) {
                resetStmt.setInt(1, getMaxCategoryId(connection) + 1);
                resetStmt.executeUpdate();
            }

            connection.commit(); // Commit transaction
            System.out.println("Category deleted successfully and IDs updated.");
            response.sendRedirect("category.jsp?status=success");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("category.jsp?status=failure");
        }
    }

    private int getMaxCategoryId(Connection connection) throws Exception {
        String query = "SELECT MAX(categoryId) AS maxId FROM Categories";
        try (PreparedStatement stmt = connection.prepareStatement(query);
             var rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt("maxId");
            }
        }
        return 0; // No categories in the table
    }
}
