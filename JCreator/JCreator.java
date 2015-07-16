import javax.swing.*;
import java.awt.*;
import java.io.*;
import java.util.*;
import java.awt.event.*;
import java.util.regex.*;
class JCreator extends JFrame 
{
	JFrame f,f1;
	JTextArea t,tx1,tx2;
	int x,y;
	JTextField t1,t2;
	JSplitPane sp;
	JTabbedPane tp,tp1;
	JScrollPane jsp,jsp1;
	String fn,fn1,path1;
	File file;
	Vector v=new Vector();
	String filename=null;
	JFileChooser fc;
	public JCreator()
	{
		JTextArea t=new JTextArea();
		t.setPreferredSize(new Dimension(500,300));
        t.setMinimumSize(new Dimension(500,300));
        t.setCaretPosition(0);
		JTextArea tx1=new JTextArea();
		tx1.setMinimumSize(new Dimension(500,100));
		tx1.setMaximumSize(new Dimension(500,100));
		tx1.setPreferredSize(new Dimension(500,100));
		JTextArea tx2=new JTextArea();
		tx2.setMinimumSize(new Dimension(500,200));
		tx2.setMaximumSize(new Dimension(500,200));
		tx2.setPreferredSize(new Dimension(500,200));
		setLayout(new GridLayout(1,1));
        JMenuBar mb=new JMenuBar();
		JMenu m1=new JMenu("File");
		JMenuItem nw=new JMenuItem("New");
		nw.addActionListener(new New());
		JMenuItem opn=new JMenuItem("Open");
		opn.addActionListener(new Open());
		JMenuItem sv=new JMenuItem("Save");
		sv.addActionListener(new Save());
		JMenuItem savall=new JMenuItem("Save As");
		savall.addActionListener(new SaveAs());
		JMenuItem cls=new JMenuItem("Close");
		cls.addActionListener(new Close());
		JMenuItem clsalltab=new JMenuItem("Close All Tabs");
		clsalltab.addActionListener(new CloseAllTabs());
		JMenuItem ext=new JMenuItem("Exit");
		ext.addActionListener(new Exit());
		m1.add(nw);
		m1.add(opn);
		m1.add(sv);
		m1.add(savall);
		m1.addSeparator();
		m1.add(cls);
		m1.add(clsalltab);
		m1.addSeparator();
		m1.add(ext);
		JMenu m2=new JMenu("Edit");
		JMenuItem cut=new JMenuItem("Cut");
		cut.addActionListener(new Cut());
		JMenuItem cpy=new JMenuItem("Copy");
		cpy.addActionListener(new Copy());
		JMenuItem pst=new JMenuItem("Paste");
		pst.addActionListener(new Paste());
		JMenuItem fnd=new JMenuItem("Find And Replace");
		fnd.addActionListener(new Find());
		m2.add(cut);
		m2.add(cpy);
		m2.add(pst);
		m2.addSeparator();
		m2.add(fnd);
		JMenu m3=new JMenu("Build");
		JMenuItem cmpil=new JMenuItem("Compile");
		cmpil.addActionListener(new Compile());
		JMenuItem run=new JMenuItem("Run");
		run.addActionListener(new Run());
		m3.add(cmpil);
		m3.addSeparator();
		m3.add(run);
		mb.add(m1);
		mb.add(m2);
		mb.add(m3);
		setJMenuBar(mb);
		sp=new JSplitPane(JSplitPane.VERTICAL_SPLIT,t,tp1);
		tp=new JTabbedPane();
		tp1=new JTabbedPane(JTabbedPane.BOTTOM);
        //jsp1=new JScrollPane(tx1);
        tp1.addTab("Build Output",tx1);
        //jsp1=new JScrollPane(tx2);
        tp1.addTab("General Output",tx2);
        sp.setBottomComponent(tp1);
		add(sp);			
	}
	class Find implements ActionListener
	{
		public void actionPerformed(ActionEvent e)
		{
			f1=new JFrame("Find And Replace");
			f1.setSize(400,200);
			f1.setBackground(Color.lightGray);
			f1.setLayout(new GridLayout(5,1));
			JLabel l1=new JLabel("Find");
			l1.setBackground(Color.yellow);
			JLabel l2=new JLabel("Replace With");
			l2.setBackground(Color.yellow);
			t1=new JTextField(100);
			t2=new JTextField(100);
			JButton b1=new JButton("Find Next");
			b1.setBackground(new Color(200,250,220));
			b1.addActionListener(new FindNext());
			JButton b2=new JButton("Replace");
			b2.setBackground(new Color(200,250,220));
			b2.addActionListener(new Replace());
			JButton b3=new JButton("Replace All");
			b3.setBackground(new Color(200,250,220));
			b3.addActionListener(new ReplaceAll());
			JButton b4=new JButton("Close");
			b4.setBackground(new Color(200,250,220));
			b4.addActionListener(new Close1());
			JPanel p1=new JPanel();
			p1.setBackground(Color.gray);
			p1.setLayout(new FlowLayout());
			p1.add(b1);
			p1.add(b2);
			p1.add(b3);
			p1.add(b4);
			f1.add(l1);
			f1.add(t1);
			f1.add(l2);
			f1.add(t2);
			f1.add(p1);
			f1.setVisible(true); 	
		}	
	}
	class New implements ActionListener
	{
		public void actionPerformed(ActionEvent e)
		{
			try
			{
				t=new JTextArea();
				t.setPreferredSize(new Dimension(500,300));
        		t.setMinimumSize(new Dimension(500,300));
				t.setCaretPosition(0);
				jsp=new JScrollPane(t);
				tp.addTab("",jsp);
				tp.setPreferredSize(new Dimension(500,300));
                tp.setMinimumSize(new Dimension(500,300));
				sp.setTopComponent(tp);
				tp.setSelectedIndex(tp.getTabCount()-1);
				setVisible(true);
				v.add(null);
				int x=tp.getSelectedIndex();
     		 	fn1=file.getName();
             	fn=file.toString();
			 	path1=fn.replaceAll(fn1,"");
			 	v.set(x,path1);
			}
			catch(NullPointerException np){}
		}
	}
	class Open implements ActionListener
    {
         public void actionPerformed(ActionEvent e)
         {
         	 fc = new JFileChooser();
             if(fc.showOpenDialog(JCreator.this)== JFileChooser.APPROVE_OPTION)
             {
             	file = fc.getSelectedFile(); 
             	try
                {
             		fn1=file.getName();
             		fn=file.toString();
			 		path1=fn.replaceAll(fn1,"");
			 		v.add(path1);
             		if (file.getName()!=null)
                	{
                		filename = fn1;
                		ReadFile();
                		tp.setSelectedIndex(tp.getTabCount()-1);
                	}
                }
             	catch(NullPointerException npe){}
             }
         }
    }
    void ReadFile()
    {
    	BufferedReader d;
        StringBuffer sb = new StringBuffer();
        try
        {
        	d = new BufferedReader(new FileReader(file));
            String str;
            t=new JTextArea();
            while((str=d.readLine())!=null)
            sb.append(str + "\n");
            t.setText(sb.toString());
            d.close();
		    jsp=new JScrollPane(t);
            tp.addTab(fn1,jsp);
            tp.setPreferredSize(new Dimension(500,300));
            tp.setMinimumSize(new Dimension(500,300));
            sp.setTopComponent(tp);
            t.setCaretPosition(0);
            setVisible(true);
        }
        catch(FileNotFoundException fe)
        {
           	System.out.println("File not Found");
        }
        catch(IOException ioe){}
	}
	class Save implements ActionListener
     {
     	public void actionPerformed(ActionEvent e)
     	{ 
     		try
     		{
     		int x=tp.getSelectedIndex();
			jsp=(JScrollPane)tp.getComponentAt(x);
			JViewport vp=(JViewport)jsp.getViewport();
			t=(JTextArea)vp.getView();
     		if((tp.getTitleAt(x)).equals(""))
     		{
     			fc = new JFileChooser();
            	if (fc.showSaveDialog(JCreator.this) == JFileChooser.APPROVE_OPTION) 
            	{
            		try
            		{
						file=fc.getSelectedFile();
             			fn1=file.getName();
             			fn=file.toString();
						path1=fn.replaceAll(fn1,"");
			 			v.set(x,path1);
             			filename = fn1;
             			setVisible(true);
                 		try
                    	{
                     		DataOutputStream d = new DataOutputStream(new FileOutputStream(file));
                     		String str = t.getText();
                     		BufferedReader br = new BufferedReader(new StringReader(str));
                     		while((str = br.readLine())!=null)
                         	{
                         		d.writeBytes(str + "\r\n");
                         	}
                         	d.close();
                     		tp.setTitleAt(x,fn1);   
                 		}
                 		catch(Exception exe)
                     	{
                     	System.out.println("File not found");
                 		}
         			}
         			catch(NullPointerException npe){}
            	}
     		}
     		else
     		if(filename!=null)
     		{
     			try
     	    	{
     	    		if((tp.getTitleAt(tp.getSelectedIndex())).equals("")==false)
					{
						file=new File((String)v.get(x)+"/"+tp.getTitleAt(tp.getSelectedIndex()));
					}
					fn1=file.getName();
            		filename = fn1;
            		setVisible(true);
            		setTitle("JCreator - Pro");
            		try
     				{
     					DataOutputStream d = new DataOutputStream(new FileOutputStream(file));
            			String str= t.getText();
            			BufferedReader br = new BufferedReader(new StringReader(str));
                		while((str = br.readLine())!=null)
                    	{
                      		d.writeBytes(str + "\r\n");
                    	}
                    	d.close();   	
            		}
            		catch(Exception exc){}
           		}
               catch(NullPointerException npe){}
           	}
     		}
     		catch(ArrayIndexOutOfBoundsException ae){}
      	}
     }
     
