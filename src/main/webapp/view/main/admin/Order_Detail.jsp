<%@page import="model_p.OrdersDTO"%>
<%@page import="model_p.PData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
OrdersDTO dto = (OrdersDTO)request.getAttribute("mainData"); 
%>

<style>

	.table-container{
		width: 1200px;
		height: 800px;
    	margin: 50px auto;
	
	}

  table {
    border-collapse: collapse;
    width: 100%;
    margin-bottom: 20px;
  }
  table td, table th {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
  }
  table th {
    background-color: #f2f2f2;
  }
  table tr:nth-child(even) {
    background-color: #f2f2f2;
  }
</style>

<div class="table-container">
<h1>회원주문내역 상세페이지</h1>

<hr />
  <table>
    <thead>
      <tr>
        <th>주문번호</th>
        <th>제품명</th>
        <th>갯수</th>
        <th>금액</th>
        <th>주문상태</th>
        <th>주문시간</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><%=dto.getOrder_no() %></td>
        <td><a href="/KRProj/Shop/Prd_Detail?code=<%=dto.getCode() %>"><%=dto.getPrd_name() %></a></td>
        <td><%=dto.getCnt() %></td>
        <td><%=dto.getTotpri() %></td>
        <td><%=dto.getDlvryStts() %>             

        </td>
        <td><%=dto.getReg_dateStr() %></td>
      </tr>
      <tr>
        <td>수령인</td>
        <td colspan="5"><%=dto.getClient() %></td>
      </tr>
      <tr>
        <td>배송장소</td>
        <td colspan="5"><%=dto.getAddress() %></td>
      </tr>	
      <tr>
        <td>결재수단</td>
        <td colspan="5"><%=dto.getCardMk() %></td>
      </tr>	
      <tr>
        <td colspan="6" align="right"><a href="QnAlist">문의목록</a></td>
      </tr>	
    </tbody>
  </table>
</div>
