<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-02
  Time: 오전 1:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/login" method="post">
    <label for="userId">User ID:</label>
    <input type="text" id="userId" name="userId" required>
    <br>
    <label for="userPassword">Password:</label>
    <input type="password" id="userPassword" name="userPassword" required>
    <br>
    <button type="submit">Login</button>
</form>
<p>${errorMessage}</p>
</body>
</html>
