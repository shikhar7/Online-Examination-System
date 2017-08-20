<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.*"%>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/data","root","root");
String sql="insert into image (img)values(?)";
String url=request.getParameter("pic");
File f=new File(url);
PreparedStatement ps=con.prepareStatement(sql);
FileInputStream fis=new FileInputStream(f);
ps.setBinaryStream(1,(InputStream)fis,(int)f.length());
ps.executeUpdate();
con.close();
%>