     class SaveAs implements ActionListener
     {
         public void actionPerformed(ActionEvent e)
         { 
         	try
            {
            	int x=tp.getSelectedIndex();
				jsp=(JScrollPane)tp.getComponentAt(x);
				JViewport vp=(JViewport)jsp.getViewport();
				t=(JTextArea)vp.getView();
				fc = new JFileChooser();
                if (fc.showSaveDialog(JCreator.this) == JFileChooser.APPROVE_OPTION) 
                {
            		try
            		{
						file=fc.getSelectedFile();
             			fn1=file.getName();
             			fn=file.toString();
			 			path1=fn.replaceAll(fn1,"");
			 			v.set(x,path1);
             			filename = fn1;
             			setVisible(true);
                 		try
                    	{
                     		DataOutputStream d = new DataOutputStream(new FileOutputStream(file));
                     		String str = t.getText();
                     		BufferedReader br = new BufferedReader(new StringReader(str));
                     		while((str = br.readLine())!=null)
                         	{
                         		d.writeBytes(str + "\r\n");
                         	}
                         	d.close();
                     		tp.setTitleAt(x,fn1);    
                 		}
                 		catch(Exception exe)
                     	{
                     		System.out.println("File not found");
                 		}
         			}
        			catch(NullPointerException npe){}
            	}
            }
        	catch(ArrayIndexOutOfBoundsException ae){}
     	}
     }
     class Close implements ActionListener
     {
     	public void actionPerformed(ActionEvent e)
     	{
     		try
     		{
     			int x=tp.getSelectedIndex();
     			tp.removeTabAt(x);
     			fn1=file.getName();
            	fn=file.toString();
				path1=fn.replaceAll(fn1,"");
				v.set(x,path1);
     		}
     		catch(IndexOutOfBoundsException a1){}
			catch(NullPointerException npe){}			 
     	}
    }
    class CloseAllTabs implements ActionListener
    {
    	public void actionPerformed(ActionEvent e)
    	{
    		tp.removeAll();
    	}
    }
    class Exit implements ActionListener
    {
        public void actionPerformed(ActionEvent e)
        {
            System.exit(0);
        }
    }
    class Cut implements ActionListener
	{
    	public void actionPerformed(ActionEvent e)
        {
        	try
            {
            	int x=tp.getSelectedIndex();
				jsp=(JScrollPane)tp.getComponentAt(x);
		    	JViewport vp=(JViewport)jsp.getViewport();
				t=(JTextArea)vp.getView();
            	t.cut();
            }
            catch(ArrayIndexOutOfBoundsException a){}
    	}
    }
    class Copy implements ActionListener
	{
    	public void actionPerformed(ActionEvent e)
        {
             	try
             	{
            		int x=tp.getSelectedIndex();
			 		jsp=(JScrollPane)tp.getComponentAt(x);
		   	 		JViewport vp=(JViewport)jsp.getViewport();
			 		t=(JTextArea)vp.getView();
             		t.copy();
             	}
             	catch(ArrayIndexOutOfBoundsException a){}
    	}
    }
    class Paste implements ActionListener
    {
    	public void actionPerformed(ActionEvent e)
        {
        	try
            {
            	int x=tp.getSelectedIndex();
				jsp=(JScrollPane)tp.getComponentAt(x);
				JViewport vp=(JViewport)jsp.getViewport();
				t=(JTextArea)vp.getView();
            	t.paste();
            }
            catch(ArrayIndexOutOfBoundsException a){}
        }
    }
    class FindNext implements ActionListener
    {
    	int i=0;
    	public void actionPerformed(ActionEvent e)
    	{
    		try
    		{
    			int x1=tp.getSelectedIndex();
				jsp=(JScrollPane)tp.getComponentAt(x1);
				JViewport vp=(JViewport)jsp.getViewport();
				t=(JTextArea)vp.getView();
    			String str=t1.getText();
     			String input=t2.getText();
     			String result=t.getText();
     			Pattern pattern=Pattern.compile(str);		
       			Matcher matcher=pattern.matcher(result.replace("\r",""));
       			matcher.find(i);
       			x=matcher.start();
       			y=matcher.end();
     	    	t.select(x,y); 
     	    	i=y;
     	    	t.requestFocus();
     	    	setVisible(true);
    		}
    		catch(IllegalStateException ise)
    		{
    			System.out.println("Cannot Find");
    		}
    		catch(IndexOutOfBoundsException a){}
    	}
    }
    class Replace implements ActionListener
    {
    	int i=0;
    	public void actionPerformed(ActionEvent e)
    	{
    		if(x!=y)
    		{
    			try
    		    {
    		    	int x1=tp.getSelectedIndex();
			    	jsp=(JScrollPane)tp.getComponentAt(x1);
			    	JViewport vp=(JViewport)jsp.getViewport();
			    	t=(JTextArea)vp.getView();
    		    	String str=t1.getText();
     		   	 	String input=t2.getText();
     		   	 	String result=t.getText();
     		    	Pattern pattern=Pattern.compile(str);		
       		    	Matcher matcher=pattern.matcher(result.replace("\r",""));
     		    	t.replaceSelection(input);
     		    	x=y;
    		    	i=y;
    		    	t.requestFocus();
    		    	setVisible(true);
    		    }
    			catch(IllegalStateException ise)
    			{
    				System.out.println("Could Not Found");
    			}
    			catch(ArrayIndexOutOfBoundsException a){}
				catch(IllegalArgumentException iae){}
			}
		}
	}
	class ReplaceAll implements ActionListener
    {
    	int i=0;
    	public void actionPerformed(ActionEvent e)
    	{
    		try
    		{
    			int x1=tp.getSelectedIndex();
				jsp=(JScrollPane)tp.getComponentAt(x1);
				JViewport vp=(JViewport)jsp.getViewport();
				t=(JTextArea)vp.getView();
    			String str=t1.getText();
     			String input=t2.getText();
     			String result=t.getText();
     			Pattern pattern=Pattern.compile(str);		
       			Matcher matcher=pattern.matcher(result.replace("\r",""));
       			matcher.find(i);
       			int x=matcher.start();
       			int y=matcher.end();
     	    	t.select(x,y); 
     			t.replaceRange(input,x,y);	  	
     			result=matcher.replaceAll(input);
     			t.setText(result);
    			i=y;
    			t.requestFocus();
    			setVisible(true);
    		}
    		catch(IllegalStateException ise)
    		{
    			System.out.println("No More Matches");	
    		}
    		catch(IndexOutOfBoundsException a){}
    	}
    }
    class Close1 implements ActionListener
    {
    	public void actionPerformed(ActionEvent e)
     	{
     		f1.dispose();
     	}	
    }
    class Compile implements ActionListener
    {
    	public void actionPerformed(ActionEvent e)
     	{
     		try
     	   	{
     	   		SwingUtilities.invokeLater(new Compile1(tx1,tp,tp1,jsp1,sp,v));
     	   	 	tx1.setMaximumSize(new Dimension(500,100));
             	tx1.setMinimumSize(new Dimension(500,100)); 
             	fn1=file.getName();
             	fn=file.toString();
			 	path1=fn.replaceAll(fn1,"");
			 	v.set(x,path1);
			 	
     	   	}
     	   	catch(NullPointerException npe){}
		}
	}
    class Run  implements ActionListener
    {
    	public void actionPerformed(ActionEvent e)
     	{	  
     		try
     	   	{
     			SwingUtilities.invokeLater(new Rn1(tx2,tp,tp1,jsp1,sp,v));
     		   	tx2.setMaximumSize(new Dimension(500,100));
				tx2.setMinimumSize(new Dimension(500,100));
				fn1=file.getName();
                fn=file.toString();
			    path1=fn.replaceAll(fn1,"");
			    v.set(x,path1);
            }
            catch(NullPointerException npe){}
        }  
    } 
	public static void main(String args[])
	{
		JFrame e=new JCreator();
		e.setSize(500,500);
		e.setVisible(true);
        e.setTitle("JCreator");
	}
}
class Rn1 extends Thread
{
	JTextArea tx3=new JTextArea();
	JTabbedPane jtp1=new JTabbedPane();
	JTabbedPane jtp=new JTabbedPane();
	JScrollPane jsp1=new JScrollPane();
	JSplitPane sp=new JSplitPane();
	Vector v=new Vector();
	public Rn1(JTextArea t,JTabbedPane jt,JTabbedPane jtp1,JScrollPane s,JSplitPane js,Vector v1)
	{
		tx3=t;
		jtp=jt;
		jtp1=jtp;
		jsp1=s;
		sp=js;
		v=v1;
	}
	public void run()
	{
		try
		{
			tx3=new JTextArea();
            jtp1=new JTabbedPane(JTabbedPane.BOTTOM);
            jsp1=new JScrollPane(tx3);
            jtp1.addTab("General Output",jsp1);
            sp.setBottomComponent(jtp1);
			int y=jtp.getSelectedIndex();
			File file=new File((String)v.get(y));
			Process p=Runtime.getRuntime().exec("cmd /c javac "+jtp.getTitleAt(y),null,file);
			BufferedReader in = new BufferedReader(new InputStreamReader(p.getErrorStream()));  
            String line = null;  
            while ((line = in.readLine()) != null) 
            {  
            	tx3.setText(line);  
            } 
            if(line==null)
            {
            	Process pr=Runtime.getRuntime().exec("cmd /c start cmd /k java "+(jtp.getTitleAt(y)).replaceAll(".java",""),null,file);
                BufferedReader in2 = new BufferedReader(new InputStreamReader(pr.getInputStream()));  
                String line2 = null;  
                while ((line2 = in2.readLine()) != null) 
                {  
                	tx3.setText(line2);  
                }
				BufferedReader in3 = new BufferedReader(new InputStreamReader(pr.getErrorStream()));  
                String line3 = null;  
                while ((line3 = in3.readLine()) != null) 
                {  
                	tx3.setText(tx3.getText()+"\n"+line3);  
                }
            }	
		}
		catch(NullPointerException ne){}
		catch(ArrayIndexOutOfBoundsException ae){}	   
        catch (IOException x) 
        {  
        x.printStackTrace();
  		}
	}
}

