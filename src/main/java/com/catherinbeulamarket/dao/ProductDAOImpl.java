package com.catherinbeulamarket.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.catherinbeulamarket.model.Product;
import com.catherinbeulamarket.util.DBConnection;

@Repository
public class ProductDAOImpl implements ProductDAO {

    @Override
    public boolean addProduct(Product product) {
        String sql="INSERT INTO products(name,price,image,category) VALUES(?,?,?,?)";

        try(Connection con=DBConnection.getConnection();
            PreparedStatement ps=con.prepareStatement(sql)) {

            ps.setString(1,product.getName());
            ps.setBigDecimal(2,product.getPrice());
            ps.setString(3,product.getImageUrl());
            ps.setString(4,product.getCategory());

            return ps.executeUpdate()>0;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public List<Product> getAllProducts() {
        List<Product> products=new ArrayList<>();

        String sql="SELECT * FROM products";

        try(Connection con=DBConnection.getConnection();
            PreparedStatement ps=con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery()) {

            while(rs.next()) {
                Product product=new Product();

                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getBigDecimal("price"));
                product.setImageUrl(rs.getString("image"));
                product.setCategory(rs.getString("category"));
                product.setStock(rs.getInt("stock"));

                products.add(product);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return products;
    }

    @Override
    public boolean updateProduct(Product product) {
        String sql="UPDATE products SET name=?,price=?,image=?,category=?,stock=? WHERE id=?";

        try(Connection con=DBConnection.getConnection();
            PreparedStatement ps=con.prepareStatement(sql)) {

            ps.setString(1,product.getName());
            ps.setBigDecimal(2,product.getPrice());
            ps.setString(3,product.getImageUrl());
            ps.setString(4,product.getCategory());
            ps.setInt(5,product.getStock());
            ps.setInt(6,product.getId());

            return ps.executeUpdate()>0;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean deleteProduct(int id) {
        String sql="DELETE FROM products WHERE id=?";

        try(Connection con=DBConnection.getConnection();
            PreparedStatement ps=con.prepareStatement(sql)) {

            ps.setInt(1,id);

            return ps.executeUpdate()>0;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}