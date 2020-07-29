<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
try {
Class.forName(driver);
} 
catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection con = null;
Statement st = null;
PreparedStatement ps=null,ps2=null,ps3=null;
ResultSet rs = null,rs2=null,rs3=null,rs4=null;
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<title>TRANSACTIONS</title>
</head>
<body>

<center>
<form action="TransactionServlet" method="post" name="form1" >
<table>
<tr><td colspan="2"><input type="text"name="amount"></td></tr>
<tr><td>
DEPOSIT : </td><td>
<input type="submit" class="btn btn-info btn-block" value="CREDIT" name="ttype"></td></tr>
<tr><td>
FUND TRANSFER : </td><td>
<input type="submit" class="btn btn-info btn-block" value="DEBIT" name="ttype"></td></tr>
</table>
</form>
<table class="table table-striped table-dark">
<tr>
<th>TRANSACTION_ID</th>
<th>TRANSACTIONS</th>
<th>TRANSACTION_TYPE</th>
</tr>
<%
try{
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/log","root","");
st=con.createStatement();

String sql ="select * from bank order by Transaction_id desc limit 5";
String sql2="select SUM(amount) FROM bank where transfer_type='CREDIT' ";
String sql3="select SUM(amount) FROM bank where transfer_type='DEBIT' ";
ps=con.prepareStatement(sql2);
ps2=con.prepareStatement(sql3);
int i=0,j=0;
rs = st.executeQuery(sql);
rs2=ps.executeQuery();
rs3=ps2.executeQuery();
while(rs.next()){
%>
<tr class="info">
<td><%=rs.getInt("Transaction_id") %>
<td><%=rs.getInt("amount") %></td>
<td><%=rs.getString("transfer_type") %></td>
</tr>
<%
}
%>
</table>
<% 
while(rs2.next())
{
	i=rs2.getInt(1);
 }
while(rs3.next())
{
	j=rs3.getInt(1);
 }

%>

<kbd>AVAILABLE BALANCE</kbd> : <%= i-j %>
<%
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>


</center>
</body>
</html>