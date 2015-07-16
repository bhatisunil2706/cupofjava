package com;
import java.sql.*;
import java.io.*;
public class Mybean1
{
	
	Connection con;
	PreparedStatement pstmt;
	
	
	String txt1,txt2,txt3,txt4,txt6,list1;
	
	public void setTxt1(String txt1)
	{
		this.txt1=txt1;
	}
	
	public void setTxt2(String txt2)
	{
		this.txt2=txt2;
	}
	
	public void setTxt3(String txt3)
	{
		this.txt3=txt3;
	}
	
	public void setTxt4(String txt4)
	{
		this.txt4=txt4;
	}
	
	
	public void setTxt6(String txt6)
	{
		this.txt6=txt6;
	}
	
	public void setList1(String list1)
	{
		
		System.out.println("hello the value is:-"+list1);
		this.list1=list1;
	}
	
	
	public String getTxt1()
	{
		return txt1;
	}
		
	public String getTxt2()
	{
		return txt2;
	}
		
	public String getTxt3()
	{
		return txt3;
	}
		
	public String getTxt4()
	{
		return txt4;
	}
	
		
	public String getTxt6()
	{
		return txt6;
	}
	
		
	public String getList1()
	{
		System.out.print("hihihih mvidjkjkjkjkjkjklhjhfgdgfdgfdsfsfdsdfsdfsfd hererererererer");
		return list1;
	}
	
	public int store()
	{
		int count=0;
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
						String query="insert into REGISTRATION values(?,?,?,?,?,?)";
						
					pstmt=con.prepareStatement(query);
					pstmt.setString(1,txt1);
					pstmt.setString(2,txt2);
					pstmt.setString(3,txt3);
					pstmt.setString(4,txt4);
					pstmt.setString(5,txt6);
					pstmt.setString(6,"india");					
					
					count=pstmt.executeUpdate();
		}
		catch(SQLException we)
		{
			
			we.printStackTrace();
		}
		return count;

	}
	public void mysd()
	{int count=0;
				
		try
		{
					String query="insert into REGISTRATION values(?,?,?,?,?,?)";
						
					pstmt=con.prepareStatement(query);
					pstmt.setString(1,txt1);
					pstmt.setString(2,txt2);
					pstmt.setString(3,txt3);
					pstmt.setString(4,txt4);
					pstmt.setString(5,txt6);
					pstmt.setString(6,"india");					
					
					count=pstmt.executeUpdate();
		}
		catch(SQLException we)
		{
			
		}
	}
}