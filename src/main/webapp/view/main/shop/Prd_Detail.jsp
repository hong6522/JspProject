<%@page import="java.util.ArrayList"%>
<%@page import="model_p.ReviewDTO"%>
<%@page import="model_p.SessionData"%>
<%@page import="model_p.PrdDTO"%>
<%@page import="model_p.PData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
PData pd = (PData)request.getAttribute("pd"); 
PrdDTO dto = (PrdDTO)request.getAttribute("mainData"); 
SessionData sd = (SessionData)session.getAttribute("SessionData");
String code = request.getParameter("code");
%>
<script src="/KRProj/jquery/jquery_3_6_3.js"></script>
<script>
$(function(){
	$("#prd_detail_Golist").hover(function(){
		$(this).css({background:"#000"})
		$("#Golist_btn").css({color:"#fff"})
		},
		function(){
			$(this).css({background:"#fff"})
			$("#Golist_btn").css({color:"#000"})
	})
})
function modifyItem(num) {
	
	$(".prd_detail_reModify").css({height:"0px"})
	$("#prd_"+num).css({height:"250px"})

	
}

function modifyCancel(num) {

	$(".prd_detail_reModify").css({height:"0px"})
	
}

function insertItem() {

	var inser = document.getElementById("prd_detail_insert");

	inser.style.display = "block";
	
}

function insertCancel() {

	var inser = document.getElementById("prd_detail_insert");

	inser.style.display = "none";
	
}

function fileDelete(num) {
    if (confirm("작업중인 내용이 초기화 됩니다.\n파일을 삭제하시겠습니까?")) {
        $('#modifyFrm').attr('action', 'ReFileDelete?num=' + num);
        $('#modifyFrm').submit();
    }
}



</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Cabin:wght@500&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');
#prd_detail_top{
	width: 1200px;
	height: 600px;
	font-family: 'Cabin', sans-serif;
	color: #000;
	background: #fff;
	border: 1px solid #fff;
	margin: auto;
}

#prd_detail_img{
	width: 575px;
	height: 575px;
	margin: 10px;
	float: left;	
}

#prd_detail_imgFile{
	width: 575px;
	height: 575px;
	float: left;
	box-shadow: 5px 5px 2px 1px rgba(40,40,40,0.7);
}

#prd_detail_info{
	width: 545px;
	height: 545px;
	margin: 10px;
	border-radius: 30px;
	float: left;	
	position: relative;
	box-shadow: 5px 5px 2px 1px rgba(40,40,40,0.7);
	padding: 15px;
}

#prd_detail_imT{
	font-size: 0.9rem;
	font-family: 'Noto Sans KR', sans-serif;
}

#prd_detail_im{
	width: 530px;
	margin: 10px;
	margin-top: 30px;
	font-size: 1.3rem;
	font-family: 'Noto Sans KR', sans-serif;
}

#prd_detail_im:nth-child(5){
	text-align: right;
	font-size: 1.5rem;
}

#prd_detail_SGCnt{
	position: absolute;
	bottom: 10px;
	width: 530px;
	margin: 10px;
	margin-bottom: 38px;
	text-align: right;
}

#prd_detail_buy{
	position: absolute;
	bottom: 10px;
	width: 530px;
	margin: 10px;
	margin-bottom: 0px;
	text-align: center;
}

#prd_buyButton{
	width: 250px;
	height: 38px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 1.5rem;
	background: #EF6253;
	border: 3px solid #f00;
	border-radius: 10px;
	color: #fff;
	box-shadow: 
    3px 0px 1px 0px #f30,
    -3px 0px 1px 0px #f30,
    0px -3px 1px 0px #f30,
    0px 3px 1px 0px #f30;
    font-weight: bold;
}
/*-------------------------------top 디자인 끝------------------------------------*/
#prd_detail_mid{
	width: 1200px;
	height: 800px;
	border: 1px solid #fff;
	background: #fff;
	margin: auto;
}

#prd_detail_deImg{
	width: 1080px;
	height: 700px;
	border-radius: 15px;
	margin: 50px;
	overflow: scroll;
}

#prd_detail_deImg::-webkit-scrollbar {
  width: 10px;
}

