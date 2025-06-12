<%-- 
    Document   : esuccess
    Created on : 9 Feb, 2025, 10:27:48 AM
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
    <center>
        <%
            if((session.getAttribute("uname")==null) || (session.getAttribute("uname")==" "))
            {
                
    %>
            you are not logged in
            <a href="elogin.html">Plz Log in</a>
            <%}

           else
        {

%>
        <h1>Welcome <%=session.getAttribute("uname")%></h1>
        <table border="2" bgcolor="yellow">
        <pre>
            <tr><td><a href="addcake.html">Add Cake</a> </td> 
                <td><a href="upcake.html">Update Cake</a></td>
                <td><a href="delcake.html">Delete Cake</a></td>
                <td><a href="viewcake.html">View Cake</a></td>
                <td><a href="editpro.jsp">Edit Profile</a></td>
                <td><a href="logout.jsp" >Logout</a></td></tr>
<% }%>
        </pre>
        </table>
    </center>
        
    </body>
</html>
