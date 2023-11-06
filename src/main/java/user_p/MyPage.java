package user_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control_p.Service;
import model_p.MembersDAO;
import model_p.MembersDTO;
import model_p.SessionData;

public class MyPage implements Service{
	
	public void execute(HttpServletRequest request , HttpServletResponse reponse) {
		
	    HttpSession session = request.getSession();
		
		SessionData sd = (SessionData)session.getAttribute("SessionData");
		
		
		
		
		MembersDAO dao = new MembersDAO();
		//dao 생성
		
		MembersDTO dto = dao.myPage(sd.getId());
		//dto에 dao.mypage를 이용해서 데이터베이스에서 dto형태로 가져옴
		
		
		request.setAttribute("mainData", dto);
		//리퀘스트에 메인데이터로 dto로 던짐
		
		
	}
	
}