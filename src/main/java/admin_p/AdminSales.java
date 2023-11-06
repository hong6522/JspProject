package admin_p;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control_p.Service;
import model_p.MembersDAO;
import model_p.MembersDTO;
import model_p.OrdersDAO;
import model_p.OrdersDTO;
import model_p.SessionData;

public class AdminSales implements Service{
	
	public void execute(HttpServletRequest request , HttpServletResponse reponse) {
		

		if(request.getParameter("startDate") != null) {
			System.out.println(request.getParameter("startDate"));
			System.out.println(request.getParameter("endDate"));
			OrdersDAO dao = new OrdersDAO();
			ArrayList<OrdersDTO> res = dao.adminSales(request.getParameter("startDate"),request.getParameter("endDate"));
			TotSales ts = new TotSales();
			
			
			for(OrdersDTO dto : res) {
				if(dto.getOrderStts().equals("취소완료")) {
					//취소 금액
					ts.totcan += dto.getTotpri();
					//취소건수
					ts.canCnt++;
					
				}			
				
				// 총 판매량
				ts.totpri += dto.getTotpri();
				// 주문건수
				ts.orderCnt++;
			}
			
			
			
			
			
			
			
			request.setAttribute("mainData", res);
			request.setAttribute("totData", ts);



		}
			
		
	}
	
}