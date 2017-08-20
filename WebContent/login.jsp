<%@page import="exam.info"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="i" class="exam.info" scope="session"/>
<%
//shikhar@gmail.com
String access=request.getParameter("acc");
String eemail=request.getParameter("uemail");
String epass=request.getParameter("upass");
session.setAttribute("uemail",eemail);
session.setAttribute("upass",epass);
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/data","root","root");
	String sql="select * from member";
	PreparedStatement stmt=con.prepareStatement(sql);
	String query="select * from admin";
	PreparedStatement ps=con.prepareStatement(query);
	ResultSet rs=stmt.executeQuery();
	ResultSet rs1=ps.executeQuery();
	int count=0;
	if(access.equals("admin"))
	{
		while(rs1.next())
		{
			String email=rs1.getString(3);
			String pass=rs1.getString(4);
			if(eemail.equals(email) && epass.equals(pass))
			{
				int id=rs1.getInt(1);
				String name=rs1.getString(2);
				String mbno=rs1.getString(5);
				String city=rs1.getString(6);
				//info i=new info();
				i.setId(id);
				i.setName(name);
				i.setEmail(email);
				i.setPass(pass);
				i.setMbno(mbno);
				i.setCity(city);
				i.setAccess(access);
				//session.setAttribute("ob",i);
				count=count+1;
			}
		}
		if(count!=0)
		{
				%>
				<jsp:forward page="adminhome.jsp"/>
				<%	
		}
		else
		{
			%>
			Sorry Wrong input!!
			<br><br>
			<jsp:include page="index.html"/>
			<%
		}
		con.close();
	}
	else
	{
		%>
		<jsp:include page="cques.jsp"/>
		<%
		while(rs.next())
		{
			String email=rs.getString(3);
			String pass=rs.getString(4);
			if(eemail.equals(email) && epass.equals(pass))
			{
				int id=rs.getInt(1);
				String name=rs.getString(2);
				String mbno=rs.getString(5);
				String city=rs.getString(6);
				//info i=new info();
				i.setId(id);
				i.setName(name);
				i.setEmail(email);
				i.setPass(pass);
				i.setMbno(mbno);
				i.setCity(city);
				i.setAccess(access);
				//session.setAttribute("ob",i);
				count=count+1;
			}
		}
		if(count!=0)
		{
				%>
				<jsp:forward page="home.jsp"/>
				<%	
		}
		else
		{
			%>
						<jsp:include page="index.html"/>
			<center>
			<div class="container" style="width:40%;">
			<div class="alert alert-warning alert-dismissable fade in">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Sorry Wrong input!!</strong>
  		</div></center></div>
			<%
		}
		con.close();
	}	
	}
catch(Exception e)
{
	out.println("Exception Found!!"+e);
}
%>
