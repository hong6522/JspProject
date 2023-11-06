<%@page import="model_p.OrdersDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model_p.MembersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% ArrayList<OrdersDTO> list = (ArrayList<OrdersDTO>)request.getAttribute("MyOrder");%>

<style>
  .container {
    max-width: 1200px;
    margin: 0 auto;
  }

  .order-table {
    border-collapse: collapse;
    width: 100%;
    margin: 50px auto;
  }

  .order-table th,
  .order-table td {
    padding: 12px 15px;
    text-align: center;
    border-bottom: 1px solid #ddd;
  }

  .order-table th {
    background-color: #f5f5f5;
  }

  .order-table td a {
    color: #555;
    text-decoration: none;
  }

  .order-table td a:hover {
    color: #333;
    font-weight: bold;
  }

  .order-table td:first-child {
    width: 100px;
  }

  .order-table td:nth-child(2) {
    width: 500px;
  }

  .order-table td:nth-child(3),
  .order-table td:nth-child(4),
  .order-table td:nth-child(5) {
    width: 100px;
  }
  
  .order-table td:nth-child(6) {
    width: 100px;
  }

  .order-table td:last-child {
    width: 100px;
  }

  .order-table tr:last-child td {
    border-bottom: none;
  }
</style>

<div class="container">
  <h1>나의 주문내역입니다.</h1>
  <table class="order-table">
    <thead>
      <tr>
        <th>주문번호</th>
        <th>제품명</th>
        <th>갯수</th>
        <th>금액</th>
        <th>주문상태</th>
        <th>주문시간</th>
        <th>문의하기</th>
      </tr>
    </thead>
    <tbody>
      <% for(OrdersDTO dto : list) { %>
      <tr>
        <td>
          <a href="Order_Detail?order_no=<%=dto.getOrder_no() %>">
            <%=dto.getOrder_no() %>
          </a>
        </td>
        <td>
          <a href="/KRProj/Shop/Prd_Detail?code=<%=dto.getCode() %>">
            <%=dto.getPrd_name() %>
          </a>
        </td>
        <td><%=dto.getCnt() %></td>
        <td><%=dto.getTotpri() %></td>
        <td><%=dto.getDlvryStts() %></td>
        <td><%=dto.getReg_dateStr() %></td>
        <td>
          <a href="QnAboard?order_no=<%=dto.getOrder_no() %>">
            문의하기
          </a>
        </td>
      </tr>
      <% } %>
    </tbody>
  </table>
</div>

