<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('images/login-new.png'); /* Replace with your image path */
            background-size: cover; /* Ensures the image covers the entire body */
            background-repeat: no-repeat; /* Prevents the image from repeating */
            background-position: center; /* Centers the image */
            background-attachment: fixed; /* Keeps the image fixed when scrolling */
        }

        .card {
            background: rgba(255, 255, 255, 0.3); /* Semi-transparent white background */
            backdrop-filter: blur(10px); /* Blur effect */
            border-radius: 15px; /* Smooth rounded corners */
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2); /* Subtle shadow for depth */
            border: 1px solid rgba(255, 255, 255, 0.2); /* Subtle border */
        }

        .btn-primary {
            background-color: #007bff; /* Button primary color */
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3; /* Darker shade on hover */
            border-color: #0056b3;
        }

        .btn-outline-primary {
            color: #007bff;
            border-color: #007bff;
        }

        .btn-outline-primary:hover {
            background-color: #007bff;
            color: white;
        }

    </style>
</head>
<body class="bg-light">

<div class="container vh-100 d-flex justify-content-center align-items-center">
    <div class="card shadow-lg" style="max-width: 400px; width: 100%;">
        <div class="card-body">
            <h3 class="text-center mb-4">Login</h3>
            <form action="login" method="POST">
                <!-- Username -->
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username" required>
                </div>

                <!-- Password -->
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
                </div>

                <!-- Role Selection -->
                <div class="mb-3">
                    <label class="form-label">Role</label>
                    <select class="form-select" name="role" required>
                        <option value="customer" selected>Customer</option>
                        <option value="administrator">Administrator</option>
                    </select>
                </div>

                <!-- Error Message -->
                <div id="errorMessage" class="text-danger mb-3" style="display: none;">
                    Invalid credentials. Please try again.
                </div>

                <!-- Submit Button -->
                <button type="submit" class="btn btn-primary w-100">Login</button>


            </form>

            <!-- Additional Links -->
            <div class="text-center mt-3">
                <a href="#" class="text-decoration-none">Forgot Password?</a>
            </div>

            <!-- Sign Up Section with Button -->
            <div class="text-center mt-4">
                <p>Don't have an account?</p>
                <a href="signUp.jsp" class="btn btn-outline-primary">Sign Up</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap Bundle JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Show error message if login fails
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.get('error') === 'true') {
        document.getElementById('errorMessage').style.display = 'block';
    }
</script>
</body>
</html>
