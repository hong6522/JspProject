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
import model_p.qnaboardDAO;
import model_p.qnaboardDTO;

public class MyQnAList implements Service{
	
	public void execute(HttpServletRequest request , HttpServletResponse reponse) {
		
		HttpSession session = request.getSession();
		SessionData sd = (SessionData)session.getAttribute("SessionData");
		
		qnaboardDAO dao = new qnaboardDAO();
		ArrayList<qnaboardDTO> list = dao.list(sd.getId());
		
		request.setAttribute("MyQnA", list);
		
		
		
	}
	
}