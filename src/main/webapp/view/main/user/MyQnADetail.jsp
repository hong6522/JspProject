<%@page import="model_p.qnaboardDTO"%>
<%@page import="model_p.MembersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<title>질문/답변</title>
	<style>
		.qna-detail-page {
			margin: 50px auto;
			width: 80%;
			   height: 800px;
			
			max-width: 800px;
			padding: 20px;
			background-color: #f5f5f5;
			border-radius: 5px;
			box-shadow: 0px 0px 5px 0px #bcbcbc;
		}
		
			.qna-row {
		display: flex;
		margin-bottom: 10px;
	}

	.qna-label {
		flex-basis: 30%;
		font-weight: bold;
		margin-right: 10px;
	}

	.qna-value {
		flex-basis: 70%;
	}

	h1 {
		text-align: center;
	}
</style>

</head>
<body>
	<%
	qnaboardDTO dto = (qnaboardDTO)request.getAttribute("mainData");
	%>
	<script>
		<%
		if(session.getAttribute("SessionData") == null){%>
			alert("Login required.");
			location.href = "Login";
		<%}%>
	</script>
	<div class="qna-detail-page">
		<h1>질문/답변</h1>
		<form action="QnAReg">
			<input type="hidden" name="no" value="<%=dto.getNo() %>"/>
			<div class="qna-row">
				<div class="qna-label">아이디</div>
				<div class="qna-value"><%=dto.getId() %></div>
			</div>
			<div class="qna-row">
				<div class="qna-label">유형</div>
				<div class="qna-value"><%=dto.getKind() %></div>
			</div>
			<div class="qna-row">
				<div class="qna-label">질문</div>
				<div class="qna-value"><%=dto.getContent() %></div>
			</div>
			<div class="qna-row">
				<div class="qna-label">답변</div>
				<div class="qna-value"><%=dto.getContent2() %></div>
			</div>
			<div class="qna-row">
				<div class="qna-label">상태</div>
				<div class="qna-value"><%=dto.getState() %></div>
			</div>
		</form>
	</div>
</body>
</html>