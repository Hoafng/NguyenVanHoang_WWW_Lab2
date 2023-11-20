<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 9/23/2023
  Time: 9:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer</title>
</head>
<body>
    <form action="controls?action=insertCust" method="post">
        Name: <input name="name"><br/>
        Email: <input name="email"><br/>
        Phone: <input name="phone"><br/>
        Addess: <input name="address"><br/>
        <input type="submit" value="Insert">
        <input type="reset" value="Clear">
    </form>
</body>
</html>
