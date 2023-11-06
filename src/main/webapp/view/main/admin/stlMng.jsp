<%@page import="model_p.DateData"%>
<%@page import="model_p.stlDTO"%>
<%@page import="model_p.OrdersDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<%
ArrayList<stlDTO> res = null;
String totPri = "";
int type = 1;
DateData dd = null;

if(request.getAttribute("mainData") != null) {
	res = (ArrayList<stlDTO>)request.getAttribute("mainData");
	totPri = (String)request.getAttribute("totPri");	
}


System.out.println(request.getAttribute("DateData"));
if(request.getAttribute("DateData") != null){
	System.out.println("ttt");
	dd = (DateData)request.getAttribute("DateData");
}

%>

<script>
  $(document).ready(function() {
    $('input[name=date_type]').change(function() {
      if ($(this).val() == '1') {
        $('#startDate').show();
        $('#sch').show();
        $('#year').hide();
        $('#month').hide();

      } else if ($(this).val() == '2') {
        $('#startDate').show();
        $('#year').show();
        $('#month').show();
        $('#startDate').hide();
        $('#sch').show();
      }
    });
  });
 
</script>

<%if(dd != null) {%>
<script>
function del(no){
	location.href = "stlMngdel?no=" + no + "&type=" + "<%=dd.getType()%>" + "&startDate=" + "<%=dd.getStartDate()%>" + "&year=" + "<%=dd.getYear()%>" + "&month=" + "<%=dd.getMonth()%>";
}

function insert(){
	 if(frm.insertDate.value==""){
         alert("날짜를 입력해주세요.")
         return
	  }
	   if(frm.content.value==""){
         alert("내용을 입력해주세요.")
         return
     }
	   if(frm.price.value==""){
	         alert("금액을 입력해주세요.")
	         return
	     }
	stlMng.action = "stlMngInsert";
}



</script>

<style>
.my-element {
  width: 100px;
  margin: 10px;
}

@media (min-width: 768px) {
  .my-element {
    width: 50%;
    margin: 20px auto;
  }
}

    form {
    	width: 1200px;
		margin: 20px auto;
		height: 800px;
        display: flex;
        flex-direction: column;
        align-items: center;
        font-family: Arial, sans-serif;
    }
    input[type=radio] {
        margin-right: 1em;
    }
    input[type=date], input[type=text], select {
        margin: 0.5em;
        padding: 0.5em;
        border: 1px solid #ccc;
        border-radius: 3px;
        font-size: 1em;
    }
    input[type=submit], input[type=button] {
        margin: 0.5em;
        padding: 0.5em 1em;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 3px;
        font-size: 1em;
        cursor: pointer;
    }
    input[type=submit]:hover, input[type=button]:hover {
        background-color: #3e8e41;
    }
    table {
        border-collapse: collapse;
        margin-top: 2em;
        font-size: 1em;
        width: 100%;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 0.5em;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
    }
    td:nth-child(4) {
        text-align: right;
    }
    td:last-child {
        text-align: center;
    }

    #stlsel{
    	width: 1200px;
    margin: 20px auto;
    
    
    }
    
    #DeliveryButton, .DeliveryButton{
    		width:70px;
    		height:30px;
    		background:#001529;
    		color:#fff;
    		text-align:center;
    		border-radius:10px 10px 10px 10px / 10px 10px 10px 10px;
    		line-height:18px;
    		margin-left:10px;
    	}
    
</style>

<%} %>


	
	<form action="stlMng" id="stlMng" class="my-element" name="frm">
		<h2>정산내역</h2>
	
	<div id="stlsel">
		<input type="radio" name="date_type" value="1" <%if(dd == null || dd.getType().equals("1")){%>checked<%}%>>일일정산
		<input type="radio" name="date_type" value="2" <%if(dd != null && dd.getType().equals("2")){%>checked<%}%>>월 정산
	<input type="date" id="startDate" name="startDate" value="<%if(dd != null && dd.getType().equals("1")){%><%=dd.getStartDate()%><%}%>"
	<%if(dd != null && dd.getType().equals("2")){%>style="display:none;"<%}%>>
	
	
	<select name="year" id="year" <%if(dd == null || dd.getType().equals("1")){%>style="display:none;"<%}%>>
		<option value="2021" <%if(dd != null && dd.getType().equals("2")){if(dd.getYear().equals("2021")){%>selected<%}}%>>2021</option>
		<option value="2022" <%if(dd != null && dd.getType().equals("2")){if(dd.getYear().equals("2022")){%>selected<%}}%>>2022</option>
		<option value="2023" <%if(dd != null && dd.getType().equals("2")){if(dd.getYear().equals("2023")){%>selected<%}}%>>2023</option>
		<option value="2024" <%if(dd != null && dd.getType().equals("2")){if(dd.getYear().equals("2024")){%>selected<%}}%>>2024</option>
	</select>
	
	<select name="month" id="month" <%if(dd == null || dd.getType().equals("1")){%>style="display:none;"<%}%>>
	<%for(int i = 1; i <=12; i++) {%>
		<option value="<%=i%>" <%if(dd != null && dd.getType().equals("2")){if(dd.getMonth().equals(i+"")){%>selected<%}}%>><%=i%></option>
	<%}%>
	</select>
	
	<button type="submit" id="sch" class="DeliveryButton">검색</button>
	</div>
	<%if(res != null) {%>
	<table border="">
		<tr>
			<td>번호</td><td>날짜</td><td>내역</td><td>금액</td><td>종류</td><td>삭제</td>
		</tr>
		<%for(stlDTO dto : res){ %>
		
			<tr>
			<td><%=dto.getStl_no() %></td><td><%=dto.getReg_dateStr() %></td><td><%=dto.getContent() %></td><td align="right"><%=dto.getPrice() %></td><td><%=dto.getKind() %></td>
			<td><input type="button" value="삭제" onclick="del(<%=dto.getStl_no() %>)" id="DeliveryButton"/> 
			</td>
			</tr>
		<%} %>
		<tr>
			
			<td></td>
			<td><input type="date" id="insertDate" name="insertDate" /></td>
			<td><input type="text" id="content" name="content" placeholder="내용을 입력하세요." /></td>
			<td><input type="text" id="price" name="price" placeholder="금액" /></td>
			<td>
			<select name="kind" id="kind">
				<option value="수입">수입</option>
				<option value="지출">지출</option>
			</select>
			</td><td><input type="submit" value="추가" onclick="insert()" id="DeliveryButton"/></td>
			
		</tr>
		<tr>
		<td colspan="6">영업이익 : <%=totPri %> 원</td>
		</tr>
	
	
		</table>
	
	<%} %>
	</form>


