<%@page import="java.util.ArrayList"%>
<%@page import="model_p.OrdersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <script>
	function change(reg,stts){
	alert("배송상태 변경");
	location.href = "Delivery?reg="+reg+"&=DlvryStts"+stts;
	}
	</script>
	
	<style>
		.DeliveryWrapper{
			width:1200px;
			margin: 0 auto;
			height:100%;
		}
		.DeliveryType{
			widht:1200px;
			height:30px;
			border-bottom:1px solid #ccc;
		}
		.DeliveryReg{
			width:200px;
			height:30px;
			float:left;
		}
		.DeliveryStts{
			width:600px;
			height:30px;
			float:left;
		}
		.DeliveryListWrapper{
			width:900px;
			line-height:40px;
			height:40px;
			float:left;
			color:#fff;
			background: #001529;
			border-radius:5px 5px 5px 5px / 5px 5px 5px 5px;
			margin-bottom:30px;
			
		}
		.DeliveryList{
			float:left;
			height:30px;
		}
		.DeliveryList:nth-child(1){
			margin-left:10px;
		}
		.DeliveryList{
			margin-left:100px;
		}
		#DeliveryButtonS{
    		width:70px;
    		height:30px;
    		background:#001529;
    		color:#fff;
    		text-align:center;
    		border-radius:10px 10px 10px 10px / 10px 10px 10px 10px;
    		line-height:30px;
    		margin-left:10px;
    	}
		#DeliveryButton{
    		width:70px;
    		height:30px;
    		background:#001529;
    		color:#fff;
    		text-align:center;
    		border-radius:10px 10px 10px 10px / 10px 10px 10px 10px;
    		line-height:30px;
    		margin-left:90px;
    	}
    	.DeliveryMenu{
    		width:70px;
    		height:30px;
    		margin-left:10px;
    		float:left;
    	}
    	.DeliveryMenu:nth-child(2),.DeliveryMenu:nth-child(3),.DeliveryMenu:nth-child(4){
    		width:70px;
    		height:30px;
    		margin-left:90px;
    		float:left;
    		text-align: center;
    	}
    	.DeliveryMenu:nth-child(5){
    		width:70px;
    		height:30px;
    		margin-left:100px;
    		float:left;
    	}
    	.DeliveryMenuWrapper{
    		width:900px;
    		height:30px;
    		margin-bottom:10px;
    		border-bottom:1px solid #ccc;
    		background-color: #F8F8F8;
    		display: inline-block;
    	}
    	#goOrder{
    		color:#000;
    	}
	</style>
	
	
	<div class="DeliveryWrapper">
	
	<h1>배송관리</h1>
	</br></br>
    	<div class="DeliveryType">
    		<form action="?">
    			<div class="DeliveryReg">
    				<b>날짜 :</b> 
    				<input type="date" name="reg"/>
    			</div>
    			
    			<div class="DeliveryStts">
    				<b>배송상태 :</b>
    				<input type="radio" name="dlvrystts" value="배송준비중"/>배송준비중
    				<input type="radio" name="dlvrystts" value="배송중"/>배송중
    				<input type="radio" name="dlvrystts" value="배송완료"/>배송완료
    				<input type="radio" name="dlvrystts" value="환불요청"/>환불요청
    				<input type="radio" name="dlvrystts" value="취소요청"/>취소요청
    				<input type="submit" value="검색" id="DeliveryButtonS"/>
    			</div>
    		</form>
    	</div>
    	 </br></br>
    <div class="DeliveryListWrapper">
    	<div class="DeliveryList">주문번호</div>
    	<div class="DeliveryList">주문날짜</div>
    	<div class="DeliveryList">상품코드</div>
    	<div class="DeliveryList">받으실 분</div>
    	<div class="DeliveryList">배송상태</div>
    </div>
    </br></br>
    <%for(OrdersDTO dto : (ArrayList<OrdersDTO>)request.getAttribute("ListData")){ %>
    <form action="DeliveryUpdateReg">
    <input type="hidden" name="reg" value="20<%=dto.getReg_dateStr() %>"/>
    <input type="hidden" name="no" value="<%=dto.getOrder_no() %>"/>
    <div class="DeliveryMenuWrapper">
    <a href="Order_Detail?order_no=<%=dto.getOrder_no() %>" id="goOrder"><div class="DeliveryMenu"><%=dto.getOrder_no() %></div></a>
     <div class="DeliveryMenu"><%=dto.getReg_dateStr() %></div>
     <div class="DeliveryMenu"><%=dto.getCode() %></div>
     <div class="DeliveryMenu"><%=dto.getClient() %></div>
    <div class="DeliveryMenu"><select name="dlvrystts">
    	<%if(dto.getDlvryStts().equals("배송준비중")){ %>
    	<option selected><%=dto.getDlvryStts() %></option>
    	<option>배송중</option>
    	<option>배송완료</option>
    	<%}else if(dto.getDlvryStts().equals("배송중")){ %>
    	<option selected><%=dto.getDlvryStts() %></option>
    	<option>배송준비중</option>
    	<option>배송완료</option>
    	<%}else if(dto.getDlvryStts().equals("취소요청")) {%>
    	<option selected><%=dto.getDlvryStts() %></option>
    	<option>취소완료</option>
    	<%}else if(dto.getDlvryStts().equals("환불요청")) { %>
    	<option selected><%=dto.getDlvryStts() %></option>
    	<option>환불완료</option>
    	<%}else{ %>
    	<option selected><%=dto.getDlvryStts() %></option>
    	<%} %>
    </select>
    </div>
    <input type="submit" value="수정하기" id="DeliveryButton"/>
    </div>
     
    </form>
   
    
    <%}%>
    </div>