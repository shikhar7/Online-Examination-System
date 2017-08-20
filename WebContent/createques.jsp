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
String ques=request.getParameter("ques");
String opta=request.getParameter("opta");
String optb=request.getParameter("optb");
String optc=request.getParameter("optc");
String optd=request.getParameter("optd");
String ans=request.getParameter("ans");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/data","root","root");
String sql1="insert into cques (ques)values(?)";
PreparedStatement ps1=con.prepareStatement(sql1);
ps1.setString(1,ques);
ps1.executeUpdate();
String sql2="insert into cans (ansid,opta,optb,optc,optd)values(?,?,?,?,?)";
PreparedStatement ps2=con.prepareStatement(sql2);
ps2.setString(1,ans);
ps2.setString(2,opta);
ps2.setString(3,optb);
ps2.setString(4,optc);
ps2.setString(5,optd);
ps2.executeUpdate();
%>
<jsp:include page="createques.html"/>
<center>
			<div class="container" style="width:20%;">
			<div class="alert alert-warning alert-dismissable fade in">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Qusetion Has been Successfully Added!!</strong>
  		</div></center></div>