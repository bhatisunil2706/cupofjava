<html>
<head>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
</head>
<body>

<% 

ArrayList<String> b5List = new ArrayList<String>();
ArrayList<String> b6List = new ArrayList<String>();
ArrayList<String> aList = new ArrayList<String>();
ArrayList<String> bList = new ArrayList<String>();
ArrayList<String> cList = new ArrayList<String>();
ArrayList<String> dList = new ArrayList<String>();
ArrayList<String> eList = new ArrayList<String>();
ArrayList<String> fList = new ArrayList<String>();

ArrayList<String> v1List = new ArrayList<String>();
ArrayList<String> v2List = new ArrayList<String>();
ArrayList<String> v3List = new ArrayList<String>();
ArrayList<String> v4List = new ArrayList<String>();

ArrayList<String> ju = new ArrayList<String>();
Connection con=null;
PreparedStatement pstmt;
ResultSet res;
int a=0,d=0,fg=0;
String sd1v=null,sd2v=null,sd3v=null;


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
			String jk="select COUNT(QUESTION) from QUIZ";
			pstmt=con.prepareStatement(jk);
			
			res=pstmt.executeQuery();
			
			while(res.next())
			{
				a=res.getInt(1);
			}
		}
		catch(Exception h)
		{
			h.printStackTrace();
		}

	for(int l=1;l<=a;l++)
	{
	
		String j=request.getParameter(""+l);
		b5List.add(j);
	}
	outer: for(int l=0;l<b5List.size();l++)
	{
		String ll=b5List.get(l);
		if(ll==null)
		{
			continue outer;
		}
		else
		{
			d++;
		}
	}
	
	
	
	
	try
	{
	
		String kq="select * from QUIZ";
		pstmt=con.prepareStatement(kq);
			
		res=pstmt.executeQuery();
			
		while(res.next())
		{
			String kz=res.getString("ANSWER");
			b6List.add(kz);
		}
	}
	catch(Exception t)
	{
		t.printStackTrace();
	}
	
	String arr1[]=new String[b5List.size()];
	
	String arr2[]=new String[b5List.size()];
	
    for(int p=0;p<b5List.size();p++)
	{
		String sd1=b5List.get(p);
		String sd2=b6List.get(p);
		
		
		arr1[p]=sd1;
		arr2[p]=sd2;
		
	}
		try
		{
			String ret="select QUESTION,OPTION1,OPTION2,OPTION3,OPTION4,REAL from QUIZ";
			
			pstmt=con.prepareStatement(ret);
			
			res=pstmt.executeQuery();
			
			while(res.next())
			
			{
				String h1=res.getString(1);
				aList.add(h1);
				
				String h3=res.getString(2);
				cList.add(h3);
				String h4=res.getString(3);
				dList.add(h4);
				String h5=res.getString(4);
				eList.add(h5);
				String h6=res.getString(5);
				fList.add(h6);
				
				String h2=res.getString(6);
				bList.add(h2);
				
			
			}
			
		}
		catch(SQLException we)
		{
			we.printStackTrace();
		}
	
	try
		{
			String ret="select OPTION11,OPTION22,OPTION33,OPTION44 from QUIZ";
			
			pstmt=con.prepareStatement(ret);
			
			res=pstmt.executeQuery();
			
			while(res.next())
			
			{
				String h1=res.getString(1);
				v1List.add(h1);
				
				String h3=res.getString(2);
				v2List.add(h3);
				
				String h4=res.getString(3);
				v3List.add(h4);
				
				String h5=res.getString(4);
				v4List.add(h5);
			
			
			}
			
		}
		catch(SQLException we)
		{
			we.printStackTrace();
		}
	
	String my[]=new String[b5List.size()];
	
	inner: for(int q=0;q<b5List.size();q++)
	{
		String sd1=arr1[q];
		String sd2=arr2[q];
		
		if(sd1==null)
		{
			my[q]="NOT SELECTED";
			ju.add(null);
		}
		else if(sd1!=null)
		{
			if(sd1.equals(sd2))
			{
				my[q]="CORRECT";
				ju.add(null);
				fg++;
				
			}
			else
			{	
				my[q]="INCORRECT";
				
				if(sd1.equals(v1List.get(q)))
				{
					ju.add(cList.get(q));
										
				}
				else if(sd1.equals(v2List.get(q)))
				{
					ju.add(dList.get(q));
					
				}
				
				else if(sd1.equals(v3List.get(q)))
				{
					ju.add(eList.get(q));
			
				}
				else if(sd1.equals(v4List.get(q)))
				{
					ju.add(fList.get(q));
							System.out.println("vishal kaisa hai"+fList.get(q));
				}
				
			}
		
		}
	}
	for(int h=0;h<ju.size();h++)
	{
		System.out.println(ju.get(h));
	}
	System.out.println("*****************");
	
