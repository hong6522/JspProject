package admin_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control_p.Service;
import model_p.MembersDAO;
import model_p.MembersDTO;
import model_p.SessionData;
import model_p.qnaboardDAO;
import model_p.qnaboardDTO;

public class QnAReg implements Service{
	
	public void execute(HttpServletRequest request , HttpServletResponse reponse) {
		
		qnaboardDAO dao = new qnaboardDAO();
		
		qnaboardDTO dto = new qnaboardDTO();
		
		dto.setNo(Integer.parseInt(request.getParameter("no")));
		dto.setContent2(request.getParameter("content2"));
		dto.setState(request.getParameter("state"));
		dao.modify(dto);
		
		
		request.setAttribute("mainUrl", "inc/alert.jsp");
		request.setAttribute("msg", "답변작성완료.");
		request.setAttribute("goUrl", "QnAlist");
		
	}
	
}