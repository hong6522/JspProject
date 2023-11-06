package user_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control_p.Service;
import model_p.MembersDAO;
import model_p.MembersDTO;

public class PwModi implements Service{
	
	public void execute(HttpServletRequest request , HttpServletResponse reponse) {
		HttpSession session = request.getSession();
		MembersDAO dao = new MembersDAO();
		MembersDTO dto = (MembersDTO)session.getAttribute("dto");
		
		String repw = request.getParameter("repw");
		
		
		dao.pwmodify(repw, dto.getId());
		
		
	}
	
}