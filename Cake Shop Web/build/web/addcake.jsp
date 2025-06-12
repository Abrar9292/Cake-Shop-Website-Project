<%-- 
    Document   : addcake
    Created on : 9 Feb, 2025, 4:26:42 AM
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
            String name=request.getParameter("n2");
            String weight=request.getParameter("n3");
            int we=Integer.parseInt(weight);
            String quantity=request.getParameter("n4");
            int q=Integer.parseInt(quantity);
            String price=request.getParameter("n5");
            int p=Integer.parseInt(price);
            String des=request.getParameter("n6");
            
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","merateddy","jateddy");
            Statement stmt=con.createStatement();
            
            int result=stmt.executeUpdate("insert into cake values("+cid+",'"+name+"',"+we+","+q+","+p+",'"+des+"')");
            
            if(result>0)
                
            {%>
               <%="<h1>one record Added</h1>"%> 
            <%}%>
            <table border="2">
                <tr><th>Cake Id</th><th>Cake Name</th><th>Weight</th><th>Quantity</th><th>Price</th><th>Description</th></tr>
                <tr><td><%=cid%></td>
                    <td><%=name%></td>
                    <td><%=we%></td>
                    <td><%=q%></td>
                    <td><%=p%></td>
                    <td><%=des%></td>
                </tr>
            </table>
    </body>
</html>
