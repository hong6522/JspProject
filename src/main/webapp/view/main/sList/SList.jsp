<%@page import="model_p.SessionData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model_p.PrdDTO"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    boolean logon = false; 
    int level = 0;
    String nick = "";
    
    int last = (int)request.getAttribute("last");
	int month = 0;
    
    if(request.getParameter("month") == null){
    	month = new Date().getMonth()+1;
    }else{
    	month = Integer.parseInt(request.getParameter("month"));
    }
    
    if(session.getAttribute("SessionData") != null){
    	SessionData sd = (SessionData)session.getAttribute("SessionData");
    	
    	level = sd.getLevel();
    	nick = sd.getNick();
    	logon = true;
    	
    }
    
    %>
    <script src="../jq/jquery_3.6.3.js"></script>
    <script type="text/javascript">
     $(function(){
	//alert("열렸냐?")
//     $(".SList_SName_Wrapper")
   	
//     	  .mouseover( 
//           	function(){
//         	$(this).parent().next('.SList_hover_div').css('display', 'block');
//           })
//           .mouseout(
//          	function() {
//             $(this).parent().next('.SList_hover_div').css('display', 'none');
//           })
          
//     
    $(".goMonth").click(
    		function(){
    	$(".goMonthWarpper").css('display','none')
    })
    
    $(".SList_calendar_header").click(
    		function(){
    			
    	$(".SList_top").css('margin-top','60px')	
    	$(".goMonthWarpper").css('display','block')
    	
    })
    })
	</script>
    
    
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Cabin:wght@500&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');
    	.SList_Wrapper{
    		width:1200px;
    		height: 2000px;
    		background:#fff;

    		margin: 0 auto;

			align-content: center;    		
    	}
    	.SList_calendar_header{
    		width:200px;
    		height:50px;
    		background:#000;
    		color:#fff;
    		float : left;
    		text-align:center;
    		line-height:45px;
    		font-size:40px;
    		border-radius:20px 20px 20px 20px / 20px 20px 20px 20px;
    	}
    	.SList_top{
    		width:410px;
    		height:50px;
    		margin-Left:450px;
    		margin-Right:100px;
    		margin-bottom:50px;
    		margin-top:30px;
    	}
    	.SList_calendar_day{
    		width:170px;
    		height:300px;
    		background:#fff;
    		float : left;
    		border:1px solid #000;
    		box-sizing: border-box;
    	}
    	.SList_MonthLeft{
    		width:50px;
    		height:50px;
    		float : left;
    		margin-right:5px;
    		background:url(../fff/arrowLl.png);
    	}
    	.SList_MonthRight{
    		width:50px;
    		height:50px;
    		float : left;
    		margin-left:5px;
    		background:url(../fff/arrowRr.png);
    	}
    	.SList_img{
    		width:40px;
    		height:40px;
    		float:left;
    	}
    	#SList_SImg{
    		width:40px;
    		height:40px;
    	}
    	.SList_SName{
    		width:100px;
    		height:50px;
    		float:left;
    		font-size:10px;
	 		font-family: 'Noto Sans KR', sans-serif;
	 		color:#000;
    	}
    	.SList_SName_Wrapper{
    		width:167px;
    		height:40px;
    		float:left;
    		background:#fff;
    		border-bottom:1px solid #000;
    		text-align: center;
    		line-height: 40px;  
    	}
    	.SList_calendar_dayStr{
    		width:167px;
    		height:30px;
    		float:left;
    		text-align:center;
    		background:#000;
    		color:#fff;
    		font-size:18px;
    		border: 1px solid #fff;
    		line-height: 30px;
    	}
    	.SList_hover_div{
    		display:none;
    		position:relative;
    		z-index: 1;
    	}
    	#rlsList{
    		color: #000;
    	}
    	.goMonthWarpper{
    		display: none;
    	}
    	#noneMonth{
   			position:absolute;
    		
    	}
    	.goMonth{ 
    		float:left;
    		width:90px;
    		height:40px;
    		background:#000;
    		color:#fff;
    		margin:5px;
    		border-radius:10px 10px 10px 10px / 10px 10px 10px 10px;
    		text-align: center;
    		line-height: 40px;
    	}
    </style>
    
		<div class="SList_Wrapper">
		<h2>RELEASE</h2>
		<hr />
		
			<div class="goMonthWarpper" id="noneMonth">
				<a href="?month=1"><div class="goMonth"><b>1월</b></div></a>
				<a href="?month=2"><div class="goMonth"><b>2월</b></div></a>
				<a href="?month=3"><div class="goMonth"><b>3월</b></div></a>
				<a href="?month=4"><div class="goMonth"><b>4월</b></div></a>
				<a href="?month=5"><div class="goMonth"><b>5월</b></div></a>
				<a href="?month=6"><div class="goMonth"><b>6월</b></div></a>
				<a href="?month=7"><div class="goMonth"><b>7월</b></div></a>
				<a href="?month=8"><div class="goMonth"><b>8월</b></div></a>
				<a href="?month=9"><div class="goMonth"><b>9월</b></div></a>
				<a href="?month=10"><div class="goMonth"><b>10월</b></div></a>
				<a href="?month=11"><div class="goMonth"><b>11월</b></div></a>
				<a href="?month=12"><div class="goMonth"><b>12월</b></div></a>
			</div>
    	    <div class="SList_top">
    	    <a href="?month=<%=month-1%>" id="mLeft">
			<div class="SList_MonthLeft"></div></a>
			<div class="SList_calendar_header"><b><%=request.getAttribute("todayStr")%></b></div>
			<a href="?month=<%=month+1%>" id="mRight">
			<div class="SList_MonthRight"></div></a>
			</div>
			<%for (int i = 1 ; i <=last ; i++){ %>
		
			<div class="SList_calendar_day">
				<div class="SList_calendar_dayStr"><b><%=i %></b></div>
				<%for(PrdDTO dto : (ArrayList<PrdDTO>)request.getAttribute("saleList")){ %>
					<%if(Integer.parseInt(dto.getReg_dateStr().substring(6))==i){ %>
					<a href="SListDetail?code=<%=dto.getCode()%>">
					<div class="SList_SName_Wrapper">
					<div class="SList_img"><img src="../prdImg/<%=dto.getImg() %>" alt="" id="SList_SImg"/></div>
						<div class="SList_SName"><b><%=dto.getPrd_name() %></b></div>
					</div>
					</a>	
					<div class="SList_hover_div"><img src="../prdImg/<%=dto.getImg() %>" alt=""></div>
					<%} %>
				<%} %>
			</div>
			
			<%} %>
			
		</div>