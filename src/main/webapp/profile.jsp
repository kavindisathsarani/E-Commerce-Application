<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/19/2025
  Time: 6:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<%
    // Check if the user is logged in (session check)
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");

    // If not logged in, redirect to the login page
    if (username == null) {
        response.sendRedirect("index.jsp");
        return;
    }

%>
<div class="container vh-100 d-flex justify-content-center align-items-center">
    <div class="card shadow-lg" style="max-width: 400px; width: 100%;">
        <div class="card-body">
            <h3 class="text-center mb-4">Update Profile</h3>
            <form action="updateProfile" method="POST">
                <!-- Username -->
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" class="form-control" id="username" name="username" value="<%= username %>" required>
                </div>

                <!-- Password -->
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Enter your new password" required>
                </div>

                <!-- Role Selection -->
                <div class="mb-3">
                    <label class="form-label">Role</label>
                    <select class="form-select" name="role" disabled>
                        <option value="customer" <%= "customer".equals(role) ? "selected" : "" %>>Customer</option>
                        <option value="administrator" <%= "administrator".equals(role) ? "selected" : "" %>>Administrator</option>
                    </select>
                </div>

                <!-- Error Message -->
                <div id="errorMessage" class="text-danger mb-3" style="display: none;">
                    Failed to update profile. Please try again.
                </div>

                <!-- Success Message -->
                <div id="successMessage" class="text-success mb-3" style="display: none;">
                    Profile updated successfully.
                </div>

                <!-- Submit Button -->
                <button type="submit" class="btn btn-primary w-100">Update</button>
            </form>

            <!-- Additional Links -->
            <div class="text-center mt-3">
                <a href="profile.jsp" class="text-decoration-none">Back to Profile</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap Bundle JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Show success or error message based on URL parameter
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.get('error') === 'true') {
        document.getElementById('errorMessage').style.display = 'block';
    }
    if (urlParams.get('success') === 'true') {
        document.getElementById('successMessage').style.display = 'block';
    }
</script>
</body>
</html>
