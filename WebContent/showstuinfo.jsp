<%@page import="java.sql.*"%>
<jsp:useBean id="s" class="exam.info" scope="session"/>
<%
String gemail=(String)session.getAttribute("uemail");
String gpass=(String)session.getAttribute("upass");
if(gemail.equals("null") && gpass.equals("null"))
{
	%>
	<jsp:forward page="index.html"/>
	<%	
}
String idd=request.getParameter("x");
int id=0;
try
{
	id=Integer.parseInt(idd);
	System.out.println("id="+id);
}
catch(Exception e)
{
	out.println("Error found"+e);
}
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/data","root","root");
String sql="select * from member where id=?";
PreparedStatement ps=con.prepareStatement(sql);
ps.setInt(1,id);
ResultSet rs=ps.executeQuery();
String name="";
String email="";
String mbno="";
String city="";
	if(rs.next())
		{
		name=rs.getString(2);
		email=rs.getString(3);
		mbno=rs.getString(5);
		city=rs.getString(6);
		s.setCity(city);
		s.setEmail(email);
		s.setMbno(mbno);
		s.setName(name);
		s.setId(id);
		}
%>
ENROLLMENT NO=<%=id%><br>
NAME=<%=name%><br>
EMAIL=<%=email%><br>
MOBNO=<%=mbno%><br>
CITY=<%=city%><br>
<br><br>
<jsp:include page="report.jsp?x=<%=id%>"></jsp:include>
<br><br>
<a href="stuinfo.jsp">BACK</a>
<br><br>
<a href="adminhome.jsp">HOME</a>