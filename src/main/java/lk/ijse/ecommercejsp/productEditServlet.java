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

@WebServlet(name = "editProduct", value = "/editProduct")

public class productEditServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ecommerce_jsp";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("id");
        System.out.println("Entered doGet method with productId: " + productId); // Debug print

        if (productId == null || productId.isEmpty()) {
            System.out.println("Error: No product ID provided.");
            response.sendRedirect("product.jsp?status=failure");
            return;
        }

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            System.out.println("Connected to the database"); // Debug print
            String sql = "SELECT * FROM Products WHERE productId = ?";
            try (PreparedStatement pst = connection.prepareStatement(sql)) {
                pst.setInt(1, Integer.parseInt(productId));
                ResultSet rs = pst.executeQuery();

                if (rs.next()) {
                    System.out.println("Product found: " + rs.getString("productName")); // Debug print
                    request.setAttribute("productId", rs.getInt("productId"));
                    request.setAttribute("productName", rs.getString("productName"));
                    request.setAttribute("description", rs.getString("description"));
                    request.setAttribute("price", rs.getBigDecimal("price"));
                    request.setAttribute("stockQuantity", rs.getInt("stockQuantity"));
                    request.setAttribute("categoryId", rs.getInt("categoryId"));
                    request.getRequestDispatcher("product-edit.jsp").forward(request, response);
                } else {
                    System.out.println("Error: Product not found for ID " + productId); // Debug print
                    response.sendRedirect("product.jsp?status=failure");
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Print exceptions to the console
            response.sendRedirect("product.jsp?status=failure");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("productId");
        String productName = request.getParameter("productName");
        String description = request.getParameter("description");
        String price = request.getParameter("price");
        String stockQuantity = request.getParameter("stockQuantity");
        String categoryId = request.getParameter("categoryId");

        if (productId == null || productId.isEmpty() || productName == null || productName.isEmpty() ||
                price == null || price.isEmpty() || stockQuantity == null || stockQuantity.isEmpty()) {
            response.sendRedirect("product.jsp?status=failure");
            return;
        }

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "UPDATE Products SET productName = ?, description = ?, price = ?, stockQuantity = ?, categoryId = ? WHERE productId = ?";
            try (PreparedStatement pst = connection.prepareStatement(sql)) {
                pst.setString(1, productName);
                pst.setString(2, description);
                pst.setBigDecimal(3, new java.math.BigDecimal(price));
                pst.setInt(4, Integer.parseInt(stockQuantity));
                if (categoryId == null || categoryId.isEmpty()) {
                    pst.setNull(5, java.sql.Types.INTEGER);
                } else {
                    pst.setInt(5, Integer.parseInt(categoryId));
                }
                pst.setInt(6, Integer.parseInt(productId));

                int rowsUpdated = pst.executeUpdate();

                if (rowsUpdated > 0) {
                    response.sendRedirect("product.jsp?status=success");
                } else {
                    response.sendRedirect("product.jsp?status=failure");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("product.jsp?status=failure");
        }
    }
}
