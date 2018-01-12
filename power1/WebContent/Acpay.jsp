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
<th align="center" ><font color="white" size="4px">Call Us At : 1800 3500 7896 <a href="Admin.html"><input type="button" value="Admin Login" style="margin-right: 35px;float: right;"></a></font></th>
</tr>
</table>

<ul class="nav">
<li><a href="Consumer.jsp">Welcome</a>
<li><a href="PaymentHistory.jsp">Payment History</a></li>
<li><a href="BillHistory.jsp">Billing History</a></li>
<li><a href="Req1">Request Status</a>
<li><a href="C_logout">Log Out<a></li></ul>
<table align="center">
<%
	session=request.getSession(false);
	String cid=(String)session.getAttribute("cid");	
	if(cid!=null){	
	//out.print(cid); 
	}else{
		
		RequestDispatcher rd=request.getRequestDispatcher("Home.html");
        rd.include(request, response);
        out.println("Please login first");
    }  
	
%>
<form action="Pay4.jsp">
	<tr><th colspan="2">Proceed For Ac Payment</th></tr>
	<tr><td>Payment Method: </td><td><input type="radio" name=r2 value="1" style="padding-left: 20px;">Debit Card Payment<input type="radio" name=r2 value="2">Net Banking</td></tr>
	<tr><td colspan="2" align="center"><input type="submit" value="Go"></td></tr>
</form>
</table>
</body>
</html>