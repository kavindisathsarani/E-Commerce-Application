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


@WebServlet(name = "editCategories", value = "/editCategory")

public class categoryEditServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ecommerce_jsp";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryId = request.getParameter("id");
        System.out.println("Entered doGet method with categoryId: " + categoryId); // Debug print

        if (categoryId == null || categoryId.isEmpty()) {
            System.out.println("Error: No category ID provided.");
            response.sendRedirect("category.jsp?status=failure");
            return;
        }

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            System.out.println("Connected to the database"); // Debug print
            String sql = "SELECT * FROM Categories WHERE categoryId = ?";
            try (PreparedStatement pst = connection.prepareStatement(sql)) {
                pst.setInt(1, Integer.parseInt(categoryId));
                ResultSet rs = pst.executeQuery();

                if (rs.next()) {
                    System.out.println("Category found: " + rs.getString("categoryName")); // Debug print
                    request.setAttribute("categoryId", rs.getInt("categoryId"));
                    request.setAttribute("categoryName", rs.getString("categoryName"));
                    request.getRequestDispatcher("category-edit.jsp").forward(request, response);
                } else {
                    System.out.println("Error: Category not found for ID " + categoryId); // Debug print
                    response.sendRedirect("category.jsp?status=failure");
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // This will print any exceptions to the console
            response.sendRedirect("category.jsp?status=failure");
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryId = request.getParameter("categoryId");
        String categoryName = request.getParameter("categoryName");

        if (categoryId == null || categoryId.isEmpty() || categoryName == null || categoryName.isEmpty()) {
            response.sendRedirect("category.jsp?status=failure");
            return;
        }

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "UPDATE Categories SET categoryName = ? WHERE categoryId = ?";
            try (PreparedStatement pst = connection.prepareStatement(sql)) {
                pst.setString(1, categoryName);
                pst.setInt(2, Integer.parseInt(categoryId));
                int rowsUpdated = pst.executeUpdate();

                if (rowsUpdated > 0) {
                    response.sendRedirect("category.jsp?status=success");
                } else {
                    response.sendRedirect("category.jsp?status=failure");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("category.jsp?status=failure");
        }
    }

}