%>


<h1 >You have scored <%= fg %> out of <%= b5List.size() %></h1>
<br>
<b>The detail is in the following manner:-</b>

<center>
	<table border="1" >
	<tr>
		<th>Q.NO.</th>
		<th>QUESTION</th>
		<th>Option A</th>
		<th>Option B</th>
		<th>Option C</th>
		<th>Option D</th>
		<th>Your Response</th>
	</tr>
	
	<% 
	
		 myloop: for(int h=0;h<b5List.size();h++)
		{
			if(my[h].equals("NOT SELECTED"))
			{
						sd1v=bList.get(h);
					%>
					<%  if(sd1v.equals(cList.get(h)))   
					{%>
							<tr>
		
		
		 	
									<td><%= h+1%></td>
									<td ><%=aList.get(h)%></td>
									<td style="background-color:#006600;"><%=cList.get(h)%></td>
									<td><%=dList.get(h)%></td>
									<td><%=eList.get(h)%></td>
									<td><%=fList.get(h)%></td>
									<td><%=my[h]%></td>		
							</tr>
				 	<% }   else if(sd1v.equals(dList.get(h)))   
					{%>
						<tr>
		
		
		 	
									<td><%= h+1%></td>
									<td ><%=aList.get(h)%></td>
									<td ><%=cList.get(h)%></td>
									<td style="background-color:#006600;"><%=dList.get(h)%></td>
									<td><%=eList.get(h)%></td>
									<td><%=fList.get(h)%></td>
									<td><%=my[h]%></td>		
						</tr>
				
					<% } else if(sd1v.equals(eList.get(h)))   
					{%>
						<tr>
		
		
		 	
									<td><%= h+1%></td>
									<td ><%=aList.get(h)%></td>
									<td ><%=cList.get(h)%></td>
									<td ><%=dList.get(h)%></td>
									<td style="background-color:#006600;"><%=eList.get(h)%></td>
									<td><%=fList.get(h)%></td>
									<td><%=my[h]%></td>		
						</tr>
				
				
					<% } else if(sd1v.equals(fList.get(h)))   
					{%>
						<tr>
		
		
		 	
									<td><%= h+1%></td>
									<td ><%=aList.get(h)%></td>
									<td ><%=cList.get(h)%></td>
									<td ><%=dList.get(h)%></td>
									<td ><%=eList.get(h)%></td>
									<td style="background-color:#006600;"><%=fList.get(h)%></td>
									<td><%=my[h]%></td>		
						</tr>
			
			
		
		
				<% } 
				continue myloop;
				} 
				else if(my[h].equals("CORRECT"))
					{sd2v=bList.get(h);
				%>
					<%  if(sd2v.equals(cList.get(h)))   
					{%>
						<tr>
		
		
		 	
									<td><%= h+1%></td>
									<td ><%=aList.get(h)%></td>
									<td style="background-color:#006600;"><%=cList.get(h)%></td>
									<td><%=dList.get(h)%></td>
									<td><%=eList.get(h)%></td>
									<td><%=fList.get(h)%></td>
									<td><%=my[h]%></td>		
						</tr>
				 	<% }   else if(sd2v.equals(dList.get(h)))   
					{%>
						<tr>
		
		
		 	
									<td><%= h+1%></td>
									<td ><%=aList.get(h)%></td>
									<td ><%=cList.get(h)%></td>
									<td style="background-color:#006600;"><%=dList.get(h)%></td>
									<td><%=eList.get(h)%></td>
									<td><%=fList.get(h)%></td>
									<td><%=my[h]%></td>		
						</tr>
				
					<% } else if(sd2v.equals(eList.get(h)))   
					{%>
						<tr>
		
		
		 	
									<td><%= h+1%></td>
									<td ><%=aList.get(h)%></td>
									<td ><%=cList.get(h)%></td>
									<td ><%=dList.get(h)%></td>
									<td style="background-color:#006600;"><%=eList.get(h)%></td>
									<td><%=fList.get(h)%></td>
									<td><%=my[h]%></td>		
						</tr>
				
				
					<% } else if(sd2v.equals(fList.get(h)))   
					{%>
						<tr>
		
		
		 	
									<td><%= h+1%></td>
									<td ><%=aList.get(h)%></td>
									<td ><%=cList.get(h)%></td>
									<td ><%=dList.get(h)%></td>
									<td ><%=eList.get(h)%></td>
									<td style="background-color:#006600;"><%=fList.get(h)%></td>
									<td><%=my[h]%></td>		
						</tr>
			
			
		
		
				<% } continue myloop;} 
				else if(my[h].equals("INCORRECT"))
				{sd2v=bList.get(h);
					sd3v=ju.get(h);
					
			
					  if(sd2v.equals(cList.get(h)))   
					{
				
					 		if (sd3v.equals(dList.get(h))) {%>
								<tr>
		
							
		 	
									<td><%= h+1%></td>
									<td ><%=aList.get(h)%></td>
									<td style="background-color:#006600;"><%=cList.get(h)%></td>
									<td style="background-color:#FF0000;"><%=dList.get(h)%></td>
									<td><%=eList.get(h)%></td>
									<td><%=fList.get(h)%></td>
									<td><%=my[h]%></td>		
								
								</tr> 
						
							<% } 
						 		else if (sd3v.equals(eList.get(h))) {%>
								<tr>
		
							
		 	
									<td><%= h+1%></td>
									<td ><%=aList.get(h)%></td>
									<td style="background-color:#006600;"><%=cList.get(h)%></td>
									<td ><%=dList.get(h)%></td>
									<td style="background-color:#FF0000;"><%=eList.get(h)%></td>
									<td><%=fList.get(h)%></td>
									<td><%=my[h]%></td>		
								
							</tr> 
						
						<% } 
						
						 	else if (sd3v.equals(fList.get(h))) {%>
							<tr>
		
							
		 	
									<td><%= h+1%></td>
									<td ><%=aList.get(h)%></td>
									<td style="background-color:#006600;"><%=cList.get(h)%></td>
									<td ><%=dList.get(h)%></td>
									<td ><%=eList.get(h)%></td>
									<td style="background-color:#FF0000;"><%=fList.get(h)%></td>
									<td><%=my[h]%></td>		
								
							</tr> 
						
							<% } 
		
						
				  }
			   else if(sd2v.equals(dList.get(h)))  
				{		 
				
						if (sd3v.equals(cList.get(h))) { %>
						<tr>
		
							
		 	
									<td><%= h+1%></td>
									<td ><%=aList.get(h)%></td>
									<td style="background-color:#FF0000;"><%=cList.get(h)%></td>
									<td style="background-color:#006600;"><%=dList.get(h)%></td>
									<td><%=eList.get(h)%></td>
									<td><%=fList.get(h)%></td>
									<td><%=my[h]%></td>		
								
						</tr> 
						
							<% } 
						 else if (sd3v.equals(eList.get(h))) {%>
							<tr>
		
							
		 	
									<td><%= h+1%></td>
									<td ><%=aList.get(h)%></td>
									<td ><%=cList.get(h)%></td>
									<td style="background-color:#006600;"><%=dList.get(h)%></td>
									<td style="background-color:#FF0000;"><%=eList.get(h)%></td>
									<td><%=fList.get(h)%></td>
									<td><%=my[h]%></td>		
								
						</tr> 
						
							<% } 
						
						 else if (sd3v.equals(fList.get(h))) {%>
							<tr>
		
							
		 	
									<td><%= h+1%></td>
									<td ><%=aList.get(h)%></td>
									<td><%=cList.get(h)%></td>
									<td style="background-color:#006600;" ><%=dList.get(h)%></td>
									<td ><%=eList.get(h)%></td>
									<td style="background-color:#FF0000;"><%=fList.get(h)%></td>
									<td><%=my[h]%></td>		
								
						</tr> 
						
						<% } } 
			else if(sd2v.equals(eList.get(h)))  
				{ 
				
				if (sd3v.equals(cList.get(h))) {%>
						<tr>
		
							
		 	
									<td><%= h+1%></td>
									<td ><%=aList.get(h)%></td>
									<td style="background-color:#FF0000;"><%=cList.get(h)%></td>
									<td ><%=dList.get(h)%></td>
									<td style="background-color:#006600;"><%=eList.get(h)%></td>
									<td><%=fList.get(h)%></td>
									<td><%=my[h]%></td>		
								
						</tr> 
						
						<% } 
						 else if (sd3v.equals(dList.get(h))) {%>
						<tr>
		
							
		 	
									<td><%= h+1%></td>
									<td ><%=aList.get(h)%></td>
									<td ><%=cList.get(h)%></td>
									<td style="background-color:#FF0000;"><%=dList.get(h)%></td>
									<td style="background-color:#006600;"><%=eList.get(h)%></td>
									<td><%=fList.get(h)%></td>
									<td><%=my[h]%></td>		
								
						</tr> 
						
						<% } 
						
						 else if (sd3v.equals(fList.get(h))) {%>
						<tr>
		
							
		 	
									<td><%= h+1%></td>
									<td ><%=aList.get(h)%></td>
									<td><%=cList.get(h)%></td>
									<td ><%=dList.get(h)%></td>
									<td style="background-color:#006600;"><%=eList.get(h)%></td>
									<td style="background-color:#FF0000;"><%=fList.get(h)%></td>
									<td><%=my[h]%></td>		
								
						</tr> 
						
						<% }} 
			else if(sd2v.equals(fList.get(h)))  
				{
			
			
					 if (sd3v.equals(cList.get(h))) {%>
						<tr>
		
							
		 	
									<td><%= h+1%></td>
									<td ><%=aList.get(h)%></td>
									<td style="background-color:#FF0000;"><%=cList.get(h)%></td>
									<td ><%=dList.get(h)%></td>
									<td ><%=eList.get(h)%></td>
									<td style="background-color:#006600;"><%=fList.get(h)%></td>
									<td><%=my[h]%></td>		
								
						</tr> 
						
						<% } 
						 else if (sd3v.equals(dList.get(h))) {%>
						<tr>
		
							
		 	
									<td><%= h+1%></td>
									<td ><%=aList.get(h)%></td>
									<td ><%=cList.get(h)%></td>
									<td style="background-color:#FF0000;"><%=dList.get(h)%></td>
									<td ><%=eList.get(h)%></td>
									<td style="background-color:#006600;"><%=fList.get(h)%></td>
									<td><%=my[h]%></td>		
								
						</tr> 
						
						<% } 
						
						 else if (sd3v.equals(eList.get(h))) {%>
						<tr>
		
							
		 	
									<td><%= h+1%></td>
									<td ><%=aList.get(h)%></td>
									<td><%=cList.get(h)%></td>
									<td ><%=dList.get(h)%></td>
									<td style="background-color:#FF0000;"><%=eList.get(h)%></td>
									<td style="background-color:#006600;"><%=fList.get(h)%></td>
									<td><%=my[h]%></td>		
								
						</tr> 
						
						<% } 
		 } continue myloop;}

		
		
		 } %>
	</table>
	</center>
	<br>
	<br>
	
	
	<table border="0" align="right">
	<tr>
	
	<td><img src="css/images/mycolor2.png"></td>
	<td><b>:-INCORRECT</b></td>
	
	</tr>
	
	<tr>
	<td><img src="css/images/mycolor.png">
	</td>
	<td><b>
	:-CORRECT</b>
	</td>
	</tr>
	</table>
	


</body>

</html>

<!-- style="background:-webkit-linear-gradient(top,  #2c354e 0%,#576a97 100%);color:#FFFFFF;"-->