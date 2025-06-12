<%-- 
    Document   : alogin
    Created on : 7 Feb, 2025, 6:45:49 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <%
        String uname=request.getParameter("n1");
        String pass=request.getParameter("n2");
        
        String un="abrar";
        String ps="abrar@123";
        
        if(uname.equals(un) && pass.equals(ps))
        {
            response.sendRedirect("sucess.html");
        }
        %>

           
    </body>
</html>
