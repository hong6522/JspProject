<%@page import="model_p.MembersDTO"%>
<%@page import="model_p.SessionData"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<h2>비밀번호 찾기</h2>

<%
	boolean res = (boolean)request.getAttribute("res");	
	
	
%>

<% if(res){ %>
<script>
location.href = "PwModi";
</script>
<%} else {%>
<script>
alert('불일치');
</script>
<%}%>

