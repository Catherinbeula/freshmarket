<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.catherinbeulamarket.model.Product" %>
<%@ page import="com.catherinbeulamarket.dao.ProductDAOImpl" %>

<%
    Map<String,Integer> cart=(Map<String,Integer>)session.getAttribute("cart");

    if(cart==null){
        cart=new HashMap<>();
        session.setAttribute("cart",cart);
    }

    String action=request.getParameter("action");
    String product=request.getParameter("product");
    String direct=request.getParameter("direct");
    String price=request.getParameter("price");
    String qtyParam=request.getParameter("qty");

    boolean directOrder="true".equals(direct)
            && product!=null
            && !product.isBlank()
            && price!=null
            && !price.isBlank();

    int directQty=1;

    if(directOrder && qtyParam!=null){
        try{
            directQty=Integer.parseInt(qtyParam);
        }catch(Exception e){
            directQty=1;
        }
    }

    if(directQty<1){
        directQty=1;
    }

    ProductDAOImpl productDAO=new ProductDAOImpl();
    List<Product> products=productDAO.getAllProducts();

    if("add".equals(action)
            && product!=null
            && !product.isBlank()){

        for(Product p:products){

            if(p.getName().equalsIgnoreCase(product)){

                int qty=cart.getOrDefault(product,0);

                if(p.getStock()>qty){
                    cart.put(product,qty+1);
                }

                break;
            }
        }

        session.setAttribute("cart",cart);

        response.sendRedirect("cart.jsp");
        return;
    }

    if("increase".equals(action)
            && product!=null
            && !product.isBlank()
            && !"true".equals(direct)){

        for(Product p:products){

            if(p.getName().equalsIgnoreCase(product)){

                int qty=cart.getOrDefault(product,0);

                if(p.getStock()>qty){
                    cart.put(product,qty+1);
                }

                break;
            }
        }

        session.setAttribute("cart",cart);

        response.sendRedirect("cart.jsp");
        return;
    }

    if("decrease".equals(action)
            && product!=null
            && !product.isBlank()
            && !"true".equals(direct)){

        int qty=cart.getOrDefault(product,0);

        if(qty>1){
            cart.put(product,qty-1);
        }else{
            cart.remove(product);
        }

        session.setAttribute("cart",cart);

        response.sendRedirect("cart.jsp");
        return;
    }

    if("directIncrease".equals(action)
            && directOrder){

        for(Product p:products){

            if(p.getName().equalsIgnoreCase(product)){

                if(directQty<p.getStock()){
                    directQty++;
                }

                break;
            }
        }

        response.sendRedirect(
            "cart.jsp?direct=true&product="
            + java.net.URLEncoder.encode(product,"UTF-8")
            + "&price="
            + java.net.URLEncoder.encode(price,"UTF-8")
            + "&qty="
            + directQty
        );

        return;
    }

    if("directDecrease".equals(action)
            && directOrder){

        if(directQty>1){
            directQty--;
        }

        response.sendRedirect(
            "cart.jsp?direct=true&product="
            + java.net.URLEncoder.encode(product,"UTF-8")
            + "&price="
            + java.net.URLEncoder.encode(price,"UTF-8")
            + "&qty="
            + directQty
        );

        return;
    }

    java.math.BigDecimal grandTotal=java.math.BigDecimal.ZERO;

    Product directProduct=null;

    Product selectedProduct=null;

    int selectedQuantity=1;

    if(directOrder){

        for(Product p:products){

            if(p.getName().equalsIgnoreCase(product)){

                directProduct=p;

                break;
            }
        }
    }
