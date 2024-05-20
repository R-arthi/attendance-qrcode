<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>User View</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: green;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .flip-card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding-top: 30px;
        }

        .flip-card {
            background-color: transparent;
            width: 300px;
            height: 200px;
            perspective: 1000px;
            margin: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .flip-card-inner {
            position: relative;
            width: 100%;
            height: 100%;
            text-align: center;
            transition: transform 0.6s;
            transform-style: preserve-3d;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        }

        .flip-card:hover .flip-card-inner {
            transform: rotateY(180deg);
        }

        .flip-card-front,
        .flip-card-back {
            position: absolute;
            width: 100%;
            height: 100%;
            -webkit-backface-visibility: hidden;
            backface-visibility: hidden;
            border-radius: 10px;
        }

        .flip-card-front {
            background-color: #fff;
            color: #333;
            border: 1px solid #ccc;
            border-radius: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .flip-card-back {
            background-color: orange;
            color: white;
            transform: rotateY(180deg);
            padding: 15px;
            border-radius: 10px;
        }

        .flip-card-back p {
            font-size: 14px;
        }

        .flip-card h3 {
            margin: 0;
            padding: 0;
        }
    </style>
</head>
<body>
    <h1></h1>
    <div class="flip-card-container">
        <% 
            Connection conn = null;
            Statement stmt = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/qrcode", "root", "1234");
                stmt = conn.createStatement();
                String sql = "SELECT * FROM info";
                ResultSet rs = stmt.executeQuery(sql);
                while(rs.next()){
        %>
        <div class="flip-card">
            <div class="flip-card-inner">
                <div class="flip-card-front">
                    <h3><%= rs.getString("Title") %></h3>
                </div>
                <div class="flip-card-back">
                    <p>Description: <%= rs.getString("description") %></p>
                </div>
            </div>
        </div>
        <%
                }
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </div>
</body>
</html>
