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
		border-bottom: 1px solid midnightblue;
    	margin-bottom: 5px;
    	width: 800px;
    	height: 30px;
    	margin: 5 auto;
    	
    }
    .info-label {
        font-weight: bold;
        display: inline-block;
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
	
	.info-row input[type="button"]  {
		background-color: #ef6253;
		color: white;
		padding: 5px 5px;
		border: none;
		border-radius: 4px;
		cursor: pointer;
		width: 70px;
		height: 30px;
	}
	
	#info-button {
		border-bottom: none;
    }
    
    #MyList {
    	width: 200px;
    	height: 200px;
    	float: left;
    }
    
    #Mypage {
    	width: 100px;
    	height: 100px;
    	float: left;
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

<script>
function del(){
    if (confirm("정말 탈퇴하시겠습니까?")) {
        location.href = "Memdelete?id="+"<%=dto.getId()%>";
    } 
}
</script>
<script>
<%
    if(session.getAttribute("SessionData") == null){%>
        alert("로그인이 필요한 페이지 입니다.");
        location.href = "Login";
<%}%>
</script>



<div class="info-container">
<h2>MyPage</h2>
    <div id="MyList">
	    <a href="MyOrderList" class="My_lists">내 주문내역</a> <br>
	    <a href="MyQnAList" class="My_lists">내 문의내역</a> <br>
	    <a href="MyMarkList" class="My_lists">내 찜목록</a> <br>
	</div>
	
	<div id="Mypage">
		<div class="info-row">
	        <span class="info-label">아이디:</span> <%=dto.getId() %>
	    </div>
	    <div class="info-row">
	        <span class="info-label">이름:</span> <%=dto.getPname() %>
	    </div>
	    <div class="info-row">
	        <span class="info-label">닉네임:</span> <%=dto.getNick() %>
	    </div>
	    <div class="info-row">
	        <span class="info-label">생년월일:</span> <%=dto.getbirthStr() %>
	    </div>
	    <div class="info-row">
	        <span class="info-label">전화번호:</span> <%=dto.getTel() %>
	    </div>
	    <div class="info-row">
	        <span class="info-label">이메일:</span> <%=dto.getEmail() %>
	    </div>
	    <div class="info-row">
	        <span class="info-label">주소:</span> <%=dto.getAddress() %>
	    </div>
	    <div class="info-row" id="info-button" style="text-align: right;">
	        <a href="MyPageModify">
	        <input type="submit" value="수정하기"/></a>
	        <input type="button" value="탈퇴하기" onclick="del()"/>
	    </div>
	</div>    
</div>