%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>FreshMart - My Cart</title>

    <style>

        *{
            box-sizing:border-box;
            margin:0;
            padding:0;
            font-family:Arial,sans-serif;
        }

        body{
            background:#f8f5ff;
            color:#333;
        }

        .navbar{
            background:#6c4ab6;
            padding:18px 50px;
            color:white;
            display:flex;
            justify-content:space-between;
            align-items:center;
        }

        .logo{
            font-size:25px;
            font-weight:bold;
        }

        .back{
            text-decoration:none;
            background:white;
            color:#6c4ab6;
            padding:9px 18px;
            border-radius:20px;
            font-weight:bold;
        }

        .container{
            width:90%;
            max-width:900px;
            margin:40px auto;
        }

        .cart-box{
            background:white;
            padding:30px;
            border-radius:14px;
            box-shadow:0 3px 12px rgba(0,0,0,0.08);
        }

        h1{
            text-align:center;
            color:#5b3a9e;
            margin-bottom:30px;
        }

        .cart-item{
            display:flex;
            align-items:center;
            justify-content:space-between;
            gap:20px;
            padding:20px 0;
            border-bottom:1px solid #eee;
        }

        .product-info{
            display:flex;
            align-items:center;
            gap:18px;
            flex:1;
        }

        .cart-image{
            width:100px;
            height:100px;
            object-fit:contain;
            border-radius:12px;
        }

        .item-name{
            font-size:18px;
            font-weight:bold;
            margin-bottom:8px;
        }

        .item-price{
            color:#6c4ab6;
            font-weight:bold;
        }

        .stock-info{
            color:#777;
            font-size:14px;
            margin-top:5px;
        }

        .quantity-box{
            display:flex;
            align-items:center;
            gap:12px;
        }

        .quantity-btn{
            width:36px;
            height:36px;
            display:inline-flex;
            align-items:center;
            justify-content:center;
            text-decoration:none;
            background:#6c4ab6;
            color:white;
            border-radius:50%;
            font-size:22px;
            font-weight:bold;
        }

        .quantity-btn:hover{
            background:#59399f;
        }

        .quantity{
            min-width:30px;
            text-align:center;
            font-size:18px;
            font-weight:bold;
        }

        .item-total{
            min-width:120px;
            text-align:right;
            color:#5b3a9e;
            font-weight:bold;
        }

        .price-details{
            margin-top:25px;
            padding:20px;
            background:#f8f5ff;
            border-radius:10px;
        }

        .price-details h3{
            color:#5b3a9e;
            margin-bottom:15px;
        }

        .price-row{
            display:flex;
            justify-content:space-between;
            margin-bottom:10px;
        }

        .total{
            text-align:right;
            margin-top:25px;
            font-size:22px;
            font-weight:bold;
            color:#5b3a9e;
        }

        .buttons{
            display:flex;
            justify-content:center;
            gap:15px;
            margin-top:25px;
        }

        .my-cart-btn{
            display:block;
            padding:12px 30px;
            text-align:center;
            text-decoration:none;
            background:#eee;
            color:#5b3a9e;
            border-radius:25px;
            font-weight:bold;
        }

        .checkout{
            display:block;
            padding:12px 30px;
            text-align:center;
            text-decoration:none;
            background:#6c4ab6;
            color:white;
            border-radius:25px;
            font-weight:bold;
        }

        .checkout:hover{
            background:#59399f;
        }

        .empty{
            text-align:center;
            padding:40px;
            color:#777;
            font-size:18px;
        }

        .shop-btn{
            display:inline-block;
            margin-top:20px;
            padding:12px 25px;
            background:#6c4ab6;
            color:white;
            text-decoration:none;
            border-radius:25px;
            font-weight:bold;
        }
        footer {
    position: fixed;
    bottom: 0;
    left: 0;
    width: 100%;
    background: #6c4ab6;
    color: white;
    text-align: center;
    padding: 18px;
}
        

        
        @media(max-width:700px){

            .navbar{
                padding:15px 20px;
            }

            .cart-item{
                flex-direction:column;
                align-items:center;
            }

            .product-info{
                flex-direction:column;
                text-align:center;
            }

            .item-total{
                text-align:center;
            }

            .buttons{
                flex-direction:column;
            }

        }

    </style>

</head>

<body>

<div class="navbar">

    <div class="logo">
        BeulaMart
    </div>

    <a class="back" href="products.jsp">
        Back to Products
    </a>

</div>

<div class="container">

    <div class="cart-box">

