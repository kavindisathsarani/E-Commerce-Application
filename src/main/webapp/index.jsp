<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<a href="signUp.jsp">Sign Up</a>
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
                        <option value="user" selected>Customer</option>
                        <option value="administrator">Administrator</option>
                    </select>
                </div>

                <!-- Error Message -->
                <div id="errorMessage" class="text-danger mb-3" style="display: none;">
                    Invalid credentials. Please try again.
                </div>

                <!-- Submit Button -->
                <button type="submit" class="btn btn-primary w-100">Login></button>


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
