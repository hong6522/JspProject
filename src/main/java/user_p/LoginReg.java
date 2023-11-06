package user_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control_p.Service;
import model_p.MembersDAO;
import model_p.SessionData;

public class LoginReg implements Service{
	
	public void execute(HttpServletRequest request , HttpServletResponse reponse) {
		
		
		System.out.println("id:"+request.getParameter("id"));
		MembersDAO dao = new MembersDAO();
		SessionData sd = dao.loginChk(request.getParameter("id"),request.getParameter("pw"));

		
		HttpSession session = request.getSession();
		if(sd != null) {
			session.setAttribute("SessionData", sd);
		}
				
	}
	
}