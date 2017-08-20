<%@page import="java.sql.*"%>
<%
String gemail=(String)session.getAttribute("uemail");
String gpass=(String)session.getAttribute("upass");
if(gemail.equals("null") && gpass.equals("null"))
{
	%>
	<jsp:forward page="index.html"/>
	<%	
}
int id=0;
try
{	
	id=Integer.parseInt(request.getParameter("x"));
	System.out.println("id="+id);
}
catch(Exception e)
{
	
}
try
{	
	id=Integer.parseInt(request.getParameter("uid"));
	System.out.println("id="+id);
}
catch(Exception e)
{
	
}
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/data","root","root");
String sql1="select * from report where id=?";
PreparedStatement ps1=con.prepareStatement(sql1);
ps1.setInt(1,id);
ResultSet rs1=ps1.executeQuery();
out.println("REPORT:"+"<br>"+"<br>");
if(rs1.next())
{
	out.println("Result of C:"+"<br>"+"<br>");
	int right=rs1.getInt(2);
	int wrong=rs1.getInt(3);
	float per=rs1.getFloat(4);
	out.println("Correct Answers="+right+"<br>");
	out.println("Wrong Answers="+wrong+"<br>");
	out.println("Percentage="+per+"%"+"<br>");
	%>
	<a href="reportc.html">Report</a>
	<%
	out.println("<br>"+"<br>"+"Result of Java:"+"<br>"+"<br>");
	int right1=rs1.getInt(5);
	int wrong1=rs1.getInt(6);
	float per1=rs1.getFloat(7);
	out.println("Correct Answers="+right1+"<br>");
	out.println("Wrong Answers="+wrong1+"<br>");
	out.println("Percentage="+per1+"%"+"<br>");
	%>
	<a href="reportjava.html">Report</a>
	<%
}
else
{
	out.println("The Student has not Given Any Exam"+"<br>"+"<br>");
}
%>