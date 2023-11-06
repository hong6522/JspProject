<%@page import="java.text.NumberFormat"%>
<%@page import="model_p.PrdImgDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model_p.SessionData"%>
<%@page import="model_p.PrdDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%
    int imgcnt = 0;
    
    PrdDTO dto = (PrdDTO)request.getAttribute("SListDetailData");
    ArrayList<PrdImgDTO> arr = null;
    
    if(request.getAttribute("filedata")!= null){
    	arr = (ArrayList<PrdImgDTO>)request.getAttribute("filedata");
    }
    
    boolean logon = false; 
    int level = 0;
    String nick = "";
    
    // 세션에 저장된 id가 null이 아니면 트루 (로그인 상태)
    if(session.getAttribute("SessionData") != null){
    	
    	SessionData sd = (SessionData)session.getAttribute("SessionData");
    	level = sd.getLevel();
    	nick = sd.getNick();
    	logon = true;
    	
    }
    %>
    
<script src="../jq/jquery_3.6.3.js"></script>
<script src="../jq/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		var logonon = eval(<%=logon%>) 
		
		$("#markChk").click(function(){
			//alert("눌렀냐?")
			//alert(logonon)
			if(logonon){
				markCallBack() 
			}
			else{
				alert("로그인이 필요한 서비스입니다.");
				location.href = "/KRProj/User/Login?url=SList/SListDetail&code=<%=dto.getCode()%>"
			}
	
		return false
		})
		
		function markCallBack(){
			$.ajax({
				url:"/KRProj/Ajax/AjaxSelect",	 // 내용을 보내고 가져올 페이지
				type:"POST" ,
				data:{code:$("#code").val()},
				
				success:function(ddd){	// 성공시
					//alert(eval(ddd))
					let msg = "찜목록에 추가되었습니다.";
					if(eval(ddd)){
						msg = "찜목록에서 제거되었습니다.";
						$("input:checkbox[id='SList_detail_Chkheart']").prop("checked",false)
					}else{
						$("input:checkbox[id='SList_detail_Chkheart']").prop("checked",true)
					}
					alert(msg)
				},
				error:function(ee){		// 실패시
					console.log(ee)
				}
			}) 
			
		}
		
		function markchek(){
			$.ajax({
				url:"/KRProj/Ajax/MarkChek",	 // 내용을 보내고 가져올 페이지
				type:"POST" ,
				data:{code:$("#code").val()},
				
				success:function(ddd){	// 성공시
					//alert(eval(ddd))
					
					if(eval(ddd)){
						$("input:checkbox[id='SList_detail_Chkheart']").prop("checked",true)
					}else{
						$("input:checkbox[id='SList_detail_Chkheart']").prop("checked",false)
					}
				},
				error:function(ee){		// 실패시
					console.log(ee)
				}
			}) 
			
		}
		if(logonon){
			markchek(); //로드후 실행
		}
		
		
		var cnt = 0
		
		
		function imgOpa(){
			$(".SList_detail_imgWrapper > .SList_detail_img").css('opacity','0')
			$(".SList_detail_imgBarWrapper > .SList_detail_imgBar").css('background','#ccc')
			
			
			$(".SList_detail_imgWrapper > .SList_detail_img").eq(cnt).animate({opacity: '1'})
			$(".SList_detail_imgBarWrapper > .SList_detail_imgBar").eq(cnt).css('background','#000')
		}
		$("#SList_detail_imgL").click(function(){
			
			if(cnt<1){
				cnt=1
			}
			cnt--
			console.log(cnt)
			imgOpa()
		})
		
		
		$("#SList_detail_imgR").click(function(){
			cnt++
			if(cnt>2){
				cnt=2
			}
			imgOpa()
			
		})
		
		imgOpa()
	})
