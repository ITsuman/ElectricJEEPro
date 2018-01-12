<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="module.GetDb"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin </title>
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
<th align="center" ><font color="white" size="4px">Call Us At : 1800 3500 7896 </font></th>
</tr>
</table>
<ul class="nav">
<li><a href="Admin.jsp">Welcome</a></li>
<li><a href="Consumer_Details.jsp">Customer Details</a></li>
<li><a href="Meter.jsp">Meter Reading</a></li>
<li><a href="ShowComplain.jsp">Complain</a></li>
<li><a href="A_logout">Log out<a></li>
</ul>
<%
	session=request.getSession(false);
	String uid1=(String)session.getAttribute("uid");	
	if(uid1==null){
		
		RequestDispatcher rd=request.getRequestDispatcher("Home.html");
        rd.include(request, response);
        out.println("Please login first");
    }  
	
%>

<table align="center" style="background-color: rgba(0,0,0,0.1);">
<tr><th colspan="12">All Customers Details</th></tr>
<tr><th>Consumer ID</th><th style="padding-left: 35px">Email</th><th style="padding-left: 35px">Name</th>
<th style="padding-left: 35px">House</th><th style="padding-left: 35px">Street</th><th style="padding-left: 35px">City</th>
<th style="padding-left: 35px">Pincode</th><th style="padding-left: 35px">PHN no</th></tr>

<%
	try{
			session=request.getSession(false);
			session.getAttribute("uid");
			Connection cn=GetDb.GetConnection();
			String sql="select * from consumer";
			PreparedStatement ps=cn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){

%>
<tr><td align="center"><%= rs.getString(1)%></td><td align="center"><%= rs.getString(2)%></td><td align="center"><%= rs.getString(3)%></td>
<td align="center"><%= rs.getString(4)%></td><td align="center"><%= rs.getString(5)%></td><td align="center"><%= rs.getString(6)%></td>
<td align="center"><%= rs.getString(7)%></td><td align="center"><%= rs.getString(8)%></td></tr>
<% } %>
<%}catch(Exception e){
	out.print(e);
	}
%>

</table>

</body>
</html>