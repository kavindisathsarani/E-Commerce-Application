package lk.ijse.ecommercejsp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/productBrowsing")
public class productBrowsingServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ecommerce_jsp";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch categories
        List<Category> categories = fetchCategories();
        request.setAttribute("categories", categories);

        // Fetch products based on search and category
        String productName = request.getParameter("productName");
        String sortBy = request.getParameter("sortBy");
        String categoryId = request.getParameter("categoryId");

        List<Products> products = fetchProducts(productName, sortBy, categoryId);
        request.setAttribute("products", products);

        // Forward to the JSP page
        request.getRequestDispatcher("customer-product-browsing.jsp").forward(request, response);
    }

    private List<Category> fetchCategories() {
        List<Category> categories = new ArrayList<>();
        String query = "SELECT * FROM Categories";
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Category category = new Category();
                category.setCategoryId(rs.getInt("categoryId"));
                category.setCategoryName(rs.getString("categoryName"));
                categories.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }

    private List<Products> fetchProducts(String productName, String sortBy, String categoryId) {
        List<Products> products = new ArrayList<>();
        String query = "SELECT * FROM Products WHERE productName LIKE ?";
        if (categoryId != null && !categoryId.isEmpty()) {
            query += " AND categoryId = ?";
        }
        if ("priceAsc".equals(sortBy)) {
            query += " ORDER BY price ASC";
        } else if ("priceDesc".equals(sortBy)) {
            query += " ORDER BY price DESC";
        }

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, "%" + productName + "%");
            if (categoryId != null && !categoryId.isEmpty()) {
                stmt.setInt(2, Integer.parseInt(categoryId));
            }

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Products product = new Products();
                    product.setProductId(rs.getInt("productId"));
                    product.setProductName(rs.getString("productName"));
                    product.setDescription(rs.getString("description"));
                    product.setPrice(rs.getDouble("price"));
                    product.setStockQuantity(rs.getInt("stockQuantity"));
                    product.setCategoryId(rs.getInt("categoryId"));
                    products.add(product);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
}
