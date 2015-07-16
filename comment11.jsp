<html>
<head>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>

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

%>

<div id="a1" style="width:100%;height:10%;">

<div style="width:10%;height:auto;float:left;"><img src="avatar92.jpg" style="height:100%;border-radius:3px;"></div>
<div style="width:80%;height:auto;">
<textarea id="countMe" cols="70" rows="2" style="font-size:18px;resize:none;wrap:hard;border-radius:5px;border:solid #999999;" placeholder="JOIN US FOR DISCUSSION"></textarea>
</div>

<div id="b11" style="display:none;width:80%;height:auto;">

<table border="2" style="background-color:#808080;width:73.5%; border:solid #999999;border-radius:5px;">
<tr>
<td style="color:#FFFFFF;"><center><b>Submit your message by clicking post button</b></center></td>
<td><input type="submit" value="post" readonly="readonly" style="background-color:#999999;color:#FFFFFF;width:100%;"></td>
</tr>

</table>

</div>
</div>



</body>

</html>