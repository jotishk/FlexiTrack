<!DOCTYPE html>
<%@ page import="java.sql.*" %>

<html>
    <head>
        <title>Log In</title>
        <link href="FlexiTrackLoginCSS.css" rel="stylesheet">
    </head>
    <body>
        <div class = "log-in-box">
            <p class = "log-in-text">LOGIN</p>
            <form action = "" method = "post">
                <input class = "username-box" type = "text" name = "username" placeholder="Username">
                <input class = "password-box" type = "password" name = "password" placeholder="Password">
                <input class = "sign-in-box" type = "submit" value = "Sign In">
            </form>
            <%
            try {
                String username = request.getParameter("username");
                String password = request.getParameter("password"); 
                
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection c = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "orcl");
                Statement stmt = c.createStatement();
                ResultSet accounts = stmt.executeQuery("select * from FlexiTrackLoginInformation");
                while (accounts.next()) {
                    String usernameToTest = accounts.getString("Username");
                    if (usernameToTest.equals(username)) {
                        String passwordToTest = accounts.getString("Pass");
                        if (passwordToTest.equals(password)) {
                            response.sendRedirect("http://localhost:8080/flexitrack/FlexiTrackDashboard.jsp?value=" + username);
                        }
                    }
                }
                c.close();
                stmt.close();
                accounts.close();

            } catch (Exception e) {
                
            }
            %>
        </div>
    </body>
</html>