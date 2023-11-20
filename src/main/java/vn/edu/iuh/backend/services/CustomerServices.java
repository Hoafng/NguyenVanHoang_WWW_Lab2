package vn.edu.iuh.backend.services;

import vn.edu.iuh.backend.models.Customer;
import vn.edu.iuh.backend.repositories.CustomerRepository;

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