class Compile1 implements Runnable
{
	JTextArea tx2=new JTextArea();
	JTabbedPane jtp1=new JTabbedPane();
	JTabbedPane jtp=new JTabbedPane();
	JScrollPane jsp1=new JScrollPane();
	JSplitPane sp=new JSplitPane();
	Vector v=new Vector();
	public Compile1(JTextArea t,JTabbedPane jt,JTabbedPane jtp1,JScrollPane s,JSplitPane js,Vector v1)
	{
		tx2=t;
		jtp=jt;
		jtp1=jtp;
		jsp1=s;
		sp=js;
		v=v1;
	}
	public void run()
	{
		 boolean b=true;
         try 
         {
         	tx2=new JTextArea();
         	jtp1=new JTabbedPane(JTabbedPane.BOTTOM);
         	jsp1=new JScrollPane(tx2);
         	jtp1.addTab("Build Output",jsp1);
         	sp.setBottomComponent(jtp1);
         	int y=jtp.getSelectedIndex();
		 	File fl=new File((String)v.get(y));
		 	
		 	
			
		 	Process pr=Runtime.getRuntime().exec("cmd /c javac "+jtp.getTitleAt(y),null,fl);
         	String line=null;
         	BufferedReader stdError = new BufferedReader(new InputStreamReader(pr.getErrorStream()));         
         	while((line = stdError.readLine()) != null) 
         	{
         		tx2.setText(tx2.getText()+"\n"+line);
         		b=false;
         	}
         	if(b==true)
         	{
         		tx2.setText("Process Completed");
        	}
    	 }
         catch(NullPointerException ne){}   
         catch(ArrayIndexOutOfBoundsException ae){}
        catch(Exception e1) 
        {
         	System.out.println(e1.toString());
         	e1.printStackTrace();
        }  
    }
}