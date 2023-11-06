<%@page import="model_p.OrdersDTO"%>
<%@page import="model_p.PData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <title>Password Modification Form</title>
    <style>
      /* main container */
      .container {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 600px;
        margin: 100px;
      }
      
      /* form container */
      .form-container {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        background-color: #F0F0F0;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
      }
      
      /* form title */
      .form-title {
        font-size: 1.5rem;
        margin-bottom: 10px;
      }
      
      /* form input field */
      .form-input {
        padding: 5px;
        border-radius: 5px;
        border: 1px solid #CCC;
        margin-bottom: 10px;
        width: 200px;
      }
      
      /* form submit button */
      .form-submit {
        padding: 5px 10px;
        background-color: #4CAF50;
        color: white;
        border-radius: 5px;
        border: none;
        cursor: pointer;
      }
      
      /* form submit button on hover */
      .form-submit:hover {
        background-color: #3E8E41;
      }
      
    </style>
  </head>
  <body>
    <div class="container">
      <div class="form-container">
        <%if(request.getParameter("repw")!= null){%>
          <script type="text/javascript">
          alert("Password has been modified.");
          location.href = "Login";
          </script>
        <%}%>
        <div class="form-title">새 비밀번호 입력</div>
        <form action="PwModi">
          <input type="text" id="repw" name="repw" class="form-input" required>
          <input type="submit" value="Submit" class="form-submit">
        </form>
      </div>
    </div>
  </body>
