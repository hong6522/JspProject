package user_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control_p.Service;
import model_p.MembersDAO;
import model_p.MembersDTO;
import model_p.SessionData;

public class JoinReg implements Service {
	
	public void execute(HttpServletRequest request , HttpServletResponse reponse) {
		
		MembersDAO dao = new MembersDAO();
		
		MembersDTO dto = new MembersDTO();
		dto.setId(request.getParameter("id"));  
		dto.setPw(request.getParameter("pw"));
		dto.setPname(request.getParameter("pname"));
		dto.setEmail(request.getParameter("email"));
		dto.setAddress(request.getParameter("address"));
		dto.setTel(request.getParameter("tel"));
		dto.setNick(request.getParameter("nick"));
		dto.setbirthStr(request.getParameter("birthStr"));
		dto.setQq(request.getParameter("qq"));
		dto.setAa(request.getParameter("aa"));
		dao.insert(dto); 
 
		
	}
	
}