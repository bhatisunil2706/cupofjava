<html>
<head>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>



<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js">
</script>


</head>


<body>
		
	 
	 <%
	String uname= (String)session.getAttribute("user");
	 
	 %>

<%
Connection con=null;
PreparedStatement pstmt;
ResultSet res;
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
		System.out.println(ipaddr);
		
		
		try
		{
		
			String sdr="select * from COMMENTSTUDY where username=? ";
			pstmt=con.prepareStatement(sdr);
			pstmt.setString(1,uname);
			res=pstmt.executeQuery();
			
			if(res.next())
			{%>
				<jsp:forward page="commenty01.jsp" />
			<%}
			else
			{%>
			<jsp:forward page="commenty02.jsp" />
				
			<%}
		}
		catch(SQLException gh)
		{
			gh.printStackTrace();
		}

%>


</body>

</html>