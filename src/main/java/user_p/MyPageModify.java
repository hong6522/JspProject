package user_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control_p.Service;
import model_p.MembersDAO;
import model_p.MembersDTO;
import model_p.SessionData;

public class MyPageModify implements Service{
	
	public void execute(HttpServletRequest request , HttpServletResponse reponse) {
		
	    HttpSession session = request.getSession();
		MembersDAO dao = new MembersDAO();
		
		SessionData sd = (SessionData)session.getAttribute("SessionData");
		
		MembersDTO dto = dao.myPage(sd.getId());
		request.setAttribute("mainData", dto);
		
	}
	
}