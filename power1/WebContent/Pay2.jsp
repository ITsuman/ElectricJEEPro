<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="module.GetDb"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
#c{
background-color: #d3e4ff;
}
.nav{
background-color: #c0cee5;
color: black;
text align:center;
padding: 20px 0 20px 0;
}
.nav >li{
display: inline-block;
padding:0 25px 0 25px; 
}
.nav > li > a{
text-decoration: none;
color: #ffffff;
}
.nav > li >a:hover{
color: silver;
}
</style>
</head>
<body id="c">
<table  width="100%" height="50%" >
<tr><th height="50" width="50%" align="center" ><b><Font color="white" ><font size="15"><img alt="" src="e3.jpg" height="60px" width="140px"><i>ESPC Limited</i></Font></b></th>
<th align="center" ><font color="white" size="4px">Call Us At : 1800 3500 7896 <a href="#"><input type="button" value="Admin Login" style="margin-right: 35px;float: right;"></a></font></th>
</tr>
</table>

<ul class="nav">
<li><a href="Home.html">Home</a></li>
<li><a href="Pay1.jsp">Pay Bill</a>
<li><a href="Complain.jsp">Complain Request</a>
<li><a href="Contact.html">Contacts</a></li>
</ul>
<form action="Pay2">
<table align="center" style="background-color: rgba(0,0,0,0.1);">
<tr><th>Consumer ID</th><th style="padding-left: 30px"> Unit Consumed</th><th style="padding-left: 30px">Due Date</th>
<th style="padding-left: 30px"> Payable Amount</th><th style="padding-left: 30px">Fine</th></tr>
<%
	try{
	Connection cn=GetDb.GetConnection();
	session=request.getSession(false);
	String cid=(String)session.getAttribute("cid");
	String sql="select * from meter where cid=? and status=?";
	PreparedStatement ps=cn.prepareStatement(sql);
	ps.setString(1, cid);
	ps.setString(2, "0");
	session=request.getSession();
	session.setAttribute("cid",cid);
	ResultSet rs=ps.executeQuery();
	if(rs.next()){
%>
<tr><td style="padding-left: 30px"><%= rs.getString(1) %></td><td style="padding-left: 30px"><%= rs.getString(2) %></td><td style="padding-left: 30px"><%= rs.getString(3) %></td><td style="padding-left: 30px"><%= rs.getString(4) %></td>
			<td style="padding-left: 30px"><%= rs.getString(5) %></td>
<tr><td colspan="6"><input type="submit" value="Go for Pay" style="float: right;"></td></tr>
<% 
	}else{
%>
		<p style="background-color: rgba(0,0,0,0.2);width: 100%;height: 40px;border-left-style: dotted; font-size: 22px;color: white;padding: 10px 0px 10px 0px;text-align: center;">Nothing to be paid now</p>
		<br>
<%
}
	}
	catch(Exception e){
		System.out.print(e);
	}
%>

</table>
</form>
</body>
</html>