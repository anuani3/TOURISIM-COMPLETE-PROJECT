<%@ page import="java.sql.*" %>

		<%
		String eid=request.getParameter("User");
		String pass=request.getParameter("password");
		try
		{
			if(eid.equals("admin") && pass.equals("admin")){
				response.sendRedirect("admin.html");
			}
			else{
				Connection con= null;
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
				String qry ="select username from Register where username=? and password=?";
				PreparedStatement pstmt = con.prepareStatement(qry);
				pstmt.setString(1,eid);
				pstmt.setString(2,pass);
				
				ResultSet rs= pstmt.executeQuery();
				while(rs.next())
				{
							if(eid.equals(rs.getString(1))){
								response.sendRedirect("index.html");
							}			 
				}
				
				out.print("Either user name or password entered wrong.....<br>You are not a valid user please register......");
			}

		}
		catch(Exception e)
		{
		out.print(e);
		e.printStackTrace();
		}
		%>