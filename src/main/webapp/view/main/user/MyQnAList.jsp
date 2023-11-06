<%@page import="model_p.qnaboardDTO"%>
<%@page import="model_p.MarkDTO"%>
<%@page import="model_p.OrdersDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model_p.MembersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% ArrayList<qnaboardDTO> list = (ArrayList<qnaboardDTO>)request.getAttribute("MyQnA");%>

<style>
  .container {
  	height: 800px;
    width: 1200px;
    margin: 0 auto;
  }

  .qna-table {
    border-collapse: collapse;
    width: 100%;
    margin: 50px auto;
  }

  .qna-table th,
  .qna-table td {
    padding: 12px 15px;
    text-align: center;
    border-bottom: 1px solid #ddd;
  }

  .qna-table th {
    background-color: #f5f5f5;
  }

  .qna-table td a {
    color: #555;
    text-decoration: none;
  }

  .qna-table td a:hover {
    color: #333;
    font-weight: bold;
  }

  .qna-table td:first-child {
    width: 20%;
  }

  .qna-table td:nth-child(2) {
    width: 15%;
  }

  .qna-table td:nth-child(3) {
    width: 35%;
  }

  .qna-table td:nth-child(4) {
    width: 15%;
  }

  .qna-table td:last-child {
    width: 15%;
  }

  .qna-table tr:last-child td {
    border-bottom: none;
  }
</style>

<div class="container">
  <h1>나의 문의내역</h1>
  <table class="qna-table">
    <thead>
      <tr>
        <th>주문번호</th>
        <th>문의종류</th>
        <th>문의내용</th>
        <th>답변상태</th>
        <th>문의날짜</th>
      </tr>
    </thead>
    <tbody>
      <% for(qnaboardDTO dto : list) { %>
      <tr>
        <td>
          <a href="Order_Detail?order_no=<%=dto.getOrder_no() %>">
            <%=dto.getOrder_no() %>
          </a>
        </td>
        <td><%=dto.getKind() %></td>
        <td><%=dto.getContent() %></td>
        <td><a href="MyQnADetail?no=<%=dto.getNo() %>"><%=dto.getState() %></a></td>
        <td><%=dto.getReg_dateStr() %></td>
      </tr>
      <% } %>
    </tbody>
  </table>
</div>
