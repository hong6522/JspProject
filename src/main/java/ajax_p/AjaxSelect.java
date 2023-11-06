package ajax_p;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;

import control_p.Service;
import model_p.MarkDAO;
import model_p.SessionData;

public class AjaxSelect implements Service{
	public void execute(HttpServletRequest request , HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		SessionData sd = (SessionData)session.getAttribute("SessionData");
	
		if(sd != null) {
			boolean res = new MarkDAO().MarkChk(sd.getId(),request.getParameter("code") );
			String resStr = ""+res;
			System.out.println(resStr);
			
			if(res) {
				int a = new MarkDAO().MarkDelete(sd.getId(),request.getParameter("code"));
				System.out.println("마크삭제:"+a);
			}else {
				int b = new MarkDAO().MarkInsert(sd.getId(),request.getParameter("code"));
				System.out.println("마크삽입:"+b);
			}
			try {
				response.getWriter().append(resStr);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
		
	}
}
