package slist_p;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control_p.Service;
import model_p.MarkDAO;
import model_p.SessionData;

public class SListDetailReg implements Service{
	
	public void execute(HttpServletRequest request , HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		SessionData sd = (SessionData)session.getAttribute("SessionData");
		
		if(sd != null) {
			new MarkDAO().MarkInsert(sd.getId(),request.getParameter("code") );
			
			try {
				response.sendRedirect("SListDetail?code="+request.getParameter("code"));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			request.setAttribute("mainUrl", "inc/alert.jsp");
			request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			request.setAttribute("goUrl", "/KRProj/User/Login");	
		}
		
	}
}
