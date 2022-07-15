<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

		<%
	String fname=request.getParameter("fname");
	String lname=request.getParameter("lname");
	String dob=request.getParameter("dob");
	String user=request.getParameter("user");
	String email=request.getParameter("email");
	String phone=request.getParameter("phone");
	String password=request.getParameter("password");
	String persons=request.getParameter("persons");
	String sdate=request.getParameter("sdate");
       String destination=request.getParameter("destination");
	
		try
		{
		Connection con= null;
      	Class.forName("oracle.jdbc.driver.OracleDriver");
      	con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
		String qry ="insert into  booked values(?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(qry);
			pstmt.setString(1,fname);
			pstmt.setString(2,lname);
			pstmt.setString(3,dob);
			pstmt.setString(4,user);
			pstmt.setString(5,email);
			pstmt.setString(6,phone);
			pstmt.setString(7,password);
			pstmt.setString(8,persons);
            pstmt.setString(9,sdate);
         	pstmt.setString(10,destination);
            
            
            
		int sts = pstmt.executeUpdate();
		if(sts>0){
			
			response.sendRedirect("index.html");
		}
	out.println(sts+ " booked  successfully");
		}
		catch(Exception e)
		{
		out.print(e);
		e.printStackTrace();
		}
		%>