#prd_detail_deImg::-webkit-scrollbar-thumb {
  background-color: #ccc;
  border-radius: 5px;
}

#prd_detail_deImg::-webkit-scrollbar-track {
  background-color: #555;
  border-radius: 5px;
}

#prd_detail_ImgFile{
	width: 1069px;
	height: 700px;
	border-radius: 10px;
}
/*------------------------------ㅡmid 디자인 끝-------------------------------------*/
#prd_detail_reList{
	width: 1198px;
	border: 2px solid #fff;
	border-top: 1px solid #aaa;
	background: #fff;
	font-size: 0.9rem;
	font-family: 'Noto Sans KR', sans-serif;
	margin: auto;
}

#prd_detail_reDetail{
	width: 1080px;
	height: 100px;
	margin: 30px;
	margin-left: 50px;
	/*border: 1px solid #333;*/
	border-radius: 5px;
	/*box-shadow: 3px 3px 1px 0px #333;*/
}

#prd_detail_reImg{
	width: 100px;
	height: 90px;
	margin: 5px;
	float: left;
}
#prd_review_img{
	width: 100px;
	height: 90px;
	box-shadow: 1px 1px 1px 0px #333;
}

#prd_detail_reInfo{
	width: 800px;
	height: 90px;
	margin: 5px;
	float: left;
}

#prd_detail_rePoint{
	width: 700px;
	height: 30px;
	margin: auto;
}

#prd_detail_reUser{
	width: 250px;
	height: 30px;
	margin: auto;
	float: left;
	text-align: center;
}

#prd_detail_reStar{
	width: 400px;
	height: 30px;
	margin: auto;
	float: left;
	text-align: center;
}

#ColorStar{
	width: 30px;
	height: 30px;
	float: left;
}

#ColorStar > img{
	width: 28px;
	height: 28px;
}

#prd_detail_reCont{
	width: 700px;
	height: 50px;
	margin-left: 10px;
	line-height: 50px;
}

#prd_detail_reFun{
	width: 140px;
	height: 90px;
	margin: 5px;
	float: left;
	text-align: center;
}

#prd_detail_reBut{
	margin-top: 5px;
}

#prd_detail_modify{
	width: 700px;
	border: 1px solid #333;
	border-radius: 10px;
	margin-left: 200px;
	text-align: center;
}

#prd_detail_modiTitle{
	width: 650px;
	margin: auto;
	clear: both;
	padding: 10px;
}

#prd_detail_modinfo{
	width: 301px;
	margin: auto;
	float: left;
}
#prd_detail_modinfo:first-child{
	text-align: center;
}
#prd_detail_modinfo:last-child{
	text-align: left;
	margin-left: 10px;
}


#prd_detail_Golist{
	width: 90px;
	height: 40px;
	margin: auto;
	margin-bottom: 10px;
	border: 1px solid #000;
	border-radius: 10px;
	background: #fff;
	text-align: center;
}

#Golist_btn{
	color: #000;
	font-size: 1rem;
	font-family: 'Noto Sans KR', sans-serif;
	line-height: 40px;
	text-decoration-line : none;
}

#prd_insertBut{
	width: 1080px;
	text-align: right; 
	margin-bottom: 30px; 
}

#prd_detail_insert{
	width: 700px;
	border: 1px solid #333;
	border-radius: 10px;
	margin-left: 200px;
	margin-top: 50px;
	text-align: center;
	display: none;
}
#prd_detail_inserTitle{
	width: 650px;
	margin: auto;
	clear: both;
	padding: 10px;
	margin-top: 10px;
	margin-bottom: 10px;
}

#prd_detail_inserinfo{
	width: 301px;
	margin: auto;
	float: left;
	margin-top: 10px;
	margin-bottom: 10px;
}

#prd_detail_inserinfo:first-child{
	text-align: center;
}
#prd_detail_inserinfo:last-child{
	text-align: left;
	margin-left: 10px;
}

#prd_detail_infunc{
	width: 1000px;
	margin: auto;
	padding: 10px;
	clear: both;
}
.prd_detail_reModify{
	width: 2000px;
	height:0px;
	overflow: hidden;
}

