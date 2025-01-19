<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/10/2025
  Time: 10:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>save-customer</title>
</head>
<body>
<h1>Save Customer</h1>

<%--<%--%>
<%--String message=request.getParameter("message");--%>
<%--String error=request.getParameter("error");--%>
<%--%>--%>

<%--<%--%>
<%--    if (message!= null){--%>
<%--%>--%>
<%--<div style="color: green"><%=message%>--%>
<%--</div>--%>

<%--<%--%>
<%--    }--%>
<%--%>--%>

<%--<%--%>
<%--    if (error!= null){--%>
<%--%>--%>
<%--<div style="color: red"><%=error%>--%>
<%--</div>--%>

<%--<%--%>
<%--    }--%>
<%--%>--%>


<form action="customer-save" method="post">
    <label for="name">Name:</label><br>
    <input type="text" id="name" name="name" required><br><br>

    <label for="address">Address:</label><br>
    <input type="text" id="address" name="address" required><br><br>

    <label for="email">Email:</label><br>
    <input type="text" id="email" name="email" required><br><br>

    <button type="submit">Save Customer</button>
</form>

</body>
</html>
