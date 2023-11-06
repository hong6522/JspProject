package user_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control_p.Service;
import model_p.MembersDAO;
import model_p.MembersDTO;

public class PwCheck implements Service{
	
	public void execute(HttpServletRequest request , HttpServletResponse reponse) {
		
		MembersDAO dao = new MembersDAO() ;
		
		MembersDTO dto = dao.myPage(request.getParameter("id"));
		request.setAttribute("dto", dto);
//		if(!dto.setAa(request.getParameter("aa")) ) {
//			
//		}
		
		
	}
	
}