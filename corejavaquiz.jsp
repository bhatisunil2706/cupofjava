<html>
<head>
<h2 style="color:red;margin-left:900px;">Timer</h2>
<span id="countdown" class="timer" style="color:#FF0000;margin-left:930px;"></span>
<script>
var seconds = 60;
function secondPassed() {
    var minutes = Math.round((seconds - 30)/60);
    var remainingSeconds = seconds % 60;
    if (remainingSeconds < 10) {
        remainingSeconds = "0" + remainingSeconds;  
    }
    document.getElementById('countdown').innerHTML = minutes + ":" + remainingSeconds;
    if (seconds == 0) {
        <!--clearInterval(countdownTimer);
        <!--document.getElementById('countdown').innerHTML = "Buzz Buzz";
		
		document.quiz.submit();
		
		<!--window.open("answer.jsp","_self","","");
    } else {
        seconds--;
    }
}
 
var countdownTimer = setInterval('secondPassed()', 1000);
</script>


<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<style type="text/css">

#button{
color:#FFFFFF;background:-webkit-linear-gradient(top,  #2c354e 0%,#576a97 100%);
background-color:;
font-size:14px;
font-style:normal;
border-radius:2px;
width:80px;
height:30px;
}

#qw{
  width: 19px;
  height: 15px;
  padding: 0 5px 0 0;
  background: url(checkbox.png) no-repeat;
  display: block;
  clear: left;
  float: left;
  color:#333366;
  background-color:#333366;
}
#input[type='radio']:active
{
	color:#333366;
	background-color:#333366;
	background:#333366;
}
</style>

</head>

<body>
<form name="quiz" action="answer.jsp" id="mkl">

	<%
int count=0;
Connection con=null;
PreparedStatement pstmt;
ResultSet res;
boolean b=true;

	ArrayList<String> aList = new ArrayList<String>();
	ArrayList<String> b1List = new ArrayList<String>();
	ArrayList<String> b2List = new ArrayList<String>();
	ArrayList<String> b3List = new ArrayList<String>();
	ArrayList<String> b4List = new ArrayList<String>();


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
			String ret="select QUESTION,OPTION1,OPTION2,OPTION3,OPTION4 from QUIZ";
			
			pstmt=con.prepareStatement(ret);
			
			res=pstmt.executeQuery();
			
			while(res.next())
			
			{
				String h1=res.getString(1);
				aList.add(h1);
				
				String h2=res.getString(2);
				b1List.add(h2);
				
				String h3=res.getString(3);
				b2List.add(h3);
				
				String h4=res.getString(4);
				b3List.add(h4);
				
				String h5=res.getString(5);
				b4List.add(h5);
			}
			
		}
		catch(SQLException we)
		{
			we.printStackTrace();
		}
		
		String sd1[]=new String[b1List.size()];
		String sd2[]=new String[b1List.size()];
		String sd3[]=new String[b1List.size()];
		String sd4[]=new String[b1List.size()];
		
		for(int jk=0;jk<b1List.size();jk++)
		{
			String sd=b1List.get(jk);
			String df=b2List.get(jk);
			String gh=b3List.get(jk);
			String kl=b4List.get(jk);
			
			sd1[jk]=sd.replace(" ","a");
			sd2[jk]=df.replace(" ","a");
			sd3[jk]=gh.replace(" ","a");
			sd4[jk]=kl.replace(" ","a");
		}
		for(int a=0;a<aList.size();a++)
		{
			int bb=a+1;
			
		%>
		
		<b><b>Q.(</b><%= bb %><b>).</b><%out.print(aList.get(a));%></b>
			<br>
			
			
			    <input type="radio" name =<%=bb %> id="qw" value=<%= sd1[a] %>><%out.print(b1List.get(a));%><br>
				<input type="radio" name =<%=bb %> id="qw" value=<%= sd2[a] %>><%out.print(b2List.get(a));%><br>
				<input type="radio" name =<%=bb %> id="qw" value=<%= sd3[a] %>><%out.print(b3List.get(a));%><br>
				<input type="radio" name =<%=bb %> id="qw" value=<%= sd4[a] %>><%out.print(b4List.get(a));%><br><br>
			
			
		<%}
					
			
										
		

%>

<center><input type="submit" value="submit" id="button"></center>
</form>
</body>

</html>