</script>
    
    <style>
		.SList_detail_wrapper{
    		width:1200px;
    		margin: 100px auto;
    		background:#fff;
    	}    
    
    	.SList_detail_content{
    		width:380px;
    		background:#fff;
    		position:absolute;
    		top:10px;
    		left:600px;
    	}
    	.SList_detail_content_Wrapper{
    		width:100%;
    		height:700px;
    		position:relative;
    	}
    	.SList_detail_img{
    		width:100px;
    		height:100px;
    		float:left;
    		margin:3px;
    	}
    	#SList_detail_Img{
    		width:100px;
    		height:100px;
    	}
    	#SList_detail_Chkheart{
    		 display: none;
    	}
    	#SList_detail_Chkheart + .SList_detail_heart{
    		display: inline-block;
            width: 50px;
            height: 50px;
            background: url(../fff/heart1.png);
    	}
    	#SList_detail_Chkheart:checked + .SList_detail_heart{
    		display: inline-block;
            width: 50px;
            height: 50px;
            background: url(../fff/heart2.png);
    	}
    	#markChk{
    		width:200px;
    		height:200px;
    		position:absolute;
    		top:460px;
    		left:600px;
    	}
    	
    	#prd_img{
    		width:500px;
    		height:500px;
    	}
    	.SList_detail_imgWrapper{
    		width:500px;
    		height:500px;
    		position:absolute;
    		top:10px;
    		left:30px;
    	}
    	.SList_detail_img:nth-child(1){
    		width:500px;
    		height:500px;
    		position:absolute;
    		opacity:1;
    	}
    	.SList_detail_img{
    		width:500px;
    		height:500px;
    		position:absolute;
    		opacity:0;
    	}
    	
    	#SList_detail_imgR{
    		width:30px;
    		height:30px;
    		position:absolute;
    		top:255px;
    		left:470px;
    		z-index: 1;
    		background:url(../fff/imgarrowR.png);
    	}
    	#SList_detail_imgL{
    		width:30px;
    		height:30px;
    		position:absolute;
    		lefr:20px;
    		top:255px;
    		z-index: 1;
    		background:url(../fff/imgarrowL.png);
    	}
    	.SList_detail_imgBarWrapper{
    		width:390px;
    		height:5px;
    		position:absolute;
    		z-index: 1;
    		left:55px;
    		top:480px;
    	}
    	.SList_detail_imgBar:nth-child(1){
    		width:130px;
    		height:3px;
    		background:#000;
    		float:left;
    	}
    	.SList_detail_imgBar{
    		width:130px;
    		height:3px;
    		background:#ccc;
    		float:left;
    	}
    	.goFormReg{
    		width:70px;
    		height:30px;
    		background:#000;
    		color:#fff;
    		text-align:center;
    		border-radius:10px 10px 10px 10px / 10px 10px 10px 10px;
    		line-height:30px;
    		float:left;
    		margin-left:10px;
    	}
    	.goFormRegWrapper{
    		width:220px;
    		height:30px;
    		position:absolute;
    		left:670px;
    		top:470px;
    	}
    	.SList_detail_name{
    		width:300px;
    		height:30px;
    		position:absolute;
    		left:600px;
    		top:300px;
    	}
    	.SList_detail_gender{
    		width:220px;
    		height:30px;
    		position:absolute;
    		left:600px;
    		top:330px;
    	}
    	.SList_detail_price{
    		width:220px;
    		height:30px;
    		position:absolute;
    		left:600px;
    		top:360px;
    	}
    </style>
    
   <%
	NumberFormat nf = NumberFormat.getNumberInstance();
	
   
   %>
    
    <input type="hidden" name="code" value="<%=dto.getCode()%>" id="code"/>
    <div class="SList_detail_wrapper">
    <div class="SList_detail_content_Wrapper">

    <%if(arr != null){ %>
    	<div class="SList_detail_imgWrapper">
    	<div id="SList_detail_imgL"></div>
    	<%int tt = 2; %>
	    <%for(PrdImgDTO idto : arr) {
	    imgcnt++;
	    %>
	    	<div class="SList_detail_img">
	    	<img src="../prdImg/<%=idto.getImg().substring(0, idto.getImg().length() - 5)+tt%>.jpg" alt="" id="prd_img"/>
	    	<%tt++; %>
	    	</div>
	    <%} %>
	    <div id="SList_detail_imgR"></div>
	    <div class="SList_detail_imgBarWrapper">
	    <%for(int aa = 0 ; aa < 3 ; aa++) {%>
	    	<div class="SList_detail_imgBar"></div>
	    	<%} %>
	    </div>
	    </div>
    <%} %>
    <div class="SList_detail_content"><b><%=dto.getContent() %></b></div>
    <div class="SList_detail_name"><b>● 모델명 : <%=dto.getPrd_name() %></b></div>
    <div class="SList_detail_gender"><b>● 성별 : <%=dto.getGender_type() %></b></div>
    <%	String tt =  nf.format(dto.getSail_price()); %>
    <div class="SList_detail_price"><b>● 판매가격 : <%=tt %> \</b></div>
    <label id="markChk">
    	<input type="checkbox" id="SList_detail_Chkheart"/><div class="SList_detail_heart"></div>
   </label>
    <%if(level==3){ %>
    <div class="goFormRegWrapper">
    <a href="ListUpdateForm?code=<%=dto.getCode()%>"><div class="goFormReg">수정</div></a>
    <a href="ListDeleteReg?code=<%=dto.getCode()%>"><div class="goFormReg">삭제</div></a>
    </div>
    <%} %>
    </div>
    </div>