<%@page import="model_p.PDataBoard"%>
<%@page import="model_p.SessionData"%>
<%@page import="model_p.PData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model_p.BoardDTO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%
PDataBoard pd = (PDataBoard)request.getAttribute("pd"); 
	BoardDTO dto = (BoardDTO)request.getAttribute("mainData"); 
	SessionData sd = (SessionData)session.getAttribute("SessionData");
	
	%>   

<script>
function del() {
	
	if(confirm('정말 삭제하시겠습니까?')){
	
		location.href = "BoardDeleteReg?id=<%=dto.getId()%>&gid=<%=dto.getGid()%>";
	}
}

</script>
<style>
.wrap {
    width: 1200px;
    margin: 50px auto;
    background: #fff;
    height: 1000px;
}

#qq {
	border: 1px solid #e0e0e0;
	padding: 10px;
	margin: 13px;
	border-radius: 5px;
	display: flex;
}

h2 {
	border-bottom: 1px solid #e0e0e0;
	padding-bottom: 13px;
	margin-left: 10px;
}

#bnt {
	background-color: #f7f8f9;
	padding: 5px;
	border: none;
	border-radius: 5px;
	float:right;
	margin : 0 15px 10px 0;
}
#mokrok , #modi {
margin-left: 10px;
 text-decoration-line : none;}
 
#fileImg {
margin-left: 20px;
}
</style>

<div class="wrap">
<h2> Board Detail </h2>

<div  id="qq">
	id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=dto.getId() %>
</div><div  id="qq"> 	
	제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=dto.getTitle() %>
</div><div  id="qq">
	작성자&nbsp;&nbsp;<%=dto.getPname() %>
</div><div  id="qq">
	작성일&nbsp;&nbsp;<%=dto.getReg_dateStr() %> 

</div><div id="qq">
	조회수&nbsp;&nbsp;<%=dto.getCnt() %>
</div><div  id="qq">
	내용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=dto.getContentBr() %>
</div><div  id="qq">


	파일  <p><br>
<% if(dto.isImgFile()) {%>
	<img src="/KRProj/prdImg/<%=dto.getUpfile() %>" alt="" id="fileImg" />
<%} else if(!dto.getUpfile().equals("")){ %>	
	<a href="FileDown?fName=<%=dto.getUpfile() %>"><%=dto.getUpfile() %></a> 
<%} %>
	</div>

		<a href="BoardList" id="mokrok">
		목록으로</a>
	
		
		
<% if(sd != null && dto.getRid().equals(sd.getId())){ %>		
		
		<a href="BoardModifyForm?id=<%=dto.getId()%>" id="modi">
	 수정</a>
		
		<input type="button" id="bnt" value="삭제" onclick="del()">
	<% }%>	
	

</div>

