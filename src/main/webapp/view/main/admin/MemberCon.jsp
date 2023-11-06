<%@page import="java.util.ArrayList"%>
<%@page import="model_p.MembersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
	ArrayList<MembersDTO> memlist = (ArrayList<MembersDTO>)request.getAttribute("mainData");

%>

<script>
function change(id) {

	  var level = document.getElementsByName("level"+id)[0].value;
		alert("회원등급 변경"+id+level);

	  location.href = "MemberCon?level=" + level + "&id="+id;
	}
</script>

<style>
.container {

  width: 1200px;
  height: 1000px;
  margin: 100px auto;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.search-bar {
  margin-bottom: 20px;
}

.table {
  display: flex;
  flex-direction: column;
  border: 1px solid black;
  width: 100%;
}

.table-header {
  display: flex;
  flex-direction: row;
  background-color: lightgray;
  border-bottom: 1px solid black;
  font-weight: bold;
}

.cell {
  flex: 1;
  padding: 10px;
  border-right: 1px solid black;
  text-align: center;
}

.cell:last-child {
  border-right: none;
}

.table-row {
  display: flex;
  flex-direction: row;
  border-bottom: 1px solid black;
}

		#DeliveryButton{
    		width:70px;
    		height:30px;
    		background:#001529;
    		color:#fff;
    		text-align:center;
    		border-radius:10px 10px 10px 10px / 10px 10px 10px 10px;
    		line-height:30px;
    		margin-left:10px;
    	}

</style>



<div class="container">
<h2>회원관리</h2>
	<hr />
  <div class="search-bar">
    <form action="MemberCon">
      <input type="text" name="sch" placeholder="검색">
      <select name="kind" >
        <option value="id" >아이디</option>
        <option value="pname" >이름</option>
      </select>
      <input type="submit" value="검색" id="DeliveryButton"/>
    </form>
  </div>
  
  <div class="table">
    <div class="table-header">
      <div class="cell">아이디</div>
      <div class="cell">이름</div>
      <div class="cell">닉네임</div>
      <div class="cell">생일</div>
      <div class="cell">전화번호</div>
      <div class="cell">등급</div>
    </div>
    <%for(MembersDTO dto : memlist) {%>
    <div class="table-row">
      <div class="cell"><%=dto.getId()%></div>
      <div class="cell"><%=dto.getPname() %></div>
      <div class="cell"><%=dto.getNick() %></div>
      <div class="cell"><%=dto.getbirthStr() %></div>
      <div class="cell"><%=dto.getTel() %></div>
      <div class="cell">
        <select name="level<%=dto.getId()%>" onchange="change('<%=dto.getId()%>')">
          <option value="3" <%if(dto.getLevel()==3){%>selected <%} %>>관리자</option>
          <option value="2" <%if(dto.getLevel()==2){%>selected <%} %>>일반</option>
          <option value="1" <%if(dto.getLevel()==1){%>selected <%} %>>블랙리스트</option>
        </select>
      </div>
    </div>
    <%}%>
  </div>
</div>


