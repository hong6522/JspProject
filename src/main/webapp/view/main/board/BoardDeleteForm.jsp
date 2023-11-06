<%@page import="model_p.PDataBoard"%>
<%@page import="model_p.PData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% PDataBoard pd = (PDataBoard)request.getAttribute("pd");  %>
<form action="BoardDeleteReg" method="post">
<input type="hidden" name="id" value="<%=request.getAttribute("id") %>" />
<input type="hidden" name="nowPage" value="<%=pd.getNowPage() %>" />
	<table border="">
		<tr>
			<td>암호</td>
			<td><input type="text" name="pw" /></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="삭제" />
				<a href="BoardDetail?id=<%=request.getAttribute("id") %>&nowPage=<%=pd.getNowPage()%>">뒤로</a>
			</td>
		</tr>
	</table>
</form>