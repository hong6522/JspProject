<%@page import="model_p.PDataBoard"%>
<%@page import="model_p.PData"%>
<%@page import="model_p.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
PDataBoard pd = (PDataBoard)request.getAttribute("pd"); 
	BoardDTO dto = (BoardDTO)request.getAttribute("mainData"); %>   
<script>
function fileDelete(){
	if(confirm("작업중인 내용이 초기화됩니다\n파일을 삭제하시겠습니까?")){
		frm.action="FileDelete?id=<%=dto.getId()%>"
			frm.submit()
	}
}

</script>
<style>
.wrap {
	width: 1200px;
    margin: 50px auto;
    height: 800px;
    border-radius: 5px;
    box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.5);


}
#cate input  {

   padding: 8px 8px;
   margin-bottom: 10px;
      width: 100%;
      max-width: 300px;
      border: 1px solid #e0e0e0;
      border-radius: 5px;
}
#cate {
margin-left: 10px;
}
#jaemok{
margin-left: 15px;
}
#text {
margin-left: 65px;
padding: 8px 8px;
   margin-bottom: 10px;
      width: 100%;
      max-width: 300px;
      border: 1px solid #e0e0e0;
      border-radius: 5px;
}
#mm {
      background-color: #f7f8f9;
      padding: 8px;
      border: none;
      border-radius: 5px;
      margin: 0 0 5px 10px;
}
#back {
float: right;
margin-right: 18px;
padding-top: 5px;
}

hr{
	margin-bottom: 100px;

}


</style>

<form action="BoardModifyReg" name="frm" method="post" enctype="multipart/form-data">
<input type="hidden" name="id" value="<%=dto.getId()%>" />
<input type="hidden" name="gid" value="<%=dto.getGid()%>" />
<input type="hidden" name="nowPage" value="<%=pd.getNowPage() %>" />
	<div class="wrap">
	<h2>글수정 입니다.</h2>
	<hr />
	
		<div id="cate">
			제목
			<input type="text" name="title" id="jaemok" value="<%=dto.getTitle()%>"/>
		</div>
			<div id="cate"> 
			작성자
			<input type="text" name="pname" value="<%=dto.getPname()%>" readonly/>
		</div>
			<div id="cate"> 
			파일&nbsp;&nbsp;&nbsp;
				
			<% if(dto.getUpfile().equals("")) {%>
			<input type="file" name="upfile" />
			<%} else { %>
			<input type="text" readonly name="upfile" value="<%=dto.getUpfile() %>" />
			<input type="button" value="파일삭제" onclick="fileDelete()" />
			<%} %>
			
		</div>
	&nbsp;&nbsp;내용
			<div >
			
			<textarea cols="50" rows="5" id="text" name="content"><%=dto.getContent()%></textarea>
		</div>
		
			
				<input type="submit" value="수정" id="mm"/>
				<input type="reset" value="초기화" id="mm" />
				<a href="BoardDetail?id=<%=dto.getId()%>&nowPage=<%=pd.getNowPage()%>" id="back">뒤로</a>
			
		
</div>
</form>