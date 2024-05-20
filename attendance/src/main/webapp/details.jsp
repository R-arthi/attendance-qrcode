<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Attendance Form</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url("images/a6.gif") center/cover no-repeat fixed;
            color: #fff;
            margin: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
        }
        div {
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
        #qrcode {
            margin-top: 15px;
        }
    </style>
</head>
<body>
   <div> <h2>Attendance Present Form</h2>
     <form  action="uploadImage.jsp" method="post" enctype="multipart/form-data">
       <input type="file" name="image" >
        <input type="submit" value="Upload" >
        </form>
         <form  action="processAttendance.jsp" method="get">
        
        <label for="uid">Roll No:</label>
        <input type="text" id="uid" name="uid" required>
        <button type="submit">Submit Attendance</button>
        </form>
       </div>
</body>
</html>
