package user_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control_p.Service;
import model_p.MembersDAO;
import model_p.MembersDTO;

public class PwMainReg implements Service{
	
	public void execute(HttpServletRequest request , HttpServletResponse reponse) {
		HttpSession session = request.getSession();
		MembersDTO dto = (MembersDTO)session.getAttribute("dto");
		System.out.println("dto "+dto);
		
		boolean res = false;
		String aa = request.getParameter("aa");
		
		if(aa.equals(dto.getAa())) {
			res = true;
			System.out.println("일치");
			}else {
				System.out.println("답변 불일치");
			}
		request.setAttribute("res" , res);
	
		
		
	}
	
}