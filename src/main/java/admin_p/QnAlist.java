package admin_p;

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

public class QnAlist implements Service{
	
	public void execute(HttpServletRequest request , HttpServletResponse reponse) {
		

		qnaboardDAO dao = new qnaboardDAO();
		ArrayList<qnaboardDTO> list = null;
		
		
		if(request.getParameter("state") == null || request.getParameter("state").equals("전체")) {
			list = dao.list();
		}else {
			list = dao.statelist(request.getParameter("state"));
		}
		
		
		request.setAttribute("MyQnA", list);
		
		
		
	}
	
}