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
   
   $("#b12").slideDown("slow");
   });

});

</script>


<script type="text/javascript" src="javascript/jquery-1.11.0.js"></script>
	<!--<script type="text/javascript" src="javascript/myjsp.js"></script>-->
	<script type="text/javascript" src="javascript/jquery.validate.pack.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function(){
		
		
		$("#fm").validate({ 
		
		rules:{
			email:{
				email:true
				
			},
			pw:{
				minlength:8
			}
		
		},
		
		
		});
		});
		
			
	
	
	</script>

</head>


<body>


<%

	
ArrayList<String> aList = new ArrayList<String>();
ArrayList<String> bList = new ArrayList<String>();
ArrayList<String> cList = new ArrayList<String>();
ArrayList<String> dList = new ArrayList<String>();
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
		


%>

<div id="a1" style="width:100%;height:10%;">

<div style="width:10%;height:auto;float:left;"><img src="css/images/avatar92.jpg" style="height:100%;border-radius:3px;margin-left:30%;"></div>
<div style="width:80%;height:auto;">
<textarea id="countMe" cols="70" rows="2" style="font-size:18px;resize:none;wrap:hard;border-radius:5px;border:solid #333366;" placeholder="JOIN US FOR DISCUSSION"></textarea>
</div>

</div>


<div id="b12" style="display:none;width:190%;height:170%;margin-left:10%;">
<div style="width:70%;">
<form action="savecmmnt.jsp" id="fm">

<table border="0" style="background:-webkit-linear-gradient(top,  #2c354e 0%,#576a97 100%);width:40%;height:20%; border:solid #333366;border-radius:5px;">

<tr>
<td style="color:#FFFFFF;width:20%;height:auto;border-radius:5%;"><center><b>Username:-</b></center></td>
<td ><input type="text" style="width:40%;height:100%;border-radius:5%;" name="unm" id="unm" value=<%= session.getAttribute("user") %> readonly="readonly"></td>
</tr>
<tr>
<td style="color:#FFFFFF;width:20%;height:auto;border-radius:5%;"><center><b>Name:-</b></center></td>
<td ><input type="text" style="width:40%;height:100%;border-radius:5%;" name="nm" id="nm" placeholder="Enter name" required></td>
</tr>
<tr>
<td style="color:#FFFFFF;width:20%;height:auto;border-radius:5%;"><center><b>Email ID:-</b></center></td>
<td><input type="text" style="width:40%;height:100%;border-radius:5%;" name="email" id="email" placeholder="Enter Email" required></td>
</tr>
<tr>
<td style="color:#FFFFFF;width:20%;height:auto;border-radius:5%;"><center><b>Password:-</b></center></td>
<td><input type="password" style="width:40%;height:100%;border-radius:5%;" name="pw" id="pw" placeholder="Enter password" required></td>
</tr>
<td colspan="2"><center><input type="submit" value="post" style="background:-webkit-linear-gradient(top,  #2c354e 0%,#576a97 100%);color:#FFFFFF;width:10%;"></center></td>
</tr>

</table>
</form>
</div>
</div>

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
