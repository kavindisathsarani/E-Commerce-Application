<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/26/2025
  Time: 7:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Orders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>

        body {
            background-image: url('images/pexels-shattha-pilabut-38930-135620.jpg'); /* Replace with your image path */
            background-size: cover; /* Ensures the image covers the entire body */
            background-repeat: no-repeat; /* Prevents the image from repeating */
            background-position: center; /* Centers the image */
            background-attachment: fixed; /* Keeps the image fixed when scrolling */
        }

        .status {
            font-weight: bold;
        }
        .status-confirmed {
            color: green;
        }
        .status-placed {
            color: orange;
        }
    </style>
</head>
<body>
<div class="container my-4">
    <h2 class="mb-4">Orders</h2>
    <div class="table-responsive">
        <table class="table table-bordered">
            <thead class="table-light">
            <tr>
                <th>Product</th>
                <th>Order ID</th>
                <th>Quantity</th>
                <th>Total Price</th>
                <th>Status</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>Harry Potter</td>
                <td>1</td>
                <td>1</td>
                <td>700.00</td>
                <td class="status status-confirmed">Order Placed</td>
            </tr>

            </tbody>
        </table>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
