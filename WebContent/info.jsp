<%@page import="java.sql.*"%>
<%@page import="exam.info"%>
<jsp:useBean id="i" class="exam.info" scope="session" />


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
String name,pass,email,mbno,city;
name="";
email="";
mbno="";
pass="";
city="";
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/data","root","root");
String sql="";
if(access.equals("admin"))
{
	sql="select * from admin where id=?";
}
else
{
	sql="select * from member where id=?";	
}
PreparedStatement ps=con.prepareStatement(sql);
ps.setInt(1,id);
ResultSet rs=ps.executeQuery();
if(rs.next())
{
	name=rs.getString(2);
	email=rs.getString(3);
	pass=rs.getString(4);
	mbno=rs.getString(5);
	city=rs.getString(6);
}
}
catch(Exception e)
{
	out.println("Exception Found!! "+e);
}

%>




<!DOCTYPE html>
<html lang="en">
<head>
  <title>INFO</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
.jumbotron { 
  padding: 15px 0px 15px 0px;
  margin: 12% 25% 0% 25%;
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
<%
if(access.equals("admin"))
{
	%>
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
        <li><% 
if(access.equals("admin"))
{
%>
<li><a href="adminhome.jsp">HOME</a></li>
<%
}
else
{
%>
<li><a href="home.jsp">HOME</a></li>
<%
}
%></li>
                <li class="active"><a href="info.jsp">INFO</a></li>
                <li><a href="stuinfo.jsp">STUDENT</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">QESTIONS<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#>">C</a></li>
            <ul class="dropdown-submenu">
            <li><a href="createques.html"><small>CREATE QUESTION</small></a></li>
            <li><a href="showadques.jsp"><small>SHOW QUESTION</small></a></li>
            <li><a href="upques.jsp"><small>UPDATE QUESTION</small></a></li>
            <li><a href="delques.jsp"><small>DELETE QUESTION</small></a></li>
          </ul>
            <li><a href="#">JAVA</a></li>
          </ul>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> LOGOUT</a></li>
      </ul>
    </div>
  </div>
</nav>
	<%
}
else
{
	%>
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
      <% 
if(access.equals("admin"))
{
%>
<li><a href="adminhome.jsp">HOME</a></li>
<%
}
else
{
%>
<li><a href="home.jsp">HOME</a></li>
<%
}
%>
                <li class="active"><a href="info.jsp">INFO</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">TEST<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="check.jsp?uid=<%=id%>">C</a></li>
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
	<%	
}

%>
  
<div class="container">
  <div class="jumbotron vertical-center">
  <center><h2>INFO</h2></center>
  <br>
  <form class="form-horizontal" action="update.jsp" method="post">
    <div class="form-group">
      <label class="control-label col-sm-4" for="name">UserName:</label>
      <div class="col-sm-7">
        <input type="text" class="form-control" id="name" placeholder="Enter UserName" name="name" value=<%=name%>>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="pass">Password:</label>
      <div class="col-sm-7">          
        <input type="password" class="form-control" id="pass" placeholder="Enter password" name="pass" value=<%=pass%>>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="email">Email:</label>
      <div class="col-sm-7">
        <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" value=<%=email%>>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="mbno">Mobile No:</label>
      <div class="col-sm-7">          
        <input type="number" class="form-control" id="mbno" placeholder="Enter Mobile No" name="no" value=<%=mbno%>>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="city">City:</label>
      <div class="col-sm-7">          
        <input type="text" class="form-control" id="city" placeholder="Enter City" name="city" value=<%=city%>>
      </div>
    </div>
        <div class="form-group">     
        <br>   
      <div class="col-sm-offset-5 col-sm-8">
        <button type="submit" class="btn btn-default">UPDATE</button>
      </div>
    </div>
  </form>
</div>

</body>
</html>
















