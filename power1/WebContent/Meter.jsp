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
<script type="text/javascript">
	function validate(){
		var c=document.frm.cid;
		var u=document.frm.unit;
		var d=document.frm.date;
		if(c.value==""){
			alert("Enter Consumer Id");
			return false;
		}
		if(u.value==""){
			alert("Enter Unit");
			return false;
		}
		if(d.value==""){
			alert("Enter date");
			return false;
		}
	}


</script>

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

<table align="center" style="background-color: rgba(0,0,0,0.1);">
<form action="Meter" name="frm" onsubmit="return validate()">
	<tr><th colspan="2">Meter Reading</th></tr>
	<tr><td>Enter Consumer NO: </td><td><input type="text" name="cid" style="border-radius:5px; margin-left: 10px;margin-right: 70px;"></td></tr>
	<tr><td>Unit : </td><td><input type="text" name="unit" style="border-radius:5px; margin-left: 10px;margin-right: 70px;"></td></tr>
	<tr><td>Date: </td><td><input type="date" name="date" style="border-radius:5px; margin-left: 10px;margin-right: 70px;"></td></tr>
	<tr><td colspan="2" align="center"><input type="submit" value="OK"></td></tr>


</form>



</table>
</body>
</html>