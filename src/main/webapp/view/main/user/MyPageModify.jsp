<%@page import="model_p.MembersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
	MembersDTO dto = (MembersDTO)request.getAttribute("mainData");
%>
<style>
    .info-container {
       	width: 1200px;
		height: 1000px;
		margin: 0 auto;
        
        
    }
    .info-row {
    	margin: 15px auto;
    	width: 300px;
    	height: 30px;
    }
    .info-label {
        font-weight: bold;
        width: 100px;
    }
    hr{
        margin-bottom: 50px;
    
    }
    
    .info-row input[type="submit"]  {
		background-color: #4CAF50;
		color: white;
		padding: 5px 5px;
		border: none;
		border-radius: 4px;
		cursor: pointer;
		width: 70px;
	    height: 30px;
	}
	
	.info-row input[type="text"]  {
	    float: right;
		height: 19px;
	    padding-left: 5px;
	    border: none;
	    border-bottom: 1px solid #777777;
	}
	
	#info-button {
		text-align: center;
		border-bottom: none;
    }
    
    #MyList {
    	width: 200px;
    	height: 200px;
    	float: left;
    }
    
    #Mypage {
    	width: 1000px;
    	margin: 0 auto;
    }
    .My_lists{
    	line-height: 23px;
       	font-weight: bold;
    	width: 100px;
    	height: 100px;
    	text-decoration-line : none;
    	color: #777777;
    }
    
    
</style>



<form action="MyPageModifyReg" class ="info-container">

<div class="info-container">
<h2>개인정보 수정</h2>
	<hr />

	<div id="Mypage">
		<div class="info-row">
	        <span class="info-label">아이디</span> <input type="text" name="id" value="<%=dto.getId() %>" readonly/>
	    </div>
	    <div class="info-row">
	        <span class="info-label">이름</span> <input type="text" name="pname" value="<%=dto.getPname() %> " readonly/>
	    </div>
	    <div class="info-row">
	        <span class="info-label">닉네임</span> <input type="text" name="nick" value="<%=dto.getNick() %>"/>
	    </div>
	    <div class="info-row">
	        <span class="info-label">생년월일</span> <input type="text" name="birth" value="<%=dto.getbirthStr() %>"/>
	    </div>
	    <div class="info-row">
	        <span class="info-label">전화번호</span> <input type="text" name="tel" id="tel" value="<%=dto.getTel() %>"/>
	    </div>
	    <div class="info-row">
	        <span class="info-label">이메일</span> <input type="text" name="email"  id="email"  value="<%=dto.getEmail() %>"/>
	    </div>
	    <div class="info-row">
	        <span class="info-label">주소</span> <input type="text" name="address" value="<%=dto.getAddress() %>"/>
	    </div>
	    <div class="info-row" id="info-button" >
			<input type="submit" value="수정하기" />
	    </div>
	</div>    
</div>


</form>

