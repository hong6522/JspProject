package shop_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control_p.Service;
import model_p.PrdDTO;
import model_p.SessionData;

public class Prd_BuyReg implements Service{

	public void execute(HttpServletRequest request , HttpServletResponse response) {

        String msg = "로그인 정보가 없습니다.\\n로그인 페이지로 이동합니다.";
        String goUrl = "/KRProj/User/Login?url=Shop/Prd_Detail&code="+request.getParameter("code")+"&nowPage="+request.getParameter("nowPage");
        HttpSession session = request.getSession();

        SessionData sd = (SessionData)session.getAttribute("SessionData");

        if(sd != null) {
        	PrdDTO dto = new PrdDTO();
        	dto.setCode(request.getParameter("code"));
            msg = "구매 페이지로 이동합니다.";
            goUrl = "Prd_BuyForm?code="+dto.getCode()+"&buyCnt="+request.getParameter("buyCnt")+"&nowPage="+request.getParameter("nowPage");
        }

        request.setAttribute("mainUrl", "inc/alert.jsp");
        request.setAttribute("msg", msg);
        request.setAttribute("goUrl", goUrl);

    }
	
}
