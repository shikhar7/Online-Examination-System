<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.*"%>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("","root","root");
int id=0;
byte[ ] imginfo=null;
String sql="select img from image where id=?";
PreparedStatement ps=con.prepareStatement(sql);
ps.setInt(1,id);
ResultSet rs=ps.executeQuery();
if(rs.next())
{
	Blob img=rs.getBlob(1);
	imginfo=img.getBytes(1,(int)img.length());
}
response.setContentType("image/gif");

OutputStream o = response.getOutputStream();

o.write(imginfo);

o.flush();

o.close();
%>