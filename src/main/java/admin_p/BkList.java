package admin_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control_p.Service;
import model_p.MembersDAO;

public class BkList implements Service{
	
	public void execute(HttpServletRequest request , HttpServletResponse reponse) {
		
		MembersDAO dao = new MembersDAO();
		int no = Integer.parseInt(request.getParameter("bk"));
		
		// bk리스트 목록 조회
		dao.bklist(request.getParameter("id"),no);
		
		
		
		
		
	}
	
}