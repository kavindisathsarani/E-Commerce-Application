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
import java.sql.SQLException;

@WebServlet(name = "CustomerSaveServlet", value = "/customer-save")
public class CustomerSaveServlet extends HttpServlet {
    String DB_URL="jdbc:mysql://localhost:3306/ecommerce_jsp";
    String DB_USER="root";
    String DB_PASSWORD="Ijse@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name=req.getParameter("name");
        String email=req.getParameter("email");
        String address=req.getParameter("address");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection= DriverManager.getConnection(
                    DB_URL,
                    DB_USER,
                    DB_PASSWORD
            );

            String sql="INSERT INTO customer(name,address,email) VALUES (?,?,?)";
            PreparedStatement pst=connection.prepareStatement(sql);
            pst.setString(1,name);
            pst.setString(2,address);
            pst.setString(3,email);

            int i= pst.executeUpdate();
            if (i >0) {
                resp.sendRedirect("customer-save.jsp?message=Customer Saved Successfully");
                //success
            }else {
                resp.sendRedirect("customer-save.jsp?error=Fail to Save Customer");
                //fail
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            resp.sendRedirect("customer-save.jsp?error=Fail to Save Customer");

            //fail

        }
    }
}
