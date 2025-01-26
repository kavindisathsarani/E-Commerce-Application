<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/26/2025
  Time: 8:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Place Order</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light py-5">

<div class="container">
    <h2 class="text-center mb-4">Place Your Order</h2>

    <!-- Product Details Section -->
    <div class="card mb-4">
        <div class="card-header">
            <h5 class="card-title">Product Details</h5>
        </div>
        <div class="card-body">
            <!-- Product Info (Dynamically populated) -->
            <div class="row">
                <div class="col-md-6">
                    <img src="images/harry-potter.jpg" alt="Product Image" class="img-fluid">
                </div>
                <div class="col-md-6">
                    <h4 id="productName">Harry Potter</h4>
                    <p id="productDescription">Description: The magic world.</p>
                    <p class="fw-bold">Price: $<span id="productPrice">700.00</span></p>
                    <p>Stock Quantity: <span id="productStock">50</span></p>

                    <!-- Quantity Input -->
                    <div class="d-flex align-items-center">
                        <label for="quantity" class="me-2">Quantity:</label>
                        <input type="number" id="quantity" name="quantity" min="1" value="1" class="form-control me-2" style="width: 80px;" required>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Order Summary Section -->
    <div class="card mb-4">
        <div class="card-header">
            <h5 class="card-title">Order Summary</h5>
        </div>
        <div class="card-body">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Product</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Price</th>
                    <th scope="col">Total</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td id="orderProductName">Harry Potter</td>
                    <td><input type="number" id="orderQuantity" name="quantity" value="1" min="1" class="form-control" style="width: 80px;"></td>
                    <td id="orderPrice">$700.00</td>
                    <td id="orderTotal">$700.00</td>
                </tr>
                </tbody>
            </table>

            <!-- Total Amount -->
            <div class="d-flex justify-content-between">
                <strong>Total Amount: $<span id="totalAmount">700.00</span></strong>
            </div>

            <!-- Place Order Form -->
            <form action="placeOrder" method="post">
                <input type="hidden" name="userId" value="1"> <!-- Example, you should dynamically populate this -->
                <input type="hidden" name="totalAmount" id="totalAmountInput" value="700.00">
                <button type="submit" class="btn btn-primary mt-3">Place Order</button>
            </form>
        </div>
    </div>

</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<!-- JavaScript to Update Order Summary Total -->

</body>
</html>
