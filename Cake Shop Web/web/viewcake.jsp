<%-- 
    Document   : viewcake
    Created on : 9 Feb, 2025, 4:30:29 AM
    Author     : ASUS
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="2">
        <%
            String cakeid=request.getParameter("n1");
            int cid=Integer.parseInt(cakeid);
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","merateddy","jateddy");
            Statement stmt=con.createStatement();
            
            ResultSet rs=stmt.executeQuery("Select * from cake where cakeid="+cid+"");
            %>
            
            <%=
                "<tr><th>Cake Id</th><th>Cake Name</th><th>Weight</th><th>Quantity</th><th>Price</th><th>Description</th></tr>"
            %>
            
            <%
             while(rs.next())
            {
                %>
           <tr>
                <td><%=rs.getInt(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getInt(3)%></td>
                <td><%=rs.getInt(4)%></td>
                <td><%=rs.getInt(5)%></td>
                <td><%=rs.getString(6)%></td>
           </tr>
                
            
            <%}%>        
           </table>
    </body>
</html>
