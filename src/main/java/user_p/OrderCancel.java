package user_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control_p.Service;
import model_p.MembersDAO;
import model_p.OrdersDAO;
import model_p.SessionData;

public class OrderCancel implements Service{
	
	public void execute(HttpServletRequest request , HttpServletResponse reponse) {
		
		// 필요한 거 
		
		HttpSession session = request.getSession();
		SessionData sd = (SessionData)session.getAttribute("SessionData");
		int order_no = Integer.parseInt(request.getParameter("order_no"));
		
		OrdersDAO dao = new OrdersDAO();
		dao.cancel(order_no);
		
		request.setAttribute("mainUrl", "inc/alert.jsp");
		request.setAttribute("msg", "취소신청 되었습니다.");
		request.setAttribute("goUrl", "MyOrderList");

		
	}
	
}