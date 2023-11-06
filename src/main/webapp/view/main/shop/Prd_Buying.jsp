<%@page import="model_p.OrdersDTO"%>
<%@page import="model_p.SessionData"%>
<%@page import="model_p.PData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

	PData pd = (PData)request.getAttribute("pd");
	SessionData sd = (SessionData)session.getAttribute("SessionData");
	OrdersDTO dto = (OrdersDTO)request.getAttribute("MainData");

%>

<style>
@import url('https://fonts.googleapis.com/css2?family=Cabin:wght@500&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');
#prd_buying_wrapper{
	width: 1200px;
	height: 1000px;
	margin: auto;
	font-family: 'Noto Sans KR', sans-serif;
	text-align: center;
	margin-bottom: 20px;
}
#prd_buying_top{
	width: 1040px;
	height: 500px;
	margin: auto;
}
#prd_buying_picode{
	width: 470px;
	height: 458px;
	margin: 10px;
	float: left;
	box-shadow: 3px 3px 2px 1px rgba(70,70,70,1);
}
#prd_buying_pic{
	width: 465px;
	height: 458px;
}
#prd_buying_prdInfo{
	width: 495px;
	height: 458px;
	margin: 10px;
	float: left;
	border-radius: 10px;
	box-shadow: 3px 3px 2px 1px rgba(70,70,70,1);
}
#prd_buying_infoPage{
	width: 495px;
	height: 70px;
	margin: 10px;
}
#prd_buying_title{
	width: 150px;
	height: 60px;
	margin: 10px;
	float: left;
	text-align: left;
	line-height: 10px;
	font-size: 0.9rem;
	margin-left: 40px;
}
#prd_buying_info{
	width: 220px;
	height: 60px;
	margin: 10px;
	float: left;
	text-align: right;
	line-height: 60px;
	font-size: 1.3rem;
	margin-right: 20px;	
}
.top_hr{
	width: 400px;
	margin: auto;
}
#prd_buying_mid{
	width: 960px;
	height: 295px;
	box-shadow: 3px 3px 2px 1px rgba(70,70,70,1);
	margin: auto;
	border-radius: 10px;
}
.mid_hr{
	width: 880px;
	margin: auto;
}
#prd_buying_perInfo{
	width: 970px;
	height: 80px;
	margin: auto;
	margin-top: 15px;
}
#prd_buying_perTitle{
	width: 290px;
	height: 60px;
	margin-left: 10px;
	margin-top: 10px;
	float: left;
	text-align: center;
	line-height: 10px;
	font-size: 1rem;
}
#prd_buying_dlInfo{
	width: 650px;
	height: 60px;
	margin-left: 10px;
	margin-top: 10px;
	float: left;
	text-align: left;
	line-height: 60px;
	font-size: 1.3rem;
}
#prd_buying_bot{
	width: 200px;
	height: 100px;
	margin: auto;
	text-align: center;
	font-size: 1.3rem;
	line-height: 100px;
}
#finish_Abtn{
	width: 150px;
	height: 60px;
	text-align: center;
	line-height: 60px;
	text-decoration-line : none;
	font-size: 1.1rem;
	background: #fff;
	color: #000;
	border: 1px solid #000;
	float: left;
	margin: 23px;
	font-family: 'Noto Sans KR', sans-serif;
	border-radius: 5px;
	margin-top: 50px;
}

#finish_Abtn:hover{
	background: #000;
	color: #fff;
}
</style>



<div id="prd_buying_wrapper">
	<h1>『 구매 완료 』</h1>
	<div id="prd_buying_top">
		<div id="prd_buying_picode">
			<img alt="" src="../prdImg/<%=dto.getImg() %>" id="prd_buying_pic">
		</div>
		<div id="prd_buying_prdInfo">
			<div id="prd_buying_infoPage">
				<div id="prd_buying_title">『 상품명 』</div>
				<div id="prd_buying_info"><%=dto.getPrd_name() %></div>
			</div>
			<hr class="top_hr">
			<div id="prd_buying_infoPage">
				<div id="prd_buying_title">『 상품수량 』</div>
				<div id="prd_buying_info"><%=dto.getCnt() %> EA</div>
			</div>
			<hr class="top_hr">
			<div id="prd_buying_infoPage">
				<div id="prd_buying_title">『 결제금액 』</div>
				<div id="prd_buying_info"><%=dto.getTotpri() %> ￦</div>
			</div>
			<hr class="top_hr">
			<div id="prd_buying_infoPage">
				<div id="prd_buying_title">『 결제정보 』</div>
				<div id="prd_buying_info"><%=dto.getCardMk() %></div>
			</div>
			<hr class="top_hr">
			<div id="prd_buying_infoPage">
				<div id="prd_buying_title">『 결제일 』</div>
				<div id="prd_buying_info"><%=dto.getReg_dateStr() %></div>
			</div>
		</div>
	</div>
	<div id="prd_buying_mid">
		<div id="prd_buying_perInfo">
			<div id="prd_buying_perTitle">『 배송수령인 』</div>
			<div id="prd_buying_dlInfo"><%=dto.getClient() %></div>
		</div>
		<hr class="mid_hr">
		<div id="prd_buying_perInfo">
			<div id="prd_buying_perTitle">『 배송수령지 』</div>
			<div id="prd_buying_dlInfo"><%=dto.getAddress() %></div>
		</div>
		<hr class="mid_hr">
		<div id="prd_buying_perInfo">
			<div id="prd_buying_perTitle">『 배송상태 』</div>
			<div id="prd_buying_dlInfo"><%=dto.getDlvryStts() %></div>
		</div>
	</div>
	<div id="prd_buying_bot">
		<a href="Prd_saleList?nowPage=<%=pd.getNowPage() %>" id="finish_Abtn"><div>목록으로</div></a>
	</div>
</div>