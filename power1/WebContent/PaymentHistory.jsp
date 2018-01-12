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
<body>
<body id="c">
<table  width="100%" height="50%" >
<tr><th height="50" width="50%" align="center" ><b><Font color="white" ><font size="15"><img alt="" src="e3.jpg" height="60px" width="140px"><i>ESPC Limited</i></Font></b></th>
<th align="center" ><font color="white" size="4px">Call Us At : 1800 3500 7896 </font></th>
</tr>
</table>

<ul class="nav">
<li><a href="Consumer.jsp">Welcome</a>
<li><a href="PaymentHistory.jsp">Payment History</a></li>
<li><a href="Req1">Request Status</a>
<li><a href="C_logout">Log Out<a></li>
</ul>
<%
	session=request.getSession(false);
	String cid1=(String)session.getAttribute("cid");	
	if(cid1!=null){	
	//out.print(cid); 
	}else{
		
		RequestDispatcher rd=request.getRequestDispatcher("Home.html");
        rd.include(request, response);
        out.println("Please login first");
    }  
	
%>

<table align="center" style="background-color: rgba(0,0,0,0.1);">
<tr><th style="margin-right: 10px;">CID</th><th style="padding-left: 30px">BILL</th>
<th style="padding-left: 30px">AMOUNT</th><th style="padding-left: 30px">DATE</th></tr>
<%
	try{
		Connection cn=GetDb.GetConnection();
		session=request.getSession(false);
		String cid=(String)session.getAttribute("cid");
		String sql="select * from payment where cid=?";
		PreparedStatement ps=cn.prepareStatement(sql);
		ps.setString(1, cid);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
%>
<tr><td style="padding-left: 30px"><%= rs.getString(1) %></td><td style="padding-left: 30px"><%= rs.getString(2) %></td>
<td style="padding-left: 30px"><%= rs.getString(3) %></td><td style="padding-left: 30px"><%= rs.getString(4) %></td></tr>
<%}
	}catch(Exception e){
		System.out.println(e);
	}
		%>

</table>
</body>
</html>