package user_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control_p.Service;

public class Logout implements Service{
	
	public void execute(HttpServletRequest request , HttpServletResponse reponse) {
		

		HttpSession session = request.getSession();
		session.removeAttribute("SessionData");

		
	}
	
}