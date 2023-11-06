package shop_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control_p.Service;
import model_p.MembersDAO;
import model_p.MembersDTO;
import model_p.PrdDAO;
import model_p.PrdDTO;
import model_p.SessionData;

public class Prd_BuyForm implements Service {

	public void execute(HttpServletRequest request , HttpServletResponse reponse) {
		
		String code = request.getParameter("code");
		
		PrdDTO SGData = new PrdDAO().ListDetail(code);
		
		HttpSession session = request.getSession();

        SessionData sd = (SessionData)session.getAttribute("SessionData");
        
        MembersDTO MemData = new MembersDAO().myPage(sd.getId());
		
		System.out.println("Prd_BuyForm.execute() 실행: "+SGData);
		
		request.setAttribute("SGData", SGData);
		request.setAttribute("MemData", MemData);
		
	}
	
}
