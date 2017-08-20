<%@page import="exam.ques"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%
String gemail=(String)session.getAttribute("uemail");
String gpass=(String)session.getAttribute("upass");
session.setMaxInactiveInterval(120);
if(gemail.equals("null") && gpass.equals("null"))
{
	%>
	<jsp:forward page="index.html"/>
	<%	
}
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/data","root","root");
	Vector<ques> v=(Vector<ques>)session.getAttribute("vector");
	try{
	String s=request.getParameter("id");
	if(!s.equals("null"))
 	{
 		int k=Integer.parseInt(request.getParameter("id"));
 		ques q=v.get(k);
 		q.setUans(request.getParameter("qans"));
 	}
	}
	catch(Exception e)
	{
		
	}

	
	int uid=Integer.parseInt(request.getParameter("uid"));
	
	
	ArrayList<Integer> list=(ArrayList<Integer>)session.getAttribute("l");
    

     Random rand = new Random();
     if(list.size() > 1) 
     {
         int idd = rand.nextInt(list.size());
         int id=list.remove(idd);
         System.out.println("Selected: "+id);
         ques q=v.get(id);
     	String opta=q.getOpta();
     	String optb=q.getOptb();
     	String optc=q.getOptc();
     	String optd=q.getOptd();
     	String ques=q.getQues();
     	String ans=q.getCans();
     	
     	
     	%>
     	
     	
     	
     	
     	<!DOCTYPE html>
<html lang="en">
<head>
  <title>C TEST</title>
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
            <li><a href="showcques.jsp?uid=<%=id%>">C</a></li>
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
  <CENTER><h1>QUESTION</h1></CENTER>
    <div class="jumbotron vertical-center">
     	
     	
     	
     	
     	
     	
     	<%
     	
     	
     	
     	
     	
     	
     	out.println(ques+"<br>");
     	%>		
		<form class="form-horizontal" action="showcques.jsp?uid=<%=uid%>&id=<%=id%>" method="post">
		<br>
    <div class="form-group"> 
      <div class="col-sm-offset-0 col-sm-8">
    <label class="radio-inline"><input type="radio" name="qans" value="a"><%=opta%></label>
    </div>
    <div class="col-sm-offset-0 col-sm-8">
    <label class="radio-inline"><input type="radio" name="qans" value="b"><%=optb%></label>
    </div>
    <div class="col-sm-offset-0 col-sm-8">
    <label class="radio-inline"><input type="radio" name="qans" value="c"><%=optc%></label>
    </div>
    <div class="col-sm-offset-0 col-sm-8">
<label class="radio-inline"><input type="radio" name="qans" value="d"><%=optd%></label>
</div></div>
    <div class="row">
<div class="form-group">     
        <br>   
      <div class="col-sm-offset-4 col-sm-3">
        <button type="submit" class="btn btn-default">Save And Next</button>
      </div>
      <div class="col-sm-offset-4">
        <button type="reset" class="btn btn-default">Reset</button>
      </div>
    </div>
    </div>
  </form>
		
		
		
		
		
		
     	<%
     }
     else if(list.size() == 1) 
     {
    	 int idd = rand.nextInt(list.size());
         int id=list.remove(idd);
         System.out.println("Selected: "+id);
         ques q=v.get(id);
     	String opta=q.getOpta();
     	String optb=q.getOptb();
     	String optc=q.getOptc();
     	String optd=q.getOptd();
     	String ques=q.getQues();
     	String ans=q.getCans();
     	
     	
     	%>
     	
     	
     	
     	
     	<!DOCTYPE html>
<html lang="en">
<head>
  <title>C TEST</title>
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
            <li><a href="showcques.jsp?uid=<%=id%>">C</a></li>
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
  <CENTER><h2>QUESTION</h2></CENTER>
    <div class="jumbotron vertical-center">
     	
     	
     	
     	
     	<%
     	
     	
     	
     	out.println(ques+"<br>");
     	%>
		<form class="form-horizontal" action="showcques.jsp?uid=<%=uid%>&id=<%=id%>" method="post">
		<br>
    <div class="form-group"> 
      <div class="col-sm-offset-0 col-sm-8">
    <label class="radio-inline"><input type="radio" name="qans" value="a"><%=opta%></label>
    </div>
    <div class="col-sm-offset-0 col-sm-8">
    <label class="radio-inline"><input type="radio" name="qans" value="b"><%=optb%></label>
    </div>
    <div class="col-sm-offset-0 col-sm-8">
    <label class="radio-inline"><input type="radio" name="qans" value="c"><%=optc%></label>
    </div>
    <div class="col-sm-offset-0 col-sm-8">
<label class="radio-inline"><input type="radio" name="qans" value="d"><%=optd%></label>
</div></div>
    <div class="row">
<div class="form-group">       
      <div class="col-sm-offset-4 col-sm-3">
        <button type="submit" class="btn btn-default">Save and SUBMIT</button>
      </div>
      <div class="col-sm-offset-4">
        <button type="reset" class="btn btn-default">Reset</button>
      </div>
    </div>
    </div>
  </form>
		
		
		
		
     	<%
     }
     else
     {
    	 %>
    	 
    	 <jsp:include page="ctestcomp.jsp?uid=<%=uid%>"/>
    	 <%
     }
     session.setAttribute("l",list);	
%>
</div>

</body>
</html>
