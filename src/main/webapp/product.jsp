<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/24/2025
  Time: 9:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Management</title>
    <!-- Add Bootstrap CSS link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('images/pexels-shattha-pilabut-38930-135620.jpg'); /* Replace with your image path */
            background-size: cover; /* Ensures the image covers the entire body */
            background-repeat: no-repeat; /* Prevents the image from repeating */
            background-position: center; /* Centers the image */
            background-attachment: fixed; /* Keeps the image fixed when scrolling */
        }

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }

        header {
            /*background-color: #007BFF;*/
            /*color: #fff;*/
            padding: 15px 20px;
            text-align: center;

        }

        .container {
            width: 90%;
            margin: 20px auto;
        }

        .action-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .action-bar button {
            background-color: #007BFF;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
        }

        .action-bar button:hover {
            background-color:#007BFF;
        }

        .product-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .product-card {
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: calc(33.333% - 20px);
            padding: 15px;
            box-sizing: border-box;
            text-align: center;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }

        .product-name {
            font-size: 1.25em;
            font-weight: bold;
            margin: 10px 0;
        }

        .product-description {
            font-size: 0.9em;
            color: #666;
            margin: 10px 0;
        }

        .product-price {
            font-size: 1.1em;
            font-weight: bold;
            color: #007BFF;
            margin: 10px 0;
        }

        .product-stock {
            font-size: 0.9em;
            color: #28A745;
            margin: 10px 0;
        }

        .product-category {
            font-size: 0.9em;
            color: #555;
            margin: 10px 0;
        }

        .product-actions {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 15px;
        }

        .product-actions button {
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 0.9em;
        }

        .edit-button {
            background-color: #FFC107;
            color: #fff;
        }

        .edit-button:hover {
            background-color: #E0A800;
        }

        .delete-button {
            background-color: #DC3545;
            color: #fff;
        }

        .delete-button:hover {
            background-color: #C82333;
        }

        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }

        .modal-content {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            width: 400px;
            max-width: 90%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .modal-content h2 {
            margin-top: 0;
        }

        .modal-content form {
            display: flex;
            flex-direction: column;
        }

        .modal-content label {
            margin-top: 10px;
            font-weight: bold;
        }

        .modal-content input, .modal-content textarea {
            margin-top: 5px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1em;
        }

        .modal-content button {
            margin-top: 15px;
            background-color: #007BFF;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .modal-content button:hover {
            background-color: #0056b3;
        }

        .modal-close {
            position: absolute;
            top: 10px;
            right: 10px;
            background: none;
            border: none;
            font-size: 1.5em;
            cursor: pointer;
        }

        .table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            text-align: left;
        }

        .table th,
        .table td {
            padding: 12px;
            border: 1px solid #ddd;
        }

        .table th {
            background-color: #007BFF;
            color: #fff;
            font-weight: bold;
        }

        .table td {
            background-color: #fff;
            color: #555;
        }

        .table tr:nth-child(even) td {
            background-color: #f9f9f9;
        }

        .table tr:hover td {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>
<header>
    <h1>Product Management</h1>
</header>
<div class="container">
    <div class="action-bar">
        <button id="addProductBtn" class="btn btn-success">Add Product</button>
    </div>

</div>

<div class="modal" id="productModal">
    <div class="modal-content">
        <button class="modal-close" id="closeModal">&times;</button>
        <h2>Add / Edit Product</h2>
        <form action="saveProduct" method="post">
            <label for="productName">Product Name:</label>
            <input type="text" id="productName" name="productName" required>

            <label for="description">Description:</label>
            <textarea id="description" name="description" required></textarea>

            <label for="price">Price:</label>
            <input type="number" id="price" name="price" step="0.01" required>

            <label for="stockQuantity">Stock Quantity:</label>
            <input type="number" id="stockQuantity" name="stockQuantity" required>

            <label for="categoryId">Category ID:</label>
            <input type="number" id="categoryId" name="categoryId" required>

            <button type="submit" class="btn btn-primary">Save Product</button>
        </form>
    </div>
</div>

<!-- Product Table -->
<div class="card">
    <div class="card-body">
        <h5 class="card-title">Existing Products</h5>
        <table class="table table-bordered">
            <thead class="table-dark">
            <tr>
                <th>#</th>
                <th>Product Name</th>
                <th>Description</th>
                <th>Price</th>
                <th>Stock Quantity</th>
                <th>Category ID</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <%-- Loop through products retrieved from the database --%>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection = DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/ecommerce_jsp", "root", "Ijse@123");

                    String sql = "SELECT * FROM Products";  // Adjusted to match the table name "Products"
                    PreparedStatement pst = connection.prepareStatement(sql);
                    ResultSet rs = pst.executeQuery();

                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("productId") %></td>  <!-- Adjusted column name -->
                <td><%= rs.getString("productName") %></td>  <!-- Adjusted column name -->
                <td><%= rs.getString("description") %></td>  <!-- Adjusted column name -->
                <td>$<%= rs.getDouble("price") %></td>
                <td><%= rs.getInt("stockQuantity") %></td>  <!-- Adjusted column name -->
                <td><%= rs.getInt("categoryId") %></td>  <!-- Adjusted column name -->
                <td>
                    <a href="editProduct?id=<%= rs.getInt("productId") %>" class="btn btn-warning btn-sm">Edit</a>
                    <a href="deleteProduct?id=<%= rs.getInt("productId") %>" class="btn btn-danger btn-sm">Delete</a>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    out.print("Error: " + e.getMessage());
                }
            %>
            </tbody>
        </table>
    </div>
</div>

<!-- Add Bootstrap JS and Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
<script>
    // Show modal when Add Product button is clicked
    document.getElementById('addProductBtn').addEventListener('click', function() {
        document.getElementById('productModal').style.display = 'flex';
    });

    // Close modal when Close button is clicked
    document.getElementById('closeModal').addEventListener('click', function() {
        document.getElementById('productModal').style.display = 'none';
    });

    // Close modal when clicking outside the modal
    window.addEventListener('click', function(e) {
        if (e.target === document.getElementById('productModal')) {
            document.getElementById('productModal').style.display = 'none';
        }
    });
</script>
</body>
</html>