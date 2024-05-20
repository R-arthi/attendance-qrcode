<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Seller Registration</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Background and basic styling */
        body {
            margin: 0;
            padding: 0;
            background: url("images/sellerdetails.gif") repeat center center fixed;
            background-size: cover;
            background-position: center;
            font-family: Arial, sans-serif;
            background-color: black;
        }

        .container {
            max-width: 500px;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 8px;
            color: #555;
        }

        input[type="text"],
        input[type="password"] {
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            padding: 12px 0;
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Seller Registration</h1>
        <form action="registeredseller.jsp" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <label for="email">Email:</label>
            <input type="text" id="email" name="email" required>

            <label for="full_name">Full Name:</label>
            <input type="text" id="full_name" name="full_name" required>

            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required>

            <label for="phone_number">Phone Number:</label>
            <input type="text" id="phone_number" name="phone_number" required>

            <input type="submit" value="Register">
        </form>
    </div>

</body>
</html>
