<%@page import="model_p.MembersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<title>문의하기</title>
	<style>
		#QnAwar {
	    width: 1200px;
	    margin: 50px auto;
	    height: 800px;
	    padding: 20px;
    		font-family: Arial, sans-serif;
			background-color: #F5F5F5;
		}
		h2 {
			color: #333;
			margin-bottom: 20px;
			text-align: center;
		}
		form {
			background-color: #FFFFFF;
			border: 1px solid #DDDDDD;
			padding: 20px;
			margin: 0 auto;
			width: 800px;
			height: 600px;
		}
		table{
			
			margin: 50px auto;
			
		
		}

		
		
		label {
			display: inline-block;
			width: 100px;
			font-weight: bold;
		}
		select, input[type="text"], textarea {
			padding: 10px;
			font-size: 16px;
			border-radius: 5px;
			border: 1px solid #CCCCCC;
			width: 100%;
			box-sizing: border-box;
			margin-bottom: 20px;
		}
		select {
			background-color: #FFFFFF;
			color: #333333;
			cursor: pointer;
		}
		input[type="submit"] {
			background-color: #333333;
			color: #FFFFFF;
			cursor: pointer;
			border: none;
			border-radius: 5px;
			padding: 10px;
			font-size: 16px;
			width: 100%;
			box-sizing: border-box;
		}
		input[type="submit"]:hover {
			background-color: #555555;
		}
	</style>
</head>
	<%int order_no = (int)request.getAttribute("order_no"); %>

	<div id="QnAwar">
	<h2>문의하기</h2>

	<form action="QnAboardReg" method="post">
		<table>
			<tr>
				<td><label for="order_no">주문번호</label></td>
				<td><input type="text" name="order_no" id="order_no" value="<%=order_no%>" readonly/></td>
			</tr>
			<tr>
				<td><label for="kind">문의종류</label></td>
				<td>
					<select name="kind" id="kind">
						<option value="상품">상품</option>
						<option value="환불">환불</option>
						<option value="취소">취소</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><label for="content">내용</label></td>
				<td><textarea name="content" id="content" cols="50" rows="5" placeholder="남기실 말"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="완료" />
				</td>
			</tr>
		</table>
	</form>
	</div>
