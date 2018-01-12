<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
#container{
	width: 80%;
	height: 450px;
	border: 1px solid black;
	margin: 0 auto;
	position: relative;
}
#container>img{
	width: 100%;
	height: 100%;
	position: absolute;
}
#container>.btn{
	position: absolute;
	width: 50px;
	height: 50px;
	border: none;
	border-radius: 25px;
	top:200px;
	background: black;
	color: white;
	font-size: 20px;
}
#container>btn1:hover{
	box-shadow: -10px 0px 20 px 0px black;
}
#container>btn2:hover{
	box-shadow: -10px 0px 20 px 0px black;
}

#container>#btn2{
	position: relative;
	float: right;
}
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
<li><a href="BillHistory.jsp">Billing History</a></li>
<li><a href="Req1">Request Status</a>
<li><a href="C_logout">Log Out<a></li>
</ul>
<div id="container">
	<img class="slides" src="e5.jpg">
	<img class="slides" src="ee2.jpg">
	<img class="slides" src="ee3.jpg">
	<img class="slides" src="e1.jpg">
	<button class="btn" onclick="plusIndex(-1)" id="btn1">&#10094;</button>
	<button class="btn" onclick="plusIndex(1)" id="btn2">&#10094;</button>
</div>
</body>
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
	<script>
		var index=1;
		function plusIndex(n){
			index = index + n;
			showImage(index);
		}
		showImage(1);
		function showImage(n){
			var i;
			var x=document.getElementsByClassName("slides");
			if(n > x.length){ index = 1 };
			if(n < 1){ index = x.length };
			for(i=0;i<x.length;i++)
				{
					x[i].style.display ="none";
				}
			x[index-1].style.display = "block";
		}
		autoSlide();
		function autoSlide(){
			var i;
			var x=document.getElementsByClassName("slides");
			for(i=0;i<x.length;i++)
			{
				x[i].style.display ="none";
			}
			if(index > x.length){ index = 1}
			x[index-1].style.display = "block";
			index++;		
			setTimeout(autoSlide, 4000);
		}
	</script>
</html>