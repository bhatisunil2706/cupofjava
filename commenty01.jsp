<html>
<head>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>



<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js">
</script>
<script>
$(document).ready(function(){

  $("#countMe").mousedown(function(){
   
   $("#b11").slideDown("slow");
   });

});

</script>

</head>


<body>

	 
	 <%
	String uname= (String)session.getAttribute("user");
	 
	
ArrayList<String> aList = new ArrayList<String>();
ArrayList<String> bList = new ArrayList<String>();
ArrayList<String> cList = new ArrayList<String>();
ArrayList<String> dList = new ArrayList<String>();
	 %>

<%
Connection con=null;
PreparedStatement pstmt;
ResultSet res;
String sdf=null,pdf=null;
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
		
		String ipaddr=InetAddress.getLocalHost().getHostAddress();
			String sdr="select * from COMMENTSTUDY where username=? ";
			pstmt=con.prepareStatement(sdr);
			pstmt.setString(1,uname);
			res=pstmt.executeQuery();
			
			while(res.next())
			{
				sdf=res.getString("Name");
				pdf="Post"+"_"+sdf;
				System.out.println("vishal look here"+pdf);
			}
		}
		catch(SQLException gh)
		{
			gh.printStackTrace();
		}
		
		try
		{
			String sdr="select * from DISPLAY";
			pstmt=con.prepareStatement(sdr);
			
			res=pstmt.executeQuery();
			
			while(res.next())
			{
				String h1=res.getString(1);
				aList.add(h1);
				String h2=res.getString(2);
				bList.add(h2);
				String h3=res.getString(3);
				cList.add(h3);
					
			}
		}
		catch(SQLException jk)
		{
			jk.printStackTrace();
		}

		
		session.setAttribute("yourname",sdf);
		

%>
<form action="display.jsp">

<div id="a1" style="width:100%;height:10%;">
<center><h1>Hello <%= sdf %>!enjoy your account and learn more</h1></center>
<div style="width:10%;height:auto;float:left;"><img src="css/images/avatar92.jpg" style="height:100%;border-radius:3px;margin-left:30%;"></div>
<div style="width:80%;height:auto;">
<textarea id="countMe" cols="70" rows="2" name="tarea" style="font-size:18px;resize:none;wrap:hard;border-radius:5px;border:solid #333366;" placeholder="JOIN US FOR DISCUSSION"></textarea>
</div>

				<div id="b11" style="display:none;width:100%;height:auto;margin-left:10%;">

				<table border="2" style="background:-webkit-linear-gradient(top,  #2c354e 0%,#576a97 100%); border:solid #999999;border-radius:5px;width:50%;">
				<tr>
					<td style="color:#FFFFFF;"><center><b>Submit your message by clicking post button</b></center></td>
					<td><input type="submit" value=<%=pdf%> readonly="readonly" style="background:-webkit-linear-gradient(top,  #2c354e 0%,#576a97 100%);color:#FFFFFF;width:100%;">
					</td>
					</tr>

				</table>

				</div>
</div>
</form>
<br>
<br>
<br>
<br>
<br>
<br>
<% for(int y=0;y<aList.size();y++) {%>

<div style="width:70%;height:15%;background-color:#0000FF;max-height:100%;">

	<div style="width:10%;height:100%;background-color:#FF0066;float:left;">
	<img src="css/images/avatar92.jpg" style="margin: 2%;height:70%;border-radius:4%;">
	</div>
	
	<div style="width:auto;height:100%;background-color:#663300;">
		<div style="width:100%;height:25%;background-color:#FFDF55;">
		<%= bList.get(y)  %>
		
		</div>
		<div style="width:100%;height:50%;background-color:#FF5FAA;max-width:100%;">
		<%= cList.get(y) %>
		
		</div>
		<div style="width:100%;height:25%;background-color:#A0A0A4;">
		<a href="" style="float:right;margin-right:5%;">Reply</a>
		
		</div>
		
	
	</div>
	</div>
	<br>
	<br>
<%}%>
</div>

</body>

</html>
