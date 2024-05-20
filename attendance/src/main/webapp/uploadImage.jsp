<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
// Establish database connection
Connection conn = null;
String url = "jdbc:mysql://localhost:3306/qrcode"; // Replace with your database URL
String user = "root";
String password = "1234";
try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(url, user, password);
    
    // Get image data from the form
    Part filePart = request.getPart("image");
    InputStream inputStream = filePart.getInputStream();
    // Insert the image into the database
    String sql = "INSERT INTO image(image_data, image_name) VALUES (?, ?)";
	PreparedStatement statement = conn.prepareStatement(sql);
	statement.setBlob(1, inputStream);
	statement.setString(2, filePart.getSubmittedFileName()); // Assuming you want to store the image name
	statement.executeUpdate();
    
    // Close resources
    statement.close();
    conn.close();
    
    response.sendRedirect("processAtendance.jsp"); // Redirect to a success page after insertion
} catch (Exception e) {
    e.printStackTrace();
}
%>
