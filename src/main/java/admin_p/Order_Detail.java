package admin_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control_p.Service;
import model_p.MembersDAO;
import model_p.MembersDTO;
import model_p.OrdersDAO;
import model_p.OrdersDTO;
import model_p.SessionData;
import model_p.qnaboardDAO;
import model_p.qnaboardDTO;

public class Order_Detail implements Service{
	
	public void execute(HttpServletRequest request , HttpServletResponse reponse) {
		
		OrdersDAO dao = new OrdersDAO();
		OrdersDTO dto = dao.orderDetail(Integer.parseInt(request.getParameter("order_no")));
		System.out.println(dto.toString());
		
		
		request.setAttribute("mainData", dto);
		

		
	}
	
}