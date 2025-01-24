package lk.ijse.ecommercejsp;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "saveProduct", value = "/saveProduct")

public class productSaveServlet extends HttpServlet {
    String DB_URL = "jdbc:mysql://localhost:3306/ecommerce_jsp";
    String DB_USER = "root";
    String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productName = req.getParameter("productName");
        String description = req.getParameter("description");
        double price = Double.parseDouble(req.getParameter("price"));
        int stockQuantity = Integer.parseInt(req.getParameter("stockQuantity"));
        int categoryId = Integer.parseInt(req.getParameter("categoryId"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
                    DB_URL,
                    DB_USER,
                    DB_PASSWORD
            );

            String sql = "INSERT INTO Products (productName, description, price, stockQuantity, categoryId) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setString(1, productName);
            pst.setString(2, description);
            pst.setDouble(3, price);
            pst.setInt(4, stockQuantity);
            pst.setInt(5, categoryId);

            int i = pst.executeUpdate();
            if (i > 0) {
                resp.sendRedirect("product.jsp?message=Product Saved Successfully");
                // success
            } else {
                resp.sendRedirect("product.jsp?error=Failed to Save Product");
                // fail
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            resp.sendRedirect("product.jsp?error=Failed to Save Product");
            // fail
        }
    }
}
