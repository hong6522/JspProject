<%@page import="model_p.PDataBoard"%>
<%@page import="model_p.PData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% PDataBoard pd = (PDataBoard)request.getAttribute("pd"); %>
<h2> 글쓰기 입니다.</h2>

<form action="BoardInsertReg" method="post" enctype="multipart/form-data">
    <table border="">
        <tr>
            <td>제목</td>
            <td><input type="text" name="title" /></td>
        </tr>
        <tr>
            <td>작성자</td>
            <td><input type="text" name="pname" /></td>
        </tr>
        <tr>
            <td>파일</td>
            <td><input type="file" name="upfile" /></td>
        </tr>
        <tr>
            <td>내용</td>
            <td><textarea cols="50" rows="5" name="content" placeholder="내용을 적으세요" /></textarea></td>
        </tr>
        <tr>
            <td colspan="2" align = "center">
                <input type="submit" value="작성"  />
                <input type="reset" value="초기화"  />
                <a href="BoardList?nowPage=<%=pd.getNowPage()%>">목록으로</a>
            </td>

        </tr>
    </table>
</form>