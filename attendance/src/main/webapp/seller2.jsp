<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome Seller</title>
    <style>
        /* Styles for decorative elements and welcome message */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: url("images/seller.gif") no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            text-align: center;
            padding: 50px;
        }
        h1 {
            font-size: 3em;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        .navbar {
            margin-top: 30px;
            display: flex;
            justify-content: space-around;
            align-items: center;
            flex-wrap: wrap;
        }

        .navbar a {
            padding: 10px 20px;
            margin: 10px;
            border: none;
            border-radius: 5px;
            font-size: 1.2em;
            cursor: pointer;
            background-color: #4CAF50;
            color: white;
            transition: transform 0.3s ease;
            text-decoration: none;
        }

        .navbar a:hover {
            background-color: #45a049;
            transform: scale(1.1);
        }
        
        /* Card animation */
        .card {
            width: 200px;
            height: 200px;
            position: centre;
            perspective: 1000px;
            margin-top: 50px;
            background-color:transparent; /* Glass green background color */
            border-radius: 10px;
        }

        .card-inner {
            width: 100%;
            height: 100%;
            position: absolute;
            transition: transform 0.6s;
            transform-style: preserve-3d;
        }

        .card:hover .card-inner {
            transform: rotateY(180deg);
        }

        .card-front,
        .card-back {
            width: 100%;
            height: 100%;
            position: absolute;
            backface-visibility: hidden;
            border-radius: 10px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        }

        .card-front {
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 10px;
        }

        .card-back {
            background-color: #555;
            color: white;
            transform: rotateY(180deg);
            padding: 15px;
            border-radius: 10px;
        }

        .card-back p {
            font-size: 14px;
        }
    </style>
</head>
<body>
<div class="main">
    <div class="topbar1"></div>
    <div class="topbar2">
        <div class="container1">
            <div class="logout-btn">
                <a href="Logout.jsp">LOGOUT</a>
            </div>
        </div>
    </div>
    </div>
    <div class="header">
        <div class="container2">
            <div class="navbar">
                <a href="HomePage.html">HOME</a>
                <a href="AddProduct.html">ADD</a>
                <a href="AddInventory.jsp">RESTOCK</a>
                <a href="SellerOrders.jsp">ORDERS</a>
            </div>
        </div>
    </div>
    <div class="active">
        <%@ page import="java.sql.*" %>
        <%@ page import="javax.sql.*" %>
        <%
            HttpSession httpSession = request.getSession();
            String guid=(String)httpSession.getAttribute("currentuser");
        %>
        <div class="filler"></div>
        <h2>welcome Seller</h2>
        <%
            ResultSet rs=null;
            PreparedStatement ps=null;
            java.sql.Connection conn=null;
            String query="select sname,sid,address,phno from seller where sid=?";
            try{
                Class.forName("com.mysql.jdbc.Driver");
                conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/farmer4","root","1234");
                ps=conn.prepareStatement(query);
                ps.setString(1,guid);
                rs=ps.executeQuery();
                if(rs.next())
                {
        %>
        <div class="filler2"></div>
        <div class="card">
            <div class="card-inner">
                <div class="card-front">
                    <img src="images/dw.gif" class="Avatar" width=264 height=194>
                </div>
                <div class="card-back">
                    <h4><b><%=rs.getString("sname") %></b></h4>
                    <p><b>ID: </b><%=rs.getString("sid") %> </p>
                    <p><b>Address: </b><%=rs.getString("address") %></p>
                    <p><b>Phone: </b><%=rs.getString("phno") %></p>
                </div>
            </div>
        </div>
        <%
            }
        }
        catch(Exception e)
        {
            out.println("error: "+e);
        }
        finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {};
            try { if (ps != null) ps.close(); } catch (Exception e) {};
            try { if (conn != null) conn.close(); } catch (Exception e) {};
        }
        %>
    </div>
</body>
</html>
