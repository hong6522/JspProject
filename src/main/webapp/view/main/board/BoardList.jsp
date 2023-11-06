<%@page import="model_p.PDataBoard"%>
<%@page import="model_p.SessionData"%>
<%@page import="model_p.PData"%>
<%@page import="java.util.Arrays"%>
<%@page import="model_p.PData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model_p.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% PDataBoard pd = (PDataBoard)request.getAttribute("pd"); 
    SessionData sd = null;

    if(session.getAttribute("SessionData") != null){
    sd = (SessionData)session.getAttribute("SessionData");
}
%>
<style>
.wrap {
	width: 1200px;
	margin: 50px auto;
}

.row {

	width: 1200px;
	justify-content: center;
	display: flex;
	flex-wrap: wrap;
	border-bottom: 1px solid midnightblue;
	padding: 12px 0;
}

.jaemok>div {
	float: left;
	padding-bottom: 15px;
	padding-top: 5px;
	font-weight: 600;
	
}
.jaemok {
	width: 1200px;
	font-size: large;
	border: 1px solid midnightblue;
	border-radius: 5px;
	height: 40px;
}

.row>div {
	margin-right: 80px;
	text-align: center;
}

.pagenum {
	text-align: center;
}

#small {
	width: 62px;
}

#big {
	width: 153px;
	padding-left: 50px;
}

.hh {
	padding-bottom: 29px;
    margin-left: 302px;
    font-weight: bold;
    font-size: 25px;

}

#tt {
	width: 40px;
	margin-left: 255px;
	s
}

#title {
	width: 200px;
	text-align: left;
}

#pp {
	width: 55px;
	margin-left: 263px;
}

#pname {
	width: 100px;
	text-align: left;
}

#title a {
	text-decoration-line: none;
}

#pdate {
	margin-right: 128px;
}

#num {
	width: 40px;
	margin-left: 44px;
}

#dd {
	width: 55px;
	margin-left: 139px;
}

#cnt {
	width: 55px;
	margin-left: 137px;
}
</style>

<div class="hh">자유게시판</div>
<div class="wrap" >

<div class="jaemok">
	<div id="num"  >번호</div>
	<div id="tt">제목</div>
	<div id="pp">작성자</div>
	<div id="dd">작성일</div>
<div id="cnt">조회수</div>
</div>

<%
int i = 1;
for(BoardDTO dto : (ArrayList<BoardDTO>)request.getAttribute("mainData")){ 
%>
<div class="row">
	<div id="small"><%=pd.getStart() + i++ %></div>
<div id="title" style="width:400px"  >	<a href="BoardDetail?id=<%=dto.getId() %>&nowPage=<%=pd.getNowPage()%>"><%=dto.getTitle() %></a></div>
	<div id="pname"><%=dto.getPname() %></div>
	<div id="pdate"><%=dto.getReg_dateStr() %></div>
<div  id="small">	<%=dto.getCnt() %></div>
</div>


<%} %>	
<div class="pagenum">
	
		<% if(pd.getStartPage() > 1){%>
		<a href="?nowPage=<%=pd.getStartPage()-1%>">이전</a>
		<%} for(int p = pd.getStartPage(); p<=pd.getEndPage();p++) {
			if(pd.getNowPage()==p){%>
				[<%=p %>]
			<%} else { %>
			<a href="?nowPage=<%=p%>"><%=p%></a>
		<%}} if(pd.getEndPage() < pd.getTotalPage()){%>
		
			<a href="?nowPage=<%=pd.getEndPage()+1%>">다음</a>
		<%} %>
	
</div>
<div>
	
		<%if(sd != null){ %><a href="BoardInsertForm?nowPage=<%=pd.getNowPage()%>">글쓰기</a><%} %>
	
</div>
</div>

