<html>
<head>
	<style type="text/css">
		
		#i1
		{
			width:100%;
			height:120px;
			background-color:#333366;
		}
		#i11
		{
			width:100%;
			height:90px;
			background-color:#333366;
		}
		#i111
		{
			width:15%;
			height:100%;
			background-color:#333366;
			float:left;
		}
		#i112
		{
			float:left;
			width:40%;
			height:100%;
			background-color:#333366;
		}
#wrapper
{
margin:0px;
padding:0px;
}

#wrapper ul
{
margin:0px;
padding:0px;
}

		img:hover
		{
		 background:#FFFFFF;
		}

#wrapper li
{
margin:0px;
padding:0px;
list-style:none;
float:left;
position:relative;
background:-webkit-linear-gradient(top,  #2c354e 0%,#576a97 100%);
}

#wrapper ul li a{
text-align:center;
font-family:"Courier New", Courier, monospace;
text-decoration:none;
height:28px;
float:left;
width:101.85px;
display:block;
color:#000000;
border:1px solid #000000;
text-shadow:1px 1px 1px;
}

#wrapper li:hover
{
background:#333366;
}
#wrapper a:hover
{

	color:#000000;
}
#wrapper
{
text-align:center;
float:left;
margin-left:0px;

}

		#id2
		{
			width:100%;
			height:300px;
			background-color:#FFFF00;
		}
		#id21
		{
			width:20%;
			height:100%;
			float:left;
			background-color:#333300;
		}

		#km:hover
		{
		background-color:#000000;		}
	
	</style>
		
<script language="JavaScript" type="text/javascript" src="css/images/jquery-2.1.0.min.js"></script>
<script language="JavaScript" type="text/javascript" src="css/images/jquery.cycle.all.js"></script>
<script type="text/javascript">
$('#magicslideshow').cycle({

});
</script>
<script language="text/javascript">
	function close_window() {
 window.close();
  }
}

</script>

<script type="text/javascript">

function change()
{
  
}
</script>
<title></title></head>
<body>
<form name="formm11">
	<header>
		
		<div id="i1">
			
			<div id="i11">
			
				<div id="i111">
					
				</div>
				<div id="i112">

						<h1 style="font-size:50px;color:#FFFFFF;margin:10px;margin-left:140px;">cup<i>OF</i>java.com</h1>
				</div>
				<div id="i113" style="width:auto;">
					<table border="0">
						<tr>
							<td style="color:#FFFFFF;" width="20%"><b>Welcome...<%= session.getAttribute("user") %></b></td>
							<td style="color:#FFFFFF;" width="20%"><a href="Untitled-1.html" id="km" target="_parent" onClick="close_window();" style="margin-left:30%;color:#FFFFFF;"><b>SignOut</b></a></td>
							<td style="color:#FFFFFF;"><a href="index2.html" target="_parent" id="km"  style="color:#FFFFFF;"><b>Home</b></a></td>

						</tr>
						<tr>
						<td colspan="4"><b style="color:#FFFFFF;float:right;">Like Us On</b></td>
							<td><a href="" style="margin-left:40%;"><img src="css/images/imgg/facebook1.jpg"></a></td>
							<td><a href="" style="margin-left:20%;"><img src="css/images/imgg/google1.png"></a></td>
							<td><a href="" style="margin-left:10%;"><img src="css/images/imgg/mail1.png"></a></td>
							<td><a href="" style="margin-left:0%;"><img src="css/images/imgg/rss1.png"></a></td>
							<td><a href="" style="margin-right:10%;"><img src="css/images/imgg/twitter1.png"></a></td>
						</tr>
					</table>
				</div>
				
				
			</div>

			<div id="i12" >
					<div id="wrapper" style="float:left;">
						<ul>
							
							<li ><a href="aa11.jsp" target="_parent" style="color:#FFFFFF;font-family:Georgia, 'Times New Roman', Times, serif;">Core Java</a></li>
							<li ><a href="bb11.jsp" target="_parent" style= "color:#FFFFFF; font-family:Georgia, 'Times New Roman', Times, serif;">Servlet</a></li>
							<li ><a href="#" style="color:#FFFFFF;font-family:Georgia, 'Times New Roman', Times, serif;">JSP</a></li>
							<li ><a href="#"style="color:#FFFFFF;font-family:Georgia, 'Times New Roeeman', Times, serif;">Mail API</a></li>
							<li ><a href="#"style="color:#FFFFFF;font-family:Georgia, 'Times New Roman', Times, serif;">Struts2</a></li>
							<li ><a href="#"style="color:#FFFFFF;font-family:Georgia, 'Times New Roman', Times, serif;">Android</a></li>
							<li ><a href="#"style="color:#FFFFFF;font-family:Georgia, 'Times New Roman', Times, serif;">SQL</a></li>
							<li ><a href="#"style="color:#FFFFFF;font-family:Georgia, 'Times New Roman', Times, serif;">Hibernet</a></li>
							<li ><a href="#"style="color:#FFFFFF;font-family:Georgia, 'Times New Roman', Times, serif;">Certification</a></li>
							<li ><a href="#"style="color:#FFFFFF;font-family:Georgia, 'Times New Roman', Times, serif;">Projects</a></li>
							<li ><a href="cc11.jsp" target="_parent"style="color:#FFFFFF;font-family:Georgia, 'Times New Roman', Times, serif;">Quiz</a></li>
							<li ><a href="dd11.jsp" target="_parent" id="mh" name="comp"style="color:#FFFFFF;font-family:Georgia, 'Times New Roman', Times, serif;">Compiler</a></li>
							<li ><a href="ee11.jsp" target="_parent" style="color:#FFFFFF;font-family:Georgia, 'Times New Roman', Times, serif;">Comment</a></li>
							
					</ul>
				</div>
		</div>
		

	
	</header>
	
	
		
	</form>

</body>
</html>