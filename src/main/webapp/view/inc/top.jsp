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
        font-size: 28px;
        float: right;
        color: #fff;
        text-align: center;
        padding: 10px;
    }
    

    


   
</style>

<div id="header_wra">
    <div id="member_box">
        <% if(logon){ %>
            <a href="/KRProj/User/Logout">
                <div id="login_button">Logout</div>
            </a>
            
            <a href="/KRProj/User/MyPage">
                <div id="login_button">Mypage</div>
            </a>
        <% } else { %>
            <a href="/KRProj/User/Login">
                <div id="login_button">Login</div>
            </a>
        <% } %>
<%--         <% if(logon){ %> --%>
<%--             <div id="login_button"><%= nick %>님 안녕하세요.</div> --%>
<%--         <% } %> --%>
        
        <% if(level == 3){ %>
            <a href="/KRProj/AdMin/AdMinMain">
                <div id="login_button">관리자페이지</div>
            </a>
        <% } %>
    </div>
    
    <div id="second_row">
    <a href="/KRProj/SList/SList">
        <div id="logo_box">    
            SYSO
        </div>
    </a>


	    <a href="/KRProj/board/BoardList">
	        <div id="top_button">BOARD</div>
	    </a>
    
	    <a href="/KRProj/Shop/Prd_saleList">
	        <div id="top_button">SHOP</div>
	    </a>
	    
	    <a href="/KRProj/SList/SList">
	        <div id="top_button">RELEASE</div>
	    </a>
	    
	</div>
    
    
    
    
    
    
</div>

