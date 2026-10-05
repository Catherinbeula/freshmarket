package com.catherinbeulamarket.dao;

import com.catherinbeulamarket.model.Product;
import java.util.List;

public interface ProductDAO {
    boolean addProduct(Product product);
    List<Product> getAllProducts();
    boolean updateProduct(Product product);
    boolean deleteProduct(int id);
}