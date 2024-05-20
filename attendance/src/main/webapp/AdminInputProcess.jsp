<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Input Process</title>
</head>
<body>
<%
    // Retrieve form data
    String productName = request.getParameter("productName");
    String description = request.getParameter("description");
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Establish connection to your database
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/qrcode", "root", "1234");

        // Prepare SQL statement to insert farmer product info into the 'farmer_products' table
        String query = "INSERT INTO info (Title, description) VALUES (?, ?)";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, productName);
        pstmt.setString(2, description);
     
        // Execute the SQL statement
        int rowsAffected = pstmt.executeUpdate();

        if (rowsAffected > 0) {
            // Redirect to a success page or display a success message
            response.sendRedirect("UserView.jsp");
        } else {
            // Redirect to an error page or display an error message
            response.sendRedirect("error");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close connections and resources
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>