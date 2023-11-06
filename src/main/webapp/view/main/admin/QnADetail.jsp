<%@page import="model_p.qnaboardDTO"%>
<%@page import="model_p.MembersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
   qnaboardDTO dto = (qnaboardDTO)request.getAttribute("mainData");
%>

<style>
.qna-detail {
    width: 1200px;
    height: 700px;
    max-width: 800px;
    margin: 0 auto;
    margin-bottom: 100px;
    padding: 20px;
    background-color: #f0f0f0;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.qna-detail div {
    margin-bottom: 10px;
}

.qna-detail span {
    font-weight: bold;
}

.qna-reply textarea {
    width: 100%;
    padding: 5px;
    border: 1px solid #ccc;
}

.qna-state form {
    display: inline-block;
}

.qna-state input[type="submit"] {
    margin-left: 10px;
    padding: 5px 10px;
    border: none;
    background-color: #008cba;
    color: #fff;
    cursor: pointer;
}

.qna-state input[type="submit"]:hover {
    background-color: #005b82;
}
#qna_textArea{
   margin-top: 10px;


}



</style>

<script>
<%
   if(session.getAttribute("SessionData") == null){%>
      alert("로그인이 필요한 페이지 입니다.");
      location.href = "Login";
<%}%>

function frmGo(){

     if(frm.content2.value==""){
        alert("답변을 입력해주세요.")
        return
     }
   
           alert("답변완료")
           frm.submit()
       
}
</script>

<div class="qna-detail">
    <div class="qna-id"><span>문의id:</span> <%=dto.getId() %></div>
    <div class="qna-kind"><span>문의종류:</span> <%=dto.getKind() %></div>
    <div class="qna-content"><span>문의내용:</span> <%=dto.getContent() %></div>
    <div class="qna-reply">
     <form action="QnAReg" name="frm">
        <span>답변내용:</span>
        <textarea cols="50" rows="5" name="content2" id="qna_textArea"/><%=dto.getContent2() %></textarea>
    </div>
    <div class="qna-state">
        <span>답변상태:</span>
       
            <select name="state">
                <option>미답변</option>
                <option>답변완료</option>
            </select>
            <input type="button" value="완료" onclick="frmGo()"/>
            <input type="hidden" name="no" value="<%=dto.getNo() %>"/>
        </form>
    </div>
</div>