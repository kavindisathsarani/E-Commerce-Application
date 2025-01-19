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

@WebServlet(name = "addCategory", value = "/addCategory")

public class categorySaveServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/ecommerce_jsp";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve the category name from the request
        String categoryName = req.getParameter("categoryName").trim();

        // SQL query to insert a new category
        String sql = "INSERT INTO Categories (categoryName) VALUES (?)";

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pst = connection.prepareStatement(sql)) {

            // Set the parameter for the query
            pst.setString(1, categoryName);

            // Execute the query
            int rowsAffected = pst.executeUpdate();

            // Redirect based on the success of the operation
            if (rowsAffected > 0) {
                // Redirect to the categories page with a success message
                resp.sendRedirect("category.jsp?success=true");
            } else {
                // Redirect to the categories page with an error message
                resp.sendRedirect("category.jsp?error=true");
            }

        } catch (Exception e) {
            e.printStackTrace();
            // Redirect to the categories page with an error message in case of exception
            resp.sendRedirect("category.jsp?error=true");
        }
    }
}
