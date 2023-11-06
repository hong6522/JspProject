package user_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control_p.Service;
import model_p.MembersDAO;
import model_p.MembersDTO;

public class PwReg implements Service{
	
	public void execute(HttpServletRequest request , HttpServletResponse reponse) {
		
		if(request.getParameter("id")!=null) {
			MembersDAO dao = new MembersDAO() ;	
			MembersDTO dto = dao.myPage(request.getParameter("id"));
			HttpSession session = request.getSession(); // session을 쓰려면 처음에 이거 해줘야함
			session.setAttribute("dto", dto);
			}

		
		
	}
	
}