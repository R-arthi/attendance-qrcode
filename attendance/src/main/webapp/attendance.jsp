<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Management System</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url("images/a2.gif") center/cover no-repeat;
            color: #fff;
            margin: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
        }

       h1 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 2em;
            color: #ffcc00; /* Change the color to your preference */
        }

        form {
            text-align: center;
        }

       button {
            background-color: #3498db;
            color: #fff;
            padding: 15px 30px;
            font-size: 1.2em;
            border: none;
            border-radius: 8px;
            margin-bottom: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <h1>Welcome to Student Management System</h1>
    <form action="details.jsp" method="get">
        <button type="submit" name="action" value="viewDetails">Give Attendance</button>
    </form>
     <div class="button-container">
      <button class="button-like-text" onclick="window.location.href='UserView.jsp'">Information</button>
     </div>
</body>
</html>