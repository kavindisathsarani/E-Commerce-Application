<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/25/2025
  Time: 10:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Browse Products</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .product-card {
            border: 1px solid #ddd;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .product-card img {
            max-height: 200px;
            object-fit: contain;
        }
        .product-title {
            font-size: 1.2rem;
            font-weight: bold;
        }
        .product-price {
            color: #e91e63;
            font-size: 1.1rem;
            font-weight: bold;
        }
        .add-to-cart-btn {
            background-color: #e91e63;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
        }
        .add-to-cart-btn:hover {
            background-color: #d81b60;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">E-Commerce</a>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
            <li class="nav-item">
                <a class="nav-link" href="cart.jsp">Shopping Cart</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="profile.jsp">Profile</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="logout.jsp">Logout</a>
            </li>
        </ul>
    </div>
</nav>

<!-- Search Section -->
<div class="container mt-5">
    <h2 class="mb-4">Browse Products</h2>

    <!-- Search Form -->
    <form class="d-flex mb-4" action="productBrowsing" method="GET">
        <input type="text" class="form-control" name="productName" placeholder="Search for products..." />
        <button type="submit" class="btn btn-primary ms-2">Search</button>
    </form>

    <!-- Products Display Section -->
    <div class="row">
        <!-- Example Product Card -->
        <div class="col-md-4">
            <div class="product-card">
                <img src="images/secret-door.jpg" alt="Product Image" class="card-img-top">
                <div class="product-info">
                    <h5 class="product-title">Secret Door</h5>
                    <p class="product-description">Fictional story book with a mysterious plot.</p>
                    <p class="product-price">$100.00</p>
                    <p>Stock: 30</p>
                    <button class="add-to-cart-btn" onclick="addToCart(1)">Add to Cart</button>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="product-card">
                <img src="images/FiveOnATreasureIsland.jpg" alt="Product Image" class="card-img-top">
                <div class="product-info">
                    <h5 class="product-title">Famous Five</h5>
                    <p class="product-description">A teenage novel with thrilling adventures.</p>
                    <p class="product-price">$300.00</p>
                    <p>Stock: 40</p>
                    <button class="add-to-cart-btn" onclick="addToCart(2)">Add to Cart</button>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="product-card">
                <img src="https://via.placeholder.com/200" alt="Product Image" class="card-img-top">
                <div class="product-info">
                    <h5 class="product-title">HTML</h5>
                    <p class="product-description">Comprehensive ICT book about HTML basics.</p>
                    <p class="product-price">$700.00</p>
                    <p>Stock: 50</p>
                    <button class="add-to-cart-btn" onclick="addToCart(3)">Add to Cart</button>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="product-card">
                <img src="https://via.placeholder.com/200" alt="Product Image" class="card-img-top">
                <div class="product-info">
                    <h5 class="product-title">Sun Dress</h5>
                    <p class="product-description">Elegant summer frock for sunny days.</p>
                    <p class="product-price">$2000.00</p>
                    <p>Stock: 50</p>
                    <button class="add-to-cart-btn" onclick="addToCart(4)">Add to Cart</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="bg-light text-center py-3 mt-5">
    <p>&copy; 2025 E-Commerce Inc.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function addToCart(productId) {
        alert("Product " + productId + " added to cart!");
        // You can implement an AJAX call here to add the product to the cart in the back-end.
    }
</script>

</body>
</html>
