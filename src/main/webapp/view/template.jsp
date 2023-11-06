<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    String mainUrl = (String)request.getAttribute("mainUrl");
    %>
<!DOCTYPE html>
<html>
<head>

<style>
	*{
		margin: 0px;
		padding: 0px;
	
	}


	body{
		width: 100%;
/* 		background-image: url(../prdImg/testbk.png); */
		
	}

	#top{
	    background: #000;
	    width: 100%;
	    height: 100px;
	    padding-top: 5px;
	    position: fixed;
	    top: 0;
		left: 0;	
		z-index: 3;
		
	}
	
	#bottom{
	    background: #000;
	    height: 110px;
	}


	#main{
		margin-top: 200px;
		height: 100%;
		width: 100%;
	}
	#main > div{
		margin: 0, auto;

	}



</style>

<meta charset="UTF-8">
<title>SYSO</title>
</head>
<body>

<div id="wrapper">

	<div id="top">
		<jsp:include page="inc/top.jsp" />
	</div>
	
	<div id="main">
		<jsp:include page="<%=mainUrl %>" />
	</div>
	
	<div id="bottom">
		<jsp:include page="inc/bottom.jsp" />
	</div>
	
</div>




</body>
</html>