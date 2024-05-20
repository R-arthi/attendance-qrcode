<%@ page import="java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
</head>
<body>
<%
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    String dept = request.getParameter("dept");
    long phno = Long.parseLong(request.getParameter("phno")); // Parse as long
    String address = request.getParameter("address");
    String uid = request.getParameter("uid");
    String pass1 = request.getParameter("pass1");
    String pass2 = request.getParameter("pass2");

    // Database connection variables
    Connection conn = null;
    PreparedStatement pstmt = null;
    try {
        // Establish connection to your database
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/qrcode", "root", "1234");

        // Prepare SQL statement to insert user details into the 'users' table
        String query = "INSERT INTO users (fname, lname, email, phno, address, uid, password,dept) VALUES (?, ?, ?, ?, ?, ?, ?,?)";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, fname);
        pstmt.setString(2, lname);
        pstmt.setString(3, email);
        pstmt.setLong(4, phno);
        pstmt.setString(5, address);
        pstmt.setString(6, uid);
        pstmt.setString(7, pass1);
        pstmt.setString(8,dept);

        // Execute the SQL statement
        int rowsAffected = pstmt.executeUpdate();

        // Check if insertion was successful
        if (rowsAffected > 0) {
            response.sendRedirect("Login.html");
        } else {
%>
            <h1>Error Registering User</h1>
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
