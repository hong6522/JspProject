<%@page import="java.util.Date"%>
<%@page import="model_p.SessionData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    boolean logon = false; 
    int level = 0;
    String nick = "";
    
    // Check if user is logged in by checking session for SessionData object
    if(session.getAttribute("SessionData") != null){
        SessionData sd = (SessionData)session.getAttribute("SessionData");
        
        level = sd.getLevel();
        nick = sd.getNick();
        logon = true;
    }
    
    Date today = new Date();
    
    
%>

<style>
@import url('https://fonts.googleapis.com/css2?family=Work+Sans:wght@600&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Anton&family=Work+Sans:wght@600&display=swap');  
  
    #header_wra {
    	width:1200px;
    	height: 80px;
        margin: 0 auto; 
        font-family: 'Work Sans', sans-serif;
        
    }
    
    #member_box {
  		width: 100%;
  		height: 20px;
        color: #B2B2B2;
    }
    
     #login_button {
        font-size: 15px;
        padding: 0 5px;
        text-align: right;
        float: right;
        color: #B2B2B2;
    }
    
     #second_row {
       	width: 100%;
        height: 60px;
    }
    
    
    #logo_box {
        display: inline-block;
        font-family: 'Anton', sans-serif;
        margin-top: -13px;
        font-size: 50px;
        color: #fff;
        text-align: left;
        margin-left: 20px;
    }
    
    #top_button {
        font-size: 20px;
        float: right;
        color: #fff;
        text-align: center;
        padding: 10px;
    }
    

    


   
</style>

<div id="header_wra">
    <div id="member_box">
		<div id="login_button"></div>
    </div>
    
    <div id="second_row">
    <a href="/KRProj/SList/SList">
        <div id="logo_box">    
            SYSO Admin
        </div>
    </a>
    	<a href="/KRProj/SList/ListInsertForm">
    		<div id="top_button">발매상품등록</div>
	    </a>

	    <a href="MemberCon">
	        <div id="top_button">회원 관리</div>
	    </a>
    
	    <a href="AdminSales">
	        <div id="top_button">매출내역확인</div>
	    </a>
	    
	    <a href="stlMng?date_type=2&year=<%=today.getYear()+1900 %>&month=<%=today.getMonth()+1 %>">
	        <div id="top_button">정산내역확인</div>
	    </a>
	    
	    <a href="Delivery?dlvrystts=배송준비중">
	        <div id="top_button">배송정보관리</div>
	    </a>
	    
	    <a href="QnAlist">
	        <div id="top_button">문의내역</div>
	    </a>
	    
	    
	</div>
    
    
    
    
    
    
</div>

