package com;
import java.sql.*;
public class Mybean2
{
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet res;
	String text1,text2;
	
	public void setText1(String text1)
	{
		this.text1=text1;
	}
	
	public void setText2(String text2)
	{
		this.text2=text2;
	}
	
	
	
	public String getText1()
	{
		
		return text1;
		
	}
		
	public String getText2()
	{
		return text2;
	}
	
	public boolean result()
	{
		
		System.out.println(text1);
		System.out.println(text2);
		boolean b1=false;
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
						String query="select PASSWORD from REGISTRATION where USERNAME=?";
						
						pstmt=con.prepareStatement(query);
						pstmt.setString(1,text1);
						
						res=pstmt.executeQuery();
						
						while(res.next())
						{
							String verify=res.getString("PASSWORD");
							System.out.println("hello ur password is"+verify);
							
							if(verify.equals(text2))
							{
								b1=true;
							}
							else
							{
								b1=false;
							}
						}
						
		}
		catch(SQLException we)
		{
			
			we.printStackTrace();
		}
		return b1;
		
	}
	
	
}
