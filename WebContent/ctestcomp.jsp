<%@page import="java.util.Vector"%>
<%@page import="exam.ques"%>
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
Vector<ques> v=(Vector<ques>)session.getAttribute("vector");

int uid=Integer.parseInt(request.getParameter("uid"));

String sql="create table member_id"+uid+"(id int)";
PreparedStatement ps=con.prepareStatement(sql);
ps.executeUpdate();	



int right=0;
int wrong=0;



String sql3="alter table member_id"+uid+" add column ques"+1+" char(20)";
PreparedStatement ps3=con.prepareStatement(sql3);
ps3.executeUpdate();	


ques q1=v.get(1);
String sql1="insert into member_id"+uid+" (id,ques"+1+")values(?,?)";
PreparedStatement ps1=con.prepareStatement(sql1);
ps1.setInt(1,uid);
String uans=q1.getUans();
ps1.setString(2,uans);
ps1.executeUpdate();	

if(q1.getCans().equals(uans))
{
	right=right+1;
}
else
{
	wrong=wrong+1;
}	


for(int j=2;j<v.size();j++)
{
	sql3="alter table member_id"+uid+" add column ques"+j+" char(20)";
	ps3=con.prepareStatement(sql3);
	ps3.executeUpdate();	
	
	
	ques q=v.get(j);
	sql1="update member_id"+uid+" set ques"+j+"=? where id="+uid;
	ps1=con.prepareStatement(sql1);
	uans=q.getUans();
	ps1.setString(1,uans);
	ps1.executeUpdate();	
	
	if(q.getCans().equals(uans))
	{
		right=right+1;
	}
	else
	{
		wrong=wrong+1;
	}	
}
	String sql2="insert into creport values(?,?,?,?,?)";
	PreparedStatement ps2=con.prepareStatement(sql2);
	ps2.setInt(1,uid);
	ps2.setInt(2,right);
	ps2.setInt(3,wrong);
	float k=right*100;
	k=k/(right+wrong);
	ps2.setFloat(4,k);
	%>
	<!DOCTYPE html>
<html lang="en">
<head>
  <title>C TEST COMPLETED</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
.jumbotron { 
  padding: 15px 0px 15px 0px;
  margin: 10% 0% 2% 0%;
    background-color: grey; /* Orange */
    color: #ffffff;
}
body {
    background-color: #222930;
    color: #ffffff;
}
.navbar-default {
    background-color: #AC2832;
    border-color: #AC2832;
}
 .navbar-default .navbar-nav > .active{
     color: #ffffff;
      background: #E3AE57;
 }
 .navbar-default .navbar-nav > .active > a, 
 .navbar-default .navbar-nav > .active > a:hover, 
 .navbar-default .navbar-nav > .active > a:focus {
      color: #ffffff;
      background: #E3AE57;
 }
.nav.navbar-nav li a {
   color: #fff;
 }

.navbar-default .navbar-brand {
    color: #d6d6d6;
}
.navbar-default .navbar-nav .open .dropdown-menu>li>a, .navbar-default .navbar-nav .open .dropdown-menu {
    background-color: #AC2832;
    color:#ffffff;
  }
</style>
<body>
    <nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">   
     
<li><a href="home.jsp">HOME</a></li>
                <li><a href="info.jsp">INFO</a></li>
        <li class="dropdown">
          <a style="background-color:#E3AE57;" class="dropdown-toggle" data-toggle="dropdown" href="#">TEST<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="showcques.jsp?uid=<%=uid%>">C</a></li>
            <li><a href="#">JAVA</a></li>
          </ul>
        </li>
        <li><a href="reportcques.jsp">REPORT</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span>LOGOUT</a></li>
      </ul>
    </div>
  </div>
</nav>
<div class="container">
	
<div class="jumbotron vertical-center">
<center><h2>Your Test Has been Completed!!</h2></center><br>
	<%
	if(k>90 && k<=100)
	{
		String status="A+";
		ps2.setString(5,status);
		
		%>
		
		<center><h1>A+</h1></center><br>
	<%
	}
	else if(k>80 && k<=90)
	{
		String status="A";
		ps2.setString(5,status);
		//out.println("Pass with Grade :A");
%>
		
		<center><h1>A</h1></center><br>
	<%
	}
	else if(k>70 && k<=80)
	{
		String status="B+";
		ps2.setString(5,status);
%>
		
		<center><h1>B+</h1></center><br>
	<%
	}
	else if(k>60 && k<=70)
	{
		String status="B";
		ps2.setString(5,status);
%>
		
		<center><h1>B</h1></center><br>
	<%
	}
	else if(k>50 && k<=60)
	{
		String status="C+";
		ps2.setString(5,status);
%>
		
		<center><h1>C+</h1></center><br>
	<%
	}
	else if(k>40 && k<=50)
	{
		String status="C";
		ps2.setString(5,status);
%>
		
		<center><h1>C</h1></center><br>
	<%
	}
	else if(k>=33 && k<=40)
	{
		String status="D";
		ps2.setString(5,status);
%>
		
		<center><h1>D</h1></center><br>
	<%
	}
	else
	{
		String status="FAIL";
		ps2.setString(5,status);
%>
		
		<center><h1>FAIL</h1></center><br>
	<%
	}
	ps2.executeUpdate();
%>
<a href="reportcques.jsp" class="btn btn-danger btn-block" role="button"><span class="glyphicon glyphicon-list-alt"></span> FULL REPORT</a>
</div>

</body>
</html>
