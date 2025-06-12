<%-- 
    Document   : view
    Created on : 9 Feb, 2025, 3:42:12 AM
    Author     : ASUS
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
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
            String empid=request.getParameter("n1");
            int eid=Integer.parseInt(empid);
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","merateddy","jateddy");
            Statement stmt=con.createStatement();
            
            ResultSet rs=stmt.executeQuery("Select * from emp where empid="+eid+"");
            %>
            
            <%=
                "<tr><th>Employee Id</th><th>First Name</th><th>Last Name</th><th>Job</th><th>Salary</th><th>Education</th><th>User Name</th><th>Password</th><th>Mobile Number</th></tr>"
            %>
            
            <%
             while(rs.next())
            {
                %>
           <tr>
                <td><%=rs.getInt(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getString(4)%></td>
                <td><%=rs.getInt(5)%></td>
                <td><%=rs.getString(6)%></td>
                <td><%=rs.getString(7)%></td>
                <td><%=rs.getString(8)%></td>
                <td><%=rs.getInt(9)%></td>
                
            
            <%}%>        
           </table>
    </body>
</html>
