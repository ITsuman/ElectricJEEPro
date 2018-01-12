<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="module.GetDb"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<th align="center" ><font color="white" size="4px">Call Us At : 1800 3500 7896 </font></th>
</tr>
</table>
<ul class="nav">
<li><a href="Admin.jsp">welcome</a></li>
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
<div style="float: left; width: 15%;background-color: #c0cee5;">
<ul>
<i><u>Complain Id</u></i>
<%
	try{
		Connection con=GetDb.GetConnection();
		String sql1="select cmid from complain";
		PreparedStatement ps1=con.prepareStatement(sql1);
		ResultSet res=ps1.executeQuery();
		while(res.next()){
%>
<li><%= res.getString(1) %></li>
<%}
	}catch(Exception e){
	System.out.println(e);			
}
%>
</ul>
</div>
<div style="float: left;width: 70%;padding-left: 85px;padding-top: 85px;">
<table>
<form action="ShowComplain.jsp">
	<tr><td>Enter Complain Id:</td><td><input type="text" name="cc" style="width: 250px; border-radius:5px;margin-top: 6px;margin-left: 14px"></td></tr>
	<tr><td colspan="2" align="right"><input type="submit"></td></tr>

</form>
</table>
</div>
<table width="60%" >
<%
	try{
		Connection cn=GetDb.GetConnection();
		String sql="select * from Complain where cmid=?";
		PreparedStatement ps=cn.prepareStatement(sql);
		ps.setString(1, request.getParameter("cc"));
		ResultSet rs=ps.executeQuery();
		while(rs.next()){

%>
<div style="float: left;width:15%;padding-top: 25px;">
<tr><td width="20%">Consumer Id:</td><td><%= rs.getString(5) %></td></tr>
<tr><td width="20%">Name:</td><td><%= rs.getString(1) %></td></tr>
<tr><td width="20%">Subject:</td><td><%= rs.getString(6) %></td></tr>
<tr><td>Email:</td><td><%= rs.getString(2) %></td></tr>
<tr><td>Phone:</td><td><%= rs.getString(3) %></td></tr>
<tr><td>Massage:</td><td><%= rs.getString(4) %></td></tr>
<tr><td colspan="4"></td></tr>
</div>
<%}
	}catch(Exception e){
		System.out.println(e);
	}
%>
</body>
</html>