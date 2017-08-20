<%@page import="exam.ques"%>
<%@page import="java.util.Vector"%>
<jsp:include page="cques.jsp"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>C-SHOW QUESTIONS</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
.jumbotron { 
  padding: 15px 0px 15px 0px;
  margin: 2% 0% 2% 0%;
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
        <li><a href="adminhome.jsp">HOME</a></li>
                <li><a href="info.jsp">INFO</a></li>
                <li><a href="stuinfo.jsp">STUDENT</a></li>
        <li class="dropdown">
          <a style="background-color:#E3AE57;" class="dropdown-toggle" data-toggle="dropdown" href="#">QESTIONS<span class="caret"></span></a>
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
  
<div class="container">

<center><h1>Questions</h1></center>
<%
String gemail=(String)session.getAttribute("uemail");
String gpass=(String)session.getAttribute("upass");
if(gemail==null && gpass==null)
{
	%>
	<jsp:forward page="index.html"/>
	<%	
}
Vector<ques> v=(Vector<ques>)session.getAttribute("vector");
for(int j=1;j<v.size();j++)
{
	ques q=v.get(j);
 	String opta=q.getOpta();
 	String optb=q.getOptb();
 	String optc=q.getOptc();
 	String optd=q.getOptd();
 	String ques=q.getQues();
 	String ans=q.getCans();
 	%>
 	<div class="jumbotron vertical-center">
  <form class="form-horizontal" action="#" method="post">
  <%
 	out.println("Ques"+j+": "+ques+"<br>"+"<br>");
 	%>
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
  </form>






 	<%
 	out.println("Correct Answer:"+ans+"<br>");
 	%>
 	</div>
 	<%
}
%>
</body>
</html>