.prd_detail_btn{
	width: 75px;
	height: 26px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 0.8rem;
	background: #fff;
	color: #000;
	border-radius: 5px;
}
.prd_detail_btn:hover{
	background: #000;
	color: #fff;
}

#prd_insert_btn {
	margin-top: 20px;
}

</style>

<div id="prd_detail_top">
	<div id="prd_detail_img"><img alt="" src="../prdImg/<%=dto.getImg() %>" id="prd_detail_imgFile"></div>
	<div id="prd_detail_info">
		<div id="prd_detail_imT">『 NAME 』</div>
		<div id="prd_detail_im"><%=dto.getPrd_name() %></div>
		<hr>
		<div id="prd_detail_imT">『 PRICE 』</div>
		<div id="prd_detail_im"><%=dto.getSail_price() %>￦</div>
		<hr>
		<div id="prd_detail_imT">『 CONTENT 』</div>
		<div id="prd_detail_im"><%=dto.getContentBr() %></div>
		<hr>
		<form action="Prd_BuyReg">
			<div id="prd_detail_SGCnt">
				<input type="number" value="1" name="buyCnt" min="1" max="100" >EA
				<input type="hidden" name="code" value="<%=dto.getCode() %>" />
				<input type="hidden" name="nowPage" value="<%=pd.getNowPage() %>" />
			</div>
			<div id="prd_detail_buy">
				<input type="submit" value="B U Y" id="prd_buyButton">
			</div>
		</form>
	</div>
</div>

<div id="prd_detail_mid">
	<div id="prd_detail_deImg">
<% for(int i = 1; i <= dto.getImgCnt(); i++) {%>
		<img alt="" src="../prdImg/<%=dto.getDetailImg()+i %>.jpg" id="prd_detail_ImgFile">
<%} %>
	</div>
</div>
<%-- -------------------------------review 구간 시작-------------------------------------- --%>
<div id="prd_detail_reList">
<%

for(ReviewDTO rDto : (ArrayList<ReviewDTO>)request.getAttribute("reviewData")) {
	if(rDto.getGid().equals(request.getParameter("code"))){
%>
	<form action="Prd_reviewDelete" >
	<input type="hidden" name="num" value="<%=rDto.getNum() %>" >
	<input type="hidden" name="code" value="<%=rDto.getGid() %>" >
	<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>" >
		<div id="prd_detail_reDetail">
			<% if((!rDto.getImg().equals(""))||(!rDto.getImg().equals("null"))||rDto.getImg()!=null) {%>
			<div id="prd_detail_reImg">
				<img alt="" src="../prdImg/<%=rDto.getImg() %>" id="prd_review_img">
			</div>
			<%} %>
			<div id="prd_detail_reInfo">
				<div id="prd_detail_rePoint">
					<div id="prd_detail_reUser"><%=rDto.getNick() %></div>
					<div id="prd_detail_reStar">
						<%for(int j = 1; j <= rDto.getStar(); j++) {%>
							<div id="ColorStar"><img alt="" src="../prdImg/star.png"></div>
						<%} %>
						<%if(rDto.getStar()!=5){ 
						for(int j = 1; j <= 5-rDto.getStar(); j++) {%>
							<div id="ColorStar"><img alt="" src="../prdImg/starNone.png"></div>
						<%}} %>
					</div>
				</div>
				<div id="prd_detail_reCont"><%=rDto.getContentBr() %></div>
			</div>
			<div  id="prd_detail_reFun">
				<div  id="prd_detail_reBut"><%=rDto.getReg_dateStr() %></div>
			<%if(sd != null && rDto.getId().equals(sd.getId())) {%>
				<div id="prd_detail_reBut"><input type="button" value="수정" onclick="modifyItem(<%=rDto.getNum() %>)" class="prd_detail_btn"></div>
				<div id="prd_detail_reBut"><input type="submit" value="삭제" class="prd_detail_btn"></div>
			<%} %>
			</div>
		</div>
	</form>
	

	

	<div class='prd_detail_reModify' id="prd_<%=rDto.getNum() %>" >
		<form action="Prd_reviewModify" name="frm"  enctype="multipart/form-data" method="post" id="modifyFrm">
		<input type="hidden" name="num" value="<%=rDto.getNum() %>" >
		<input type="hidden" name="gid" value="<%=rDto.getGid() %>" >
		<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>" >
			<div id="prd_detail_modify">
				<div id="prd_detail_modiTitle">
					<div id="prd_detail_modinfo">닉네임</div>
					<div id="prd_detail_modinfo">
						<input type="text" name="nick" value="<%=rDto.getNick() %>" readonly >
					</div>
				</div>
				<br/><hr>
				<div id="prd_detail_modiTitle">
					<div id="prd_detail_modinfo">평점</div>
					<div id="prd_detail_modinfo">
						<input type="number" name="star" value="<%=rDto.getStar() %>" max="5" min="1" >
					</div>
				</div>
				<br/><hr>
				<div id="prd_detail_modiTitle">
					<div id="prd_detail_modinfo">내용</div>
					<div id="prd_detail_modinfo">
						<input type="text" name="content" value="<%=rDto.getContentBr() %>" cols="500" rows="5" >
					</div>
				</div>
				<br/><hr>
				<div id="prd_detail_modiTitle">
					<div id="prd_detail_modinfo">파일명</div>
					<div id="prd_detail_modinfo">
					<% if(rDto.getImg()!=null && !rDto.getImg().equals("notImg.jpg")) {%>
						<input type="text" name="img" value="<%=rDto.getImg() %>" >
						<input type="button" value="파일삭제" onclick="fileDelete(<%=rDto.getNum() %>)" class="prd_detail_btn">
					<%} else{%>
						<input type="file" name="img" value="" id="prd_upfile" >
					<%} %>
					</div> 
				</div>
				<br/><hr>
				<div id="prd_detail_modiTitle">
					<input type="submit" value="수정" class="prd_detail_btn">
					<input type="reset" value="초기화" class="prd_detail_btn">
					<input type="button" value="수정취소" onclick="modifyCancel(<%=rDto.getNum() %>)" class="prd_detail_btn">
				</div>
			</div>
		</form>
</div>
	<hr>
	<%} %>

<% }%>

