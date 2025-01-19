<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/19/2025
  Time: 7:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Categories Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-image: url('images/pexels-shattha-pilabut-38930-135620.jpg'); /* Replace with your image path */
            background-size: cover; /* Ensures the image covers the entire body */
            background-repeat: no-repeat; /* Prevents the image from repeating */
            background-position: center; /* Centers the image */
            background-attachment: fixed; /* Keeps the image fixed when scrolling */
        }
    </style>

</head>
<body class="bg-light">
<div class="container mt-5">
    <h1 class="text-center mb-4">Categories Management</h1>

    <!-- Add Category Form -->
    <div class="card mb-4">
        <div class="card-body">
            <h5 class="card-title">Add New Category</h5>
            <form action="addCategory" method="POST">
                <div class="mb-3">
                    <label for="categoryName" class="form-label">Category Name</label>
                    <input type="text" class="form-control" id="categoryName" name="categoryName" placeholder="Enter category name" required>
                </div>
                <button type="submit" class="btn btn-primary">Add Category</button>
            </form>
        </div>
    </div>

    <!-- Categories List -->
    <div class="card">
        <div class="card-body">
            <h5 class="card-title">Existing Categories</h5>
            <table class="table table-bordered">
                <thead class="table-dark">
                <tr>
                    <th>#</th>
                    <th>Category Name</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <%-- Example Row (Replace this with dynamic rows using JSP) --%>

                <%-- Loop through categories retrieved from the database --%>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection connection = DriverManager.getConnection(
                                "jdbc:mysql://localhost:3306/ecommerce_jsp", "root", "Ijse@123");

                        String sql = "SELECT * FROM Categories";
                        PreparedStatement pst = connection.prepareStatement(sql);
                        ResultSet rs = pst.executeQuery();

                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("categoryId") %></td>
                    <td><%= rs.getString("categoryName") %></td>
                    <td>
                        <a href="editCategory?id=<%= rs.getInt("categoryId") %>" class="btn btn-warning btn-sm">Edit</a>
                        <a href="deleteCategory?id=<%= rs.getInt("categoryId") %>" class="btn btn-danger btn-sm">Delete</a>
                    </td>
                </tr>
                <%
                        }
                        connection.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Bootstrap Bundle JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
