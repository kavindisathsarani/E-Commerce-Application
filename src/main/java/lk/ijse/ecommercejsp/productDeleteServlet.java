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

        if (productId == null || productId.isEmpty()) {
            response.sendRedirect("productManagement.jsp?status=failure");
            return;
        }

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String deleteQuery = "DELETE FROM Products WHERE productId = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery)) {
                preparedStatement.setInt(1, Integer.parseInt(productId));
                int rowsDeleted = preparedStatement.executeUpdate();

                if (rowsDeleted > 0) {
                    response.sendRedirect("product.jsp?status=success");
                    return;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("product.jsp?status=failure");
    }
}
