<%@ page import="java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Authenticate Admin</title>
    <link rel="stylesheet" href="styles.css"> 
</head>
<body>
<%
    String enteredUsername = request.getParameter("username");
    String enteredPassword = request.getParameter("password");
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/qrcode", "root", "1234");
        String query = "SELECT * FROM staff WHERE username=? AND password=?";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, enteredUsername);
        pstmt.setString(2, enteredPassword);
        rs = pstmt.executeQuery();
        if (rs.next()) {
            response.sendRedirect("AdminHomePage.html");
            return; 
        } else {
%>
            <h1>Invalid Credentials</h1>
<%
            response.sendRedirect("login_admin.jsp");
            return; 
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
</body>
</html>