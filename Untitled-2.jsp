
<html>
<head>
<style type="text/css">
	#frm1
	{
		background:-webkit-linear-gradient(top,  #2c354e 0%,#576a97 100%);
		color:#FFFFFF;
		
		border-right:groove;
	}
	#ch1
	{
		border-bottom:;
	}
</style>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>



</head>
	
<%
int count=0;
Connection con=null;
PreparedStatement pstmt;
ResultSet res;
boolean b=true;

	ArrayList<String> aList = new ArrayList<String>();


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
		
		
				String qw="select USERNAME from REGISTRATION";
				
				pstmt=con.prepareStatement(qw);
				
				res=pstmt.executeQuery();
				while(res.next())
				{
					String hj=res.getString(1);
					aList.add(hj);
				}
				
				
				for(int y=0;y<aList.size();y++)
				{
					System.out.println("hellllooooooooooooooo");
					if(request.getParameter("txt3").equalsIgnoreCase(aList.get(y)))
					{
						System.out.println("u r in");
						b=false;
						
					}
				}
				
				
				
				if(b)
				{
					System.out.println("r u there");
					
					
					try
					{
					
					System.out.println("r u there22222222");
					String query="insert into REGISTRATION values(?,?,?,?,?,?)";
						
					pstmt=con.prepareStatement(query);
					pstmt.setString(1,request.getParameter("txt1"));
					pstmt.setString(2,request.getParameter("txt2"));
					pstmt.setString(3,request.getParameter("txt3"));
					pstmt.setString(4,request.getParameter("txt4"));
					pstmt.setString(5,request.getParameter("txt6"));
					pstmt.setString(6,"india");					
					
					count=pstmt.executeUpdate();
					
					System.out.println(count);
					%>
					
<frameset rows="23%,*" scrolling="no" frameborder="0">
	<frame src="afterlogin1.jsp" id="ch1" scrolling="no" frameborder="0">
		<frame name="frame2" src="next.html" resizable="false" frameborder="0" scrolling="no">
	
	</frameset><noframes></noframes>
					
					<%
					}
					catch(SQLException r)
					{
					}
					
				}
				else
				{
					%>
					
		<jsp:forward page="Untitled-4.html"/>
					
					
			<%	}
			
		}
		catch(Exception er)
		{
		}
		
					
			
										
		

%>

	<%
	String name=request.getParameter("txt3");
	session.setAttribute("user",name);
	%>
</html>