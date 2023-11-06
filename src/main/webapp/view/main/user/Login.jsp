<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<style>
.login-form {
	
	background-color: #f7f7f7;
	padding: 20px;
	margin: 0 auto;
	max-width: 400px;
	border: 1px solid #ccc;
	border-radius: 4px;
	text-align: center;
	
}

.form-group {

	margin-top:10px;
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	margin-bottom: 5px;
}

.form-group input[type="text"], .form-group input[type="password"] {
	height: 40px;
	line-height: 40px;
	width: 100%;
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.form-group input[type="submit"] {
	background-color: #353535;
	color: white;
	padding: 10px 15px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	width: 100%;
}

.form-group a {
	margin-right: 10px;
}

.loginMenu {
	color: #777777;
	text-decoration-line : none;

}

#longinWar{
	height: 700px;
	margin: 0 auto;

}

</style>    

    
    

<% if(session.getAttribute("SessionData") == null) {%>
<form action="LoginReg">
<%if(request.getParameter("url")!=null) {%>
<input type="hidden" name="url" value="<%=request.getParameter("url") %>">
<input type="hidden" name="code" value="<%=request.getParameter("code") %>">
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
<%} %>

<div id="longinWar">

	<div class="login-form">
	<h1>SYSO</h1>
	Members Login	
	
		<div class="form-group">
<!-- 			<label for="id">아이디</label> -->
			<input type="text" name="id" id="id" placeholder="아이디"/>
		</div>
		<div class="form-group">
<!-- 			<label for="pw">암호</label> -->
			<input type="password" name="pw" id="pw" placeholder="비밀번호"/>
		</div>
		<div class="form-group">
			<input type="submit" value="로그인"/>
		</div>
		<div class="form-group">
			<a href="LoginForm" class="loginMenu">회원가입 </a> 
			| &nbsp; 
			
			<a href="PwSch" class="loginMenu">비밀번호 찾기</a>
		</div>
	</div>
</div>
</form>		
<%}else { %>
로그인성공
<%} %>
