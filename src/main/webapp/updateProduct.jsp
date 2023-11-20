<%@ page import="vn.edu.iuh.backend.models.Product" %>
<%@ page import="vn.edu.iuh.backend.services.ProductServices" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: my computer
  Date: 20/11/2023
  Time: 7:13 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    List<Product> listproduct = (List<Product>) request.getSession().getAttribute("listproduct");
    if(listproduct != null){
        for (Product product : listproduct) {
            long proId =product.getProduct_id();
%>
<title>Update Products</title>
    <form action="controls?action=update_products" method="post">
        ID: <%=proId%><br/>
    Name: <input name="name" value="<%=product.getName()%>"/><br/>
    Description:<input name="desc" value="<%=product.getDescription()%>"/><br/>
    Unit: <input name="unit" value="<%=product.getUnit()%>"/><br/>
    Manufacturer: <input name="manu" value="<%=product.getManufacturer()%>"/><br/>
    Status:<select name="status">
        <option selected="true" label="ACTIVE" >ACTIVE</option>
        <option label="IN_ACTIVE">IN_ACTIVE</option>
        <option label="TERMINATED">TERMINATED</option>
    </select>
    <input type="submit" value="Insert"/>
    <input type="reset" value="Clear"/>
</form>
        <%}
        }%>
</body>
</html>
