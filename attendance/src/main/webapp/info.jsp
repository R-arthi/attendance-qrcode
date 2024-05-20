<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Staff Input</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: lightPink;
            margin: 0;
            padding: 0;
        }

        form {
            background-color: #fff;
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            border-radius: 4px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
        }

        input[type="text"],
        textarea {
            width: calc(100% - 20px);
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        textarea {
            resize: vertical;
        }

        input[type="submit"] {
            background-color: #f90;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #ffaa00;
        }
    </style>
</head>
<body>
    <h1>Add Information</h1>
    <form action="AdminInputProcess.jsp" method="post">
        <label for="productName">Title:</label>
        <input type="text" id="productName" name="productName" required><br><br>
        
        <label for="description">Description:</label><br>
        <textarea id="description" name="description" rows="4" cols="50"></textarea><br><br>
        
        <input type="submit" value="Add Product">
    </form>
</body>
</html>
