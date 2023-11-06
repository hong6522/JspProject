package user_p;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control_p.Service;
import model_p.MembersDAO;
import model_p.MembersDTO;
import model_p.OrdersDTO;
import model_p.SessionData;

public class MyOrderList implements Service{
	
	public void execute(HttpServletRequest request , HttpServletResponse reponse) {
		
		HttpSession session = request.getSession();
		SessionData sd = (SessionData)session.getAttribute("SessionData");
		
		MembersDAO dao = new MembersDAO();
		ArrayList<OrdersDTO> list = dao.myOrder(sd.getId());
		
		
		
		
		request.setAttribute("MyOrder", list);
		
		
		
	}
	
}