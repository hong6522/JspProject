<%@page import="model_p.qnaboardDTO"%>
<%@page import="model_p.MarkDTO"%>
<%@page import="model_p.OrdersDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model_p.MembersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% ArrayList<qnaboardDTO> list = (ArrayList<qnaboardDTO>)request.getAttribute("MyQnA");
	
	String state = "";
	if(request.getParameter("state") != null){
		state = request.getParameter("state");
	}
%>
 
<style>
.container {
	width: 1200px;
	height: 1000px;
    margin: 50px auto;
}

h1 {
    margin-bottom: 20px;
    font-size: 36px;
}

.form-container {
	float: left;
    align-items: center;
    width: 100%;
    margin-bottom: 20px;
}

.form-container label {
    font-size: 20px;
    margin-right: 10px;
}

.form-container input[type=radio] {
    margin-right: 5px;
}

.form-container input[type=submit] {
    background-color: #001529;
    color: white;
    font-size: 16px;
    border: none;
    padding: 10px 16px;
    cursor: pointer;
    border-radius: 5px;
}

.row-container {
	float:left;
    align-items: center;
    width: 100%;
    background-color: #F8F8F8;
    border-radius: 5px;
    padding: 10px;
    margin-bottom: 10px;
}

.row-container > div{
	float:left;
	


}

.row-container:hover {
    background-color: #EDEDED;
}

.qna_no, .qna_id, .qna_order_no, .qna_kind, .qna_qq{

	width:100px;
	float:right;

}
.qna_content{

	width:500px;
}

#qna_title{
	color: #fff;
	background-color: #001529;


}


</style>
<form action="QnAlist">
<div class="container">
    <h1>회원 문의 내역입니다.</h1>

    <div class="form-container">
        <label>답변상태</label>
        <input type="radio" value="전체" name="state" <%if(state.equals("전체")){%>checked <%}%> />전체
        <input type="radio" value="미답변" name="state" <%if(state.equals("미답변")){%>checked <%}%>/>미답변
        <input type="radio" value="답변완료" name="state" <%if(state.equals("답변완료")){%>checked <%}%>/>답변완료
        <input type="submit" value="검색" /> 
    </div>

	<div class="row-container"  id="qna_title">
        <div class="qna_no">문의번호</div>
        <div class="qna_id">문의자id</div>
        <div class="qna_order_no">주문번호</div>
        <div class="qna_kind">문의종류</div>
        <div class="qna_content">문의내용</div>
        <div class="qna_qq">답변상태</div>
        <div class="qna_reg_date">문의날짜</div>
    </div>


    <% for(qnaboardDTO dto : list) { %>
    <div class="row-container">
        <div class="qna_no"><%=dto.getNo() %></div>
        <div class="qna_id"><%=dto.getId() %></div>
        <div class="qna_order_no"><a href="Order_Detail?order_no=<%=dto.getOrder_no() %>"><%=dto.getOrder_no() %></a></div>
        <div class="qna_kind"><%=dto.getKind() %></div>
        <div class="qna_content"><%=dto.getContent() %></div>
        <div class="qna_qq"><a href="QnADetail?no=<%=dto.getNo() %>"><%=dto.getState() %></a></div>
        <div class="qna_reg_date"><%=dto.getReg_dateStr() %></div>
    </div>
    <% } %>
</div>
</form>
