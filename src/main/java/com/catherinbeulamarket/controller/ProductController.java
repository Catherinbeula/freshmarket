package com.catherinbeulamarket.controller;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.catherinbeulamarket.dao.ProductDAOImpl;
import com.catherinbeulamarket.model.Product;

@Controller
public class ProductController {

    @Autowired
    private ProductDAOImpl productDAO;

    @PostMapping("/add-product")
    public String addProduct(
            @RequestParam String name,
            @RequestParam BigDecimal price,
            @RequestParam String image,
            @RequestParam String category) {

        Product product=new Product();

        product.setName(name);
        product.setPrice(price);
        product.setImageUrl(image);
        product.setCategory(category);

        productDAO.addProduct(product);

        return "redirect:/admin-products.jsp";
    }

    @PostMapping("/update-product")
    public String updateProduct(
            @RequestParam int id,
            @RequestParam String name,
            @RequestParam BigDecimal price,
            @RequestParam String image,
            @RequestParam String category,
            @RequestParam int stock) {

        Product product=new Product();

        product.setId(id);
        product.setName(name);
        product.setPrice(price);
        product.setImageUrl(image);
        product.setCategory(category);
        product.setStock(stock);

        productDAO.updateProduct(product);

        return "redirect:/admin-products.jsp";
    }

    @PostMapping("/delete-product")
    public String deleteProduct(@RequestParam int id) {

        productDAO.deleteProduct(id);

        return "redirect:/admin-products.jsp";
    }
}