<html>
<head>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>

</head>
<body>


<%
Connection con=null;
PreparedStatement pstmt;
ResultSet res;

String str1=request.getParameter("nm");
String str2=request.getParameter("email");
String str3=request.getParameter("pw");
String str4=request.getParameter("unm");
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
		String ipaddr=InetAddress.getLocalHost().getHostAddress();
		System.out.println(ipaddr+"vvvvvvvvvvvvvv");
		
		
		try
		{
			String fg="insert into COMMENTSTUDY values(?,?,?,?)";
			pstmt=con.prepareStatement(fg);
			pstmt.setString(1,str4);
			pstmt.setString(2,str1);
			pstmt.setString(3,str2);
			pstmt.setString(4,str3);
			
			int y=pstmt.executeUpdate();
		}
		catch(SQLException gh)
		{
			gh.printStackTrace();
		}
		

%>

<jsp:forward page="commenty03.jsp"/>

</body>
</html>