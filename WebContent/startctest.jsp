<%@page import="java.sql.*"%>
<%
String gemail=(String)session.getAttribute("uemail");
String gpass=(String)session.getAttribute("upass");
if(gemail==null && gpass==null)
{
	%>
	<jsp:forward page="index.html"/>
	<%	
}
	int uid=Integer.parseInt(request.getParameter("uid"));
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/data","root","root");
	String sql="select count(*) as total from cques";
	PreparedStatement ps=con.prepareStatement(sql);
	ResultSet rs=ps.executeQuery();
	int num=0;
	while(rs.next())
	{
		num=rs.getInt("total");
	}
	int time=num/2;
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>C-TEST INSTRUCTIONS</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
.jumbotron { 
  padding: 15px 0px 15px 0px;
  margin: 5% 0% 2% 0%;
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
        <li><a href="home.jsp">Home</a></li>
                <li><a href="info.jsp">INFO</a></li>
        <li class="dropdown">
          <a style="background-color:#E3AE57;" class="dropdown-toggle" data-toggle="dropdown" href="#">TEST<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="check.jsp?uid=<%=uid%>">C</a></li>
            <li><a href="#">JAVA</a></li>
          </ul>
        </li>
        <li><a href="reportcques.jsp">REPORT</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> LOGOUT</a></li>
      </ul>
    </div>
  </div>
</nav>
  <center>
      <div class="container" style="width:40%;">
      <div class="alert alert-warning alert-dismissable fade in">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>PLEASE READ ALL THE INSTRUCTION CAREFULLY</strong>
      </div></center></div>


<div class="container">
<div class="jumbotron vertical-center">
<center><h2>INSTRUCTIONS</h2></center>
<ul><br>
  <li><strong><p style="font-size: 17px">Only one attempt is alowed</p></strong></li>
  <li><strong><p style="font-size: 17px">The quiz is of <%=time%> minutes</p></strong></li>
  <li><strong><p style="font-size: 17px">The quiz consist of <%=num%> questions</p></strong></li>
  <li><strong><p style="font-size: 17px">There is no negative marking</p></strong></li>
  <li><strong><p style="font-size: 17px">Only one attempt will be given per question</p></strong></li>
  <li><strong><p style="font-size: 17px">All the questions are not compulsory</p></strong></li>
  <li><strong><p style="font-size: 17px">You cannot go back to any previous question</p></strong></li>
  <li><strong><p style="font-size: 17px">If student closes the quiz in between then the student will be considered a	s FAILED</p></strong></li>
</ul>
<br><br>
<a href="showcques.jsp?uid=<%=uid%>" class="btn btn-danger btn-block" role="button"><span class="glyphicon glyphicon-play-circle"> </span> START TEST</a>
</div>
</div>
</body>
</html>