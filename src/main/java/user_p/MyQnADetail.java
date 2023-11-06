package user_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control_p.Service;
import model_p.MembersDAO;
import model_p.MembersDTO;
import model_p.SessionData;
import model_p.qnaboardDAO;
import model_p.qnaboardDTO;

public class MyQnADetail implements Service{
	
	public void execute(HttpServletRequest request , HttpServletResponse reponse) {
		
		qnaboardDAO dao = new qnaboardDAO();
		qnaboardDTO dto = dao.detail(request.getParameter("no"));
		System.out.println(dto.toString());
		
		
		request.setAttribute("mainData", dto);
		

		
	}
	
}