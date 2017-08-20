<%@page import="java.sql.*"%>
<%
int uid=Integer.parseInt(request.getParameter("uid"));
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/data","root","root");
int c=0;
try
{
	String sql="select * from member_id"+uid;
	PreparedStatement ps=con.prepareStatement(sql);
	ResultSet rs=ps.executeQuery();
}
catch(Exception e)
{
	%>
	c=c+1;
	<jsp:forward page="startctest.jsp?uid=<%=uid%>"/>
	<%
}
if(c==0)
{
	%>
	<jsp:forward page="NewFile.jsp?uid=<%=uid%>"/>
	<%
}
%>