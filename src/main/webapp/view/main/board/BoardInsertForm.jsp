<%@page import="model_p.PDataBoard"%>
<%@page import="model_p.SessionData"%>
<%@page import="model_p.PData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PDataBoard pd = (PDataBoard) request.getAttribute("pd");
  SessionData sd = (SessionData) session.getAttribute("SessionData");
%>
<script src="../jquery/jquery_3_6_3.js"></script>
<script type="text/javascript">

function frmGo() {
	  if (/^\s*$/.test(frm.title.value)) {
	    alert("제목이 비어있습니다");
	    return false;
	  } else if (/^\s*$/.test(frm.content.value)) {
		    alert("내용이 비어있습니다");
		    return false;
		  }
	  else{
	        frm.submit()
	  }
	  // ...
	  
	  
	  
	}
</script>

<style>

  .board_wrap {
    width: 1200px;
    margin: 50px auto;
    height: 800px;
    padding: 20px;
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.5);
  }

  h2 {
    width: 1200px;
    margin: 0 auto;
    border-bottom: 1px solid #ccc;
    padding-bottom: 10px;
  }

  label {
    display: block;
    margin-bottom: 10px;
    font-weight: bold;
  }

  input[type="text"],
  textarea {
    width: 100%;
    padding: 10px;
    margin-bottom: 20px;
    border-radius: 5px;
    border: 1px solid #ccc;
    box-sizing: border-box;
    font-size: 16px;
  }

  input[type="file"] {
    margin-top: 10px;
  }

  textarea {
    height: 200px;
  }

  input[type="submit"],
  input[type="reset"],
  input[type="button"] {
    display: inline-block;
    padding: 10px 20px;
    background-color: #777777;
    color: #fff;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
  }

  input[type="submit"]:hover,
  input[type="reset"]:hover,
  input[type="button"]:hover {
    background-color: midnightblue;
  }

  .btn-group {
    margin-top: 20px;
  }

  .btn-group a {
    display: inline-block;
    padding: 10px 20px;
    background-color: #ccc;
    color: #fff;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    text-decoration: none;
    margin-right: 10px;
    cursor: pointer;
  }

  .btn-group a:last-child {
    margin-right: 0;
  }

  .btn-group a:hover {
    background-color: #999;
  }

  .error {
    color: red;
    font-size: 14px;
    margin-top: 5px;
  }
  #back {
  float: right;}
</style>




<form action="BoardInsertReg" name="frm" method="post" enctype="multipart/form-data">
  <input type="hidden" value="<%=sd.getId()%>" name="rid">
    <h2>글쓰기</h2>
  
  <div class="board_wrap">
  
    <div>
       제목 
    <br>  <input type="text" id="title"  name="title"  />
    </div>
    <div>
     작성자
   <br>   <input type="text" id="pname" name="pname" value="<%=sd.getNick()%>" readonly />
    </div>
    <div>
     파일
      <input type="file" id="upfile" name="upfile" />
    </div>
    <br> 내용
    <div>
      <br><textarea  name="content" id= "content" placeholder="내용을 입력하세요." ></textarea>
    </div>
    
    <div>
      <input type="button" value="작성" onclick="frmGo()" />
      <input type="reset" value="초기화"  />
      <a href="BoardList?nowPage=<%=pd.getNowPage()%>" id="back">목록으로</a>
    </div>
  </div>
</form>
