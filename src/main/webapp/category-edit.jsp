<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/24/2025
  Time: 11:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Category</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1>Edit Category</h1>


    <form action="editCategory" method="POST" onsubmit="return confirmEdit()">
        <input type="hidden" name="categoryId" value="${categoryId}">
        <div class="mb-3">
            <label for="categoryNameInput" class="form-label">Category Name</label>
            <input type="text" class="form-control" name="categoryName" id="categoryNameInput" value="${categoryName}" required>
        </div>
        <button type="submit" class="btn btn-primary">Save Changes</button>
    </form>

    <a href="category.jsp" class="btn btn-secondary mt-3">Back to Categories</a>
</div>
<script>
    function confirmEdit() {
        return confirm("Are you sure you want to edit this category?");
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
