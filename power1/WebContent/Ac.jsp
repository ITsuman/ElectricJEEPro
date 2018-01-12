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
		var c=document.frm.cid;
		
		if(c.value==""){
			alert("Enter Consumer Id");
			return false;
		}
		
	}


</script>



</head>
<body>
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
<table align="center" style="background-color: rgba(0,0,0,0.1);">
<form action="Ac" name="frm" onsubmit="return validate()">
<tr><th colspan="2" style="font-size: 20px;color: white;">AC Application</th></tr>
<tr><td>Consumer id:</td><td><input type="text" name="cid" style="width: 250px; border-radius:5px;margin-top: 6px;margin-left: 14px"></td></tr>
<tr><td></td><td align="right"><input type="submit" value="Apply"></td></tr>
</form>
</table>

</body>
</html>