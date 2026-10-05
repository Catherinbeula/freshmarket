package com.catherinbeulamarket.controller;

import com.catherinbeulamarket.model.User;
import com.catherinbeulamarket.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/place-order")
public class OrderController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String product=request.getParameter("product");
        String qty=request.getParameter("qty");

        HttpSession session=request.getSession(false);

        if(session==null || session.getAttribute("user")==null){
            response.sendRedirect("login.jsp");
            return;
        }

        if(product==null || product.isBlank()
                || qty==null || qty.isBlank()){

            response.getWriter().println("Invalid order details");
            return;
        }

        User user=(User)session.getAttribute("user");
        String email=user.getEmail();

        Connection con=null;

        try{

            int quantity=Integer.parseInt(qty);

            if(quantity<1){
                quantity=1;
            }

            con=DBConnection.getConnection();

            con.setAutoCommit(false);

            String stockSql=
                    "SELECT id,price,stock FROM products WHERE name=? FOR UPDATE";

            PreparedStatement stockPs=
                    con.prepareStatement(stockSql);

            stockPs.setString(1,product);

            ResultSet rs=stockPs.executeQuery();

            if(!rs.next()){

                rs.close();
                stockPs.close();

                con.rollback();

                response.getWriter().println("Product not found");
                return;
            }

            int productId=rs.getInt("id");

            BigDecimal unitPrice=rs.getBigDecimal("price");

            int availableStock=rs.getInt("stock");

            rs.close();
            stockPs.close();

            if(availableStock<=0){

                con.rollback();

                response.getWriter().println(
                        "Order failed: Product is out of stock"
                );

                return;
            }

            if(quantity>availableStock){

                con.rollback();

                response.getWriter().println(
                        "Order failed: Only "
                        + availableStock
                        + " item(s) are available"
                );

                return;
            }

            BigDecimal totalPrice=
                    unitPrice.multiply(
                            BigDecimal.valueOf(quantity)
                    );

            String updateSql=
                    "UPDATE products SET stock=stock-? WHERE id=?";

            PreparedStatement updatePs=
                    con.prepareStatement(updateSql);

            updatePs.setInt(1,quantity);
            updatePs.setInt(2,productId);

            int updated=updatePs.executeUpdate();

            updatePs.close();

            if(updated==0){

                con.rollback();

                response.getWriter().println(
                        "Order failed"
                );

                return;
            }

            String orderSql=
                    "INSERT INTO orders(email, product, price, status, quantity) VALUES(?,?,?,?,?)";

            PreparedStatement orderPs=
                    con.prepareStatement(orderSql);

            orderPs.setString(1,email);
            orderPs.setString(2,product);
            orderPs.setBigDecimal(3,totalPrice);
            orderPs.setString(4,"PLACED");
            orderPs.setInt(5,quantity);

            orderPs.executeUpdate();

            orderPs.close();

            con.commit();

            con.close();

            response.sendRedirect("order-success.jsp");

        }catch(Exception e){

            e.printStackTrace();

            try{
                if(con!=null){
                    con.rollback();
                }
            }catch(Exception rollbackException){
                rollbackException.printStackTrace();
            }

            response.getWriter().println(
                    "Order failed"
            );

        }finally{

            try{
                if(con!=null && !con.isClosed()){
                    con.close();
                }
            }catch(Exception e){
                e.printStackTrace();
            }
        }
    }
}