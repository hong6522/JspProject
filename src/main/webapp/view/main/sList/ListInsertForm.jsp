<%@page import="java.util.ArrayList"%>
<%@page import="java.io.File"%>
<%@page import="model_p.PrdDTO"%>
<%@page import="model_p.PData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%  PrdDTO dto = null;
	boolean res = false;
	int length = 0;
	ArrayList<File> arr = null;
	
	if(request.getAttribute("mainData") != null){
		dto = (PrdDTO)request.getAttribute("mainData");
		res = true;
	}
	
	if(session.getAttribute("fileData") != null){
		
		arr = (ArrayList)session.getAttribute("fileData");
		System.out.println(arr.size());
		for(File ff : arr){
			System.out.println("들어오냐?"+ff.getName());
		}
		length = arr.size();
		System.out.println(arr.size());

	}
	
%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

function frmGo(){

	  if(frm.code.value==""){
          alert("코드를 입력해주세요.")
          return
	  }
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


	  if(frm.content.value==""){
          alert("상품내용을 입력해주세요.")
          return
	  } 
	      

	        alert("패턴테스트완료")
	        frm.submit()
	    
}
</script>

<style>
.ListInsertWrapper{
		width:1200px;
		margin: 0 auto;
	}
	.ListInsertType{
		width:150px;
		height:30px;
		text-align:center;
   		border-bottom:1px solid #ccc;
   		line-height:30px;
   		float:left;
	}
	.ListInsertLine{
		width:1200px;
		height:50px;
		margin-top:10px;
	}
	.ListInsertIndex{
		width:200px;
		height:30px;
   		border-bottom:1px solid #ccc;
   		line-height:30px;
   		float:left;
   		margin-left:10px;
	}
	.ListInsertLineHeight{
		width:600px;
		height:200px;
		margin-top:10px;
		border-bottom:1px solid #ccc;
	}
	.ListInsertIndexHeight{
   		line-height:30px;
   		float:left;
   		margin-left:10px;
	}
	.ListInsertTypeHeight{
		width:150px;
		height:30px;
		text-align:center;
   		line-height:30px;
   		float:left;
	}
	.ListInsertLineButton{
		width:600px;
		height:200px;
		margin-top:10px;
		border-bottom:1px solid #ccc;
	}
	#ListInsertButton{
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
    	alert("이미지 추가 완료")
    	
    	frm.action = "ListInsertForm";
    	
    }
    
    </script>
    <div class="ListInsertWrapper">
      <h1>상품등록</h1>
      </br>
    <form action="ListInsertReg" method="post" enctype="multipart/form-data"  name="frm">
    	
    		<div class="ListInsertLine">
    			<div class="ListInsertType"><b>코드</b></div>
    			<div class="ListInsertIndex"><input type="text" name="code" <%if(dto.getCode() != null){ %>value="<%=dto.getCode() %>" <%} %>/></div>
    		</div>
    		
    		<div class="ListInsertLine">
    			<div class="ListInsertType"><b>상품이름</b></div>
    			<div class="ListInsertIndex"><input type="text" name="prd_name" <%if(dto.getPrd_name() != null){ %>value="<%=dto.getPrd_name() %>" <%} %>/></div>
    		</div>
    		
    		<div class="ListInsertLine">
    			<div class="ListInsertType"><b>판매가격</b></div>
    			<div class="ListInsertIndex"><input type="text" name="sail" <%if(dto.getSail_price() != 0){ %>value="<%=dto.getSail_price() %>" <%} %> /></div>
    		</div>
    		
    		<div class="ListInsertLine">
    			<div class="ListInsertType"><b>원가</b></div>
    			<div class="ListInsertIndex"><input type="text" name="real" <%if(dto.getReal_price() != 0){ %>value="<%=dto.getReal_price() %>" <%} %>/></div>
    		</div>
    		
    		<div class="ListInsertLine">
    			<div class="ListInsertType"><b>상품종류</b></div>
    			<div class="ListInsertIndex">
    				<select name="type">
    					<option value="rls"  <%if(dto.getType() != null && dto.getType().equals("rls")){ %>selected <%} %>>발매</option>
    					<option value="sg" <%if(dto.getType() != null && dto.getType().equals("sg")){ %>selected <%} %>>판매</option>
    				</select>
    			</div>
    		</div>
    		
    		<div class="ListInsertLine">
    			<div class="ListInsertType"><b>발매(판매)일자</b></div>
    			<div class="ListInsertIndex"><input type="date" name="reg_date" <%if(dto.getReg_date() != null){ %>value="<%="20"+dto.getReg_dateStr() %>" <%} %>/></div>
    		</div>
    		
    		<div class="ListInsertLineHeight">
    			<div class="ListInsertTypeHeight"><b>상품 이미지</b></div>
    			<div class="ListInsertIndexHeight">
    			<%if(arr != null) {%>
    				<%for(File ff : arr){%>
    					<%=ff.getName()%><a href="ListInsertForm?del=<%=ff.getName()%>">삭제</a><br />
    				<%}%>
    			<%}%>
    			
    			<input type="file" name="imgfile"/>
    			<input type="submit" value="추가" onclick="addImg()"/>
    			</div>
    			</div>
    				

    		<div class="ListInsertLineHeight">
    			<div class="ListInsertTypeHeight"><b>상품설명</b></div>
    			<div class="ListInsertIndexHeight"><textarea cols="50" rows="5" name="content" >남기실 말</textarea></div>
    		</div>
    		
    		<div class="ListInsertLineButton">
    		<a href="/KRProj/AdMin/AdMinMain"><div id="ListInsertButton">입력취소</div></a>
    		<input type="reset" value="초기화" id="ListInsertButton"/>
    			<input type="button" value="작성" id="ListInsertButton" onclick="frmGo()"/>
    		</div>
    
    </form>
    </div>