<%@ page import="java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register staff</title>
    <link rel="stylesheet" href="styles.css"> 
</head>
<body>
<%
    // Retrieve form data
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String email = request.getParameter("email");

    // Database connection variables
    Connection conn = null;
    PreparedStatement pstmt = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/qrcode", "root", "1234");
        String query = "INSERT INTO staff (username, password, email) VALUES (?, ?, ?)";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, username);
        pstmt.setString(2, password);
        pstmt.setString(3, email);
        // Execute the SQL statement
        int rowsAffected = pstmt.executeUpdate();

        // Check if insertion was successful
        if (rowsAffected > 0) {
            response.sendRedirect("login_admin.jsp");

        } else {
%>
            <h1>Error Registering staff</h1>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
</body>
</html>
