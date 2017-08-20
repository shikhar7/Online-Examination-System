<%@page import="java.util.Vector"%>
<%@page import="exam.ques"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%
String gemail=(String)session.getAttribute("uemail");
String gpass=(String)session.getAttribute("upass");

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/data","root","root");
String sql="select count(*) as total from cques";
PreparedStatement ps=con.prepareStatement(sql);
ResultSet rs=ps.executeQuery();
int n=0;
while(rs.next())
{
	n=rs.getInt("total");
}
ques q[]=new ques[n+1];;
for(int j=0;j<=n;j++)
{
	q[j]=new ques();	
}
for(int j=1;j<=n;j++)
{
	String sql1="select * from cques where quesid=?";
	PreparedStatement ps1=con.prepareStatement(sql1);
	ps1.setInt(1,j);
	ResultSet rs1=ps1.executeQuery();
	String sql2="select * from cans where quesid=?";
	PreparedStatement ps2=con.prepareStatement(sql2);
	ps2.setInt(1,j);
	ResultSet rs2=ps2.executeQuery();
	q[j].setN(n);
	while(rs1.next() && rs2.next())
	{		
		q[j].setQues(rs1.getString(2));
		q[j].setCans(rs2.getString(1));
		q[j].setOpta(rs2.getString(2));
		q[j].setOptb(rs2.getString(3));
		q[j].setOptc(rs2.getString(4));
		q[j].setOptd(rs2.getString(5));
		
	}
}
Vector<ques> v=new Vector<ques>();
for(int j=0;j<=n;j++)
{
	v.addElement(q[j]);
	//System.out.println(v);
}
session.setAttribute("vector",v);
ArrayList<Integer> list = new ArrayList<Integer>(n);
for(int j = 1; j <= n; j++) {
    list.add(j);
}
session.setAttribute("l",list);
//System.out.println(n+" "+v.size());
%>