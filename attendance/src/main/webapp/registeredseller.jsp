<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register Doctor</title>
    <link rel="stylesheet" href="styles.css"> <!-- Link your CSS file here -->
    <!-- Your CSS styles -->
</head>
<%
    // Retrieve form data
    String name = request.getParameter("username");
String name2 = request.getParameter("full_name");
	String pass = request.getParameter("password");
	String email = request.getParameter("email");
    String address = request.getParameter("address");
    String phonenumber = request.getParameter("phno");
    String city = request.getParameter("email");

    // Database connection variables
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Establish connection to your database
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/farmer4", "root", "1234");

        // Prepare SQL statement to insert doctor details into the 'doctors' table
        String query = "INSERT INTO salesMan (username,password,email,full_name, address,phone_number) VALUES (?, ?, ?, ?,?,?)";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, name);
        pstmt.setString(2, pass);
        pstmt.setString(3, email);
        pstmt.setString(4, name2);
        pstmt.setString(5, address);
        pstmt.setString(6, phonenumber);

        // Execute the SQL statement
        int rowsAffected = pstmt.executeUpdate();

        // Check if insertion was successful
        if (rowsAffected > 0) {
%>
            <h1>Seller Registered Successfully</h1>
            <!-- Additional success message or redirection can be added here -->
<%
        } else {
%>
            <h1>Error Registering seller</h1>
            <!-- Additional error message or redirection can be added here -->
<%
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
</body>
</html>
