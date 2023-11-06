package user_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control_p.Service;
import model_p.MembersDAO;
import model_p.MembersDTO;
import model_p.SessionData;

public class MyPageModifyReg implements Service{
	
	public void execute(HttpServletRequest request , HttpServletResponse reponse) {
		
	    HttpSession session = request.getSession();
		MembersDAO dao = new MembersDAO();
		
		SessionData sd = (SessionData)session.getAttribute("SessionData");
		MembersDTO dto = new MembersDTO();
		
		dto.setId(request.getParameter("id"));
		dto.setPname(request.getParameter("pname"));
		dto.setNick(request.getParameter("nick"));
		dto.setbirthStr(request.getParameter("birth"));
		dto.setTel(request.getParameter("tel"));
		dto.setEmail(request.getParameter("email"));
		dto.setAddress(request.getParameter("address"));

		dao.modify(dto);
		
		
		request.setAttribute("mainData", dto);
		
	}
	
}