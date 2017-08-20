<%@page import="java.sql.*"%>
<%@page import="exam.info"%>
<jsp:useBean id="i" class="exam.info" scope="session" />
<jsp:setProperty name="i" property="*" />  
<%
String gemail=(String)session.getAttribute("uemail");
String gpass=(String)session.getAttribute("upass");
if(gemail.equals("null") && gpass.equals("null"))
{
	%>
	<jsp:forward page="index.html"/>
	<%	
}
	int id=i.getId();
String access=i.getAccess();
	String name=request.getParameter("name");
	String pass=request.getParameter("pass");
	String email=request.getParameter("email");
	long mbno=Long.parseLong(request.getParameter("no"));
	String city=request.getParameter("city");
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/data","root","root");
		String sql="";
		if(access.equals("admin"))
		{
			sql="UPDATE admin SET name=?,email=?,pass=?,mbno=?,city=? where id=?";
		}
		else
		{
			sql="UPDATE member SET name=?,email=?,pass=?,mbno=?,city=? where id=?";
		}
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1,name);
		ps.setString(2,email);
		ps.setString(3,pass);
		ps.setLong(4,mbno);
		ps.setString(5,city);
		ps.setInt(6,id);	
		ps.executeUpdate();
	}
catch(Exception e)
	{
		out.println("Exception Found!! "+e);
	}
%>
Update Successfull<br><br>
<jsp:setProperty name="i" property="*" /> 
<jsp:include page="info.jsp"/>