package vn.edu.iuh.backend.services;

import vn.edu.iuh.backend.enums.ProductStatus;
import vn.edu.iuh.backend.models.Product;
import vn.edu.iuh.backend.repositories.ProductRepository;

import java.util.List;

public class ProductServices {
    private final ProductRepository repository;

    public ProductServices() {
        repository=new ProductRepository();
    }

    public void insert(Product product){
        repository.insert(product);
    }

    public List<Product>getActiveProducts(){
        return repository.getActiveProduct();
    }
    public List<Product> getProduct(long id){return  repository.getProdcut(id);}

    public void updateStatus(long id, ProductStatus status) {
        repository.updateStatus(id,status);
    }

    public void update(long id,Product product) {
        repository.update(id,product);
    }
}
