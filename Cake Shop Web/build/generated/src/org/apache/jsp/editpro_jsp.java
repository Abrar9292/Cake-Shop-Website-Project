package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class editpro_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <table border=\"2\">\n");
      out.write("        ");

            try
        {
                String uname=(String)session.getAttribute("uname");
                if(uname==null)
                {
                    out.println("Session not found. please Log in again.");
      out.write("\n");
      out.write("                    <a href=\"elogin.html\">Try Again</a>\n");
      out.write("                    ");
return;
                }
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","merateddy","jateddy");
            Statement stmt=con.createStatement();
            
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
                        PreparedStatement updateStmt=con.prepareStatement("UPDATE emp SET fname=?, lname=?, job=?, salary=?, education=? , mobile=? WHERE uname=?");
                            
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
            ResultSet rs=selectStmt.executeQuery();
            
            if(rs.next())
            {
      out.write("\n");
      out.write("            <h2>edit Profile</h2>\n");
      out.write("            <form method=\"post\" action=\"editpro.jsp\">\n");
      out.write("                \n");
      out.write("                <tr><td>Change First Name</td>\n");
      out.write("                    <td><input type=\"text\" name=\"fname\" value=\"");
      out.print( rs.getString("fname"));
      out.write("\"></td></tr>\n");
      out.write("                    <tr><td>Change Last Name</td>\n");
      out.write("                        <td><input type=\"text\" name=\"lname\" value=\"");
      out.print( rs.getString("lname"));
      out.write("\"></td></tr>\n");
      out.write("                    <tr><td>Chane Job</td>\n");
      out.write("                        <td><input type=\"text\" name=\"job\" value=\"");
      out.print( rs.getString("job"));
      out.write("\"></td></tr>\n");
      out.write("                    <tr><td>Change Salary</td>\n");
      out.write("                        <td><input type=\"text\" name=\"sal\" value=\"");
      out.print( rs.getString("sal"));
      out.write("\"></td></tr>\n");
      out.write("                    <tr><td>Change Education</td>\n");
      out.write("                        <td><input type=\"text\" name=\"education\" value=\"");
      out.print( rs.getString("education"));
      out.write("\"></td></tr>\n");
      out.write("                    \n");
      out.write("                    <tr><td>Change Mobile Number</td>\n");
      out.write("                        <td><input type=\"text\" name=\"mob\" value=\"");
      out.print( rs.getString("mob"));
      out.write("\"></td></tr>\n");
      out.write("                    <tr><td><input type=\"Submit\" value=\"Update\"></td></tr>\n");
      out.write("            </form>\n");
      out.write("            ");
}
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

      out.write("\n");
      out.write("        </table>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
