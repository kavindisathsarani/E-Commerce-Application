<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/26/2025
  Time: 7:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add to Cart</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .card {
            border-radius: 10px;
        }
        .product-img {
            max-width: 100%;
            border-radius: 10px;
        }
        .alert-custom {
            font-size: 1rem;
            margin-top: 20px;
        }
    </style>
</head>
<body class="bg-light py-5">
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-lg">
                <!-- Product Details Section -->
                <div class="card-body">
                    <div class="text-center">
                        <!-- Product Image -->
                        <img src="images/secret-door.jpg" alt="Product Image" class="product-img mb-3">
                    </div>
                    <h5 class="card-title text-center">Sample Product</h5>
                    <p class="card-text text-center">Description: This is a sample product description. It’s high-quality and affordable!</p>
                    <p class="card-text text-center fw-bold">Price: $<span id="productPrice">100.00</span></p>

                    <!-- Add to Cart Form -->
                    <form action="addToCart" method="post" class="d-flex justify-content-center">
                        <!-- Hidden input for Product ID -->
                        <input type="hidden" name="productId" value="1">

                        <!-- Quantity Input -->
                        <div class="d-flex align-items-center me-3">
                            <label for="quantity" class="me-2">Quantity:</label>
                            <input type="number" id="quantity" name="quantity" min="1" value="1" class="form-control" style="width: 80px;" required>
                        </div>

                        <!-- Add to Cart Button -->
                        <button type="submit" class="btn btn-primary">Add to Cart</button>
                    </form>

                    <!-- Alert Message (hidden initially) -->
                    <div class="alert alert-success alert-custom mt-3" role="alert" id="successAlert" style="display:none;">
                        Item added to cart successfully!
                    </div>
                    <div class="alert alert-danger alert-custom mt-3" role="alert" id="errorAlert" style="display:none;">
                        Failed to add item to cart. Please try again.
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Include Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<!-- JavaScript to show alert -->
<script>
    document.querySelector('form').addEventListener('submit', function (event) {
        event.preventDefault(); // Prevent form submission for demonstration

        // Simulating successful form submission
        let success = Math.random() > 0.5; // Randomly simulate success or failure

        if (success) {
            document.getElementById('successAlert').style.display = 'block';
            document.getElementById('errorAlert').style.display = 'none';
        } else {
            document.getElementById('errorAlert').style.display = 'block';
            document.getElementById('successAlert').style.display = 'none';
        }
    });
</script>
</body>
</html>
