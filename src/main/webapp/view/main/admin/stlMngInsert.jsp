<%@page import="model_p.DateData"%>
<%@page import="model_p.SessionData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%DateData dd = (DateData)request.getAttribute("DateData"); 
%>

<script type="text/javascript">
	alert("추가완료");
	location.href = "stlMng?date_type=" + "<%=dd.getType()%>" + "&startDate=" + "<%=dd.getStartDate()%>" + "&year=" + "<%=dd.getYear()%>" + "&month=" + "<%=dd.getMonth()%>";

</script>
