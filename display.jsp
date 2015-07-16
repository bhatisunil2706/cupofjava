<html>
<head>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>


</head>


<body>

	 <%
	 System.out.println("hello vishal u r doing");
	String uname= (String)session.getAttribute("user");
	 
	 %>

<%
Connection con=null;
PreparedStatement pstmt;
ResultSet res;
String sdf=null,pdf=null,str11=null;
		try
		{
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();

		}
		try
		{
			
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","COMPILER","COMPILER");
		}
		catch(SQLException ev)
		{
				ev.printStackTrace();
		}
		
		
		try
		{
		
			String sdr="select * from COMMENTSTUDY where username=? ";
			pstmt=con.prepareStatement(sdr);
			pstmt.setString(1,uname);
			res=pstmt.executeQuery();
			
			while(res.next())
			{
				sdf=res.getString("Name");
				
				System.out.println("vishal look here 22222222222"+sdf);
			}
		}
		catch(SQLException gh)
		{
			gh.printStackTrace();
		}

		try
		{
			String sdfg="insert into DISPLAY values(?,?,?)";
			pstmt=con.prepareStatement(sdfg);
			pstmt.setString(1,uname);
			pstmt.setString(2,sdf);
			pstmt.setString(3,request.getParameter("tarea"));
			
			int hj=pstmt.executeUpdate();
			
		}
		catch(Exception gh)
		{
			gh.printStackTrace();
		}
		
%>
<jsp:forward page="displayafter.jsp"/>
</body>
</html>