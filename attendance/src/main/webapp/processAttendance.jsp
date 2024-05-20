<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Attendance Process</title>
     <style>
          body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url("images/a3.gif") center/cover no-repeat;
            color: #fff;
            margin: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
        }

        form {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
            width: 300px;
            text-align: center;
        }

        h2 {
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background-color: #3498db;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #2980b9;
        }

        .message {
            margin-top: 20px;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            background-color: rgb(84,54,124);
            color: #blue;
            font-weight: bold;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Attendance Processed</h2>
        <% 
            String uid = request.getParameter("uid"); // Retrieve UID from the request parameter
            String fname = ""; // Initialize fname
			
            // Simulated database connection and query
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/qrcode","root","1234");
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT uid, fname FROM users WHERE uid = '" + uid + "'");
          
                if (resultSet.next()) {
                    uid = resultSet.getString("uid");
                    fname = resultSet.getString("fname");
                }
                resultSet.close();
                statement.close();
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        
        <% 
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/qrcode","root","1234");

                // Use PreparedStatement to handle parameters
                String updateQuery = "UPDATE users SET attendance_status = 'Present', updated_at = CURRENT_TIMESTAMP WHERE uid = ?";
                PreparedStatement pstmt = connection.prepareStatement(updateQuery);

                // Set UID parameter
                pstmt.setString(1, uid);

                int rowsAffected = pstmt.executeUpdate();
                pstmt.close();
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        <div class="message">
            <% if (!fname.isEmpty()) { %>
                <%= "Attendance recorded for: " + fname + " (UID: " + uid  +")" %>
            <% } else { %>
                <%= "Error: Student Not Register." %>
            <% } %>
        </div>
    </div>
</body>
</html>