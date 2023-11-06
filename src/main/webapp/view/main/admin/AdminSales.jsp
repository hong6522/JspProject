<%@page import="admin_p.TotSales"%>
<%@page import="model_p.OrdersDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    boolean list = false;
    ArrayList<OrdersDTO> res = null;
   	String totpri = "";
   	String totcan = "";
   	String prican = "";
   	TotSales ts = null;
  
    if(request.getAttribute("mainData") != null){
    	
    	ts = (TotSales)request.getAttribute("totData");
    	res = (ArrayList<OrdersDTO>)request.getAttribute("mainData");
    	list = true;
    }

    %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>매출확인 페이지</title>
	<style>
	
	#sales_war{
		    width: 1200px;
		    margin: 50px auto;
    		height: 100%;
	
	}
		table {
			border-collapse: collapse;
			width: 100%;
			margin: 20px 0;
		}
		th, td {
			text-align: left;
			padding: 8px;
			border: 1px solid #ddd;
		}
		th {
			background-color: #f2f2f2;
			font-weight: bold;
		}
		tr:nth-child(even) {
			background-color: #f2f2f2;
		}
		tr:hover {
			background-color: #ddd;
		}
		#DeliveryButton{
    		width:70px;
    		height:30px;
    		background:#001529;
    		color:#fff;
    		text-align:center;
    		border-radius:10px 10px 10px 10px / 10px 10px 10px 10px;
    		line-height:30px;
    		margin-left:10px;
    	}
		
	</style>

<div id="sales_war">
	<form action="AdminSales">
		<h1>매출확인 페이지</h1>
	
		<label for="startDate">시작 날짜 선택:</label>
		<input type="date" id="startDate" name="startDate">
		<br>
		<label for="endDate">종료 날짜 선택:</label>
		<input type="date" id="endDate" name="endDate">
		<br>
		<button type="submit" id="DeliveryButton">검색</button>
	</form>
	<% if(list){ %>
	<div>
		<h2>매출 통계</h2>
		<p>주문건수 <%=res.size()%></p>
		<p>취소건수 <%=ts.canCnt%></p>
		<p>총 매출액 <%=ts.totpri%></p>
		<p>총 취소액 <%=ts.totcan%></p>
		<p>순 판매액 <%=ts.totpri-ts.totcan%></p>
	</div>
	<table>
		<thead>
			<tr>
				<th>주문번호</th>
				<th>아이디</th>
				<th>받는분</th>
				<th>주문상품</th>
				<th>주문갯수</th>
				<th>주문가격</th>
				<th>배송주소</th>
				<th>주문시간</th>
				<th>배송상태</th>
				<th>카드종류</th>
				<th>주문상태</th>
			</tr>
		</thead>
		<tbody>
			<% for(OrdersDTO dto : res) { %>
				<tr>
					<%=dto.toString()%>
				</tr>
			<% } %>
		</tbody>
	</table>
	<% } %>
</div>
    