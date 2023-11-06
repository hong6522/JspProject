<%@page import="java.util.ArrayList"%>
<%@page import="model_p.MembersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
	ArrayList<MembersDTO> memlist = (ArrayList<MembersDTO>)request.getAttribute("mainData");
%>

<table border="" width="100%">
<tr>
<td>아이디</td><td>이름</td><td>닉네임</td><td>생일</td><td>전화번호</td><td>등급</td><td>블랙리스트</td>
</tr>

<%for(MembersDTO dto : memlist) {%>

<tr>
<td><%=dto.getId() %></td><td><%=dto.getPname() %></td><td><%=dto.getNick() %></td><td><%=dto.getbirthStr() %></td><td><%=dto.getTel() %></td>
<td>
<select name="level">    
                        <option value="1" <%if(dto.getLevel()==1){%>selected <%} %>>일반</option>
                        <option value="3" <%if(dto.getLevel()==3){%>selected <%} %>>관리자</option>
</select>
</td>

<td><a href="">블랙리스트 <%if(dto.getBklist()==0){%>등록 <%}else{%>해제<%} %></a></td>


</tr>

<%}%>
</table>


