<%@page import="model_p.MembersDTO"%>
<%@page import="model_p.SessionData"%>
<%@page import="model_p.PrdDTO"%>
<%@page import="model_p.PData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% 
	PData pd = (PData)request.getAttribute("pd"); 
	PrdDTO Pdto = (PrdDTO)request.getAttribute("SGData"); 
	MembersDTO Mdto = (MembersDTO)request.getAttribute("MemData");
	SessionData sd = (SessionData)session.getAttribute("SessionData");
	String code = request.getParameter("code");
%>

<script src="/KRProj/jquery/jquery_3_6_3.js"></script>

<script>
$(function(){
	$(".bankName").eq(0).click(function(){
		$(this).css({background:"#009591",color:"#fff"})
		$(".bankName").not(this).css({background:"#fff", color:"#000"})
		}
		
	)
	$(".bankName").eq(1).click(function(){
		$(this).css({background:"#ffce0b",color:"#fff"})
		$(".bankName").not(this).css({background:"#fff", color:"#000"})
		}
		
	)
	$(".bankName").eq(2).click(function(){
		$(this).css({background:"#0076be",color:"#fff"})
		$(".bankName").not(this).css({background:"#fff", color:"#000"})
		}
		
	)
	$(".bankName").eq(3).click(function(){
		$(this).css({background:"#13a94f",color:"#fff"})
		$(".bankName").not(this).css({background:"#fff", color:"#000"})
		}
		
	)
	$(".bankName").eq(4).click(function(){
		$(this).css({background:"#007aff",color:"#fff"})
		$(".bankName").not(this).css({background:"#fff", color:"#000"})
		}
		
	)
	$(".bankName").eq(5).click(function(){
		$(this).css({background:"#0c43b7",color:"#fff"})
		$(".bankName").not(this).css({background:"#fff", color:"#000"})
		}
		
	)
	$(".bankName").eq(6).click(function(){
		$(this).css({background:"#9cc5fd",color:"#fff"})
		$(".bankName").not(this).css({background:"#fff", color:"#000"})
		}
		
	)
})
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Cabin:wght@500&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');
#prd_buy_wrapper{
	width: 1000px;
	margin: auto;
	font-size: 1.2rem;
	font-family: 'Noto Sans KR', sans-serif;
	border: 2px solid #333;
	border-radius: 10px;
	margin-bottom: 20px;
}

#prd_buy_info{
	width: 800px;
	height: 100px;
	margin: auto;
}

.prd_buy_title{
	width: 150px;
	margin: 10px;
	float: left;
	text-align: center;
	line-height: 80px;
	font-size: 1rem;
}

#prd_buy_titlePW{
	line-height: 40px;
}

#prd_buy_PrdData{
	width: 600px;
	margin: 10px;
	float: left;
	text-align: left;
	line-height: 80px;
	font-size: 1rem;
}

#prd_buy_menu{
	width: 300px;
	height: 100px;
	margin: auto;
	text-align: center;
	margin-top: 30px;
}
hr{
	width: 800px;
	margin: auto;
}
.bankName{
	width: 100px;
	height: 50px;
	margin: 10px;
	float: left;
	text-align: center;
	border: 1px solid #ccc;
	line-height: 50px;
	font-family: 'Noto Sans KR', sans-serif;
	border-radius: 10px;
	background: #fff;
	color: #000;
}
#cardBank{
	line-height: 150px;
}
#bankChk{
	display: none;
}

.prd_textBox{
	width: 80px;
	height: 30px;
	font-family: 'Noto Sans KR', sans-serif;
	border-radius: 5px;
	text-align: center;
	font-size: 1.2rem;
}
#prd_adrBox{
	width: 600px;
	height: 30px;
	font-family: 'Noto Sans KR', sans-serif;
	border-radius: 5px;
	text-align: left;
	font-size: 1rem;
}

.buy_btn{
	width: 51.78px;
	height: 31.78px;
	text-align: center;
	line-height: 30px;
	text-decoration-line : none;
	font-size: 0.8rem;
	background: #fff;
	color: #000;
	border: 1px solid #000;
	float: left;
	margin: 10px;
	font-family: 'Noto Sans KR', sans-serif;
	border-radius: 5px;
}
.buy_Abtn{
	width: 50px;
	height: 30px;
	text-align: center;
	line-height: 30px;
	text-decoration-line : none;
	font-size: 0.8rem;
	background: #fff;
	color: #000;
	border: 1px solid #000;
	float: left;
	margin: 10px;
	font-family: 'Noto Sans KR', sans-serif;
	border-radius: 5px;
}
.buy_btn:hover, .buy_Abtn:hover{
	background: #000;
	color: #fff;
}
</style>

<div id="prd_buy_wrapper">

