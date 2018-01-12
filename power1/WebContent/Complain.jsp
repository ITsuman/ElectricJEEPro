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
<script type="text/javascript">
	function validate(){
	var n=document.frm.name;
	var e=document.frm.email;
	var p=document.frm.phn;
	var m=document.frm.msg;
	if(n.value==""){
		alert("Enter Your Name");
		return false;
	}
	if(e.value==""){
		alert("Enter Email");
		return false;
	}
	if(p.value==""){
		alert("Enter phone no");
		return false;
	}
	if(p.value.length!='10'){
		alert("Phone no must be hold ten digit");
		return false;
	}
	if(isNaN(p.value)){
		alert("Enter the phone no properly");
		return false;
	}
	if(m.value==""){
		alert("Enter Massage");
		return false;
	}
}


</script>
</head>
<body id="c">
<table  width="100%" height="50%" >
<tr><th height="50" width="50%" align="center" ><b><Font color="white" ><font size="15"><img alt="" src="e3.jpg" height="60px" width="140px"><i>ESPC Limited</i></Font></b></th>
<th align="center" ><font color="white" size="4px">Call Us At : 1800 3500 7896 <a href="Admin.html"><input type="button" value="Admin Login" style="margin-right: 35px;float: right;"></a></font></th>
</tr>
</table>

<ul class="nav">
<li><a href="Home.html">Home</a></li>
<li><a href="New_Con.html">New Connection</a></li>
<li><a href="Pay1.jsp">Pay Bill</a>
<li><a href="Complain.jsp">Complain Request</a>
<li><a href="Ac.jsp">AC Application</a>
<li><a href="Contact.html">Contacts<a></li>
</ul>
<form action="Complain" name="frm" onsubmit="return validate()">
<table align="center" style="background-color: rgba(0,0,0,0.1);">
<tr><th colspan="2">Complain Here</th></tr>
<tr><td>Name: </td><td><input type="text" name="name" style="width: 250px; border-radius:5px;margin-top: 6px;margin-left: 14px"></td></tr>
<tr><td>Consumer Id: </td><td><input type="text" name="cid" style="width: 250px; border-radius:5px;margin-top: 6px;margin-left: 14px"></td></tr>
<tr><td>Email: </td><td><input type="email" name="email" style="width: 250px; border-radius:5px;margin-top: 6px;margin-left: 14px"></td></tr>
<tr><td>Phn No: </td><td><input type="text" name="phn" style="width: 250px; border-radius:5px;margin-top: 6px;margin-left: 14px"></td></tr>
<tr><td>Subject: </td><td><textarea rows="2" cols="10"  name="sub" style="width: 250px; border-radius:5px;margin-top: 6px;margin-left: 14px"></textarea></td></tr>
<tr><td>Massage: </td><td><textarea rows="4" cols="10"  name="msg" style="width: 250px; border-radius:5px;margin-top: 6px;margin-left: 14px"></textarea></td></tr>
<tr><td colspan="2" align="right"><input type="submit" value="Submit"></td></tr>
</table>
</form>
</body>
</html>