package shop_p;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control_p.Service;
import model_p.PData;
import model_p.PrdDAO;
import model_p.PrdDTO;
import model_p.ReviewDAO;
import model_p.ReviewDTO;
import model_p.SessionData;

public class Prd_reviewDelete implements Service{

	public void execute(HttpServletRequest request , HttpServletResponse reponse) {
		
		String msg = "삭제가 완료되었습니다.";
        String goUrl = "Prd_Detail?code="+request.getParameter("code")+"&nowPage="+request.getParameter("nowPage");
        
        new ReviewDAO().review_delete(Integer.parseInt(request.getParameter("num")));

        request.setAttribute("mainUrl", "inc/alert.jsp");
        request.setAttribute("msg", msg);
        request.setAttribute("goUrl", goUrl);
				
	}
	
}
