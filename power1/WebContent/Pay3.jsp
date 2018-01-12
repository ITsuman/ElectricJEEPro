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

#t{
	background:rgba(0,0,0,0.1);
	color: #333;
	height: 200px;
	width: 40%;
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
<p align="center" style="color: white;font-size: 25px">Payment Details</p>
<table align="center">
<form action="Pay3">
<tr><td>Enter Details</td></tr>
<%
	try{
		if(request.getParameter("r2").equals("1")){
%>
<tr><td>Enter Card No</td><td><input type="text" ></td></tr>
<tr><td>Enter CCV</td><td><input type="text" ></td></tr>
<tr><td>Enter Expiary Date</td><td><input type="date" ></td></tr>
<tr><td>Date</td><td><input type="date" name="d"></td></tr>
<%	}else{
%>	
<tr><td>Choose Bank</td><td><select name="bank"><option>Sate Bank Of India</option><option>ICICI</option><option>United Bank</option>
<option>Allahabad bank</option>
<option>HDFC Bank</option><option>Bharat Bank</option><option>Canara Bank</option><option>Panjab National Bank</option></select></td></tr>
<tr><td>Enter IFSC</td><td><input type="text" ></td></tr>
<tr><td>Enter Branch</td><td><input type="text" ></td></tr>
<tr><td>Date</td><td><input type="date" name="d"></td></tr>
<% }
		Connection cn=GetDb.GetConnection();
		session=request.getSession(false);
		String cid=(String)session.getAttribute("cid");
		String sql="select payable from meter where cid=? and status=0";
		PreparedStatement ps=cn.prepareStatement(sql);
		ps.setString(1, cid);
		session=request.getSession();
		session.setAttribute("cid",cid);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
%>
<tr><td>Amount:   </td><td ><input type="text" name="am" value="<%= rs.getString(1) %>" style="border-radius:5px; margin-left: 10px;margin-right: 70px;"></td></tr>
<% }
	}catch(Exception e){
	System.out.println(e);
}
	%>
<tr><td colspan="4" align="center"><input type="submit" value="Pay"></td></tr>
</form>
</table>
         
</body>
</html>