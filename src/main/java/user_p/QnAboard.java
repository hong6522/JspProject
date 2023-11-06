package user_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control_p.Service;
import model_p.MembersDAO;
import model_p.OrdersDAO;
import model_p.SessionData;

public class QnAboard implements Service{
	
	public void execute(HttpServletRequest request , HttpServletResponse reponse) {
		

		int order_no = Integer.parseInt(request.getParameter("order_no"));
		request.setAttribute("order_no", order_no);
		
		
		
	}
	
}