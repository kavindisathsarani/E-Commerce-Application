<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/19/2025
  Time: 1:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Modern E-Commerce</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">

    <style lang="scss">
        :root {
            --primary-color: #2563eb;
            --secondary-color: #1e40af;
            --background-color: #f3f4f6;
            --error-color: #ef4444;
            --success-color: #10b981;
        }

        body {
            min-height: 100vh;

            background-image: url('images/pexels-naimbic-2610756.jpg'); /* Replace with your image path */
            background-size: cover; /* Ensures the image covers the entire body */
            background-repeat: no-repeat; /* Prevents the image from repeating */
            background-position: center; /* Centers the image */
            background-attachment: fixed; /* Keeps the image fixed when scrolling */
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Inter', -apple-system, sans-serif;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.2); /* Semi-transparent background */
            border-radius: 1rem; /* Rounded corners */
            padding: 2.5rem; /* Inner padding */
            width: 100%; /* Full width */
            max-width: 450px; /* Limit max width */
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04); /* Subtle shadow */
            backdrop-filter: blur(15px); /* Blurs the background behind the container */
            border: 1px solid rgba(255, 255, 255, 0.25); /* Subtle border for depth */
        }

        .login-header {
            text-align: center;
            margin-bottom: 2rem;

            .logo {
                font-size: 2rem;
                color: var(--primary-color);
                margin-bottom: 1rem;
            }

            h1 {
                font-size: 1.5rem;
                font-weight: 600;
                color: #1f2937;
                margin-bottom: 0.5rem;
            }

            p {
                color: #6b7280;
                font-size: 0.875rem;
            }
        }

        .form-floating {
            margin-bottom: 1rem;

            .form-control {
                border-radius: 0.5rem;
                border: 1px solid #e5e7eb;
                padding: 1rem 0.75rem;
                height: calc(3.5rem + 2px);

                &:focus {
                    border-color: var(--primary-color);
                    box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.1);
                }
            }

            label {
                padding: 1rem 0.75rem;
            }
        }

        .btn-login {
            background-color: var(--primary-color);
            border: none;
            width: 100%;
            padding: 0.875rem;
            border-radius: 0.5rem;
            color: white;
            font-weight: 500;
            font-size: 1rem;
            transition: all 0.2s;

            &:hover {
                background-color: var(--secondary-color);
                transform: translateY(-1px);
            }

            &:active {
                transform: translateY(0);
            }
        }

        .role-selector {
            margin-bottom: 1rem;

            .form-check {
                padding: 1rem;
                border: 1px solid #e5e7eb;
                border-radius: 0.5rem;
                margin-bottom: 0.5rem;
                cursor: pointer;
                transition: all 0.2s;

                &:hover {
                    background-color: #f9fafb;
                }

                &.active {
                    border-color: var(--primary-color);
                    background-color: #eff6ff;
                }
            }

            .form-check-input:checked {
                background-color: var(--primary-color);
                border-color: var(--primary-color);
            }
        }

        .error-message {
            color: var(--error-color);
            font-size: 0.875rem;
            margin-top: 0.5rem;
            display: none;

            &.show {
                display: block;
            }
        }

        @media (max-width: 640px) {
            .login-container {
                margin: 1rem;
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
<div class="login-container">
    <div class="login-header">
        <div class="logo">
            <i class="bi bi-shop"></i>
        </div>
        <h1>Welcome</h1>
        <p>Please sign up to continue</p>
    </div>

    <form action="signup-save" method="POST" id="loginForm">
       <%-- <div class="form-floating">
            <input type="text" class="form-control" id="userid" name="userid" placeholder="User ID" required>
            <label for="userid">User ID</label>
        </div>--%>

        <div class="form-floating">
            <input type="text" class="form-control" id="username" name="username" placeholder="Username" required>
            <label for="username">Username</label>
        </div>

        <div class="form-floating">
            <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
            <label for="password">Password</label>
        </div>

        <div class="role-selector">
            <div class="form-check">
                <input class="form-check-input" type="radio" name="role" id="roleUser" value="customer" checked>
                <label class="form-check-label" for="roleUser">
                    <i class="bi bi-person me-2"></i>
                    Customer
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="role" id="roleAdmin" value="administrator">
                <label class="form-check-label" for="roleAdmin">
                    <i class="bi bi-shield-lock me-2"></i>
                    Administrator
                </label>
            </div>
        </div>

        <div class="error-message" id="errorMessage">
            Invalid credentials. Please try again.
        </div>

        <button type="submit" class="btn btn-login">
            Sign In
            <i class="bi bi-arrow-right ms-2"></i>
        </button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Add active class to selected role
    document.querySelectorAll('.form-check').forEach(check => {
        check.addEventListener('click', () => {
            document.querySelectorAll('.form-check').forEach(c => c.classList.remove('active'));
            check.classList.add('active');
        });
    });

    // Show error message if login fails
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.get('error') === 'true') {
        document.getElementById('errorMessage').classList.add('show');
    }
</script>
</body>
</html>