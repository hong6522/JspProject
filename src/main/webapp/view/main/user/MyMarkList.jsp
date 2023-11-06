<%@page import="model_p.MarkDTO"%>
<%@page import="model_p.OrdersDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model_p.MembersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>나의 찜목록</title>
	<style>
		h1{
					width: 1200px;
					margin: 50px auto;
		
		
		}
		

	
		table {
			width: 1200px;
			height: 800px;
			border-collapse: collapse;
			margin-top: 20px;
			margin: 50px auto;
			
		}
		table th, table td {
			padding: 10px;
			text-align: center;
			border: 1px solid #ddd;
		}
		table th {
			background-color: #f5f5f5;
			font-weight: bold;
			font-size: 18px;
			color: #333;
		}
		table td a {
			color: #333;
			text-decoration: none;
			font-weight: bold;
		}
		table td a:hover {
			color: #0080ff;
		}
	</style>
</head>
<body>
	<h1>나의 찜목록</h1>

	<% ArrayList<MarkDTO> list = (ArrayList<MarkDTO>)request.getAttribute("MyMark");%>
	<table>
	
		<tr>
			<th>ID</th>
			<th>찜코드</th>
			<th>상품명</th>
		</tr>
		<%for(MarkDTO dto : list) {%>
		<tr>
			<td><%=dto.getId() %></td>
			<td><%=dto.getMarkcode() %></td>
			<td><a href="/KRProj/SList/SListDetail?code=<%=dto.getMarkcode() %>"><%=dto.getPname() %></a></td>
		</tr>
		<%}%>
	</table>
</body>
</html>
