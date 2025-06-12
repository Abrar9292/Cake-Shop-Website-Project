<%-- 
    Document   : addemp
    Created on : 8 Feb, 2025, 6:57:16 PM
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
            String empid=request.getParameter("n1");
            int eid=Integer.parseInt(empid);
            String fname=request.getParameter("n2");
            String lname=request.getParameter("n3");
            String job=request.getParameter("n4");
            String salary=request.getParameter("n5");
            int sal=Integer.parseInt(salary);
            String education=request.getParameter("n6");
            String uname=request.getParameter("n7");
            String pass=request.getParameter("n8");
            String mobile=request.getParameter("n9");
            long mob=Long.parseLong(mobile);
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","merateddy","jateddy");
            Statement stmt=con.createStatement();
            
            int result=stmt.executeUpdate("insert into emp values("+eid+",'"+fname+"','"+lname+"','"+job+"',"+sal+",'"+education+"','"+uname+"','"+pass+"',"+mob+")");
            
            if(result>0)
                
            {%>
               <%="<h1>one record Added</h1>"%> 
            <%}%>
            <table border="2">
                <tr><th>Employee Id</th><th>First Name</th><th>Last Name</th><th>Job</th><th>Salary</th><th>Education</th><th>User Name</th><th>Password</th><th>Mobile Number</th></tr>
                <tr><td><%=eid%></td>
                    <td><%=fname%></td>
                    <td><%=lname%></td>
                    <td><%=job%></td>
                    <td><%=sal%></td>
                    <td><%=education%></td>
                    <td><%=uname%></td>
                    <td><%=pass%></td>
                    <td><%=mob%></td>
            </table>
        
    </body>
</html>
