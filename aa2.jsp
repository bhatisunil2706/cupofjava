<html>
<head>
	<%@page import="java.io.*" %>
	<%@page import="java.util.*" %>
	<%@page import="java.util.regex.*" %>

</head>

<body >
<%


ArrayList<String> alist = new ArrayList<String>();
String str=null;

try
{
	boolean b=true;
	
			File fr=new File("D:/software/apache-tomcat-6.0.10/webapps/quickk/temp/mytwo.java");
			FileWriter fg=new FileWriter(fr);
			
			
			fg.write(request.getParameter("tarea"));
			
			fg.flush();
			fg.close();
			File fr1=new File(fr.getParent());
			
			Process pr=Runtime.getRuntime().exec("cmd /c javac"+" "+fr.getName(),null,fr1);
			String line=null;
         	BufferedReader stdError = new BufferedReader(new InputStreamReader(pr.getErrorStream()));  
			
			      

         	while((line = stdError.readLine()) != null) 
         	{	b=false;
			
			
         		str=line;
				alist.add(str);

         	}
         	if(b==true)
         	{
				str="Process completed";
        	}
			
			
}
		catch(Exception e)
		{
			e.printStackTrace();
		
		}
%>
<center>
<b>Your respective compilation output is as follows!</b>
</center>
<textarea name="txtt1" style="width:100%;height:90%;color:#000000;border:solid #2A3F55; font-size:16px; font-family:Georgia, 'Times New Roman', Times, serif;" id="txtara1" readonly="readonly">

<% 

if(alist.size()<=0)
{
 	out.println("Process Completed");
}
else
{
 for(int i=0;i<alist.size();i++)
 {
   out.println(alist.get(i));
 }
}

%>
</textarea>


</body>

</html>