package admin_p;

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
		
		System.out.println("id=>"+request.getParameter("id")+" level=>"+request.getParameter("level"));
		
		if(request.getParameter("id") != null) {
			dao.chenlevel(request.getParameter("id"),request.getParameter("level"));
		}
		
		ArrayList<MembersDTO> memlist;
		
		
		if(request.getParameter("sch") != null && request.getParameter("kind") != null ) {
			memlist = dao.memList(request.getParameter("kind"),request.getParameter("sch"));
		}else {
			memlist = dao.memList();

		}
		
		
		
		
		
		request.setAttribute("mainData", memlist);
			
		
	}
	
}