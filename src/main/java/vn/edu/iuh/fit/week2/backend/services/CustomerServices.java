package vn.edu.iuh.fit.week2.backend.services;

import vn.edu.iuh.fit.week2.backend.models.Customer;
import vn.edu.iuh.fit.week2.backend.repositories.CustomerRepository;

import java.util.ArrayList;
import java.util.List;

public class CustomerServices {
    private final CustomerRepository repository = new CustomerRepository();

    public CustomerServices() {
//        repository = new CustomerRepository();
    }

    public void insertCust(Customer customer) {
        repository.insertCust(customer);
    }

    public List<Customer> getAll() {
        return repository.getAllCust();
    }
}
