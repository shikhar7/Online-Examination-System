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
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/data","root","root");

int id=Integer.parseInt(request.getParameter("x"));
String ques=request.getParameter("ques");
String opta=request.getParameter("opta");
String optb=request.getParameter("optb");
String optc=request.getParameter("optc");
String optd=request.getParameter("optd");
String ans=request.getParameter("ans");

String sql1="update cques set ques=? where quesid=?";
PreparedStatement ps1=con.prepareStatement(sql1);
ps1.setString(1,ques);
ps1.setInt(2,id);
ps1.executeUpdate();


String sql2="update cans set ansid=?,opta=?,optb=?,optc=?,optd=? where quesid=?";
PreparedStatement ps2=con.prepareStatement(sql2);
ps2.setString(1,ans);
ps2.setString(2,opta);
ps2.setString(3,optb);
ps2.setString(4,optc);
ps2.setString(5,optd);
ps2.setInt(6,id);
ps2.executeUpdate();

%>
<jsp:include page="cques.jsp"/>
<jsp:include page="upques.jsp"/>
<center>
			<div class="container" style="width:40%;">
			<div class="alert alert-warning alert-dismissable fade in">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Update SuccessFull!!</strong>
  		</div></center></div>