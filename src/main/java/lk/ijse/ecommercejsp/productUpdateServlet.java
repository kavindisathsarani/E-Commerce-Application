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

@WebServlet("/editProduct")
public class productUpdateServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ecommerce_jsp";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve product details from the request
        String productId = request.getParameter("id");
        String productName = request.getParameter("name");
        String description = request.getParameter("description");
        String price = request.getParameter("price");
        String stockQuantity = request.getParameter("stockQuantity");
        String categoryId = request.getParameter("categoryId");

        // Validate input (you can add more validations as needed)
        if (productId == null || productId.isEmpty() ||
                productName == null || productName.isEmpty() ||
                price == null || price.isEmpty() ||
                stockQuantity == null || stockQuantity.isEmpty() ||
                categoryId == null || categoryId.isEmpty()) {
            response.sendRedirect("product.jsp?status=invalidInput");
            return;
        }

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String updateQuery = "UPDATE Products " +
                    "SET productName = ?, description = ?, price = ?, stockQuantity = ?, categoryId = ? " +
                    "WHERE productId = ?";


            try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
                // Set parameters
                preparedStatement.setString(1, productName);
                preparedStatement.setString(2, description);
                preparedStatement.setDouble(3, Double.parseDouble(price));
                preparedStatement.setInt(4, Integer.parseInt(stockQuantity));
                preparedStatement.setInt(5, Integer.parseInt(categoryId));
                preparedStatement.setInt(6, Integer.parseInt(productId));

                int rowsUpdated = preparedStatement.executeUpdate();

                if (rowsUpdated > 0) {
                    response.sendRedirect("product.jsp?status=success");
                } else {
                    response.sendRedirect("product.jsp?status=failure");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("product.jsp?status=error");
        }
    }
}
