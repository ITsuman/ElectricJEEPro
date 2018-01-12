<%@page import="java.sql.ResultSet"%>
<%@page import="module.GetDb"%>
<%@page import="java.sql.Connection"%>
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
<tr><th height="50" width="50%" align="center" ><b><Font color="white" ><font size="15"><img alt="" src="e3.jpg" height="60px" width="140px">EPSC Limited</Font></b></th>
<th align="center" ><font color="white" size="4px">Call Us At : 1800 3500 7896</font></th>
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
		//out.println("Please login first");
		RequestDispatcher rd=request.getRequestDispatcher("Home.html");
        rd.include(request, response);
        
    }  
	
%>

<form action="ApproveRequest" name="frm" >
<table align="center" style="background-color: rgba(0,0,0,0.1);">
<tr><th colspan="3" style="color: white;font-size: 20px;">New Client Request</th></tr>
<tr><th style="padding-left: 35px">Consumer Id</th><th style="padding-left: 35px">New Connection Request</th><th style="padding-left: 35px">Ac Request</th></tr>
<tr><td colspan="3"><hr></td></tr>
<%
	try{
			Connection cn=GetDb.GetConnection();
			session=request.getSession(false);
			String uid=(String)session.getAttribute("uid");
			String sql="select cid,rq,acq from request";
			PreparedStatement ps=cn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				if(rs.getString(2).equals("1") && rs.getString(3).equals("0")){
					
%>
<tr><td style="padding-left: 35px"><%= rs.getString(1) %></td><td style="padding-left: 35px">Yes</td><td style="padding-left: 35px">NO</td><td><input type="radio" name="r" value="<%= rs.getString(1)%>"></td>
<td colspan="3" align="right"><input type="submit" value="Grant Request"></td></tr>
<%}
				if(rs.getString(2).equals("1") && rs.getString(3).equals("1")){			
%>
<tr><td style="padding-left: 35px"><%= rs.getString(1) %></td><td style="padding-left: 35px">Yes</td><td style="padding-left: 35px">Yes</td><td ><input type="radio" name="r" value="<%= rs.getString(1)%>"></td>
<td colspan="3" align="right"><input type="submit" value="Grant Request"></td></tr>

<%
	}
				if(rs.getString(2).equals("2") && rs.getString(3).equals("1")){			
%>
<tr><td style="padding-left: 35px"><%= rs.getString(1) %></td><td style="padding-left: 35px">Not Applicable</td><td style="padding-left: 35px">Yes</td><td><input type="radio" name="r" value="<%= rs.getString(1)%>"></td>
<td colspan="3" align="right"><input type="submit" value="Grant Request"></td></tr>
<%
	}
}
	}catch(Exception e){
		System.out.print(e);
	}

%>

</table>
<img alt="" src="ee8.jpg" height="400px" width="700px" style="margin-left: 22%">
</form>
</body>
</html>