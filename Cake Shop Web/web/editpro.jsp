<%--- 
    Document   : editpro
    Created on : 11 Feb, 2025, 6:14:39 PM
    Author     : ASUS
--%>


<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
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
        try
        {
                String uname=(String)session.getAttribute("uname");
                if(uname==null)
                {
                    out.println("Session not found. please Log in again.");%>
                    <a href="elogin.html">Try Again</a>
                    <%return;
                }
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","merateddy","jateddy");
            
            
            if("POST".equals(request.getMethod()))
            {
                try
                {
                        String fname=request.getParameter("fname");
                        String lname=request.getParameter("lname");
                        String job=request.getParameter("job");
                        String sal=request.getParameter("sal");
                        String education=request.getParameter("education");
                        String mob=request.getParameter("mob");
                    if(mob !=null && fname !=null && lname !=null && job !=null && sal !=null && education !=null)
                    {
                        PreparedStatement updateStmt=con.prepareStatement("UPDATE emp SET fname=?, lname=?, job=?, sal=?, education=? , mob=? WHERE uname=?");
                            
                        updateStmt.setString(1, fname);
                        updateStmt.setString(2, lname);
                        updateStmt.setString(3, job);
                        updateStmt.setString(4, sal);
                        updateStmt.setString(5, education);
                        updateStmt.setString(6, mob);
                        updateStmt.setString(7, uname);

                        int Updated=updateStmt.executeUpdate();
                        if(Updated>0)
                        {
                            out.println("Udated Sucessfully");
                        }
                        updateStmt.close();
                   }
                }
                catch(SQLException e)
                {
                    out.println("Error Updating Profile: "+e.getMessage());
                }
            }
            PreparedStatement selectStmt=con.prepareStatement("select * from emp where uname=?");
            selectStmt.setString(1,uname);
            ResultSet rs=selectStmt.executeQuery();
            
            if(rs.next())
            {%>
            <h2>Edit Profile</h2>
            <form method="post" action="editpro.jsp">
                
                <tr><td>First Name</td>
                    <td><input type="text" name="fname" value="<%= rs.getString("fname")%>"></td></tr>
                    <tr><td>Last Name</td>
                        <td><input type="text" name="lname" value="<%= rs.getString("lname")%>"></td></tr>
                    <tr><td>Job</td>
                        <td><input type="text" name="job" value="<%= rs.getString("job")%>"></td></tr>
                    <tr><td>Salary</td>
                        <td><input type="text" name="sal" value="<%= rs.getString("sal")%>"></td></tr>
                    <tr><td>Education</td>
                        <td><input type="text" name="education" value="<%= rs.getString("education")%>"></td></tr>
                    
                    <tr><td>Mobile Number</td>
                        <td><input type="text" name="mob" value="<%= rs.getString("mob")%>"></td></tr>
                    <tr><td><input type="Submit" value="Update"></td></tr>
            </form>
            <%}
            else
            {
                 out.println("user data not fount. ");           
            }
                    rs.close();
                    selectStmt.close();
                    con.close();
        }catch(Exception e)
                {
                    out.println("Error: "+e.getMessage());
                    e.printStackTrace();
                }
%>
        </table>
    </body>
</html>
