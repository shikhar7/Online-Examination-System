<%@page import="java.sql.*"%>
<jsp:useBean id="i" class="exam.info" scope="session"/>
<jsp:setProperty name="i" property="*" /> 
<%
String name=request.getParameter("uname");
String pass=request.getParameter("upass");
String email=request.getParameter("uemail");
String mobno=request.getParameter("uno");
String city=request.getParameter("ucity");
//out.println(name+"\n"+pass+"\n"+mobno+"\n"+city+"\n"+email);
try
{
	Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/data","root","root");
String sql="insert into member (name,email,pass,mbno,city) values('"+name+"','"+email+"','"+pass+"','"+mobno+"','"+city+"')";
PreparedStatement stmt=con.prepareStatement(sql);
int num=stmt.executeUpdate();
if(num!=0)
{
	i.setAccess("student");
	%>
	<jsp:forward page="index.html"/>
	<%
}
else
{
	%>
	Sorry Try Again!!
	<jsp:forward page="signup.html"/>
	<%
}
//<jsp:include page="home.jsp"/>
//<jsp:forward page="home.jsp"/>
con.close();
}
catch(Exception e)
{
	out.println(e);
}
%>