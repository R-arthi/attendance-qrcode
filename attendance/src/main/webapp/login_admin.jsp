<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Staff Login</title>
     <style>
        /* Your CSS styles for the login form */

        /* Background and layout */
        body {
            font-family: Arial, sans-serif;
            background-image: url('images/a8.gif'); /* Replace with your image URL */
            background-size: cover;
            background-repeat: no-repeat;
            height: 100vh; /* Full viewport height */
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .login-container {
            width: 300px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white background */
        }

        /* Header styles */
        .login-container h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        /* Form input styles */
        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        .form-group input[type="text"],
        .form-group input[type="password"] {
            width: calc(100% - 10px);
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 3px;
            color: #333;
        }

        /* Submit button styles */
        .form-group input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 3px;
            background-color: rgb(0,0,0);
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-group input[type="submit"]:hover {
            background-color:rgb(0,0,0);
        }

        /* Styles for the 'Create a new one' link */
        .new-account-link {
            text-align: center;
            margin-top: 20px;
            color: #333;
        }

        .new-account-link a {
            color: rgb(0,0,0);
            text-decoration: none;
            font-weight: bold;
        }
        .new-account-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>Staff Login</h1>
        <form action="authenticate_admin.jsp" method="post" class="login-form">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
            <div class="form-group">
                <input type="submit" value="Login">
            </div>
        </form>
        <div class="new-account-link">
            <p>Don't have an account? <a href="register_admin.html">Create a new one</a></p>
        </div>
    </div>
</body>
</html>