<%-- 
    Document   : logout
    Created on : 11 Feb, 2025, 5:32:21 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="red">
        <% session.setAttribute("uname",null);
            session.invalidate();
            response.sendRedirect("main.html");
            %>
    </body>
</html>