<%
    if(directOrder){

        if(directProduct!=null && directProduct.getStock()>0){

            if(directQty>directProduct.getStock()){
                directQty=directProduct.getStock();
            }

            java.math.BigDecimal unitPrice=
                new java.math.BigDecimal(
                    String.valueOf(directProduct.getPrice())
                );

            grandTotal=
                unitPrice.multiply(
                    java.math.BigDecimal.valueOf(directQty)
                );
%>

        <h1>Order Product</h1>

        <div class="cart-item">

            <div class="product-info">

                <img class="cart-image"
                     src="<%= directProduct.getImageUrl() %>"
                     alt="<%= directProduct.getName() %>">

                <div>

                    <div class="item-name">
                        <%= directProduct.getName() %>
                    </div>

                    <div class="item-price">
                        ₹<%= unitPrice %> / kg
                    </div>

                    <div class="stock-info">
                        Available Stock: <%= directProduct.getStock() %>
                    </div>

                </div>

            </div>

            <div class="quantity-box">

                <a class="quantity-btn"
                   href="cart.jsp?action=directDecrease&direct=true&product=<%= java.net.URLEncoder.encode(product,"UTF-8") %>&price=<%= price %>&qty=<%= directQty %>">
                    -
                </a>

                <span class="quantity">
                    <%= directQty %>
                </span>

                <a class="quantity-btn"
                   href="cart.jsp?action=directIncrease&direct=true&product=<%= java.net.URLEncoder.encode(product,"UTF-8") %>&price=<%= price %>&qty=<%= directQty %>">
                    +
                </a>

            </div>

            <div class="item-total">
                ₹<%= grandTotal %>
            </div>

        </div>

        <div class="price-details">

            <h3>Price Details</h3>

            <div class="price-row">

                <span>Product</span>

                <span>
                    <%= directProduct.getName() %>
                </span>

            </div>

            <div class="price-row">

                <span>Quantity</span>

                <span>
                    <%= directQty %>
                </span>

            </div>

            <div class="price-row">

                <span>Price</span>

                <span>
                    ₹<%= unitPrice %>
                </span>

            </div>

        </div>

        <div class="total">
            Total: ₹<%= grandTotal %>
        </div>

        <div class="buttons">

            <a class="my-cart-btn"
               href="products.jsp">
                Continue Shopping
            </a>

            <a class="checkout"
               href="checkout.jsp?product=<%= java.net.URLEncoder.encode(product,"UTF-8") %>&price=<%= grandTotal %>&qty=<%= directQty %>">
                Place Order
            </a>

        </div>

<%
        }else{
%>

        <div class="empty">

            <p>
                Product is out of stock or not available.
            </p>

            <a class="shop-btn" href="products.jsp">
                Back to Products
            </a>

        </div>

<%
        }

    }else{

        if(cart.isEmpty()){
%>

        <h1>My Cart</h1>

        <div class="empty">

            <p>Your cart is empty.</p>

            <a class="shop-btn" href="products.jsp">
                Continue Shopping
            </a>

        </div>

<%
        }else{
%>

        <h1>My Cart</h1>

<%
            for(Product p:products){

                String productName=p.getName();

                if(cart.containsKey(productName)){

                    int quantity=cart.get(productName);

                    if(quantity>p.getStock()){
                        quantity=p.getStock();

                        if(quantity<=0){
                            cart.remove(productName);
                            continue;
                        }

                        cart.put(productName,quantity);
                    }

                    if(selectedProduct==null){
                        selectedProduct=p;
                        selectedQuantity=quantity;
                    }

                    java.math.BigDecimal unitPrice=
                        new java.math.BigDecimal(
                            String.valueOf(p.getPrice())
                        );

                    java.math.BigDecimal itemTotal=
                        unitPrice.multiply(
                            java.math.BigDecimal.valueOf(quantity)
                        );

                    grandTotal=grandTotal.add(itemTotal);
%>

        <div class="cart-item">

            <div class="product-info">

                <img class="cart-image"
                     src="<%= p.getImageUrl() %>"
                     alt="<%= productName %>">

                <div>

                    <div class="item-name">
                        <%= productName %>
                    </div>

                    <div class="item-price">
                        ₹<%= unitPrice %> / kg
                    </div>

                    <div class="stock-info">
                        Available Stock: <%= p.getStock() %>
                    </div>

                </div>

            </div>

            <div class="quantity-box">

                <a class="quantity-btn"
                   href="cart.jsp?action=decrease&product=<%= java.net.URLEncoder.encode(productName,"UTF-8") %>">
                    -
                </a>

                <span class="quantity">
                    <%= quantity %>
                </span>

                <a class="quantity-btn"
                   href="cart.jsp?action=increase&product=<%= java.net.URLEncoder.encode(productName,"UTF-8") %>">
                    +
                </a>

            </div>

            <div class="item-total">
                ₹<%= itemTotal %>
            </div>

        </div>

<%
                }
            }

            session.setAttribute("cart",cart);
%>

        <div class="price-details">

            <h3>Price Details</h3>

            <div class="price-row">

                <span>Number of Products</span>

                <span>
                    <%= cart.size() %>
                </span>

            </div>

            <div class="price-row">

                <span>Total Customer Price</span>

                <span>
                    ₹<%= grandTotal %>
                </span>

            </div>

            <div class="price-row">

                <span>You will save</span>

                <span>₹0</span>

            </div>

        </div>

        <div class="total">
            Total: ₹<%= grandTotal %>
        </div>

        <div class="buttons">

            <a class="my-cart-btn"
               href="products.jsp">
                Continue Shopping
            </a>

<%
            if(selectedProduct!=null){
%>

            <a class="checkout"
               href="checkout.jsp?product=<%= java.net.URLEncoder.encode(selectedProduct.getName(),"UTF-8") %>&price=<%= grandTotal %>&qty=<%= selectedQuantity %>">
                Place Order
            </a>

<%
            }
%>

        </div>

<%
        }

    }
%>

    </div>

</div>

<footer>

    <p>
        © 2026 FreshMart. All Rights Reserved.
    </p>

</footer>

</body>

</html>