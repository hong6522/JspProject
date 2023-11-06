<%@page import="model_p.MembersDTO"%>
<%@page import="model_p.SessionData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<%
	
	MembersDTO dto = (MembersDTO)session.getAttribute("dto");
	
	//System.out.println("aa "+dto.getAa());
%>
<style>

.login-form {
   
   background-color: #f7f7f7;
   padding: 20px;
   height: 650px;
  
   max-width: 400px;
   border: 1px solid #ccc;
   border-radius: 4px;
   text-align: center;
   
}

 .form-group {
	border: 1px solid #353535;
   height:170px;
   width: 500px;
   margin: 50px auto;
   border-radius: 5px;
   
} 

.title {
font-size: 30px;
  font-style: oblique;
margin: 30px 0 10px 20px; 
}
.form-group input[type="text"] {
 	height: 36px;
    line-height: 40px;
    width: 191px;
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    margin-left: 20px;
}

.form-group input[type="submit"] {
background-color: #353535;
    color: white;
    margin-left: 10px;
    padding: 10px 22px;
    border: none;
    border-radius: 4px;
    cursor: pointer; 
    width: 89px;
    margin-top: 10px;
}

#pmrwar{
	   height: 800px;
	   width:1200px;
	   margin: 50px auto;
   	text-align: center;
	   
}

</style>

<div id="pmrwar">
	<h2>비밀번호 질문 답변</h2>

	<form action="PwMainReg">
	
	<div class="form-group">
	  <div class="title">질문 : <%=dto.getQq() %></div>
	   
	<input type="text" id="pwChk" name="aa"> 
	
	<input type="submit" value="완료">
	
	</div>
	</form>
</div>