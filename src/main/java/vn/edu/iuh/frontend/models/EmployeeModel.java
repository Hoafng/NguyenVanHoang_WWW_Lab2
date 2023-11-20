package vn.edu.iuh.frontend.models;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.iuh.backend.enums.EmployeeStatus;
import vn.edu.iuh.backend.models.Employee;
import vn.edu.iuh.backend.services.EmployeeServices;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class EmployeeModel {
    public void insertEmp(HttpServletRequest req, HttpServletResponse resp) throws IOException, InterruptedException {
        String name = req.getParameter("name");
        String s_dob = req.getParameter("dob");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        LocalDateTime dob;

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        if(!s_dob.equalsIgnoreCase("")) {
             dob = LocalDateTime.parse(s_dob, formatter);
        }else {
             dob = LocalDateTime.now();
        }
        Employee employee = new Employee(name, dob, email, phone, address, EmployeeStatus.IN_ACTIVE);
        EmployeeServices services =new EmployeeServices();
        services.insertEmp(employee);
        resp.sendRedirect("index.jsp");
    }
}
