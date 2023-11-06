<%@page import="model_p.PData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model_p.PrdDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% PData pd = (PData)request.getAttribute("pd"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>굿즈판매 페이지</title>

<style>
@import url('https://fonts.googleapis.com/css2?family=Cabin:wght@500&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');
#prd_thum_wrapper{
	width: 1080px;
	margin: auto;
	height: 1000px;	
	background: #fff;
}

#prd_thum_board{
	width: 240px;
	height: 365px;
	float: left;
	margin-top: 40px;
	margin-left: 17.5px;
	border-radius: 30px;
}

#prd_thum_img{
	width: 225px;
	height: 272px;
	box-shadow: 3px 3px 2px 1px rgba(70,70,70,1);
	background: #fff;
	border-radius: 5px;
	margin: 10px;

}

#prd_thum_File{
	width: 225px;
	height: 272px;
	border-radius: 5px;
}

#prd_thum_imf{
	width: 212px;
	height: 80px;
	border: 1px solid #000;
	border-radius: 20px;
	margin: 10px;
	line-height: 40px;
}

#prd_thum_Info{
	/*margin-left: 35px;*/
	text-align: center;
	font-family: 'Noto Sans KR', sans-serif;
	color: #000;
	font-size: 1.1rem;
	line-height: 25px;
}

#prd_thum_page{
	clear: both;
	width: 250px;
	height: 50px;
	text-align: center;
	line-height: 50px;
	margin: auto;
}
.prd_listPage{
	width: 50px;
	height: 50px;
	font-family: 'Cabin', sans-serif;
	color: #000;
	font-size: 1rem;
	float: left;
	margin: auto;
}
</style>

</head>
<body>
<div id="prd_thum_wrapper">
		<h2>SHOP</h2>
		<hr />
	
<%
ArrayList<PrdDTO> tt = (ArrayList<PrdDTO>)request.getAttribute("mainData");
System.out.println("tttttt"+tt.size());

for(PrdDTO dto : (ArrayList<PrdDTO>)request.getAttribute("mainData")) {
	//if(dto.getType().equals("sg")){
%>
	<a href="Prd_Detail?code=<%=dto.getCode() %>&nowPage=<%=pd.getNowPage() %>" id="prd_aColor" ><div id="prd_thum_board">
	<div id="prd_thum_img">
	<img alt="" src="../prdImg/<%=dto.getImg() %>" id="prd_thum_File"></div>
	
	<div id="prd_thum_Info"><%=dto.getPrd_name() %></div>
	<div id="prd_thum_Info"><%=dto.getSail_price() %>￦</div></div></a>

<% }%>
<div id="prd_thum_page">
<% if(pd.getStartPage() > 1){%>
	<a href="?nowPage=<%=pd.getStartPage()-1 %>" ><div class="prd_listPage" id="prd_back">◀</div></a>
<%} %>
<% for(int p = pd.getStartPage(); p <= pd.getEndPage(); p++) {
	if(pd.getNowPage()==p){%>
<div class="prd_listPage" id="prd_now">[<%=p %>]</div>
<%}else{ %>
	<a href="?nowPage=<%=p %>" ><div class="prd_listPage" id="prd_num"><%=p %></div></a>
<%}} if(pd.getEndPage() < pd.getTotalPage()){%>
	<a href="?nowPage=<%=pd.getEndPage()+1 %>" ><div class="prd_listPage" id="prd_back">▶</div></a>
<%} %>
</div>
</div>

</body>
</html>