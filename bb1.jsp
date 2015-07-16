
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

<script language="javascript" type="text/javascript">
  function resizeIframe(obj) {
    obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
  }
  
  function change()
  {
  	document.getElementById('ch2').cols="30%,*";
  }
</script>


		<jsp:useBean id="require" class="com.Mybean2" scope="session"/>

</head>

<frameset rows="23%,*" frameborder="no" >
	<frame src="afterlogin.jsp" id="ch1" scrolling="no" >
		<frameset cols="16%,*" id="ch2" >
			<frame name="frame1" id="frm1" resizable="true" src ="quiz.html" style="background:-webkit-linear-gradient(top,  #2c354e 0%,#576a97 100%);color:#FFFFFF;">
			<frame name="frame2" src="whatisjava.html" resizable="true">
		</frameset>
	
	</frameset><noframes></noframes>
	
	<%
		String gift=require.getText1();
		
		
	pageContext.setAttribute("user",gift,PageContext.APPLICATION_SCOPE);
			
	 %>
	
</html>>
>
