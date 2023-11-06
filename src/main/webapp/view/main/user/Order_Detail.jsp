<%@page import="model_p.OrdersDTO"%>
<%@page import="model_p.PData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>주문상세 페이지</title>
	<style>
		.container {
		    width: 1200px;
		    margin: 50px auto;
		    height: 800px;
			align-items: center;
			padding: 20px;
		}
		.title {
			font-size: 24px;
			font-weight: bold;
			margin-bottom: 20px;
		}
		.table {
			border-collapse: collapse;
			width: 100%;
		}
		.table td, .table th {
			text-align: left;
			padding: 8px;
			border: 1px solid #ddd;
		}
		.table tr:nth-child(even) {
			background-color: #f2f2f2;
		}
		.table th {
			background-color: #4CAF50;
			color: white;
		}
		.row {
			align-items: left;
			height: 30px;
			margin: 10px 0;
			width: 100%;
			

		}
		.label {
			width: 100px;
			flex-basis: 150px;
			font-weight: bold;
			float: left;
		}
		.value {
			flex-grow: 1;
			margin-left: 20px;
			float: left;
			
		}
		.button {
			margin-top: 20px;
		}
	</style>
</head>
<body>

<div class="container">

<% 
OrdersDTO dto = (OrdersDTO)request.getAttribute("mainData"); 
%>

<div class="title">주문상세 페이지</div>

<table class="table">
    <tr>
    	<th>주문번호</th>
    	<th>제품명</th>
    	<th>갯수</th>
    	<th>금액</th>
    	<th>주문상태</th>
    	<th>주문시간</th>
    </tr>
	<tr>
		<td><%=dto.getOrder_no() %> </td>
		<td><a href="/KRProj/Shop/Prd_Detail?code=<%=dto.getCode() %>"><%=dto.getPrd_name() %> </a></td>
		<td><%=dto.getCnt() %></td>
		<td><%=dto.getTotpri() %></td>
		<td><%=dto.getDlvryStts() %></td>
		<td><%=dto.getReg_dateStr() %></td>
	</tr>
</table>

<div class="row">
	<div class="label">수령인</div>
	<div class="value"><%=dto.getClient() %></div>
</div>

<div class="row">
	<div class="label">배송장소</div>
	<div class="value"><%=dto.getAddress() %></div>
</div>	

<div class="row">
	<div class="label">결재수단</div>
	<div class="value"><%=dto.getCardMk() %></div>
</div>

<div class="button">
	<a href="MyOrderList">주문목록</a>
</div>	
	
</div>

</body>
</html>