<%if(sd == null) {%>
		<div style="display: none;"></div>
	<%} else {%>
<div id="prd_insertBut">
	<form action="Prd_insert" enctype="multipart/form-data" method="post">
		<input type="hidden" name="gid" value="<%=request.getParameter("code") %>" >
		<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>" >
		<div id="prd_detail_insert">
			<div id="prd_detail_inTitle">
				<div id="prd_detail_inserinfo">닉네임</div>
				<div id="prd_detail_inserinfo">
					<input type="text" name="nick" value="<%=sd.getNick() %>" readonly >
				</div>
			</div>
			<br/><br/><hr>
			<div id="prd_detail_inTitle">
				<div id="prd_detail_inserinfo">평점</div>
				<div id="prd_detail_inserinfo">
					<input type="number" name="star" value="" max="5" min="1" >
				</div>
			</div>
			<br/><br/><hr>
			<div id="prd_detail_inTitle">
				<div id="prd_detail_inserinfo">내용</div>
				<div id="prd_detail_inserinfo">
					<input type="text" name="content" value="" cols="100" rows="1" >
				</div>
			</div>
			<br/><br/><hr>
			<div id="prd_detail_inTitle">
				<div id="prd_detail_inserinfo">사진파일</div>
				<div id="prd_detail_inserinfo">
					<input type="file" name="img" value="">
				</div><br/>
			</div>
			<br/><br/><hr>
			<div id="prd_detail_inTitle">
			<br/>
				<input type="submit" value="리뷰작성" class="prd_detail_btn">
				<input type="reset" value="초기화" class="prd_detail_btn">
				<input type="button" value="작성취소" onclick="insertCancel()" class="prd_detail_btn">
			
			</div><br/>
		</div>
		
	</form>



<input type="button" value="리뷰작성" onclick="insertItem()" class="prd_detail_btn" id="prd_insert_btn"></div>
<%} %>
</div>

<%-- -------------------------------review 끝-------------------------------------- --%>

<div id="prd_detail_Golist">
<a href="Prd_saleList?nowPage=<%=pd.getNowPage() %>" id="Golist_btn">이전페이지</a></div>

