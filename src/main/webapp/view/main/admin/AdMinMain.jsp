<%@page import="model_p.adminData"%>
<%@page import="admin_p.TotSales"%>
<%@page import="model_p.OrdersDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int ding=0,dfi=0;

	ArrayList<OrdersDTO> otot = null;
   if(request.getAttribute("readyList")!= null){
	   otot = (ArrayList<OrdersDTO>)request.getAttribute("readyList");
   }
   
	ArrayList<OrdersDTO> ototo = null;
	   if(request.getAttribute("cancelList")!= null){
		   ototo = (ArrayList<OrdersDTO>)request.getAttribute("cancelList");
	}

	ArrayList<OrdersDTO> alist =  (ArrayList<OrdersDTO>)request.getAttribute("alist");
	
	for(OrdersDTO dto : alist){
		if(dto.getDlvryStts().equals("배송중")){
			ding++;
		}
		if(dto.getDlvryStts().equals("배송완료")){
			dfi++;
		}
		
	}


%>
    
<style>


    .admin_main_wrapper{
    	width:100%;
    	height: 800px;
    		
    }
    	
    #adminMain, .admin_main_wrapper, .similar_admin_main_wrapper{
		width:1200px;
		margin: 0 auto;    		
    }
	.Delivery_Ready_big_wrapper, .Delivery_cancel_big_wrapper{
		float: left;
		width:45%;
		height:400px;
  		border-radius: 5px;
  		border: 3px solid rgba(0, 0, 120, 0.9);		
  		margin-right: 20px;
  		margin-left: 20px;
  		
	}
	.delivery_ready_wrapper, .delivery_cancel_wrapper{
		height:30px;
		overflow: auto;
		height:300px;
		border-radius: 5px;
  		border: 1px solid rgba(0, 0, 120, 0.5);
	}
	.delivery_ready, .delivery_cancel {
		width: 18%;
		height:50px;
		float:left;
		box-sizing: border-box;
	}
	.delivery_ready_line, .delivery_cancel_line{
	  background-color: #f4f4f4;

	
		height:50px;
	}
    </style>    


<style>

body {
	margin: 0;
	padding: 0;
	font-family: Arial, sans-serif;
}

main {
	margin-top: 60px;
}

.breadcrumb {
	margin: 24px;
}

.breadcrumb li {
	display: inline-block;
}

.breadcrumb a {
	color: #001529;
	text-decoration: none;
}

.content {
	padding: 24px;
	background-color: #f0f2f5;
	min-height: 400px;
}

footer {
	background-color: #001529;
	color: #fff;
	text-align: center;
	padding: 24px;
	box-shadow: 0 -2px 8px rgba(0, 0, 0, 0.15);
}

.dashboard-container {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}

.dashboard-section {
  flex: 1 1 30%;
  margin: 0 10px 20px;
  padding: 10px;
  background-color: #f4f4f4;
  border-radius: 5px;
  border: 3px solid rgba(0, 0, 120, 0.9);
  box-sizing: border-box;
	}

.dashboard-section h2 {
  font-size: 20px;
  font-weight: bold;
  margin-bottom: 10px;
  }


</style>


<%   adminData ad =	(adminData)request.getAttribute("adminData"); 

%>

<div id="adminMain">
	
	<div class="dashboard-container">
  <div class="dashboard-section">
    <h2>금일주문현황</h2>
    <div class="dashboard-row">
      <div class="dashboard-cell">
        <span class="dashboard-cell-title">주문건수</span>
        <span class="dashboard-cell-value"><%=ad.getOrderCnt() %></span>
      </div>
      <div class="dashboard-cell">
        <span class="dashboard-cell-title">주문금액</span>
        <span class="dashboard-cell-value"><%=ad.getTotPrice() %></span>
      </div>
      <div class="dashboard-cell">
        <span class="dashboard-cell-title">상품</span>
        <span class="dashboard-cell-value"><%=ad.getPriqq() %></span>
      </div>
    </div>
    <a href="AdminSales?startDate=<%=ad.getToday()%>&endDate=<%=ad.getNextday()%>">더보기</a>
  </div>
  
  <div class="dashboard-section">
    <h2>미답변 문의내역</h2>
    <div class="dashboard-row">
      <div class="dashboard-cell">
        <span class="dashboard-cell-title">상품</span>
        <span class="dashboard-cell-value"><%=ad.getPriqq() %></span>
      </div>
      <div class="dashboard-cell">
        <span class="dashboard-cell-title">환불</span>
        <span class="dashboard-cell-value"><%=ad.getRefundqq() %></span>
      </div>
      <div class="dashboard-cell">
        <span class="dashboard-cell-title">취소</span>
        <span class="dashboard-cell-value"><%=ad.getCancelqq() %></span>
      </div>
    </div>
    <a href="QnAlist?state=미답변">더보기</a>
  </div>
  
  <div class="dashboard-section">
    <h2>배송현황</h2>
    <div class="dashboard-row">
      <div class="dashboard-cell">
        <span class="dashboard-cell-title">배송준비중</span>
        <span class="dashboard-cell-value"><%=otot.size() %></span>
      </div>
      <div class="dashboard-cell">
        <span class="dashboard-cell-title">배송중</span>
        <span class="dashboard-cell-value"><%=ding %></span>
      </div>
      <div class="dashboard-cell">
        <span class="dashboard-cell-title">배송완료</span>
        <span class="dashboard-cell-value"><%=dfi %></span>
      </div>
    </div>
      <a href="Delivery?reg=<%=ad.getToday()%>&dlvrystts=배송준비중">더보기</a>
  </div>
</div>
	



</div>





<div class="admin_main_wrapper">
	
	<h2>배송상태 별 리스트</h2><br/>
	<div class="Delivery_Ready_big_wrapper">
	
	<a href="Delivery?dlvrystts=배송준비중"><h3>배송준비중</h3></a>
	<div class="delivery_ready_wrapper">
	<%for(OrdersDTO dto : (ArrayList<OrdersDTO>)request.getAttribute("readyList")){ %>
	<div class="delivery_ready_line">
		<div class="delivery_ready" style="width:40px" style="padding-right: :5px"><%=dto.getCode() %></div>
		<div class="delivery_ready"><%=dto.getDlvryStts() %></div>
		<div class="delivery_ready"><%=dto.getClient() %></div>
		<div class="delivery_ready" style="width:170px"><%=dto.getAddress() %></div>
		<div class="delivery_ready"><%=dto.getTotpri() %></div>
	</div>
	<br/>
	<%} %>
	</div>
</div>

	<div class="Delivery_cancel_big_wrapper">
	<h3>취소요청</h3>
	<div class="delivery_cancel_wrapper">
	<%for(OrdersDTO dto : (ArrayList<OrdersDTO>)request.getAttribute("cancelList")){ %>
	<div class="delivery_cancel_line">
		<div class="delivery_cancel"><%=dto.getCode() %></div>
		<div class="delivery_cancel"><%=dto.getOrderStts()%></div>
		<div class="delivery_cancel"><%=dto.getClient()%></div>
		<div class="delivery_cancel" style="width:170px"><%=dto.getAddress()%></div>
	</div>
	<br/>
	<%} %>
	</div>
	
</div>
</div>


