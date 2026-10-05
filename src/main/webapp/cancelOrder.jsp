<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.catherinbeulamarket.util.DBConnection" %>

<%
    String orderId = request.getParameter("order_id");

    Connection con = null;
    PreparedStatement ps = null;

    try {
        con = DBConnection.getConnection();

        String sql = "UPDATE orders SET status = 'Cancelled' WHERE order_id = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, Integer.parseInt(orderId));
        ps.executeUpdate();

        response.sendRedirect("my-orders.jsp");

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (ps != null) ps.close();
        } catch (Exception ignored) {
        }

        try {
            if (con != null) con.close();
        } catch (Exception ignored) {
        }
    }
%>