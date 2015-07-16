
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
		border-bottom:double;
	}
</style>


		<jsp:useBean id="require" class="com.Mybean2" scope="session"/>

</head>
<frameset rows="23%,*" frameborder="no" >
	<frame src="afterlogin.jsp" id="ch1" scrolling="no">
		<frameset cols="50%,*">
			<frame name="frame1" id="frm1" src ="mycompiler.html" style="background:-webkit-linear-gradient(top,  #2c354e 0%,#576a97 100%);color:#FFFFFF;">
			<frame name="frame2" src="UntitledFrame-1">
		</frameset>
	
	</frameset><noframes></noframes>

	<%
	
		out.print("u r inininininin jhjfhkjdhkg dsjgfdsjfdsf");
		String gift=require.getText1();
		
		
	pageContext.setAttribute("user",gift,PageContext.APPLICATION_SCOPE);
			
	 %>
	
</html>>
