package user_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control_p.Service;
import model_p.MembersDAO;
import model_p.MembersDTO;
import model_p.SessionData;

public class Memdelete implements Service{
	
	public void execute(HttpServletRequest request , HttpServletResponse reponse) {
		
		
		
		MembersDAO dao = new MembersDAO();
		//세션제거 후(로그아웃)
		HttpSession session = request.getSession();
		session.removeAttribute("SessionData");
		
		//탈퇴
		dao.memdelete(request.getParameter("id"));
		
		
	}
	
}