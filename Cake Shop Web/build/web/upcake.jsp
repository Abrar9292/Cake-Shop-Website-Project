<%-- 
    Document   : upcake
    Created on : 9 Feb, 2025, 4:28:09 AM
    Author     : ASUS
--%>

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
        <%
            String cakeid=request.getParameter("n1");
            int cid=Integer.parseInt(cakeid);
            String price=request.getParameter("n2");
            int p=Integer.parseInt(price); 
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","merateddy","jateddy");
            Statement stmt=con.createStatement();
            
            int result=stmt.executeUpdate("update cake set price="+p+" where cakeid="+cid+"");
            
            if(result>0)
                
            {%>
               <%="<h1>one record Added</h1>"%> 
            <%}%>
            <table border="2">
                <tr><th>Cake Id</th><th>Price</th></tr>
                <tr>
                    <td><%=cid%></td>
                    <td><%=p%></td>
                </tr>
            </table>
    </body>
</html>
