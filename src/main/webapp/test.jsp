<%@ page import="vn.edu.iuh.backend.repositories.EmployeeRepository" %>
<%@ page import="vn.edu.iuh.backend.models.Employee" %>
<%@ page import="vn.edu.iuh.backend.enums.EmployeeStatus" %>
<%@ page import="vn.edu.iuh.backend.repositories.ProductRepository" %>
<%@ page import="vn.edu.iuh.backend.models.Product" %>
<%@ page import="vn.edu.iuh.backend.enums.ProductStatus" %>
<%@ page import="vn.edu.iuh.backend.models.ProductImage" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<%
    EmployeeRepository repository = new EmployeeRepository();
    Employee emp = new Employee("teo", LocalDateTime.now(), "teo" + System.currentTimeMillis() + "@mail.com",
            "2349235", "12 NVB", EmployeeStatus.ACTIVE);
    repository.insertEmp(emp);

    out.print(emp);

    ProductRepository productRepository = new ProductRepository();
    Product product = new Product("xoai", "xoai ngot", "kg", "ba dua", ProductStatus.ACTIVE);

    ProductImage productImage = new ProductImage();
    productImage.setAlternative("xxx xxx");
    productImage.setPath("/images/zzz.jpg");
    productImage.setProduct(product);

    product.getProductImageList().add(productImage);

    productRepository.insert(product);

    out.print("OK");
%>
</body>
</html>