<%@page import="model_p.SessionData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
SessionData sd = (SessionData)session.getAttribute("SessionData"); 
%>

<%
	if(sd != null){%>
		<script type="text/javascript">
		alert('<%=sd.getNick()%>' +"님 로그인 되었습니다.");
		<%if(request.getParameter("url")==null || request.getParameter("url").equals("null")) {%>
        location.href = "../SList/SList";
        <%} else if(request.getParameter("nowPage")== null || request.getParameter("nowPage").equals("null")){%>
        location.href = "../<%=request.getParameter("url") %>?code=<%=request.getParameter("code") %>";
        <%} else{ %>
        location.href = "../<%=request.getParameter("url") %>?code=<%=request.getParameter("code") %>&nowPage=<%=request.getParameter("nowPage")%>";
        <%} %>
		</script>
		
		<%System.out.println("ttt");
	}else{%>
		<script type="text/javascript">
		alert("계정정보가 일치하지 않습니다.");
		location.href = "Login";
		</script>
		
	<%}
%>
