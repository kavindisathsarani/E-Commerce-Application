<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/25/2025
  Time: 10:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1>Edit Product</h1>

    <form action="editProduct" method="POST" onsubmit="return confirmEdit()" enctype="multipart/form-data">
        <input type="hidden" name="productId" value="${productId}">

        <div class="mb-3">
            <label for="productNameInput" class="form-label">Product Name</label>
            <input type="text" class="form-control" name="productName" id="productNameInput" value="${productName}" required>
        </div>

        <div class="mb-3">
            <label for="productDescriptionInput" class="form-label">Description</label>
            <textarea class="form-control" name="description" id="productDescriptionInput" rows="3" required>${description}</textarea>
        </div>

        <div class="mb-3">
            <label for="productPriceInput" class="form-label">Price</label>
            <input type="number" step="0.01" class="form-control" name="price" id="productPriceInput" value="${price}" required>
        </div>

        <div class="mb-3">
            <label for="stockQuantityInput" class="form-label">Stock Quantity</label>
            <input type="number" class="form-control" name="stockQuantity" id="stockQuantityInput" value="${stockQuantity}" required>
        </div>

        <div class="mb-3">
            <label for="categoryIdInput" class="form-label">Category</label>
            <select class="form-control" name="categoryId" id="categoryIdInput" >
                <option value="">Select a category</option>
                <!-- Dynamic categories -->
                <c:forEach var="category" items="${categories}">
                    <option value="${category.categoryId}"
                        ${category.categoryId == categoryId ? 'selected' : ''}>
                            ${category.categoryName}
                    </option>
                </c:forEach>
            </select>
        </div>



        <button type="submit" class="btn btn-primary">Save Changes</button>
    </form>

    <a href="product.jsp" class="btn btn-secondary mt-3">Back to Products</a>
</div>

<script>
    function confirmEdit() {
        return confirm("Are you sure you want to edit this product?");
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
