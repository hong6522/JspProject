<%@page import="model_p.PrdImgDTO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model_p.PrdDTO"%>
<%@page import="model_p.PData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
PrdDTO dto = (PrdDTO)request.getAttribute("UpdateData");

boolean res = false;
int length = 0;
ArrayList<File> arr = null;
ArrayList<PrdImgDTO> arrr = null;


if(request.getAttribute("mainData") != null){
	dto = (PrdDTO)request.getAttribute("mainData");
	res = true;
}

System.out.println("res"+res);

if(session.getAttribute("fileData") != null){
	
	arr = (ArrayList)session.getAttribute("fileData");
	System.out.println(arr.size());
	for(File ff : arr){
		System.out.println("들어오냐?"+ff.getName());
	}
	length = arr.size();
	System.out.println(arr.size());

}

if(request.getAttribute("filedata")!= null){
	arrr = (ArrayList<PrdImgDTO>)request.getAttribute("filedata");
}

System.out.println(arrr.size());

%>
<style>
	.ListUpdateWrapper{
		width:1200px;
		margin: 0 auto;
	}
	.ListUpdateType{
		width:150px;
		height:30px;
		text-align:center;
   		border-bottom:1px solid #ccc;
   		line-height:30px;
   		float:left;
	}
	.ListUpdateLine{
		width:1200px;
		height:50px;
		margin-top:10px;
	}
	.ListUpdateIndex{
		width:200px;
		height:30px;
   		border-bottom:1px solid #ccc;
   		line-height:30px;
   		float:left;
   		margin-left:10px;
	}
	.ListUpdateLineHeight{
		width:600px;
		height:200px;
		margin-top:10px;
		border-bottom:1px solid #ccc;
	}
	.ListUpdateIndexHeight{
   		line-height:30px;
   		float:left;
   		margin-left:10px;
	}
	.ListUpdateTypeHeight{
		width:150px;
		height:30px;
		text-align:center;
   		line-height:30px;
   		float:left;
	}
	.ListUpdateLineButton{
		width:600px;
		height:200px;
		margin-top:10px;
		border-bottom:1px solid #ccc;
	}
	#ListUpdateButton{
		background:#000;
		color:#fff;
		width:70px;
		height:30px;
		float:Right;
		margin-right:5px;
		text-align:center;
		line-height:30px;
		border-radius:10px 10px 10px 10px / 10px 10px 10px 10px;
	}
</style>

    <script>
    function addImg(){
    	alert("이미지 추가 테스트")
    	
    	ListInsert.action = "ListUpdateForm";
    	
    }
    
    function frmGo(){

  	 
  	   if(frm.prd_name.value==""){
            alert("상품명을 입력해주세요.")
            return
        }
  	  if(frm.sail.value==""){
            alert("판매가격을 입력해주세요.")
            return
        }
  	  if(frm.real.value==""){
            alert("원가를 입력해주세요.")
            return
        }
		if(frm.reg_date.value==""){
        alert("발매일자를 선택해주세요.")
        return
	  } 

  	  if(frm.content.value==""){
            alert("상품내용을 입력해주세요.")
            return
  	  } 
  	      

  	        alert("수정완료")
  	        frm.submit()
  	    
  }
    </script>
	<div class="ListUpdateWrapper">
    <h1>상품수정</h1>
    </br>
    <form action="ListUpdateReg" method="post" id="ListInsert" enctype="multipart/form-data" name="frm">
    <input type="hidden" name="code" value="<%=dto.getCode()%>"/>
    	
    		<div class="ListUpdateLine">
    			<div class="ListUpdateType"><b>코드</b></div>
    			<div class="ListUpdateIndex"><input type="text" readonly name="code" <%if(dto.getCode() != null){ %>value="<%=dto.getCode() %>" <%} %>/></div>
    		</div>
    		
    		<div class="ListUpdateLine">
    			<div class="ListUpdateType"><b>상품이름</b></div>
    			<div class="ListUpdateIndex"><input type="text" name="prd_name" <%if(dto.getPrd_name() != null){ %>value="<%=dto.getPrd_name() %>" <%} %>/></div>
    		</div>
    		
    		<div class="ListUpdateLine">
    			<div class="ListUpdateType"><b>판매가격</b></div>
    			<div class="ListUpdateIndex"><input type="text" name="sail" <%if(dto.getSail_price() != 0){ %>value="<%=dto.getSail_price() %>" <%} %> /></div>
    		</div>
    		
    		<div class="ListUpdateLine">
    			<div class="ListUpdateType"><b>원가</b></div>
    			<div class="ListUpdateIndex"><input type="text" name="real" <%if(dto.getReal_price() != 0){ %>value="<%=dto.getReal_price() %>" <%} %>/></div>
    		</div>
    		
    		<div class="ListUpdateLine">
    			<div class="ListUpdateType"><b>상품종류</b></div>
    			<div class="ListUpdateIndex">
    				<select name="type">
    					<option value="rls"  <%if(dto.getType() != null && dto.getType().equals("rls")){ %>selected <%} %>>발매</option>
    					<option value="sg" <%if(dto.getType() != null && dto.getType().equals("sg")){ %>selected <%} %>>판매</option>
    				</select>
    			</div>
    		</div>
    		
    		<div class="ListUpdateLine">
    			<div class="ListUpdateType"><b>발매(판매)일자</b></div>
    			<div class="ListUpdateIndex"><input type="date" name="reg_date" <%if(dto.getReg_date() != null){ %>value="<%="20"+dto.getReg_dateStr() %>" <%} %>/></div>
    		</div>
    		
    		<div class="ListUpdateLineHeight">
    			<div class="ListUpdateTypeHeight"><b>상품 이미지</b></div>
    			<div class="ListUpdateIndexHeight">
    	<%if(arrr != null) { %>
 			<%for(PrdImgDTO dtooo : arrr){%>
 			
	 			<%=dtooo.getImg()%><a href="ListUpdateForm?del=<%=dtooo.getImg()%>&code=<%=dtooo.getCode()%>">삭제</a><br />
	 		<%}%>
	 	<%}%>
    			
    			<input type="file" name="imgfile" />
    			<input type="submit" value="추가" onclick="addImg()"/>
    			</div>
    		</div>   		

    		
    		<div class="ListUpdateLineHeight">
    			<div class="ListUpdateTypeHeight"><b>상품설명</b></div>
    			<div class="ListUpdateIndexHeight"><textarea cols="55" rows="12" name="content" ><%if(dto.getContent() != null){ %><%=dto.getContent() %>" <%} %> </textarea></div>
    		</div>
    		
    		<div class="ListUpdateLineButton">
    		<a href="SListDetail?code=<%=dto.getCode()%>"><div id="ListUpdateButton">입력취소</div></a>
    		<input type="reset" value="초기화" id="ListUpdateButton"/>
   			<input type="button" value="작성" id="ListUpdateButton" onclick="frmGo()"/>
    		</div>
   		</div>
   </form> 	
   