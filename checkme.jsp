<html>
<head>

		<jsp:useBean id="require" class="com.Mybean2" scope="session"/>
		<jsp:setProperty name="require" property="*"/>

</head>

<body>


<% boolean bb=require.result(); %>



<% 
	if(bb==true)
	{
	%>
	
		
	<%
		String gh=request.getParameter("text1");
		
		
	session.setAttribute("user",gh);
			
	 %>
	
	<jsp:forward page="index2.html"/>
	
	<%
	}
	else
	{%>
		<jsp:forward page="notavailable.html"/>
	<%}
%>


</body>

</html>


