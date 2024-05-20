<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Details</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            width: 100%;
        }

        h2 {
            color: #2c3e50;
            text-align: center;
        }

        .student-details {
            background-color: #3498db;
            border-radius: 8px;
            margin: 15px 0;
            padding: 15px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            color: #fff;
        }

        .student-details p {
            margin: 5px 0;
        }

        .student-details strong {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Student Attendance Details</h2>
        <% 
            try {
                // Establish the database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/qrcode", "root", "1234");

                // Query to retrieve attendance details
                String query = "SELECT fname, uid, dept, attendance_status,updated_at FROM users";
                PreparedStatement pstmt = conn.prepareStatement(query);
                ResultSet rs = pstmt.executeQuery();
                while (rs.next()) {
                    String studentName = rs.getString("fname");
                    String rollNumber = rs.getString("uid");
                    String dept = rs.getString("dept");
                    String attendance_status = rs.getString("attendance_status");
                    String updated_at1 = rs.getString("updated_at");
                    
        %>
                    <div class="student-details">
                        <p><strong>Student Name:</strong> <%= studentName %></p>
                        <p><strong>Roll Number:</strong> <%= rollNumber %></p>
                        <p><strong>Department:</strong> <%= dept %></p>
                        <p><strong>Status:</strong> <%= attendance_status %></p>
                            <p><strong>Time:</strong> <%= updated_at1 %></p>
                    </div>
        <%
                }
                // Close resources
                rs.close();
                pstmt.close();
                conn.close();
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        %>
    </div>
</body>
</html>