package user_p;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control_p.Service;
import model_p.MembersDAO;
import model_p.MembersDTO;
import model_p.SessionData;

public class MemberCon implements Service{
	
	public void execute(HttpServletRequest request , HttpServletResponse reponse) {
		
		MembersDAO dao = new MembersDAO();
		
		ArrayList<MembersDTO> memlist = dao.memList();
		
		request.setAttribute("mainData", memlist);
			
		
	}
	
}