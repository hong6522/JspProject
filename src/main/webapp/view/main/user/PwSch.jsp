<%@page import="model_p.SessionData"%>
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
   height: 164px;
   margin-bottom: 342px;
}




.login-form input[type="text"] {
   height: 40px;
   line-height: 40px;
   width: 200px;
   padding: 5px;
   border: 1px solid #ccc;
   border-radius: 4px;
   box-sizing: border-box;
   margin-top: 23px;
   margin-left: 6px;
}

.login-form input[type="submit"] {
   background-color: #353535;
   color: white;
   border: none;
  padding: 12px 26px;
   border: none;
   border-radius: 4px;
   cursor: pointer;
   margin-left: 5px;
}
span {
font-size: 25px;
 }

h1{
margin-bottom: 20px;}
</style>

<form action="PwReg">
<div class="login-form">
   <h1>SYSO</h1>
   
	<div class="idChk">
<span>ID</span>	
		 <input type="text" name="id" placeholder="아이디를 입력하세요."/>
		<input type="submit" value="완료" />	
</div>

	</div>
</form>




  