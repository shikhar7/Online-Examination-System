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
int num=Integer.parseInt(request.getParameter("x"));
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/data","root","root");

int n=0;


String sql6="select count(*) as total from cques";
PreparedStatement ps6=con.prepareStatement(sql6);
ResultSet rs6=ps6.executeQuery();
while(rs6.next())
{
	n=rs6.getInt("total");
}

System.out.println("num="+num+"n="+n);

String sql="delete from cques where quesid=?";
PreparedStatement ps=con.prepareStatement(sql);
ps.setInt(1, num);
String sql1="delete from cans where quesid=?";
PreparedStatement ps1=con.prepareStatement(sql1);
ps1.setInt(1, num);
ps1.executeUpdate();
ps.executeUpdate();

int j=0;
if(num<n)
{
	int del=num+1;
	j=del;
	for(j=del;j<=n;j++)
	{
		String sql2="UPDATE cques SET quesid = quesid-1 where quesid=?";
		PreparedStatement ps2=con.prepareStatement(sql2);
		ps2.setInt(1,j);
		
		String sql3="UPDATE cans SET quesid = quesid-1 where quesid=?";
		PreparedStatement ps3=con.prepareStatement(sql3);
		ps3.setInt(1,j);
		
		ps3.executeUpdate();
		ps2.executeUpdate();
	}
}
else
{
	j=num;
}


String sql4="alter table cques auto_increment=?";
PreparedStatement ps4=con.prepareStatement(sql4);
ps4.setInt(1,j);


String sql5="alter table cans auto_increment=?";
PreparedStatement ps5=con.prepareStatement(sql5);
ps5.setInt(1,j);


ps5.executeUpdate();
ps4.executeUpdate();

%>
<jsp:include page="cques.jsp"/>
Question deleted Successfully<br>
<jsp:include page="delques.jsp"/>