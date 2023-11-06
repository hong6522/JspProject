package admin_p;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control_p.Service;
import model_p.OrdersDAO;
import model_p.OrdersDTO;
import model_p.SessionData;

public class Delivery implements Service{

	
	public void execute(HttpServletRequest request , HttpServletResponse response) {
		
		
		// 배송상태 검색
		if(request.getParameter("dlvrystts")!=null && (request.getParameter("reg") == null) || request.getParameter("reg").equals("")) {
			ArrayList<OrdersDTO> ListData =  new OrdersDAO().orderlist(request);
			request.setAttribute("ListData", ListData);
		
		// 배송상태, 날짜검색
		}else if(request.getParameter("dlvrystts")!=null && request.getParameter("reg")!=null){
			ArrayList<OrdersDTO> ListData =  new OrdersDAO().orderlist(request.getParameter("reg"),request.getParameter("dlvrystts"));
			request.setAttribute("ListData", ListData);
		}
		
		//날짜 검색
		if(request.getParameter("reg") != null && request.getParameter("dlvrystts")==null ){
			ArrayList<OrdersDTO> ListData =  new OrdersDAO().orderlist(request.getParameter("reg"));
			request.setAttribute("ListData", ListData);
		}
		
	}
}
