<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/19/2025
  Time: 2:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSP - Hello World</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <%--    <link rel="stylesheet" href="/CSS/index.css">--%>

    <style>
        /* Modern CSS styles */
        :root {
            --primary-color: #2563eb;
            --secondary-color: #1e40af;
            --text-color: #1f2937;
            --light-bg: #f3f4f6;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            color: var(--text-color);
            line-height: 1.6;
        }

        /* Navbar styling */
        .navbar {
            background-color: white;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.04);
            padding: 1rem 0;
        }

        .navbar-brand {
            font-weight: 700;
            font-size: 1.5rem;
            color: var(--primary-color) !important;
        }

        .nav-link {
            font-weight: 500;
            color: var(--text-color) !important;
            margin: 0 0.5rem;
            transition: color 0.2s ease;
        }

        .nav-link:hover {
            color: var(--primary-color) !important;
        }

        /* Hero section */
        .hero {
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
                url('https://images.unsplash.com/photo-1441986300917-64674bd600d8?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80');

            background-size: cover;
            background-position: center;
            padding: 8rem 0;
            margin-bottom: 4rem;
            color: white;
        }

        .hero h1 {
            font-size: 3.5rem;
            font-weight: 800;
            margin-bottom: 1.5rem;
            line-height: 1.2;
        }

        .hero p {
            font-size: 1.25rem;
            opacity: 0.9;
            max-width: 600px;
            margin-bottom: 2rem;
        }

        /* Buttons */
        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            padding: 0.75rem 1.5rem;
            font-weight: 500;
            border-radius: 0.5rem;
        }

        .btn-primary:hover {
            background-color: var(--secondary-color);
            border-color: var(--secondary-color);
            transform: translateY(-1px);
        }

        /* Featured Categories */
        .category-card {
            border: none;
            border-radius: 1rem;
            overflow: hidden;
            transition: transform 0.2s ease;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        }

        .category-card:hover {
            transform: translateY(-5px);
        }

        .category-card img {
            height: 200px;
            object-fit: cover;
        }

        .category-card .card-body {
            padding: 1.5rem;
        }

        .category-card .card-title {
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        /* Features section */
        .features {
            background-color: var(--light-bg);
            padding: 4rem 0;
        }

        .feature-icon {
            font-size: 2rem;
            color: var(--primary-color);
            margin-bottom: 1rem;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .hero {
                padding: 6rem 0;
            }

            .hero h1 {
                font-size: 2.5rem;
            }

            .category-card {
                margin-bottom: 1.5rem;
            }
        }
    </style>


</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light">
    <div class="container">
        <a class="navbar-brand" href="#">
            <i class="bi bi-shop me-2"></i>
            E-Commerce
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="customer-product-browsing.jsp">
                        <i class="bi bi-grid me-1"></i>Products
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="cart.jsp">
                        <i class="bi bi-cart me-1"></i>Cart
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="dashboardCustomer.jsp">
                        <i class="bi bi-speedometer2 me-1"></i>Dashboard
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">
                        <i class="bi bi-person me-1"></i>Logout
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="profile.jsp">
                        <i class="bi bi-person me-1"></i>profile
                    </a>
                </li>

            </ul>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero text-center">

    <div class="container">
        <h1>Discover Amazing Products</h1>
        <p>Explore our curated collection of premium products and enjoy a seamless shopping experience with exclusive deals and offers.</p>
        <a href="product-list.jsp" class="btn btn-primary btn-lg">
            Start Shopping
            <i class="bi bi-arrow-right ms-2"></i>
        </a>
    </div>
</section>



<!-- Featured Categories -->
<section class="container mb-5">
    <h2 class="text-center mb-4 fw-bold">Featured Categories</h2>
    <div class="row">
        <div class="col-md-4">
            <div class="category-card card">
                <img src="https://images.unsplash.com/photo-1498049794561-7780e7231661?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80" class="card-img-top" alt="Electronics">
                <div class="card-body">
                    <h5 class="card-title">Electronics</h5>
                    <p class="card-text">Discover the latest gadgets and tech accessories.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="category-card card">
                <img src="https://images.unsplash.com/photo-1445205170230-053b83016050?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80" class="card-img-top" alt="Fashion">
                <div class="card-body">
                    <h5 class="card-title">Fashion</h5>
                    <p class="card-text">Trendy clothing and accessories for every style.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="category-card card">
                <img src="https://images.unsplash.com/photo-1484101403633-562f891dc89a?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80" class="card-img-top" alt="Home & Living">
                <div class="card-body">
                    <h5 class="card-title">Home & Living</h5>
                    <p class="card-text">Beautiful decor and essentials for your home.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Features Section -->
<section class="features">
    <div class="container">
        <div class="row text-center">
            <div class="col-md-4 mb-4">
                <div class="feature-icon">
                    <i class="bi bi-truck"></i>
                </div>
                <h4>Free Shipping</h4>
                <p class="text-muted">On orders over $50</p>
            </div>
            <div class="col-md-4 mb-4">
                <div class="feature-icon">
                    <i class="bi bi-shield-check"></i>
                </div>
                <h4>Secure Payments</h4>
                <p class="text-muted">100% secure transactions</p>
            </div>
            <div class="col-md-4 mb-4">
                <div class="feature-icon">
                    <i class="bi bi-headset"></i>
                </div>
                <h4>24/7 Support</h4>
                <p class="text-muted">Dedicated customer service</p>
            </div>
        </div>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
