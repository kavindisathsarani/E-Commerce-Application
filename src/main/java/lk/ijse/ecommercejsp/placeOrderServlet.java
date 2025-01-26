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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "placeOrder", value = "/placeOrder")

public class placeOrderServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ecommerce_jsp";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId = Integer.parseInt(req.getParameter("userId"));
        double totalAmount = Double.parseDouble(req.getParameter("totalAmount"));

        // Create the order
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            // Insert into Orders table with orderDate and default status
            String insertOrderSQL = "INSERT INTO Orders (userId, orderDate, status, totalAmount) VALUES (?, NOW(), 'pending', ?)";
            try (PreparedStatement pst = connection.prepareStatement(insertOrderSQL, PreparedStatement.RETURN_GENERATED_KEYS)) {
                pst.setInt(1, userId);
                pst.setDouble(2, totalAmount);
                int rowsInserted = pst.executeUpdate();

                if (rowsInserted > 0) {
                    // Get the generated orderId
                    ResultSet generatedKeys = pst.getGeneratedKeys();
                    if (generatedKeys.next()) {
                        int orderId = generatedKeys.getInt(1);

                        // Now, insert each item in the cart into OrderDetails table
                        String selectCartItemsSQL = "SELECT productId, quantity FROM Cart WHERE userId = ?";
                        try (PreparedStatement cartPst = connection.prepareStatement(selectCartItemsSQL)) {
                            cartPst.setInt(1, userId);
                            ResultSet cartItems = cartPst.executeQuery();

                            while (cartItems.next()) {
                                int productId = cartItems.getInt("productId");
                                int quantity = cartItems.getInt("quantity");

                                // Fetch the price from the Products table based on productId
                                String selectProductPriceSQL = "SELECT price FROM Products WHERE productId = ?";
                                try (PreparedStatement productPst = connection.prepareStatement(selectProductPriceSQL)) {
                                    productPst.setInt(1, productId);
                                    ResultSet productResult = productPst.executeQuery();

                                    if (productResult.next()) {
                                        double price = productResult.getDouble("price");

                                        // Insert into OrderDetails table
                                        String insertOrderDetailsSQL = "INSERT INTO OrderDetails (orderId, productId, quantity, price) VALUES (?, ?, ?, ?)";
                                        try (PreparedStatement detailsPst = connection.prepareStatement(insertOrderDetailsSQL)) {
                                            detailsPst.setInt(1, orderId);
                                            detailsPst.setInt(2, productId);
                                            detailsPst.setInt(3, quantity);
                                            detailsPst.setDouble(4, price);
                                            detailsPst.executeUpdate();
                                        }
                                    }
                                }
                            }
                        }

                        // Clear the cart after placing the order
                        String deleteCartSQL = "DELETE FROM Cart WHERE userId = ?";
                        try (PreparedStatement deletePst = connection.prepareStatement(deleteCartSQL)) {
                            deletePst.setInt(1, userId);
                            deletePst.executeUpdate();
                        }

                        // Redirect to confirmation page
                        resp.sendRedirect("placeOrder.jsp?orderId=" + orderId);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("placeOrder.jsp?error=Error placing order");
        }
    }
}