<form action="Prd_Buying" method="post">
<input type="hidden" name="code" value="<%=Pdto.getCode() %>">
<input type="hidden" name="nowPage" value="<%=pd.getNowPage() %>">
<input type="hidden" name="cnt" value="<%=request.getParameter("buyCnt") %>" >
<input type="hidden" name="totpri" value="<%=Integer.parseInt(request.getParameter("buyCnt"))*Pdto.getSail_price() %>" >
	<div id="prd_buy_info">
		<div class="prd_buy_title">상품명</div>
		<div id="prd_buy_PrdData"><%=Pdto.getPrd_name() %></div>
	</div>
	<hr>
	<div id="prd_buy_info">
		<div class="prd_buy_title">구매 수량</div>
		<div id="prd_buy_PrdData">
			<%=request.getParameter("buyCnt") %>EA
		</div>
	</div>
	<hr>
	<div id="prd_buy_info">
		<div class="prd_buy_title">상품 가격</div>
		<div id="prd_buy_PrdData"><%=Pdto.getSail_price() %>￦</div>
	</div>
	<hr>
	<div id="prd_buy_info">
		<div class="prd_buy_title">구매 가격</div>
		<div id="prd_buy_PrdData">
		<%=Integer.parseInt(request.getParameter("buyCnt"))*Pdto.getSail_price() %>￦
		</div>
	</div>
	<hr>
	<div id="prd_buy_info">
		<div class="prd_buy_title">수령인</div>
		<div id="prd_buy_PrdData"><input type="text" value="<%=Mdto.getPname() %>" name="client" required class="prd_textBox" ></div>
	</div>
	<hr>
	<div id="prd_buy_info">
		<div class="prd_buy_title">배송지</div>
		<div id="prd_buy_PrdData"><input type="text" value="<%=Mdto.getAddress() %>" name="address" required id="prd_adrBox"></div>
	</div>
	<hr>
	<div id="prd_buy_info">
		<div class="prd_buy_title">결제 방법</div>
		<div id="prd_buy_PrdData">
			<b>※ 현재 결제는 카드결제 밖에 되지 않으니 양해부탁드립니다. ※</b>
		</div>
	</div>
	<hr>
	<div id="prd_buy_info">
		<div class="prd_buy_title" id="cardBank">카드사</div>
		<div id="prd_buy_PrdData">
			<label class="bankName"><input type="radio" name="cardMk" value="하나은행" id="bankChk"><div>하나은행</div></label>
			<label class="bankName"><input type="radio" name="cardMk" value="국민은행" id="bankChk" ><div>국민은행</div></label>
			<label class="bankName"><input type="radio" name="cardMk" value="신한은행" id="bankChk" ><div>신한은행</div></label>
			<label class="bankName"><input type="radio" name="cardMk" value="농협" id="bankChk" ><div>농협</div></label>
			<label class="bankName"><input type="radio" name="cardMk" value="새마을금고" id="bankChk"><div>새마을금고</div></label>
			<label class="bankName"><input type="radio" name="cardMk" value="기업은행" id="bankChk" ><div>기업은행</div></label>
			<label class="bankName"><input type="radio" name="cardMk" value="우리은행" id="bankChk" ><div>우리은행</div></label>
		</div>
	</div>
	<hr>
	<div id="prd_buy_info">
		<div class="prd_buy_title">카드번호</div>
		<div id="prd_buy_PrdData" >
			<input type="text" name="cardNum1" pattern="\d*" minlength="4" maxlength="4" style="width:120px; text-align: center;" required class="prd_textBox">
			 - <input type="password" name="cardNum2" pattern="\d*" minlength="4" maxlength="4" style="width:120px; text-align: center;" required class="prd_textBox">
			 - <input type="password" name="cardNum3" pattern="\d*" minlength="4" maxlength="4" style="width:120px; text-align: center;" required class="prd_textBox">
			 - <input type="password" name="cardNum4" pattern="\d*" minlength="4" maxlength="4" style="width:120px; text-align: center;" required class="prd_textBox">
		</div>
	</div>
	<hr>
	<div id="prd_buy_info">
		<div class="prd_buy_title">CVC번호(3자리)</div>
		<div id="prd_buy_PrdData">
			<input type="password" name="CVCNum" pattern="\d*" minlength="3" maxlength="3" style="width:100px; text-align: center;" required class="prd_textBox">
		</div>
	</div>
	<hr>
	<div id="prd_buy_info">
		<div class="prd_buy_title">유효기간</div>
		<div id="prd_buy_PrdData">
			<input type="number" name="cardYY" min="23" max="99" style="width:50px; text-align: center;" required class="prd_textBox"> 년
			<input type="number" name="cardMM" min="1" max="12" style="width:50px; text-align: center;" required class="prd_textBox"> 월
		</div>
	</div>
	<hr>
	<div id="prd_buy_info">
		<div class="prd_buy_title" id="prd_buy_titlePW">비밀번호<br/>(앞자리:2)</div>
		<div id="prd_buy_PrdData">
			<input type="password" name="cardPw" pattern="\d*" minlength="2" maxlength="2" style="width:50px; text-align: center;" required class="prd_textBox">●●
			</div>
	</div>
	<hr>
	<div id="prd_buy_menu">
		<input type="submit" value="결제" class="buy_btn">
		<input type="reset" value="초기화" class="buy_btn">
		<a href="Prd_Detail?code=<%=Pdto.getCode() %>&nowPage=<%=request.getParameter("nowPage") %>" class="buy_Abtn"><div>취소</div></a>
		<a href="Prd_saleList?nowPage=<%=request.getParameter("nowPage") %>" class="buy_Abtn"><div>목록</div></a>
	</div>
</form>
</div>